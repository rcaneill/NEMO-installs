#!/bin/bash 

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p NEMO
cd NEMO

# If not downloaded, download NEMO
if [ ! -d "NEMOGCM" ]; then
  svn co https://forge.ipsl.jussieu.fr/nemo/svn/NEMO/releases/release-4.0 NEMOGCM
fi

cd NEMOGCM
# For the doc, we need to use the pdfcreator from the trunk
cd doc
svn co https://forge.ipsl.jussieu.fr/nemo/svn/NEMO/trunk/doc/PDF_creation.sh PDF_creation.sh
cd ..

cp $SCRIPTPATH/arch_nemo/arch-local.fcm arch/arch-local_$HOSTNAME.fcm
#copying the file for variables and lib positions

ARCHI=\'local_$HOSTNAME\'

./makenemo -m $ARCHI -a CANAL -n 'my_canal' -j 5

