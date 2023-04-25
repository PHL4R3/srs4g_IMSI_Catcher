#!/bin/bash
#install dependencies
apt update -y
apt install git -y
#install uhd
sudo apt-get install autoconf automake build-essential ccache cmake cpufrequtils doxygen ethtool \
g++ git inetutils-tools libboost-all-dev libncurses5 libncurses5-dev libusb-1.0-0 libusb-1.0-0-dev \
libusb-dev python3-dev python3-mako python3-numpy python3-requests python3-scipy python3-setuptools \
python3-ruamel.yaml -y

git clone https://github.com/EttusResearch/uhd.git

cd uhd
cd host
mkdir build
cd build 
cmake ../
make
make install
ldconfig

cd ../../
#install the srsran library
sudo apt-get install build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev
git clone https://github.com/srsRAN/srsRAN_4G.git
cd srsRAN_4G
mkdir build
cd build
cmake ../
make
make install
srsran_install_configs.sh user


