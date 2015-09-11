#!/bin/bash

echo "This program exspects the ISO names to be Windows_7_Pro_x86 or Windows_7_Pro_SP1_x64, winpe_x86.iso"
sudo umount /mnt/loop


sudo mkdir /var/lib/tftpboot/windows
sudo cp ~/Downloads/winpe_x86.iso /var/lib/tftpboot/windows
sudo chmod 775 /var/lib/tftpboot/winpe_x86.iso

sudo cp /usr/lib/syslinux/memdisk /var/lib/tftpboot
sudo chmod 775 /usr/lib/syslinux/memdisk

sudo mount ~/Downloads/Windows_7_Pro_x86 /mnt/loop
sudo mkdir /srv/install/Windows_7_x86
sudo cp -R /mnt/loop/* /srv/install/Windows_7_x86
sudo mkdir /var/lib/tftpboot/windows


LABEL X
        MENU LABEL Windows 7 x86 PE
        KERNEL Memdisk
        INITRD windows/winpe_x86.iso
        APPEND iso raw
        TEXT HELP
        Boot into Windows 7 x86 PE
        ENDTEXT
