#!/bin/bash
## Note: this must executed as root

## There is probably a standard and robust way to install things like this.
##   These are more like notes on what I did to build my AMI.

## install dependencies
apt-get update
apt-get install --assume-yes make
apt-get install --assume-yes cmake
apt-get install --assume-yes default-jre
apt-get install --assume-yes gcc
apt-get install --assume-yes g++
apt-get install --assume-yes libncurses5 libncurses5-dev
apt-get install --assume-yes zlib1g-dev
apt-get install --assume-yes git

## pull gotcloud source
git clone --recursive git://github.com/statgen/gotcloud.git

## build
cd ./gotcloud/src/; make

## link to a standard directory on the PATH
sudo ln -s /home/vasya/gotcloud/gotcloud /usr/local/bin/gotcloud

cd ../..

