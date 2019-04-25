These scripts are designed for an installation on a Linux Mint computer, using the *GCC* compilers.
They can be adapted for other environment (Mac OS, other GNU/Linux distributions, etc).
There is no way to execute all of the scripts at once, this is on purpose: usually
everything will not work well at the first try for every library, so it is
safer to compile them one by one.

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

# Note

A part of these scripts have been inspired from a doc made by
Fatemeh Chegini, and Jean-Philippe Paquin fro NEMO 3.6:
[https://nemo-eastcoast.readthedocs.io/en/latest/nemo-code/nemo3.6/scripts/]
(https://nemo-eastcoast.readthedocs.io/en/latest/nemo-code/nemo3.6/scripts/)