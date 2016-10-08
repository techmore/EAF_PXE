#!/bin/bash

echo "This script is used just to download iso from the internet in order the test the scripts for PXE creation and decouple them."

cd ~/Downloads

wget   http://releases.ubuntu.com/16.04.1/ubuntu-16.04.1-desktop-amd64.iso
   http://releases.ubuntu.com/16.04.1/ubuntu-16.04.1-server-amd64.iso
   http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/netboot.tar.gz
   http://cdimage.ubuntu.com/edubuntu/releases/14.04.5/release/edubuntu-14.04.5-dvd-i386.iso
   http://cdimage.ubuntu.com/lubuntu/xenial/daily/current/xenial-alternate-amd64.iso
   http://cdimage.ubuntu.com/mythbuntu/xenial/daily-live/current/xenial-desktop-amd64.iso
   http://cdimage.ubuntu.com/ubuntustudio/xenial/dvd/current/xenial-dvd-amd64.iso
