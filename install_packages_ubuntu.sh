#!/bin/bash
# Script to add key packages to a new Ubuntu install
#
sudo add-apt-repository ppa:webupd8team/atom -y # Atom
sudo add-apt-repository ppa:dhor/myway -y       # Raw Therapy

# Add packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y ufraw rawtherapee atom glabels lynx cifs-utils seahorse-nautilus gpa gnupg2 libpam-google-authenticator network-manager-openconnect-gnome build-essential libjpeg-dev default-jre network-manager-vpnc network-manager-vpnc-gnome tree liblcms2-dev libtiff-dev libpng-dev libopenjp2-tools enscript libtiff-tools imagemagick jasper httpie cups cmake imagemagick leptonica-progs autoconf-archive libpng-dev libleptonica-dev tesseract-ocr golang-go hugo pandoc shotwell tesseract-ocr-all graphicsmagick feh autokey-gtk gimp liblcms2-dev libtiff-dev libpng-dev libz-dev git curl chromium-browser emacs gdebi-core argyll
#
# Google Cloud Apps installation
# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk

#
# Add OpenJpeg
cd
if [ ! -d "install" ] ; then
mkdir install
fi
cd install

if [ -d "openjpeg" ] ; then
rm -r -f openjpeg
fi
git clone https://github.com/uclouvain/openjpeg.git 
cd openjpeg ; mkdir build ; cd build ; cmake .. -DMAKE_BUILD_TYPE=Release ; sudo make install ; sudo make clean

# R language and RStudio
sudo add-apt-repository ppa:marutter/rrutter
sudo apt-get install -y r-base r-base-dev
# NOTE: you must download current RStudio version at https://www.rstudio.com/products/rstudio/download/#download
# and substitute below "rstudio-xenial-1.1.456-amd64.deb" with the current version.
#
# wget https://download1.rstudio.org/rstudio-xenial-1.1.456-amd64.deb
# sudo gdebi rstudio-xenial-1.1.456-amd64.deb ; rm rstudio-xenial-1.1.456-amd64.deb

#
# Add [Grok image compression ](https://github.com/GrokImageCompression)
cd
if [ ! -d "install" ] ; then
mkdir install
fi
cd install

if [ -d "grok" ] ; then
rm -r -f grok
fi
cd install
git clone https://github.com/GrokImageCompression/grok.git
cd grok
cmake -DCMAKE_BUILD_TYPE=Debug ./
