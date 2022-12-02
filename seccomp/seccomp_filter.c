#include <errno.h>
#include <fcntl.h>
#include <inttypes.h>
#include <seccomp.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void log_all_syscalls(void) {
  scmp_filter_ctx ctx = seccomp_init(SCMP_ACT_LOG);
  seccomp_arch_add(ctx, SCMP_ARCH_X86_64);
  seccomp_export_bpf(ctx, 1);
  seccomp_export_pfc(ctx, 2);
  seccomp_release(ctx);
}

int log_current_seccomp(void) {
  int rc = -1;
  scmp_filter_ctx ctx;
  int filter_fd;

  ctx = seccomp_init(SCMP_ACT_KILL);
  if (ctx == NULL)
    goto out;

  filter_fd = open("/tmp/seccomp_filter.bpf",
                   O_CREAT | O_WRONLY | O_NOFOLLOW | O_TRUNC, S_IRWXU);
  if (filter_fd == -1) {
    rc = -errno;
    goto out;
  }

  rc = seccomp_export_bpf(ctx, filter_fd);
  if (rc < 0) {
    close(filter_fd);
    goto out;
  }
  close(filter_fd);

  filter_fd = open("/tmp/seccomp_filter.pfc",
                   O_CREAT | O_WRONLY | O_NOFOLLOW | O_TRUNC, S_IRWXU);
  if (filter_fd == -1) {
    rc = -errno;
    goto out;
  }

  rc = seccomp_export_pfc(ctx, filter_fd);
  if (rc < 0) {
    close(filter_fd);
    goto out;
  }
  close(filter_fd);

out:
  seccomp_release(ctx);
  return -rc;
}

int main(int argc, char **argv) {
  if (argc == 3) {
    if (!strcmp("--filter", argv[1])) {
      if (!strcmp("current", argv[2])) {
        log_current_seccomp();
      } else if (!strcmp("logging", argv[2])) {
        log_all_syscalls();
      } else {
      }
    }
  } else {
    printf("going with the default filter kind which is logging.\n");
    log_all_syscalls();
  }
}
