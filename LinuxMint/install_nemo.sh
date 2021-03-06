#!/bin/bash 

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p NEMO
cd NEMO

# If not downloaded, download NEMO
if [ ! -d "NEMOGCM" ]; then
  svn co https://forge.ipsl.jussieu.fr/nemo/svn/NEMO/releases/release-4.0.1 NEMOGCM
fi

cd NEMOGCM

sed -e "s:\$INSTDIR:${INSTDIR}:" -e "s:\$WORKDIR:${WORKDIR}:" $SCRIPTPATH/arch_nemo/arch-local.fcm > arch/arch-local_$HOSTNAME.fcm
#copying the file for variables and lib positions



