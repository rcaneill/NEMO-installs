# Compilation of NEMO on Tetralith
## Download NEMO

    $ svn co https://forge.ipsl.jussieu.fr/nemo/svn/NEMO/releases/release-4.0 NEMOGCM
    $ cd NEMOGCM

## Arch files

1. Copy the arch files from *NEMO/arch/**for Tetralith into the arch/ folder
   (git clone this repository and
   then copy or use wget to just downlod the arch files).
2. Replace the libraries lines according to your system in
   *arch-X64_TETRALITH.fcm*

## Compiling NEMO

Load your compiling environment and
run makenemo according to your NEMO configuration, e.g.

    $ module load module load buildenv-intel/2018a-eb
    $ ./makenemo -n 'my_canal' -a 'CANAL' -m 'X64_TETRALITH' -j 8