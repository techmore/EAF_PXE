#!/bin/bash

# Check if running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cat << EOF_introduction

Welcome to EAF-PXE for Ubuntu 16.04 LTS.
This program has only been made possible by :
   Electronic Access Foundation http://e-access.org/
   Computer Reach http://www.computerreach.org/
   National Cristina Foundation https://www.cristina.org/
   Hill Top Preparatory School http://hilltopprep.org/

This REQUIRES an internet connection to install and configure : 
tftpd-hpa nfs-kernel-server samba apache2 cifs-utils openssh-server isc-dhcp-server

We will attempt to locate these files in /home/users/Downloads : 
   netboot.tar.gz

EOF_introduction
#   dban-2.3.0_i586.iso
#   clonezilla-live-2.4.2-10-i586.iso
#   ubuntu-16.04.1-desktop-amd64.iso

sleep 2
# We want the most up to date packages to avoid conflict. Install required rependancies
# syslinux
apt -y update; apt install -y tftpd-hpa nfs-kernel-server samba apache2 cifs-utils openssh-server
apt -y clean
echo "";echo ""; 
echo "****************************************************"
echo "** You must type in password as the password!! **"
echo "****************************************************"

# This works for a USER named "user"
smbpasswd -a user

# This should work for any currently logged in user running the script
# sudo smbpasswd -a $USER

# Apache directories setup #######################################################
mkdir -p /var/www/html/1.Images /var/www/html/2.Reports /var/www/html/3.Scripts /var/www/html/4.ISOs

# This path needs to be updated
cp /home/user/Downloads/EAF_PXE-master/pxe_create.sh /var/www/html/3.Scripts
mv /var/www/html/index.html /var/www/html/index.html.bak
chmod -R 777 /var/www/html
chown -R user /var/www/html/1.Images
chown -R user /var/www/html/2.Reports
ln -s /var/lib/tftpboot /var/www/html
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

cat <<EOF >> /etc/samba/smb.conf
[Images]
path = /var/www/html/1.Images
available = yes
valid users = user
read only = no
browseable = yes
public = yes
writeable = yes
guest ok = yes

[Reports]
path = /var/www/html/2.Reports
available = yes
valid users = user
read only = no
browseable = yes
public = yes
writeable = yes
guest ok = yes
EOF

service smbd restart

mkdir -p /mnt/loop /srv/install
echo "/srv/install         10.10.10.0/24(rw,async,no_root_squash,no_subtree_check) " > /etc/exports
exportfs -a

# 7/23/15 DBan has been updated  if [ ! -f ~/Downloads/dban-2.2.8_i586.iso ]; then
# http://sourceforge.net/projects/dban/files/dban/dban-2.3.0/dban-2.3.0_i586.iso

if [ ! -f /home/user/Downloads/dban-2.3.0_i586.iso ]; then
  echo "~/Downloads/dban-2.3.0_i586.iso NOT found, attempting to download."
  echo "--Downloading dban-2.3.0_i586.iso..."
  cd /var/www/html/4.ISOs
  wget http://downloads.sourceforge.net/project/dban/dban/dban-2.3.0/dban-2.3.0_i586.iso
  echo "DBAN download complete."
  echo ""
else
  echo "dban-2.3.0_i586.iso found."
  mv /home/user/Downloads/dban-2.3.0_i586.iso /var/www/html/4.ISOs 
fi
echo ""

# 7/23/15 Clonezilla version updated
if [ ! -f /home/user/Downloads/clonezilla-live-2.4.7-8-amd64.iso ]; then
   echo "clonezilla-live-2.4.7-8-amd64.iso NOT found, attempting to download."
   echo "--Downloading clonezilla-live-2.4.7-8-amd64.iso ..."
   cd /var/www/html/4.ISOs
   wget http://downloads.sourceforge.net/project/clonezilla/clonezilla_live_stable/2.4.2-10/clonezilla-live-2.4.2-10-i586.iso
 7/23/16 Clonezilla update
   wget https://osdn.jp/frs/redir.php?m=gigenet&f=%2Fclonezilla%2F66042%2Fclonezilla-live-2.4.7-8-amd64.iso
else
   echo "clonezilla-live-2.4.7-8-amd64.iso found."
   mv /home/user/Downloads/clonezilla-live-2.4.7-8-amd64.iso /var/www/html/4.ISOs
fi

echo ""
if [ ! -f /home/user/Downloads/ubuntu-16.04.1-desktop-amd64.iso ]; then
   echo "ubuntu-16.04.1-desktop-amd64.iso NOT found, attempting to download."
   echo "--Downloading ubuntu-16.04.1-desktop-amd64.iso..."
   cd /var/www/html/4.ISOs
#  wget  https://nyc3.dl.elementary.io/download/MTQ0MjE4OTk5Nw==/elementaryos-stable-0.3.1-i386.20150903.iso
#  https://nyc3.dl.elementary.io/download/MTQ3NDg1NjE4MA==/elementaryos-0.4-stable-amd64.20160921.iso
#   wget http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-desktop-i386.iso
   wget http://releases.ubuntu.com/16.04.1/ubuntu-16.04.1-desktop-amd64.iso
else
   echo "ubuntu-16.04.1-desktop-amd64.iso found."
   cp /home/user/Downloads/ubuntu-16.04.1-desktop-amd64.iso /var/www/html/4.ISOs
fi

echo ""
if [ ! -f /home/user/Downloads/netboot.tar.gz ]; then
   echo "netboot.tar.gz NOT found, attempting to download."
   echo "--Downloading netboot.tar.gz..."
   cd /var/www/html/4.ISOs
   wget http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/netboot.tar.gz
else
   echo "netboot.tar.gz found."
   cp /home/user/Downloads/netboot.tar.gz /var/www/html/4.ISOs
   cd /var/www/html/4.ISOs
fi
mkdir -p /var/www/html/4.ISOs/netboot
tar -xvzf netboot.tar.gz -C /var/www/html/4.ISOs/netboot
######### Syslinux setup stuff #####################################################
cp /var/www/html/4.ISOs/netboot/ubuntu-installer/amd64/pxelinux.0 /var/lib/tftpboot
cp /var/www/html/4.ISOs/netboot/ubuntu-installer/amd64/boot-screens/vesamenu.c32 /var/lib/tftpboot
cp /var/www/html/4.ISOs/netboot/ubuntu-installer/amd64/boot-screens/ldlinux.c32 /var/lib/tftpboot
cp /var/www/html/4.ISOs/netboot/ubuntu-installer/amd64/boot-screens/libcom32.c32 /var/lib/tftpboot
cp /var/www/html/4.ISOs/netboot/ubuntu-installer/amd64/boot-screens/libutil.c32 /var/lib/tftpboot
 mkdir -p /var/lib/tftpboot/pxelinux.cfg
 cp /home/user/Downloads/EAF_PXE-master/logo.png /var/lib/tftpboot/pxelinux.cfg
 touch /var/lib/tftpboot/pxelinux.cfg/pxe.conf
 touch /var/lib/tftpboot/pxelinux.cfg/default

# wget https://help.ubuntu.com/community/PXEInstallMultiDistro?action=AttachFile&do=view&target=logo.png
# cp /usr/lib/syslinux/pxelinux.0 /var/lib/tftpboot
# cp /usr/lib/syslinux/vesamenu.c32 /var/lib/tftpboot
# cp /usr/lib/syslinux/modules/bios/pxelinux.0 /var/lib/tftpboot
# cp /usr/lib/syslinux/modules/bios/vesamenu.c32 /var/lib/tftpboot

chown -R nobody:nogroup /var/lib/tftpboot

# https://nyc3.dl.elementary.io/download/MTQ0MjE4OTk5Nw==/elementaryos-stable-0.3.1-i386.20150903.iso
# https://nyc3.dl.elementary.io/download/MTQ0MjE4OTk5Nw==/elementaryos-stable-0.3.1-amd64.20150903.iso
# Sperated to be readable

   mkdir -p /srv/install/ubuntu-16.04.1-desktop-amd64
   mkdir -p /var/lib/tftpboot/ubuntu-16.04.1-desktop-amd64
   mkdir -p /var/lib/tftpboot/clonezilla-live-2.4.7-8-amd64 
   mkdir -p /var/lib/tftpboot/dban-2.3.0_i586 /srv/install/dban-2.3.0_i586 

 mount -o loop -t iso9660 /var/www/html/4.ISOs/dban-2.3.0_i586.iso /mnt/loop
 cp /mnt/loop/dban.bzi /var/lib/tftpboot/dban-2.3.0_i586/dban.bzi
 umount /mnt/loop

 mount -o loop -t iso9660 /var/www/html/4.ISOs/clonezilla-live-2.4.7-8-amd64.iso /mnt/loop
 cp /mnt/loop/live/vmlinuz /var/lib/tftpboot/clonezilla-live-2.4.7-8-amd64
 cp /mnt/loop/live/initrd.img /var/lib/tftpboot/clonezilla-live-2.4.7-8-amd64
 cp /mnt/loop/live/filesystem.squashfs /var/lib/tftpboot/clonezilla-live-2.4.7-8-amd64
 umount /mnt/loop

 mount -o loop -t iso9660 /var/www/html/4.ISOs/ubuntu-16.04.1-desktop-amd64.iso /mnt/loop
 cp /mnt/loop/casper/vmlinuz.efi /var/lib/tftpboot/ubuntu-16.04.1-desktop-amd64
 cp /mnt/loop/casper/initrd.lz /var/lib/tftpboot/ubuntu-16.04.1-desktop-amd64
 cp -R /mnt/loop/* /srv/install/ubuntu-16.04.1-desktop-amd64
 cp -R /mnt/loop/.disk /srv/install/ubuntu-16.04.1-desktop-amd64
 umount /mnt/loop

# /var/lib/tftpboot/pxelinux.cfg/pxe.conf ############################################
cat <<EOF_pxe.conf >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
  MENU TITLE  PXE Server
  MENU BACKGROUND pxelinux.cfg/logo.png
  NOESCAPE 1
  ALLOWOPTIONS 1
  PROMPT 0
  menu width 80
  menu rows 14
  MENU TABMSGROW 24
  MENU MARGIN 10
  menu color border               30;44      #ffffffff #00000000 std
EOF_pxe.conf

# /var/lib/tftpboot/pxelinux.cfg/default ##################################################
cat <<EOF_default >> /var/lib/tftpboot/pxelinux.cfg/default
  DEFAULT vesamenu.c32
  TIMEOUT 600
  ONTIMEOUT BootLocal
  PROMPT 0
  MENU INCLUDE pxelinux.cfg/pxe.conf
  NOESCAPE 1
  LABEL Boot off internal drive
       localboot 0
       TEXT HELP
       Boot to local hard disk
       ENDTEXT
  LABEL 1
       MENU LABEL DBAN - Hard Drive Sanitation
       KERNEL dban-2.3.0_i586/dban.bzi
       APPEND nuke=\"dwipe --autonuke\" silent vga=785
       TEXT HELP
       Warning - This will erase your hard drive
       ENDTEXT

# echo "LABEL 2" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        MENU LABEL Inventory Machine - Alpha (not working)" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        KERNEL clonezilla-live-2.4.2-10-i586.iso/vmlinuz" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        APPEND initrd=clonezilla-live-2.4.2-10-i586.iso/initrd.img boot=live config noswap nolocales edd=on nomodeset noprompt ocs_prerun=\"/var/www/html/TM_Inventory_Scanner.sh\" ocs_live_run=\"\" ocs_live_keymap=\"NONE\" ocs_live_batch=\"yes\" ocs_lang=\"en_US.UTF-8\" vga=791 ip=frommedia nosplash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes fetch=tftp://10.10.1.10/clonezilla-live-2.4.2-10-i586/filesystem.squashfs" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        Boot the Inventory Machine" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default

  LABEL 3
        MENU LABEL List Images
        KERNEL clonezilla-live-2.4.7-8-amd64/vmlinuz
        APPEND initrd=clonezilla-live-2.4.7-8-amd64/initrd.img boot=live config noswap nolocales edd=on nomodeset noprompt ocs_prerun=\"mount -t cifs -o user=user,password=password //10.10.10.10/Images /home/partimag\" ocs_live_run=\"ocs-sr -g auto -e1 auto -e2 -batch -icds -r -j2 -k1 -p reboot restoredisk ask_user sda\" ocs_live_keymap=\"NONE\" ocs_live_batch=\"yes\" ocs_lang=\"en_US.UTF-8\" vga=791 ip=frommedia nosplash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes fetch=tftp://10.10.10.10/clonezilla-live-2.4.7-8-amd64/filesystem.squashfs
        TEXT HELP
        Boot the List Images
        ENDTEXT
  LABEL 4
        MENU LABEL Create Image
        KERNEL clonezilla-live-2.4.7-8-amd64/vmlinuz
        APPEND initrd=clonezilla-live-2.4.7-8-amd64/initrd.img boot=live config noswap nolocales edd=on nomodeset noprompt ocs_prerun=\"mount -t cifs -o user=user,password=password //10.10.10.10/Images /home/partimag\" ocs_live_run=\"ocs-sr -q2 -j2 -rm-win-swap-hib -z1 -i 2000 -sc -fsck-src-part-y -p true savedisk ask_user sda\" ocs_live_keymap=\"NONE\" ocs_live_batch=\"yes\" ocs_lang=\"en_US.UTF-8\" vga=791 ip=frommedia nosplash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes fetch=tftp://10.10.10.10/clonezilla-live-2.4.7-8-amd64/filesystem.squashfs
        TEXT HELP
        Boot the Create Image
        ENDTEXT
  LABEL 5
        MENU LABEL Ubuntu-16.04.1-desktop-amd64
        KERNEL ubuntu-16.04.1-desktop-amd64/vmlinuz.efi
        APPEND boot=casper netboot=nfs nfsroot=10.10.10.10:/srv/install/ubuntu-16.04.1-desktop-amd64 initrd=ubuntu-16.04.1-desktop-amd64/initrd.lz
        TEXT HELP
        Boot the ubuntu-16.04.1-desktop-amd64
        ENDTEXT
EOF_default

chmod 777 -R /var/lib/tftpboot
echo "****************************************************************************"
echo "*** DHCP will now be installed, this machine should be network isolated. ***"
echo "****************************************************************************"

apt install -y isc-dhcp-server
# /etc/network/interfaces
# auto lo
# iface lo inet loopback
#cat <<EOF_interfaces >> /etc/network/interfaces
echo "auto `echo /sys/class/net | grep -v lo`" >> /etc/network/interfaces
echo "iface `echo /sys/class/net | grep -v lo` inet static" >> /etc/network/interfaces
echo "address 10.10.10.10" >> /etc/network/interfaces
echo "netmask 255.255.255.0" >> /etc/network/interfaces
echo "gateway 10.10.10.10" >> /etc/network/interfaces
#EOF_interfaces

# /etc/dhcp/dhcpd.conf
cat <<EOF_dhcpd.conf >> /etc/dhcp/dhcpd.conf
subnet 10.10.10.0 netmask 255.255.255.0 {
       range 10.10.10.100 10.10.10.200;
       filename "pxelinux.0";
       next-server 10.10.10.10;
       option subnet-mask 255.255.255.0;
       option broadcast-address 10.10.10.255;}
EOF_dhcpd.conf

ifconfig wlan0 down 2&>/dev/null
ifconfig `ls /sys/class/net | grep -v lo` 10.10.10.10 netmask 255.255.255.0
ifconfig `ls /sys/class/net | grep -v lo` down
ifconfig `ls /sys/class/net | grep -v lo` up
pkill dhclient
dhclient -r
service isc-dhcp-server restart
service tftpd-hpa restart
service nfs-kernel-server
service smbd restart

echo "#!/bin/bash" >> /home/user/Desktop/restart_pxe.sh
echo "sudo ifconfig `ls /sys/class/net | grep -v lo` 10.10.10.10 netmask 255.255.255.0 && sudo service isc-dhcp-server restart && sudo service tftpd-hpa restart ; sudo pkill dhclient" >> /home/user/Desktop/restart_pxe.sh
sudo chmod 775 /home/user/Desktop/restart_pxe.sh

echo "";echo ""; echo "Installation complete!" 
echo "You should now be able to PXE boot other computers directly from this computers network port, or through a switch. If you have having issues with some services, a restart_pxe.sh file was created to make settings easier."
echo ""

# sudo reboot
sh /home/user/Desktop/restart_pxe.sh

ifconfig `ls /sys/class/net | grep -v lo` 10.10.10.10 netmask 255.255.255.0
