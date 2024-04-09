#!/bin/bash
# this scripts is tested to install xuggle-xuggler 5.5.jar at Raspberry Pi 4 (Ubuntu 20.04.5 32bits system)

sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo dpkg --configure -a

sudo apt update
sudo apt install gcc-7 g++-7
sudo apt install yasm make openjdk-8-jre openjdk-8-jdk

sudo apt-get install build-essential

sudo apt install openssl pkg-config


apt-get install ant-optional
apt install junit	

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10


cd xuggle-xuggler
wget wget https://repo1.maven.org/maven2/org/apache/ivy/ivy/2.4.0/ivy-2.4.0.jar
mv ivy-2.4.0.jar mk/buildtools/lib/

git apply raspberrypi_32_xuggle.patch
ant stage
sudo ant install
