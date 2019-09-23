# Slurm MPI Pi Computation Example

This is a simple example of an inefficient method to calculate
pi using randomly generated numbers, using MPI to enlist several
nodes and then sum the total results from all nodes.

The accompanying slides are designed for use in a class lecture but
may be generally useful to look at.

To compile the examples load the "GCC" and "OpenMPI" modules in Lmod.

These examples are set to run on Intel "skylake" architecture CPUs and
can be compiled as follows:

```
$ g++ -o pi-single -O2 -march=skylake pi-single.cpp

$ mpic++ -o pi-mpi -O2 -march=skylake pi-mpi.cpp
```
