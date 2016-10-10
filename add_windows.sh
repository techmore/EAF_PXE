#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "This program expects Windows_7_x64.iso, WinPE_x64.iso in $HOME/Downloads folder."

# cd /var/www/html/4.ISOs
# This program will download Windows AIK for windows 7 and put it in 4.ISOs on the PXE server."
# wget https://download.microsoft.com/download/8/E/9/8E9BBC64-E6F8-457C-9B8D-F6C9A16E6D6A/KB3AIK_EN.iso

# If you want to build your windows PE here download Virtualbox
# http://download.virtualbox.org/virtualbox/5.1.6/virtualbox-5.1_5.1.6-110634~Ubuntu~xenial_amd64.deb
# dpkg -i virtualbox-5.1_5.1.6-110634~Ubuntu~xenial_amd64.deb

mkdir -p /srv/windows/x64 /var/lib/tftpboot/windows
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
mv $HOME/Downloads/WinPE_x64.iso /var/lib/tftpboot/windows/
chmod 777 -R /var/lib/tftpboot/windows

mount -o loop $HOME/Downloads/Windows_7_x64.iso /mnt
cp -rf  /mnt/*  /srv/windows/x64/
umount  /mnt
chmod -R 0755 /srv/windows
chown -R nobody:nogroup /windows

cat << EOF_pxelinux.cfg >> /var/lib/tftpboot/pxelinux.cfg/default
  label 9
  menu label Windows 7 x32/x64
  KERNEL memdisk
  INITRD windows/WinPE_x64.iso
  APPEND iso raw
EOF_pxelinux.cfg

cat << EOF_How >> /var/www/html/3.Scripts/How_to_install_Windows.html
<pre>
 Run this on the PE booting machine.

 net use z : \\10.10.10.10\x64
 Y:
 setup.exe

 For authentication
 net use z : \\10.10.10.10\x64  /user:samba_username
</pre>
EOF_How

