#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p XIOS
cd XIOS

# If not downloaded, download XIOS-2.5
if [ ! -d "xios-2.5" ]; then
    svn co http://forge.ipsl.jussieu.fr/ioserver/svn/XIOS/branchs/xios-2.5 xios-2.5
fi

cd xios-2.5

#copying the file for variables and lib positions
cp $SCRIPTPATH/arch_xios/arch-GCC_LINUX_local.env arch/arch-GCC_LINUX_$HOSTNAME.env
cp $SCRIPTPATH/arch_xios/arch-GCC_LINUX_local.path arch/arch-GCC_LINUX_$HOSTNAME.path
cp $SCRIPTPATH/arch_xios/arch-GCC_LINUX_local.fcm arch/arch-GCC_LINUX_$HOSTNAME.fcm

./make_xios --arch GCC_LINUX_$HOSTNAME 2>&1 | tee ${HOSTNAME}-make.log
