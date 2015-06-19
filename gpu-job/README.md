GPU-based Molecular Dynamics Simulations in HOOMD-Blue
======================================================

Included in this directory is a HOOMD script and SLURM
scripts for running this simulation across a single GPU
and all four GPUs in a node. 

Notes
-----

You can safely ignore messages like this from the single-GPU run:

```
PMI2 initialized but returned bad values for size and rank.
This is symptomatic of either a failure to use the
"--mpi=pmi2" flag in SLURM, or a borked PMI2 installation.
If running under SLURM, try adding "-mpi=pmi2" to your
srun command line. If that does not work, or if you are
not running under SLURM, try removing or renaming the
pmi2.h header file so PMI2 support will not automatically
be built, reconfigure and build OMPI, and then try again
with only PMI1 support enabled.
```

or this:

```
[vmp829:29218] 1 more process has sent help message help-common-pmi.txt / pmi2-init-returned-bad-values
[vmp829:29218] Set MCA parameter "orte_base_help_aggregate" to 0 to see all help / error messages
```
