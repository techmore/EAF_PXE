#!/bin/bash


echo "This program expects Windows_7_x64.iso, WinPE_x64.iso in $HOME/Downloads folder."

mkdir -p /srv/windows
cat <<EOF >> /etc/samba/smb.conf
  [Windows_install]
  comment = Windows 7 Image
  path = /srv/windows
  available = yes
  # valid users = user
  read only = no
  browseable = yes
  public = yes
  printable = no
  guest ok = yes
  # oplocks = no
  # level2 oplocks = no
  # locking = no
EOF

# Windows 7 64-bit DVD Image, but this time copy DVD mounted content to /windows/x64/ shared path.
cp $HOME/Downloads/WinPE_x64.iso /var/www/html/4.ISOs/WinPE_x64.iso
mv /windows/WinPE_x64.iso  /var/lib/tftpboot/windows/

mount -o loop $HOME/Downloads/Windows_7_x64.iso /mnt
cp -rf  /mnt/*  /srv/windows/x64/
umount  /mnt
chmod -R 0755 /srv/windows
chown -R nobody:nobody /windows
mkdir -p /var/lib/tftpboot/windows

cat << EOF_pxelinux.cfg >> /var/lib/tftpboot/pxelinux.cfg/default
  label 9
  menu label ^9) Install Windows 7 x32/x64
  KERNEL memdisk
  INITRD /var/www/html/4.ISOs/WinPE_x64.iso
  APPEND iso raw
EOF_pxelinux.cfg


# ON A WINDOWS 7 machine
# Download windows 7 AIK
# http://www.microsoft.com/en-us/download/details.aspx?id=5753
# Daemon Tools Lite Free Edition
# 3. After Windows AIK software is installed on your system go to Windows Start -> All Programs -> Microsoft Windows AIK -> right click on Deployment Tools Command Prompt and select Run as Administrator and a new Windows Shell console should open on your screen.

# copype amd64 C:\winPE_amd64
# copy "C:\Program Files\Windows AIK\Tools\PETools\amd64\winpe.wim" C:\winpe_amd64\ISO\Sources\Boot.wim
# copy "C:\Program Files\Windows AIK\Tools\amd64\Imagex.exe" C:\winpe_amd64\ISO\
# oscdimg -n -bC:\winpe_amd64\etfsboot.com C:\winpe_amd64\ISO C:\winpe_amd64\winpe_amd64.iso
# 7. After WinPE x86 ISO file is completely transferred to Samba “install” shared directory go back to PXE Server console and move this image from root’s /windows directory to TFTP windows directory path to complete the entire installation process.

# Run this on the PE booting machine.

# net use y : \\192.168.1.20\install\x64
# Y:
# setup.exe

# net use y : \\192.168.1.20\install\x64  /user:samba_username
