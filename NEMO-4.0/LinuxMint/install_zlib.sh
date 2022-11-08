#!/bin/bash

# get access to exported variables in config_vars.sh
SCRIPT=$(realpath $0)
SCRIPTPATH=$(dirname $SCRIPT)
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p ZLIB
cd ZLIB

LIB_VERSION="zlib-1.2.11"
LIB_FILE="${LIB_VERSION}.tar.gz"

# If not downloaded, download zlib
if [ ! -f $LIB_FILE ]; then
    wget https://www.zlib.net/${LIB_FILE}
fi
tar xvfz $LIB_FILE

cd $LIB_VERSION

./configure --prefix=$INSTDIR 2>&1 | tee ${HOSTNAME}-configure_zlib.log
make 2>&1 | tee ${HOSTNAME}-make.log
make check 2>&1 | tee ${HOSTNAME}-make_check.log
make install 2>&1 | tee ${HOSTNAME}-install.log
