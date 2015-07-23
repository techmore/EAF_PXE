#!/bin/bash

sudo apt-get -y update; echo ""
echo "This program assumes dban-2.2.8_i586.iso and ubuntu-14.04.2-desktop-i386.iso are in the downloads folders or it will attempt a download from a hard coded location that may fail."; echo ""

# 7/23/15 DBan has been updated  if [ ! -f ~/Downloads/dban-2.2.8_i586.iso ]; then
# http://sourceforge.net/projects/dban/files/dban/dban-2.3.0/dban-2.3.0_i586.iso
if [ ! -f ~/Downloads/dban-2.3.0_i586.iso ]; then
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
http://downloads.sourceforge.net/project/clonezilla/clonezilla_live_stable/2.4.2-10/clonezilla-live-2.4.2-10-i586.iso

# 7/23/15 Clonezilla version updated
# if [ ! -f ~/Downloads/clonezilla-live-2.3.2-22-i586.iso ]; then
if [ ! -f ~/Downloads/clonezilla-live-2.4.2-10-i586.iso ]; then
   echo "clonezilla-live-2.4.2-10-i586.iso NOT found, attempting to download."
   echo "--Downloading clonezilla-live-2.4.2-10-i586.iso ..."
   cd ~/Downloads
   wget http://downloads.sourceforge.net/project/clonezilla/clonezilla_live_stable/2.4.2-10/clonezilla-live-2.4.2-10-i586.iso
else
   echo "clonezilla-live-2.4.2-10-i586.iso found."
fi


/*

 Edubuntu 	A complete Linux based operating system targeted for primary and secondary education. It is freely available with community based support. The Edubuntu community is built on the ideas enshrined in the Edubuntu Manifesto: that software, especially for education, should be available free of charge and that software tools should be usable by people in their local language and despite any disabilities.[54]
 Kubuntu 	An official derivative of Ubuntu Linux using KDE instead of the GNOME or Unity interfaces used by default in Ubuntu.[55]
 Ubuntu GNOME 	An official Ubuntu variant[56] that uses Gnome Shell as its default desktop and GDM as its display manager.[57]
Ubuntu MATE 	An official derivative of Ubuntu using MATE, a desktop environment forked from the now-defunct GNOME 2 code base, with an emphasis on the desktop metaphor.[58]
 Lubuntu 	Lubuntu is a project that is an official derivative of the Ubuntu operating system that is "lighter, less resource hungry and more energy-efficient", using the LXDE desktop environment.[59][60][61]
 Xubuntu 	An official derivative of Ubuntu using Xfce. Xubuntu is intended for use on less-powerful computers or those who seek a highly efficient desktop environment on faster systems, and uses mostly GTK+ applications.[62]
 Mythbuntu 	Based on Ubuntu and MythTV, providing applications for recording TV and acting as a media center.[63]
Ubuntu for Android 	Designed for use with Android phones.[64]
UbuntuKylin 	An official derivative aimed at the Chinese market.
 Ubuntu Server 	An official derivative made for use in servers. Ubuntu Server handles mail, controls printers, acts as a fileserver, can host LAMP and more.[65]
 Ubuntu Studio 	Based on Ubuntu, providing open-source applications for multimedia creation aimed at the audio, video and graphic editors.[66]
Ubuntu Touch 	Designed for use with touchscreen devices.
Ubuntu TV 	Designed for use with TVs.[67]


Desktop
http://releases.ubuntu.com/14.04.2/ubuntu-14.04.2-desktop-amd64.iso.torrent
http://releases.ubuntu.com/14.04.2/ubuntu-14.04.2-desktop-i386.iso.torrent
Server
http://releases.ubuntu.com/14.04.2/ubuntu-14.04.2-server-amd64.iso.torrent
http://releases.ubuntu.com/14.04.2/ubuntu-14.04.2-server-i386.iso.torrent
Net install
http://archive.ubuntu.com/ubuntu/dists/trusty-updates/main/installer-amd64/current/images/netboot/netboot.tar.gz
http://archive.ubuntu.com/ubuntu/dists/trusty-updates/main/installer-i386/current/images/netboot/netboot.tar.gz

Edubuntu
http://cdimage.ubuntu.com/edubuntu/releases/14.04.2/release/edubuntu-14.04.2-dvd-amd64.iso.torrent
http://cdimage.ubuntu.com/edubuntu/releases/14.04.2/release/edubuntu-14.04.2-dvd-i386.iso.torrent
Lubuntu
http://cdimage.ubuntu.com/lubuntu/releases/14.04.2/release/lubuntu-14.04.2-desktop-i386.iso.torrent
http://cdimage.ubuntu.com/lubuntu/releases/14.04.2/release/lubuntu-14.04.2-desktop-amd64.iso.torrent
Kubuntu
http://cdimage.ubuntu.com/kubuntu/releases/14.04.2/release/kubuntu-14.04.2-desktop-amd64.iso.torrent
http://cdimage.ubuntu.com/kubuntu/releases/14.04.2/release/kubuntu-14.04.2-desktop-i386.iso.torrent
ubuntu-gnome
http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04.2/release/ubuntu-gnome-14.04.2-desktop-amd64.iso.torrent
http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04.2/release/ubuntu-gnome-14.04.2-desktop-i386.iso.torrent
xubuntu
http://cdimage.ubuntu.com/xubuntu/releases/14.04.2/release/xubuntu-14.04.2-desktop-amd64.iso.torrent
http://cdimage.ubuntu.com/xubuntu/releases/14.04.2/release/xubuntu-14.04.2-desktop-i386.iso.torrent

Ubuntu-NEXT
http://cdimage.ubuntu.com/ubuntu-desktop-next/backup-20150422/vivid-desktop-amd64.iso
http://cdimage.ubuntu.com/ubuntu-desktop-next/backup-20150422/vivid-desktop-i386.iso

ubuntmyth
http://cdimage.ubuntu.com/mythbuntu/releases/14.04.2/release/mythbuntu-14.04.2-desktop-amd64.iso.torrent
http://cdimage.ubuntu.com/mythbuntu/releases/14.04.2/release/mythbuntu-14.04.2-desktop-i386.iso.torrent

ubuntustudio
http://cdimage.ubuntu.com/ubuntustudio/releases/14.04.2/release/ubuntustudio-14.04.2-dvd-i386.iso.torrent
http://cdimage.ubuntu.com/ubuntustudio/releases/14.04.2/release/ubuntustudio-14.04.2-dvd-amd64.iso.torrent
*/
echo ""
if [ ! -f ~/Downloads/ubuntu-14.04.2-desktop-i386.iso ]; then
   echo "ubuntu-14.04.2-desktop-i386.iso NOT found, attempting to download."
   echo "--Downloading Ubuntu 14.04 32-bit Desktop LTS..."
   cd ~/Downloads
   wget http://releases.ubuntu.com/14.04.2/ubuntu-14.04.2-desktop-i386.iso
else
   echo "Ubuntu-14.04.2-desktop-i386.iso found."
fi

sudo apt-get install -y tftpd-hpa syslinux nfs-kernel-server samba apache2 cifs-utils
echo "";echo ""
echo "You must type in password as the password."
sudo smbpasswd -a user

# Apache directories setup #######################################################
mkdir /var/www/html/3.Scripts
sudo cp ~/Downloads/pxe_create.sh /var/www/html/3.Scripts
sudo mkdir /var/www/html/1.Images
sudo mkdir /var/www/html/2.Reports
sudo rm /var/www/html/index.html
sudo chmod -R 777 /var/www/html
sudo chown -R user /var/www/html/1.Images
sudo chown -R user /var/www/html/2.Reports
sudo ln -s /var/lib/tftpboot /var/www/html
sudo cp /etc/samba/smb.conf ~
echo "[Images]" >> /etc/samba/smb.conf
echo "path = /var/www/html/1.Images" >> /etc/samba/smb.conf
echo "available = yes" >> /etc/samba/smb.conf
echo "valid users = user" >> /etc/samba/smb.conf
echo "read only = no" >> /etc/samba/smb.conf
echo "browseable = yes" >> /etc/samba/smb.conf
echo "public = yes" >> /etc/samba/smb.conf
echo "writeable = yes" >> /etc/samba/smb.conf
echo "guest ok = yes" >> /etc/samba/smb.conf
echo "" >> /etc/samba/smb.conf
echo "[Reports]" >> /etc/samba/smb.conf
echo "path = /var/www/html/2.Reports" >> /etc/samba/smb.conf
echo "available = yes" >> /etc/samba/smb.conf
echo "valid users = user" >> /etc/samba/smb.conf
echo "read only = no" >> /etc/samba/smb.conf
echo "browseable = yes" >> /etc/samba/smb.conf
echo "public = yes" >> /etc/samba/smb.conf
echo "writeable = yes" >> /etc/samba/smb.conf
echo "guest ok = yes" >> /etc/samba/smb.conf
sudo service smbd restart

if [ ! -d /srv/install/ubuntu-14.04.2-desktop-i386 ]; then
   sudo mkdir /srv/install/ubuntu-14.04.2-desktop-i386; fi
if [ ! -d /mnt/loop ]; then
   sudo mkdir /mnt/loop; fi
if [ ! -d /var/lib/tftpboot/dban-2.3.0_i586 ]; then
   sudo mkdir /var/lib/tftpboot/dban-2.3.0_i586; fi
if [ ! -d /srv/install/dban-2.3.0_i586 ]; then
   sudo mkdir /srv/install/dban-2.3.0_i586; fi
sudo mount -o loop -t iso9660 ~/Downloads/dban-2.3.0_i586.iso /mnt/loop
sudo cp /mnt/loop/dban.bzi /var/lib/tftpboot/dban-2.3.0_i586/dban.bzi
sudo umount /mnt/loop

if [ ! -d /var/lib/tftpboot/clonezilla-live-2.4.2-10-i586.iso ]; then
  sudo mkdir /var/lib/tftpboot/clonezilla-live-2.4.2-10-i586; fi
sudo mount -o loop -t iso9660 ~/Downloads/clonezilla-live-2.4.2-10-i586.iso /mnt/loop
sudo cp /mnt/loop/live/vmlinuz /var/lib/tftpboot/clonezilla-live-2.4.2-10-i586
sudo cp /mnt/loop/live/initrd.img /var/lib/tftpboot/clonezilla-live-2.4.2-10-i586
sudo cp /mnt/loop/live/filesystem.squashfs /var/lib/tftpboot/clonezilla-live-2.4.2-10-i586
sudo umount /mnt/loop

if [ ! -d /var/lib/tftpboot/ubuntu-14.04.2-desktop-i386 ]; then
  sudo mkdir /var/lib/tftpboot/ubuntu-14.04.2-desktop-i386; fi
sudo mount -o loop -t iso9660 ~/Downloads/ubuntu-14.04.2-desktop-i386.iso /mnt/loop
sudo cp /mnt/loop/casper/vmlinuz /var/lib/tftpboot/ubuntu-14.04.2-desktop-i386
sudo cp /mnt/loop/casper/initrd.lz /var/lib/tftpboot/ubuntu-14.04.2-desktop-i386

if [ ! -d /srv/install/ubuntu-14.04.2-desktop-i386 ]; then
  sudo mkdir -p /srv/install/ubuntu-14.04.2-desktop-i386; fi
sudo cp -R /mnt/loop/* /srv/install/ubuntu-14.04.2-desktop-i386
sudo cp -R /mnt/loop/.disk /srv/install/ubuntu-14.04.2-desktop-i386
sudo umount /mnt/loop

######### Syslinux setup stuff #####################################################
# wget https://help.ubuntu.com/community/PXEInstallMultiDistro?action=AttachFile&do=view&target=logo.png
sudo cp ~/Downloads/logo.png /var/lib/tftpboot/pxelinux.cfg
sudo cp /usr/lib/syslinux/pxelinux.0 /var/lib/tftpboot
sudo cp /usr/lib/syslinux/vesamenu.c32 /var/lib/tftpboot
sudo mkdir /var/lib/tftpboot/pxelinux.cfg
sudo touch /var/lib/tftpboot/pxelinux.cfg/pxe.conf
sudo touch /var/lib/tftpboot/pxelinux.cfg/default
sudo mkdir /srv/install
sudo echo "/srv/install         10.10.1.0/24(rw,async,no_root_squash,no_subtree_check) " > /etc/exports
sudo exportfs -a

# /var/lib/tftpboot/pxelinux.cfg/pxe.conf ############################################
echo "MENU TITLE  PXE Server" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
echo "MENU BACKGROUND pxelinux.cfg/logo.png" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
echo "NOESCAPE 1" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
echo "ALLOWOPTIONS 1" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
echo "PROMPT 0" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
echo "menu width 80" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
echo "menu rows 14" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
echo "MENU TABMSGROW 24" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
echo "MENU MARGIN 10" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf
echo "menu color border               30;44      #ffffffff #00000000 std" >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf

# /var/lib/tftpboot/pxelinux.cfg/default ##################################################
echo "DEFAULT vesamenu.c32" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "TIMEOUT 600" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "ONTIMEOUT BootLocal" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "PROMPT 0" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "MENU INCLUDE pxelinux.cfg/pxe.conf" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "NOESCAPE 1" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL BootLocal" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        localboot 0" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Boot to local hard disk" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL 1" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        MENU LABEL DBAN Boot and Nuke" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        KERNEL dban-2.3.0_i586/dban.bzi" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        APPEND nuke="dwipe" silent floppy=0,16,cmos" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Warning - This will erase your hard drive" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL 2" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        MENU LABEL Inventory Machine - Alpha (not working)" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        KERNEL clonezilla-live-2.4.2-10-i586.iso/vmlinuz" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        APPEND initrd=clonezilla-live-2.4.2-10-i586.iso/initrd.img boot=live config noswap nolocales edd=on nomodeset noprompt ocs_prerun=\"/var/www/html/TM_Inventory_Scanner.sh\" ocs_live_run=\"\" ocs_live_keymap=\"NONE\" ocs_live_batch=\"yes\" ocs_lang=\"en_US.UTF-8\" vga=791 ip=frommedia nosplash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes fetch=tftp://10.10.1.10/clonezilla-live-2.3.2-22-i586/filesystem.squashfs" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Boot the Inventory Machine" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL 3" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        MENU LABEL List Images" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        KERNEL clonezilla-live-2.4.2-10-i586./vmlinuz" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        APPEND initrd=cclonezilla-live-2.4.2-10-i586/initrd.img boot=live config noswap nolocales edd=on nomodeset noprompt ocs_prerun=\"mount -t cifs -o user=user,password=password //10.10.1.10/Images /home/partimag\" ocs_live_run=\"ocs-sr -g auto -e1 auto -e2 -batch -icds -r -j2 -k1 -p reboot restoredisk ask_user sda\" ocs_live_keymap=\"NONE\" ocs_live_batch=\"yes\" ocs_lang=\"en_US.UTF-8\" vga=791 ip=frommedia nosplash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes fetch=tftp://10.10.1.10/clonezilla-live-2.3.2-22-i586/filesystem.squashfs" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Boot the List Images" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL 4" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        MENU LABEL Create Image" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        KERNEL clonezilla-live-2.4.2-10-i586/vmlinuz" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        APPEND initrd=clonezilla-live-2.4.2-10-i586/initrd.img boot=live config noswap nolocales edd=on nomodeset noprompt ocs_prerun=\"mount -t cifs -o user=user,password=password //10.10.1.10/Images /home/partimag\" ocs_live_run=\"ocs-sr -q2 -j2 -rm-win-swap-hib -z1 -i 2000 -sc -fsck-src-part-y -p true savedisk ask_user sda\" ocs_live_keymap=\"NONE\" ocs_live_batch=\"yes\" ocs_lang=\"en_US.UTF-8\" vga=791 ip=frommedia nosplash i915.blacklist=yes radeonhd.blacklist=yes nouveau.blacklist=yes vmwgfx.blacklist=yes fetch=tftp://10.10.1.10/clonezilla-live-2.3.2-22-i586/filesystem.squashfs" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Boot the Create Image" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "LABEL 5" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        MENU LABEL Ubuntu-14.04.2-desktop-i386" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        KERNEL ubuntu-14.04.2-desktop-i386/vmlinuz" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        APPEND boot=casper netboot=nfs nfsroot=10.10.1.10:/srv/install/ubuntu-14.04.2-desktop-i386 initrd=ubuntu-14.04.2-desktop-i386/initrd.lz" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "        Boot the ubuntu-14.04.2-desktop-i386" >> /var/lib/tftpboot/pxelinux.cfg/default
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
# rm ~/Downloads/ubuntu-14.04.2-desktop-i386.iso
# rm ~/Downloads/edubuntu-14.04.2-dvd-i386.iso
# rm ~/Downloads/clonezilla-live-2.3.2-22-i586
# rm ~/Downloads/lubuntu-15.04-desktop-i386
# rm ~/Downloads/elementaryos-freya-i386.20150411
