#!/bin/bash 

# Script from https://nemo-eastcoast.readthedocs.io/en/latest/nemo-code/nemo3.6/scripts/Install_netcdfc.html#install-netcdfc
# Modified by Romain Caneill to adapt to his computer

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p NetCDF-c
cd NetCDF-c
wget https://github.com/Unidata/netcdf-c/archive/v4.6.2.tar.gz
tar xvzf v4.6.2.tar.gz
cd netcdf-c-4.6.2

export CPPFLAGS="-I$INSTDIR/include -DpgiFortran"
export LDFLAGS="-L$INSTDIR/lib -lhdf5_hl -lhdf5"
export LIBS="-lmpi"

./configure --prefix=$INSTDIR --enable-netcdf-4 --enable-shared \
	    --enable-parallel --enable-parallel-tests \
	    2>&1 | tee hansolo-configure.log

make 2>&1 | tee hansolo-make.log
make check 2>&1 | tee hansolo-check.log
sudo make install 2>&1 | tee hansolo-install.log

