#!/bin/bash

# This program has only been made possible by
# Electronic Access Foundation http://e-access.org/
# Computer Reach http://www.computerreach.org/
# National Cristina Foundation https://www.cristina.org/
# Hill Top Preparatory School http://hilltopprep.org/

# This program will setup a PXE boot server on a fresh Ubuntu 16.04.1 LTS install, It exspects an internet connection

# Images currently stored in /var/www/html/1.Images

# Check if running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# We want the most up to date packages to avoid conflict
apt -y update; echo ""

# sudo mkdir /home/images
# sudo chmod 775 -R /home/images
# Install required rependancies
apt install -y tftpd-hpa syslinux nfs-kernel-server samba apache2 cifs-utils openssh-server
echo "";echo ""; echo "****************************************************"
echo "** You must type in password as the password!! **"
echo "****************************************************"

# This works for a USER named "user"
smbpasswd -a user

# This should work for any currently logged in user running the script
# sudo smbpasswd -a $USER

# Apache directories setup #######################################################
mkdir /var/www/html/3.Scripts
# This path needs to be updated
cp /home/user/Downloads/EAF_PXE-master/pxe_create.sh /var/www/html/3.Scripts
mkdir /var/www/html/1.Images
mkdir /var/www/html/2.Reports
mkdir /var/www/html/4.ISOs
rm /var/www/html/index.html
chmod -R 777 /var/www/html
chown -R user /var/www/html/1.Images
chown -R user /var/www/html/2.Reports
ln -s /var/lib/tftpboot /var/www/html
# This path needs to be update
ln -s /home/user/Downloads /var/www/html
ln -s /home/user/Desktop /var/www/html

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

sudo service smbd restart

echo "This program assumes dban-2.3.0_i586.iso, clonezilla-live-2.4.2-10-i586.iso and ubuntu-16.04.1-desktop-amd64.iso are in the downloads folders or it will attempt a download from a hard coded location that may fail."; echo ""

# 7/23/15 DBan has been updated  if [ ! -f ~/Downloads/dban-2.2.8_i586.iso ]; then
# http://sourceforge.net/projects/dban/files/dban/dban-2.3.0/dban-2.3.0_i586.iso
if [ ! -f /home/user/Downloads/dban-2.3.0_i586.iso ]; then
   echo "~/Downloads/dban-2.3.0_i586.iso NOT found, attempting to download."
   echo "--Downloading dban-2.3.0_i586.iso..."
   cd ~/Downloads
   wget http://downloads.sourceforge.net/project/dban/dban/dban-2.3.0/dban-2.3.0_i586.iso
   echo "DBAN download complete."
   echo ""
else
   echo "dban-2.3.0_i586.iso found."
fi
echo ""

# 7/23/15 Clonezilla version updated
if [ ! -f /home/user/Downloads/clonezilla-live-2.4.7-8-amd64.iso ]; then
   echo "clonezilla-live-2.4.7-8-amd64.iso NOT found, attempting to download."
   echo "--Downloading clonezilla-live-2.4.7-8-amd64.iso ..."
   cd ~/Downloads
#   wget http://downloads.sourceforge.net/project/clonezilla/clonezilla_live_stable/2.4.2-10/clonezilla-live-2.4.2-10-i586.iso
# 7/23/16 Clonezilla update
   wget https://osdn.jp/frs/redir.php?m=gigenet&f=%2Fclonezilla%2F66042%2Fclonezilla-live-2.4.7-8-amd64.iso
else
   echo "clonezilla-live-2.4.7-8-amd64.iso found."
fi

echo ""
if [ ! -f /home/user/Downloads/ubuntu-16.04.1-desktop-amd64.iso ]; then
   echo "ubuntu-16.04.1-desktop-amd64.iso NOT found, attempting to download."
   echo "--Downloading ubuntu-16.04.1-desktop-amd64.iso..."
   cd ~/Downloads
#  wget  https://nyc3.dl.elementary.io/download/MTQ0MjE4OTk5Nw==/elementaryos-stable-0.3.1-i386.20150903.iso
#  https://nyc3.dl.elementary.io/download/MTQ3NDg1NjE4MA==/elementaryos-0.4-stable-amd64.20160921.iso

#   wget http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-desktop-i386.iso
   wget http://releases.ubuntu.com/16.04.1/ubuntu-16.04.1-desktop-amd64.iso
else
   echo "ubuntu-16.04.1-desktop-amd64.iso found."
fi

# https://nyc3.dl.elementary.io/download/MTQ0MjE4OTk5Nw==/elementaryos-stable-0.3.1-i386.20150903.iso
# https://nyc3.dl.elementary.io/download/MTQ0MjE4OTk5Nw==/elementaryos-stable-0.3.1-amd64.20150903.iso
# if [ ! -d /srv/install/ubuntu-16.04.1-desktop-amd64.iso ]; then
   mkdir /srv/install/ubuntu-16.04.1-desktop-amd64 #; fi
# if [ ! -d /mnt/loop ]; then
   mkdir /mnt/loop #; fi
#if [ ! -d /var/lib/tftpboot/dban-2.3.0_i586 ]; then
   mkdir /var/lib/tftpboot/dban-2.3.0_i586 #; fi
#if [ ! -d /srv/install/dban-2.3.0_i586 ]; then
   mkdir /srv/install/dban-2.3.0_i586 #; fi
mount -o loop -t iso9660 /home/`echo $USER`/Downloads/dban-2.3.0_i586.iso /mnt/loop
cp /mnt/loop/dban.bzi /var/lib/tftpboot/dban-2.3.0_i586/dban.bzi
umount /mnt/loop

#if [ ! -d /var/lib/tftpboot/clonezilla-live-2.4.7-8-amd64.iso ]; then
  mkdir /var/lib/tftpboot/clonezilla-live-2.4.7-8-amd64 #; fi
mount -o loop -t iso9660 /home/`echo $USER`/Downloads/cclonezilla-live-2.4.7-8-amd64.iso /mnt/loop
cp /mnt/loop/live/vmlinuz /var/lib/tftpboot/clonezilla-live-2.4.7-8-amd64
cp /mnt/loop/live/initrd.img /var/lib/tftpboot/clonezilla-live-2.4.7-8-amd64
cp /mnt/loop/live/filesystem.squashfs /var/lib/tftpboot/clonezilla-live-2.4.7-8-amd64
umount /mnt/loop

#if [ ! -d /var/lib/tftpboot/ubuntu-16.04.1-desktop-amd64 ]; then
  mkdir /var/lib/tftpboot/ubuntu-16.04.1-desktop-amd64 #; fi
mount -o loop -t iso9660 /home/`echo $USER`/Downloads/ubuntu-16.04.1-desktop-amd64.iso /mnt/loop
cp /mnt/loop/casper/vmlinuz /var/lib/tftpboot/ubuntu-16.04.1-desktop-amd64
cp /mnt/loop/casper/initrd.lz /var/lib/tftpboot/ubuntu-16.04.1-desktop-amd64

mkdir -p /srv/install/ubuntu-16.04.1-desktop-amd64
cp -R /mnt/loop/* /srv/install/ubuntu-16.04.1-desktop-amd64
cp -R /mnt/loop/.disk /srv/install/ubuntu-16.04.1-desktop-amd64
umount /mnt/loop

######### Syslinux setup stuff #####################################################
# wget https://help.ubuntu.com/community/PXEInstallMultiDistro?action=AttachFile&do=view&target=logo.png
cp /home/user/Downloads/logo.png /var/lib/tftpboot/pxelinux.cfg
cp /usr/lib/syslinux/pxelinux.0 /var/lib/tftpboot
cp /usr/lib/syslinux/vesamenu.c32 /var/lib/tftpboot
mkdir /var/lib/tftpboot/pxelinux.cfg
touch /var/lib/tftpboot/pxelinux.cfg/pxe.conf
touch /var/lib/tftpboot/pxelinux.cfg/default
mkdir -p /srv/install
echo "/srv/install         10.10.1.0/24(rw,async,no_root_squash,no_subtree_check) " > /etc/exports
exportfs -a

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
echo "DEFAULT vesamenu.c32" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "TIMEOUT 600" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "ONTIMEOUT BootLocal" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "PROMPT 0" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "MENU INCLUDE pxelinux.cfg/pxe.conf" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "NOESCAPE 1" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL Boot off internal drive" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        localboot 0" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Boot to local hard disk" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL 1" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        MENU LABEL DBAN - Hard Drive Sanitation" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        KERNEL dban-2.3.0_i586/dban.bzi" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        APPEND nuke=\"dwipe --autonuke\" silent vga=785" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Warning - This will erase your hard drive" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
/*
# echo "LABEL 2" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        MENU LABEL Inventory Machine - Alpha (not working)" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        KERNEL clonezilla-live-2.4.2-10-i586.iso/vmlinuz" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        APPEND initrd=clonezilla-live-2.4.2-10-i586.iso/initrd.img boot=live config noswap nolocales edd=on nomodeset noprompt ocs_prerun=\"/var/www/html/TM_Inventory_Scanner.sh\" ocs_live_run=\"\" ocs_live_keymap=\"NONE\" ocs_live_batch=\"yes\" ocs_lang=\"en_US.UTF-8\" vga=791 ip=frommedia nosplash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes fetch=tftp://10.10.1.10/clonezilla-live-2.4.2-10-i586/filesystem.squashfs" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        Boot the Inventory Machine" >> /var/lib/tftpboot/pxelinux.cfg/default
# echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
*/
echo "LABEL 3" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        MENU LABEL List Images" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        KERNEL clonezilla-live-2.4.7-8-amd64/vmlinuz" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        APPEND initrd=clonezilla-live-2.4.7-8-amd64/initrd.img boot=live config noswap nolocales edd=on nomodeset noprompt ocs_prerun=\"mount -t cifs -o user=user,password=password //10.10.1.10/Images /home/partimag\" ocs_live_run=\"ocs-sr -g auto -e1 auto -e2 -batch -icds -r -j2 -k1 -p reboot restoredisk ask_user sda\" ocs_live_keymap=\"NONE\" ocs_live_batch=\"yes\" ocs_lang=\"en_US.UTF-8\" vga=791 ip=frommedia nosplash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes fetch=tftp://10.10.1.10/clonezilla-live-2.4.7-8-amd64/filesystem.squashfs" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Boot the List Images" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL 4" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        MENU LABEL Create Image" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        KERNEL clonezilla-live-2.4.2-10-i586/vmlinuz" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        APPEND initrd=clonezilla-live-2.4.2-10-i586/initrd.img boot=live config noswap nolocales edd=on nomodeset noprompt ocs_prerun=\"mount -t cifs -o user=user,password=password //10.10.1.10/Images /home/partimag\" ocs_live_run=\"ocs-sr -q2 -j2 -rm-win-swap-hib -z1 -i 2000 -sc -fsck-src-part-y -p true savedisk ask_user sda\" ocs_live_keymap=\"NONE\" ocs_live_batch=\"yes\" ocs_lang=\"en_US.UTF-8\" vga=791 ip=frommedia nosplash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes fetch=tftp://10.10.1.10/clonezilla-live-2.4.7-8-amd64/filesystem.squashfs" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Boot the Create Image" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL 5" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        MENU LABEL Ubuntu-16.04.1-desktop-amd64" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        KERNEL ubuntu-16.04.1-desktop-amd64/vmlinuz" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        APPEND boot=casper netboot=nfs nfsroot=10.10.1.10:/srv/install/ubuntu-16.04.1-desktop-amd64 initrd=ubuntu-16.04.1-desktop-amd64/initrd.lz" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Boot the ubuntu-16.04.1-desktop-amd64" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default

sudo chmod 777 -R /var/lib/tftpboot
echo ""
echo "DHCP will now be installed, this machine should be network isolated."
echo ""

sudo apt-get install -y isc-dhcp-server
# /etc/network/interfaces
echo "auto lo" > /etc/network/interfaces
echo "iface lo inet loopback" >> /etc/network/interfaces
echo "auto eth0" >> /etc/network/interfaces
echo "iface eth0 inet static" >> /etc/network/interfaces
echo "address 10.10.1.10" >> /etc/network/interfaces
echo "netmask 255.255.255.0" >> /etc/network/interfaces
echo "gateway 10.10.1.10 " >> /etc/network/interfaces
# /etc/dhcp/dhcpd.conf
echo "subnet 10.10.1.0 netmask 255.255.255.0 {" >> /etc/dhcp/dhcpd.conf
echo "        range 10.10.1.100 10.10.1.200;" >> /etc/dhcp/dhcpd.conf
echo "        filename \"pxelinux.0\";" >> /etc/dhcp/dhcpd.conf
echo "        next-server 10.10.1.10;" >> /etc/dhcp/dhcpd.conf
echo "        option subnet-mask 255.255.255.0;" >> /etc/dhcp/dhcpd.conf
echo "        option broadcast-address 10.10.1.255;}" >> /etc/dhcp/dhcpd.conf

sudo ifconfig wlan0 down
sudo ifconfig eth0 10.10.1.10 netmask 255.255.255.0
sudo ifconfig eth0 down
sudo ifconfig eth0 up
sudo pkill dhclient
sudo dhclient -r
sudo service isc-dhcp-server restart
sudo service tftpd-hpa restart
sudo service nfs-kernel-server
sudo service samaba restart

echo "#!/bin/bash" >> ~/Desktop/restart_pxe.sh
echo "sudo ifconfig eth0 10.10.1.10 netmask 255.255.255.0 && sudo service isc-dhcp-server restart && sudo service tftpd-hpa restart ; sudo pkill dhclient" >> ~/Desktop/restart_pxe.sh
sudo chmod 775 ~/Desktop/restart_pxe.sh

echo "You should now be able to PXE boot other computers directly from this computers network port, or through a switch. If you have having issues with some services, a restart_pxe.sh file was created to make settings easier."
echo ""
sudo reboot

# rm ~/Downloads/dban-2.2.8_i586.iso
# rm ~/Downloads/ubuntu-14.04.-desktop-i386.iso
# rm ~/Downloads/edubuntu-14.04.-dvd-i386.iso
# rm ~/Downloads/clonezilla-live-2.3.2-22-i586
# rm ~/Downloads/lubuntu-15.04-desktop-i386
# rm ~/Downloads/elementaryos-freya-i386.20150411
