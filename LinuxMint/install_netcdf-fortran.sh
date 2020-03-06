#!/bin/bash 

# Script inspired from
#https://nemo-eastcoast.readthedocs.io/en/latest/nemo-code/nemo3.6/scripts/Install_netcdff.html#install-netcdff
#https://www.unidata.ucar.edu/software/netcdf/docs/building_netcdf_fortran.html
# Modified by Romain Caneill to adapt to his computer

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p NetCDF-fortran
cd NetCDF-fortran

LIB_VERSION="4.5.2"
LIB_FILE="v${LIB_VERSION}.tar.gz"

# If not downloaded, download zlib
if [ ! -f $LIB_FILE ]; then
    wget https://github.com/Unidata/netcdf-fortran/archive/${LIB_FILE}
fi
tar xvfz $LIB_FILE

cd netcdf-fortran-${LIB_VERSION}

export LD_LIBRARY_PATH=${NCDIR}/lib:${LD_LIBRARY_PATH}
export CPPFLAGS="-I$INSTDIR/include -DpgiFortran"
export LDFLAGS="-Wl,-rpath,$INSTDIR/lib -L$INSTDIR/lib -lnetcdf -lhdf5_hl -lhdf5 -lz -lcurl"
export LIBS="-lmpi"

./configure --prefix=$INSTDIR \
	    --enable-shared --enable-parallel-tests \
	    --enable-parallel \
	    2>&1 | tee ${HOSTNAME}-configure.log

make 2>&1 | tee ${HOSTNAME}-make.log
make check 2>&1 | tee ${HOSTNAME}-check.log
make install 2>&1 | tee ${HOSTNAME}-install.log

	    

