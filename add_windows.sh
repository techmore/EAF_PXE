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

