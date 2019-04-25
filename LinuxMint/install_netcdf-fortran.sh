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
wget https://github.com/Unidata/netcdf-fortran/archive/v4.4.5.tar.gz
tar xvzf v4.4.5.tar.gz
cd netcdf-fortran-4.4.5

export LD_LIBRARY_PATH=${NCDIR}/lib:${LD_LIBRARY_PATH}
export CPPFLAGS="-I$INSTDIR/include -DpgiFortran"
export LDFLAGS="-L$INSTDIR/lib -lnetcdf -lhdf5_hl -lhdf5 -lz -lcurl"
export LIBS="-lmpi"

./configure --prefix=$INSTDIR \
	    --enable-shared --enable-parallel-tests \
	    --enable-parallel \
	    2>&1 | tee hansolo-configure.log

make 2>&1 | tee hansolo-make.log
make check 2>&1 | tee hansolo-check.log
sudo make install 2>&1 | tee hansolo-install.log

	    

