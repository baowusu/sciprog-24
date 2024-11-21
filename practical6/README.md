# Practical 6

* This folder contains four fortran codes and an additional makefile

## Compile

* gfortran matmult.f90 -o matrixmult
* gfortran use_printf.f90 -o print
* gfortran example.f90 -o PersonalData
* gfortran -c main.f90
* gfortran -c mm.f90
* gfortran -o matmultF main.o mm.o

### NB: compile main.f90, mm.f90, and matmultF in this other as the later requires the first two to compile and then execute using ./matmultF below.


 ## Makefile

* make -f MakefileF


## Execute

* ./matrixmult
  
* ./print

* ./PersonalData

* ./matmultF


:)

