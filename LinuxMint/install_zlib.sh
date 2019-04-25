#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p ZLIB
cd ZLIB

# If not downloaded, download zlib
if [ ! -d "zlib-1.2.8.tar.gz" ]; then
    wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/zlib-1.2.8.tar.gz
fi
tar xvfz zlib-1.2.8.tar.gz

cd zlib-1.2.8
./configure --prefix=$INSTDIR 2>&1 | tee hansolo-configure_zlib.log
make 2>&1 | tee hansolo-make.log
make check 2>&1 | tee hansolo-make_check.log
sudo make install 2>&1 | tee hansolo-install.log
