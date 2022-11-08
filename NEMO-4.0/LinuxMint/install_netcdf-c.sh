#!/bin/bash 

# Script from https://nemo-eastcoast.readthedocs.io/en/latest/nemo-code/nemo3.6/scripts/Install_netcdfc.html#install-netcdfc
# Modified by Romain Caneill to adapt to his computer

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p NetCDF-c
cd NetCDF-c

LIB_VERSION="4.7.3"
LIB_FILE="v${LIB_VERSION}.tar.gz"

# If not downloaded, download zlib
if [ ! -f $LIB_FILE ]; then
    wget https://github.com/Unidata/netcdf-c/archive/${LIB_FILE}
fi
tar xvfz $LIB_FILE

cd netcdf-c-${LIB_VERSION}

export CPPFLAGS="-I$INSTDIR/include -DpgiFortran"
export LDFLAGS="-Wl,-rpath,$INSTDIR/lib -L$INSTDIR/lib -lhdf5_hl -lhdf5"
export LIBS="-lmpi"

./configure --prefix=$INSTDIR --enable-netcdf-4 --enable-shared \
	    --enable-parallel-tests \
	    2>&1 | tee ${HOSTNAME}-configure.log

make 2>&1 | tee ${HOSTNAME}-make.log
make check 2>&1 | tee ${HOSTNAME}-check.log
make install 2>&1 | tee ${HOSTNAME}-install.log

