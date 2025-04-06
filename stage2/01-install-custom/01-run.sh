#!/bin/bash -e
echo "Downloading package-manager..."
mkdir -p ${ROOTFS_DIR}/opt/package-manager
curl -L https://github.com/corsed-bytes/package-manager/releases/download/0.0.4/package-manager.lin.armv7.zip -o ${ROOTFS_DIR}/opt/package-manager/pm.zip
unzip ${ROOTFS_DIR}/opt/package-manager/pm.zip -d ${ROOTFS_DIR}/opt/package-manager/

# Ausführung beim Boot (systemd service)
install -m 644 files/pm.service ${ROOTFS_DIR}/etc/systemd/system/pm.service
on_chroot << EOF
systemctl enable pm.service
EOF