#!/bin/bash

# script originaly from https://nemo-eastcoast.readthedocs.io/en/latest/nemo-code/nemo3.6/scripts/Install_hdf5.html#install-hdf5
# Modified by Romain Caneill to adapt to his computer

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p HDF5
cd HDF5

LIB_VERSION="hdf5-1.10.5"
LIB_FILE="${LIB_VERSION}.tar.gz"

# If not downloaded, download hdf5
if [ ! -f $LIB_FILE ]; then
    wget http://www.hdfgroup.org/ftp/HDF5/current/src/${LIB_FILE}
fi
tar xvfz $LIB_FILE

cd $LIB_VERSION

export HDF5_Make_Ignore=yes

# Configure

./configure --prefix=$INSTDIR \
	    --enable-fortran  --enable-parallel --enable-hl --enable-shared  \
	    --with-zlib=$INSTDIR \
	    2>&1 | tee ${HOSTNAME}-configure_hdf5_zlib.log

# Make and install

make 2>&1 | tee ${HOSTNAME}-make_hdf5_zlib.log
make check  2>&1 | tee ${HOSTNAME}-make_check_hdf5_zlib.log
make install 2>&1 | tee ${HOSTNAME}-install_hdf5_zlib.log
