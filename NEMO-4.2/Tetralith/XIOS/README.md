# Compiling XIOS on Tetralith
## Download XIOS

Replace the name of the xios folder with your actual compiler and/or
building environment. NEMO 4.2 needs the trunk from xios:

    $ svn co http://forge.ipsl.jussieu.fr/ioserver/svn/XIOS/trunk xios_trunk-intel2018a-eb
    $ cd xios_trunk-intel2018a-eb

## Arch files

1. Copy the arch files from *XIOS/arch/* for Tetralith into the arch/ folder
   (git clone this repository and
   then copy or use wget to just download the arch files).
2. Replace the librairies lines according to your system in
   *arch-X64_TETRALITH.path*
3. Replace the loaded modules according to you compiler and/or building environment
   in *arch-X64_TETRALITH.env*

## Compiling xios

Run make_xios.

    $ ./make_xios --job 8 --full --arch X64_TETRALITH 2>&1 | tee TETRALITH_make.log
