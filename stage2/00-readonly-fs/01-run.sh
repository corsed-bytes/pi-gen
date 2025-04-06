#!/bin/bash -e
echo "Making filesystem readonly..."
echo "fastboot noswap ro" >> ${ROOTFS_DIR}/boot/cmdline.txt
echo "overlay" >> ${ROOTFS_DIR}/etc/fstab

# Beispiel: root in readonly und tmpfs für /var/log
cat <<EOF >> ${ROOTFS_DIR}/etc/fstab
tmpfs   /tmp            tmpfs   defaults,noatime,nosuid,size=100m  0  0
tmpfs   /var/log        tmpfs   defaults,noatime,nosuid,size=50m   0  0
EOF