#!/bin/bash

#  /srv/install 23GB
echo "This script will install x86 / x64 versions of the following operating systems. 
 Edubuntu - A complete Linux based operating system targeted for primary and secondary education. It is freely available with community based support. The Edubuntu community is built on the ideas enshrined in the Edubuntu Manifesto: that software, especially for education, should be available free of charge and that software tools should be usable by people in their local language and despite any disabilities.
 Net Installer
 Ubuntu Desktop 
 Ubuntu Server - An official derivative made for use in servers. Ubuntu Server handles mail, controls printers, acts as a fileserver, can host LAMP and more.
 Lubuntu - Lubuntu is a project that is an official derivative of the Ubuntu operating system that is lighter, less resource hungry and more energy-efficient, using the LXDE desktop environment.
 Xubuntu - An official derivative of Ubuntu using Xfce. Xubuntu is intended for use on less-powerful computers or those who seek a highly efficient desktop environment on faster systems, and uses mostly GTK+ applications.
 Mythbuntu - Based on Ubuntu and MythTV, providing applications for recording TV and acting as a media center.
  Ubuntu Studio - Based on Ubuntu, providing open-source applications for multimedia creation aimed at the audio, video and graphic editors. "

ubuntu_array=(
#   http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-desktop-i386.iso
#   http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-desktop-amd64.iso
#   http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-server-amd64.iso
    http://releases.ubuntu.com/16.04.1/ubuntu-16.04.1-desktop-amd64.iso
    http://releases.ubuntu.com/16.04.1/ubuntu-16.04.1-server-amd64.iso
)
ubuntu_net_array=(
#   http://archive.ubuntu.com/ubuntu/dists/trusty-updates/main/installer-i386/current/images/netboot/netboot.tar.gz
#   http://archive.ubuntu.com/ubuntu/dists/trusty-updates/main/installer-amd64/current/images/netboot/netboot.tar.gz
    http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/netboot.tar.gz
)
iso_array=(
#  http://cdimage.ubuntu.com/edubuntu/releases/14.04.2/release/edubuntu-14.04.3-dvd-amd64.iso 
#  http://cdimage.ubuntu.com/edubuntu/releases/14.04.2/release/edubuntu-14.04.3-dvd-i386.iso 
   http://cdimage.ubuntu.com/edubuntu/releases/14.04.5/release/edubuntu-14.04.5-dvd-i386.iso

#   http://cdimage.ubuntu.com/ubuntu-mate/releases/15.04/release/ubuntu-mate-15.04-desktop-i386.iso
#   http://cdimage.ubuntu.com/ubuntu-mate/releases/15.04/release/ubuntu-mate-15.04-desktop-amd64.iso

#   http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04.3/release/ubuntu-gnome-14.04.3-desktop-i386.iso
#   http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04.3/release/ubuntu-gnome-14.04.3-desktop-amd64.iso
    
#   http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/lubuntu-14.04.3-desktop-i386.iso
#   http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/lubuntu-14.04.3-desktop-amd64.iso
    http://cdimage.ubuntu.com/lubuntu/xenial/daily/current/xenial-alternate-amd64.iso

#  http://cdimage.ubuntu.com/xubuntu/releases/14.04.3/release/xubuntu-14.04.3-desktop-i386.iso
#  http://cdimage.ubuntu.com/xubuntu/releases/14.04.3/release/xubuntu-14.04.3-desktop-amd64.iso

#  http://cdimage.ubuntu.com/mythbuntu/releases/14.04.3/release/mythbuntu-14.04.3-desktop-i386.iso
#  http://cdimage.ubuntu.com/mythbuntu/releases/14.04.3/release/mythbuntu-14.04.3-desktop-amd64.iso
   http://cdimage.ubuntu.com/mythbuntu/xenial/daily-live/current/xenial-desktop-amd64.iso

#   http://cdimage.ubuntu.com/ubuntustudio/releases/14.04.3/release/ubuntustudio-14.04.3-dvd-i386.iso
#   http://cdimage.ubuntu.com/ubuntustudio/releases/14.04.3/release/ubuntustudio-14.04.3-dvd-amd64.iso
   http://cdimage.ubuntu.com/ubuntustudio/xenial/dvd/current/xenial-dvd-amd64.iso
)

torrent_array=(
    http://cdimage.ubuntu.com/edubuntu/releases/14.04.2/release/edubuntu-14.04.3-dvd-amd64.iso.torrent
    http://cdimage.ubuntu.com/edubuntu/releases/14.04.2/release/edubuntu-14.04.3-dvd-i386.iso.torrent
    
    http://cdimage.ubuntu.com/kubuntu/releases/trusty/release/kubuntu-14.04.3-desktop-i386.iso.torrent
    http://cdimage.ubuntu.com/kubuntu/releases/trusty/release/kubuntu-14.04.3-desktop-amd64.iso.torrent

    http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-desktop-i386.iso.torrent
    http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-desktop-amd64.iso.torrent
 
    http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-server-i386.iso.torrent
    http://releases.ubuntu.com/14.04.3/ubuntu-14.04.3-server-amd64.iso.torrent

    http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04.3/release/ubuntu-gnome-14.04.3-desktop-i386.iso.torrent
    http://cdimage.ubuntu.com/ubuntu-gnome/releases/14.04.3/release/ubuntu-gnome-14.04.3-desktop-amd64.iso.torrent

     http://cdimage.ubuntu.com/ubuntu-mate/releases/15.04/release/ubuntu-mate-15.04-desktop-i386.iso.torrent
     http://cdimage.ubuntu.com/ubuntu-mate/releases/15.04/release/ubuntu-mate-15.04-desktop-amd64.iso.torrent

     http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/lubuntu-14.04.3-desktop-i386.iso.torrent
     http://cdimage.ubuntu.com/lubuntu/releases/14.04/release/lubuntu-14.04.3-desktop-amd64.iso.torrent

    http://cdimage.ubuntu.com/xubuntu/releases/14.04.3/release/xubuntu-14.04.3-desktop-i386.iso.torrent
    http://cdimage.ubuntu.com/xubuntu/releases/14.04.3/release/xubuntu-14.04.3-desktop-amd64.iso.torrent

     http://cdimage.ubuntu.com/mythbuntu/releases/14.04.3/release/mythbuntu-14.04.3-desktop-i386.iso.torrent
     http://cdimage.ubuntu.com/mythbuntu/releases/14.04.3/release/mythbuntu-14.04.3-desktop-amd64.iso.torrent

     http://cdimage.ubuntu.com/ubuntustudio/releases/14.04.3/release/ubuntustudio-14.04.3-dvd-i386.iso.torrent
     http://cdimage.ubuntu.com/ubuntustudio/releases/14.04.3/release/ubuntustudio-14.04.3-dvd-amd64.iso.torrent
)


# echo "Please select : 
# 1.ISO
# 2.Torrent ( not working )"

# read method

# if [ method == 1 ]; then
#    echo "Downloading ISOs"
# fi

# " >> /var/lib/tftpboot/pxelinux.cfg/pxe.conf

echo " MENU BEGIN Ubuntu" >> /var/lib/tftpboot/pxelinux.cfg/default
echo " MENU TITLE Ubuntu" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "         LABEL Previous" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "         MENU LABEL Previous Menu" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "         TEXT HELP" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "         Return to previous menu" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "         ENDTEXT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "         MENU EXIT" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "         MENU SEPARATOR" >> /var/lib/tftpboot/pxelinux.cfg/default
echo "         MENU INCLUDE Ubuntu/Ubuntu.menu" >> /var/lib/tftpboot/pxelinux.cfg/default
echo " MENU END" >> /var/lib/tftpboot/pxelinux.cfg/default


sudo mkdir /var/lib/tftpboot/Ubuntu
sudo touch /var/lib/tftpboot/Ubuntu/Ubuntu.menu

for x in ${ubuntu_array[@]}; do
   # echo $x
   y=$(echo $x | cut -d / -f 5)
   z=$(echo $y | sed "s/.iso//g")

#   echo $y
   echo ""
   if [ ! -f ~/Downloads/$y ]; then
      echo "~/$y NOT found, attempting to download."
      echo "--Downloading $y LTS..."
      cd ~/Downloads
      wget $x
   else
      echo "$y found."
   fi
   if [ ! -d /var/lib/tftpboot/Ubuntu/$z ]; then
      sudo mkdir /var/lib/tftpboot/Ubuntu/$z; fi
      sudo mount -o loop -t iso9660 ~/Downloads/$y /mnt/loop
      sudo cp /mnt/loop/casper/vmlinuz /var/lib/tftpboot/Ubuntu/$z
      sudo cp /mnt/loop/install/vmlinuz.efi /var/lib/tftpboot/Ubuntu/$z

      sudo cp /mnt/loop/casper/initrd.lz /var/lib/tftpboot/Ubuntu/$z
      sudo cp /mnt/loop/install/initrd.gz /var/lib/tftpboot/Ubuntu/$z

      sudo mkdir -p /srv/install/Ubuntu/$z
      sudo cp -R /mnt/loop/* /srv/install/Ubuntu/$z
      sudo cp -R /mnt/loop/.disk /srv/install/Ubuntu/$z
      sudo umount /mnt/loop
done
#
# for x in ${ubuntu_net_array[@]}; do
   # echo $x
#   y=$(echo "net_installer_"; echo $x | cut -d / -f 8)
#   echo $y
#   echo ""
#   if [ ! -f ~/Downloads/$y ]; then
#      echo "ubuntu/$y NOT found, attempting to download."
#      echo "--Downloading $y LTS..."
#      cd ~/Downloads
#     wget $x
#   else
#      echo "$y found."
#   if [ ! - d /var/lib/tftpboot/ubuntu-14.04.3-desktop-i386 ]; then
#     sudo mkdir /var/lib/tftpboot/ubuntu-14.04.3-desktop-i386; fi
#     sudo mount -o loop -t iso9660 ~/Downloads/ubuntu-14.04.3-desktop-i386.iso /mnt/loop
#     sudo cp /mnt/loop/casper/vmlinuz /var/lib/tftpboot/ubuntu-14.04.3-desktop-i386
#     sudo cp /mnt/loop/casper/initrd.lz /var/lib/tftpboot/ubuntu-14.04.3-desktop-i3863

 #    sudo mkdir -p /srv/install/ubuntu-14.04.3-desktop-i386
 #     sudo cp -R /mnt/loop/* /srv/install/ubuntu-14.04.3-desktop-i386
 #     sudo cp -R /mnt/loop/.disk /srv/install/ubuntu-14.04.3-desktop-i386
 #     sudo umount /mnt/loop
 #  fi
#done

for x in ${iso_array[@]}; do
   # echo $x
   y=$(echo $x | cut -d / -f 8)
   z=$(echo $y | sed "s/.iso//g")
#   echo $y
 #  echo $z
   echo ""
   if [ ! -f ~/Downloads/$y ]; then
      echo "~/Downloads/$y NOT found, attempting to download."
      echo "--Downloading $y LTS..."
      cd ~/Downloads
      wget $x
   else
      echo "$y found."
   fi
   if [ ! -d /var/lib/tftpboot/Ubuntu/$z ]; then
     sudo mkdir -v "/var/lib/tftpboot/Ubuntu/$z"
     sudo mount -o loop -t iso9660 ~/Downloads/$y /mnt/loop
     sudo cp /mnt/loop/casper/vmlinuz "/var/lib/tftpboot/Ubuntu/$z"
     sudo cp /mnt/loop/casper/vmlinuz.efi "/var/lib/tftpboot/Ubuntu/$z"
     sudo cp /mnt/loop/casper/initrd.lz "/var/lib/tftpboot/Ubuntu/$z"

     if [ ! -d /srv/install/$z ]; then
       sudo mkdir -p -v /srv/install/$z
       sudo cp -R -v /mnt/loop/* /srv/install/$z
       sudo cp -R -v /mnt/loop/.disk /srv/install/$z
     fi
     sudo umount /mnt/loop
     
     echo "LABEL" >> /var/lib/tftpboot/Ubuntu/Ubuntu.menu
     echo "        MENU LABEL $z" >> /var/lib/tftpboot/Ubuntu/Ubuntu.menu
     echo "        KERNEL Ubuntu/$z/vmlinuz.efi" >> /var/lib/tftpboot/Ubuntu/Ubuntu.menu
     echo "        APPEND boot=casper netboot=nfs nfsroot=10.10.1.10:/srv/install/Ubuntu/$z initrd=Ubuntu/$z/initrd.lz" >> /var/lib/tftpboot/Ubuntu/Ubuntu.menu
     echo "        TEXT HELP" >> /var/lib/tftpboot/Ubuntu/Ubuntu.menu
     echo "        Boot the $z" >> /var/lib/tftpboot/Ubuntu/Ubuntu.menu
     echo "        ENDTEXT" >> /var/lib/tftpboot/Ubuntu/Ubuntu.menu
   fi
done

