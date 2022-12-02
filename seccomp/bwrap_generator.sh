#!/usr/bin/env dash

TEMP_LOG=/tmp/seccomp_logging_filter.bpf

get_sos() {
  SO_LIST=$(ldd "$1" | awk '{print $3}')
  for SO in ${SO_LIST}; do
    echo --ro-bind "${SO}" "${SO} \\"
  done
}

make && ./seccomp_filter --filter logging > ${TEMP_LOG}

echo "env -i \\"
echo "bwrap \\"
echo "--unshare-all --share-net \\"
get_sos "$@"
echo "--uid $(id -u) \\"
echo "--gid $(id -g) \\"
echo "--chdir ${SANDBOX_DIR_NAME} \\"
echo "--bind $1 ${SANDBOX_DIR_NAME} \\"
echo "--setenv HTTP_PROXY socks5h://192.168.1.214 \\"
echo "--setenv HTTPS_PROXY socks5h://192.168.1.214 \\"
echo "--setenv NO_PROXY 10.0.0.0/8,localhost,127.0.0.1/8,192.168.0.0/16 \\"
echo "--seccomp 10 10<${TEMP_LOG} \\"
