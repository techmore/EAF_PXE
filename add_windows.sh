#!/bin/bash


# cat <<EOF >> /etc/samba/smb.conf
# [Images]
# path = /var/www/html/1.Images
# available = yes
# valid users = user
# read only = no
# browseable = yes
# public = yes
# writeable = yes
# guest ok = yes

[install]
comment = Windows 7 Image
path = /windows
read only = no
browseable = yes
public = yes
printable = no
guest ok = yes
oplocks = no
level2 oplocks = no
locking = no

# Windows 7 64-bit DVD Image, but this time copy DVD mounted content to /windows/x64/ shared path.

# mount -o loop /dev/cdrom /mnt
# cp -rf  /mnt/*  /windows/x64/
# umount  /mnt
chmod -R 0755 /windows
# chown -R nobody:nobody /windows

mkdir /var/lib/tftpboot/windows

nano /var/lib/tftpboot/pxelinux.cfg/default
label 9
menu label ^9) Install Windows 7 x32/x64
KERNEL memdisk
INITRD windows/winpe_x86.iso
APPEND iso raw

ON A WINDOWS 7 machine
# Download windows 7 AIK
http://www.microsoft.com/en-us/download/details.aspx?id=5753

Daemon Tools Lite Free Edition

3. After Windows AIK software is installed on your system go to Windows Start -> All Programs -> Microsoft Windows AIK -> right click on Deployment Tools Command Prompt and select Run as Administrator and a new Windows Shell console should open on your screen.

copype amd64 C:\winPE_amd64
copy "C:\Program Files\Windows AIK\Tools\PETools\amd64\winpe.wim" C:\winpe_amd64\ISO\Sources\Boot.wim
copy "C:\Program Files\Windows AIK\Tools\amd64\Imagex.exe" C:\winpe_amd64\ISO\
oscdimg -n -bC:\winpe_amd64\etfsboot.com C:\winpe_amd64\ISO C:\winpe_amd64\winpe_amd64.iso

# Windows 8 build
copype amd64 C:\Win8PE_amd64
MakeWinPEMedia /ISO C:\Win8PE_amd64 C:\Win8PE_amd64\Win8PE_amd64.iso

7. After WinPE x86 ISO file is completely transferred to Samba “install” shared directory go back to PXE Server console and move this image from root’s /windows directory to TFTP windows directory path to complete the entire installation process.

# mv /windows/winpe_x86.iso  /var/lib/tftpboot/windows/


net use y : \\192.168.1.20\install\x64
Y:
setup.exe

net use y : \\192.168.1.20\install\x64  /user:samba_username
