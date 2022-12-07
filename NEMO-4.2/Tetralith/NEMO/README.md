# Compilation of NEMO on Tetralith
## Download NEMO

    $ git clone --branch 4.2.0 https://forge.nemo-ocean.eu/nemo/nemo.git nemo_4.2.0
    $ cd nemo_4.2.0

## Arch files

1. Copy the arch files from *NEMO/arch/* for Tetralith into the arch/ folder
   (git clone this repository and
   then copy or use wget to just download the arch files).
2. Replace the libraries lines according to your system in
   *arch-X64_TETRALITH.fcm*

## Compiling NEMO

Load your compiling environment and
run makenemo according to your NEMO configuration, e.g.

    $ module load buildenv-intel/2018a-eb
    $ ./makenemo -n 'my_canal' -a 'CANAL' -m 'X64_TETRALITH' -j 8


## Notes

Compared to compilation of NEMO 4.0, we need to remove the `-C` flag, otherwise
there is an error linked to replacing C-like comments
(see [question on nemo forum](https://nemo-ocean.discourse.group/t/fortran-preprocessing-converts-precision-to-problematic-sp/108/9))
