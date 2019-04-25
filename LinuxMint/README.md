# Installation of librairies needed by NEMO
Will create a folder in the home directory: /home/$USER/NEMO_UTILS/

The installation folder can be changed in the file **config_vars.sh**.

# Checking of compiler and libraries availability
## compiler
- openmpi-bin
- lam4-dev
- gcc
- g++
- gfortran
- svn (package subversion on ubuntu)
- ...

# dev librairies
- libcurl4-openssl-dev
- ...

# Order of execution of the scripts

/!\ *You need to execute the script config_vars.sh like this,
to get the exported variables accessible:* 
    $. ./config_var.sh


1. config_vars.sh
2. install_zlib.sh
3. install_hdf5.sh
4. install netCDF-c.sh
5. install_netCDF-fortran.sh
6. install_xios.sh
