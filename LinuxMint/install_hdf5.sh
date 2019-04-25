#!/bin/bash

# script originaly from https://nemo-eastcoast.readthedocs.io/en/latest/nemo-code/nemo3.6/scripts/Install_hdf5.html#install-hdf5
# Modified by Romain Caneill to adapt to his computer

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p HDF5
cd HDF5
wget http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.4.tar.gz
tar xvzf hdf5-1.10.4.tar.gz
cd hdf5-1.10.4

export HDF5_Make_Ignore=yes

# Configure

./configure --prefix=$INSTDIR \
	    --enable-fortran  --enable-parallel --enable-hl --enable-shared  \
	    --with-zlib=$INSTDIR \
	    2>&1 | tee hansolo-configure_hdf5_zlib.log

# Make and install

make 2>&1 | tee hamsolo-make_hdf5_zlib.log
make check  2>&1 | tee hansolo-make_check_hdf5_zlib.log
sudo make install 2>&1 | tee hansolo-install_hdf5_zlib.log
