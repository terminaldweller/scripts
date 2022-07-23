#!/usr/bin/sh
set -e

BUSY_BOX_VERSION="1.35.0"
KERNEL_VERSION="v5.10"
BUILD_BASE=$(pwd)/kernel-dev
INITRAMFS_BASE=$(pwd)/kernel-dev/initramfs

# wont run wihtout static busybox. the install target should be static too.
mkdir -p ./kernel-dev/busybox
cd ./kernel-dev/busybox &&\
  wget https://www.busybox.net/downloads/busybox-$BUSY_BOX_VERSION.tar.bz2 &&\
  tar -xvf busybox-$BUSY_BOX_VERSION.tar.bz2
cd busybox-$BUSY_BOX_VERSION &&\
  make defconfig &&\
  LD_FLAGS="--static" make -j4 && make install

cd "$BUILD_BASE" &&\
  git clone --depth=1 --branch ${KERNEL_VERSION} https://github.com/torvalds/linux
cd linux &&\
  make defconfig &&\
  make -j12

cd "$BUILD_BASE" &&\
  mkdir initramfs
(cd initramfs && mkdir -p bin sbin etc proc sys usr/bin usr/sbin dev tmp)
cp -a "${BUILD_BASE}"/busybox/busybox-$BUSY_BOX_VERSION/_install/* ./initramfs

cat > "$INITRAMFS_BASE"/bin/init <<EOL
#!/bin/sh
mount -t proc none /proc
mount -t sysfs none /sys
exec sh
EOL
chmod +x "$INITRAMFS_BASE"/bin/init

cat > "$INITRAMFS_BASE"/etc/inittab <<EOL
::sysinit:/etc/init.d/rcS
::respawn:-/bin/sh
::askfirst:-/bin/sh
::cttlaltdel:/bin/umount -a -r
EOL
chmod 755 "$INITRAMFS_BASE"/etc/inittab

mkdir -p "$INITRAMFS_BASE"/etc/init.d
cat > "$INITRAMFS_BASE"/etc/init.d/rcS <<EOL
echo "----------mount all in fstab----------------"
/bin/mount -a #Read / etc/fstab and load the file system
mkdir -p /dev/pts
mount -t devpts devpts /dev/pts
echo /sbin/mdev > /proc/sys/kernel/hotplug
mdev -s
echo "****************Hello Hello******************"
echo "Kernel Version:linux-5.4.50"
echo "***********************************************"
EOL
chmod 755 "$INITRAMFS_BASE"/etc/init.d/rcS

cat > "$INITRAMFS_BASE"/etc/fstab <<EOL
#device mount-point type option dump fsck
proc  /proc proc  defaults 0 0
temps /tmp  rpoc  defaults 0 0
none  /tmp  ramfs defaults 0 0
sysfs /sys  sysfs defaults 0 0
mdev  /dev  ramfs defaults 0 0
EOL

cd "$INITRAMFS_BASE"/dev
sudo mknod console c 5 1
sudo mknod null c 1 3
sudo mknod tty1 c 4 1
# sudo mknod dev/ram b 1 0

cd "$INITRAMFS_BASE"
find . -print0 | cpio --null -ov --format=newc | gzip -9 > ../initramfs.cpio.gz

qemu-system-x86_64 \
  -kernel "$BUILD_BASE"/linux/arch/x86/boot/bzImage \
  -initrd "$BUILD_BASE"/initramfs.cpio.gz \
  -nographic \
  -m 512 \
  -append "root=/dev/ram0 init=/bin/init console=ttyS0"
