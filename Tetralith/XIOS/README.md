# Compiling XIOS on Tetralith
## Download XIOS

Replace the name of the xios folder with your actual compiler and/or
building environment.

    $ svn co http://forge.ipsl.jussieu.fr/ioserver/svn/XIOS/branchs/xios-2.5 xios-2.5-intel2018a-eb
    $ cd xios-2.5-intel2018a-eb

## Arch files

1. Copy the arch files from _XIOS/arch/*_ for Tetralith into the arch/ folder
   (git clone this repository and
   then copy or use wget to just download the arch files).
2. Replace the librairies lines according to your system in
   *arch-X64_TETRALITH.path*
3. Replace the loaded modules according to you compiler and/or building environment
   in *arch-X64_TETRALITH.env*

## Compiling xios

Run make_xios.

    $ ./make_xios --job 8 --full --arch X64_TETRALITH 2>&1 | tee TETRALITH_make.log