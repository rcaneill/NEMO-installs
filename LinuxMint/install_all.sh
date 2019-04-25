#!/bin/bash

###############
# Not meant to be executed at once, just execute each script in the following order
###############

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

$SCRIPTPATH/install_zlib.sh
$SCRIPTPATH/install_hdf5.sh
$SCRIPTPATH/install_netcdf-c.sh
$SCRIPTPATH/install_netcdf-fortran.sh
$SCRIPTPATH/install_xios.sh
$SCRIPTPATH/install_nemo.sh
