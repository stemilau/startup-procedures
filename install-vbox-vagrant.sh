#!/usr/bin/bash

sudo dnf -y install wget
wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
sudo mv virtualbox.repo /etc/yum.repos.d/virtualbox.repo

sudo dnf install -y gcc binutils make glibc-devel patch libgomp glibc-headers  kernel-headers kernel-devel-`uname -r` dkms
sudo dnf install VirtualBox-7.0

sudo usermod -a -G vboxusers stemilau

sudo /usr/lib/virtualbox/vboxdrv.sh setup

VER=$(curl -s https://download.virtualbox.org/virtualbox/LATEST.TXT)
wget https://download.virtualbox.org/virtualbox/$VER/Oracle_VM_VirtualBox_Extension_Pack-$VER.vbox-extpack

sudo VBoxManage extpack install Oracle_VM_VirtualBox_Extension_Pack-$VER.vbox-extpack

sudo dnf -y install vagrant

