#!/bin/bash
# Script to add key packages to a new Ubuntu install
#
# Add packages
sudo apt-get install -y glabels lynx cifs-utils seahorse-nautilus gpa gnupg2 libpam-google-authenticator network-manager-openconnect-gnome build-essential libjpeg-dev default-jre network-manager-vpnc network-manager-vpnc-gnome tree liblcms2-dev libtiff-dev libpng-dev libopenjp2-tools enscript libtiff-tools imagemagick jasper google-cloud-sdk httpie cups cmake imagemagick leptonica-progs autoconf-archive libpng-dev libleptonica-dev tesseract-ocr golang-go hugo pandoc shotwell tesseract-ocr-all graphicsmagick feh google-cloud-sdk openjpeg-tools autokey-gtk gimp liblcms2-dev libtiff-dev libpng-dev libz-dev git curl
#
# Google Cloud Apps installation
sudo apt-get install curl -y ; export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"; echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list; curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#
# Add OpenJpeg
cd
if [ ! -d "install" ] ; then mkdir install
fi
cd install

if [ -d "openjpeg" ] ; then rm -r openjpeg

git clone sudohttps://github.com/uclouvain/openjpeg.git 
cd openjpeg ; mkdir build ; cd build ; cmake .. -DMAKE_BUILD_TYPE=Release ; make install ; make clean ; make doc
