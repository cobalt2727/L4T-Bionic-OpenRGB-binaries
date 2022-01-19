#!/bin/bash

#The following script is targeted at 18.04.
#It can be used as a reference to build for newer versions of Ubuntu, but you'll want to get rid of the GCC-11 bits.
#The '/opt/qt515/bin/qmake' part can be replaced with just 'qmake' on modern distros.
#please also refer to https://gitlab.com/CalcProgrammer1/OpenRGB#linux

### general dependencies (not comprehensive, may need more?)
# sudo apt install mbedtls hidapi qt5-default

### GCC (needed to build and to run)
# sudo add-apt-repository ppa:ubuntu-toolchain-r/test
##for building
# sudo apt install gcc-11 g++-11
##for installing
# sudo apt install libgcc-s1

### QT (needed just to build, system QT will probably suffice to install/run, I think?)
##x86 machines:
# sudo add-apt-repository ppa:beineri/opt-qt-5.15.2-bionic
##ARM machines:
# sudo add-apt-repository ppa:theofficialgman/opt-qt-5.15.2-bionic-arm
# sudo apt install qt515base AndOtherStuffHere

### LLVM 13
# https://apt.llvm.org/
# afaik this is not needed to run at all, but it showed up in the .buildinfo for the .deb I made for some reason

rm -rf OpenRGB/
git clone https://gitlab.com/CalcProgrammer1/OpenRGB
cd OpenRGB/
CC=/usr/bin/gcc-11 CXX=/usr/bin/g++-11 /opt/qt515/bin/qmake OpenRGB.pro
CC=/usr/bin/gcc-11 CXX=/usr/bin/g++-11 dpkg-buildpackage -us -B

#results will be located in ../ for some reason, so maybe create a dedicated folder *before* running this script
