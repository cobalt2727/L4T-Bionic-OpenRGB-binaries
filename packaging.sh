#!/bin/bash

#The following script is targeted at 18.04.
#It can be used as a reference to build for newer versions of Ubuntu, but you'll want to get rid of the GCC-11 bits.
#The '/opt/qt515/bin/qmake' part can be replaced with just 'qmake' on modern distros.
#please also refer to https://gitlab.com/CalcProgrammer1/OpenRGB#linux

### GCC
# sudo add-apt-repository ppa:ubuntu-toolchain-r/test
# sudo apt install gcc-11 g++-11

### QT
# x86 machines: sudo add-apt-repository ppa:beineri/opt-qt-5.15.2-bionic
# ARM machines: sudo add-apt-repository ppa:theofficialgman/opt-qt-5.15.2-bionic-arm

### LLVM 13
# https://apt.llvm.org/
# I have no idea why (or if) this is needed, but it showed up in the .buildinfo for the .deb I made

rm -rf OpenRGB/
git clone https://gitlab.com/CalcProgrammer1/OpenRGB
cd OpenRGB/
CC=/usr/bin/gcc-11 CXX=/usr/bin/g++-11 /opt/qt515/bin/qmake OpenRGB.pro
CC=/usr/bin/gcc-11 CXX=/usr/bin/g++-11 dpkg-buildpackage -us -B

#results will be located in ../ for some reason, so maybe create a dedicated folder *before* running this script
