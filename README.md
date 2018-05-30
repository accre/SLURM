SLURM
=====

Test Commands
-------------

- **slurm-commands.sh**: contains lots of examples of SLURM commands
and how to customize the output of each command

Test Scripts
------------

Make sure to change the email if you want to submit these scripts.
To submit to the cluster type:

	sbatch SCRIPT_NAME.slurm

- **srun/** This runs a few very simple commands, one with a single
process, and another few with multiple processes.
Demonstrates the use of srun.

- **python-job/** Demonstrates a simple Python job, using a single CPU core.

- **mpi-job/** Example of a MPI job running across 3 nodes and 24 CPU cores.
A simple MPI C++ code is also included, along with a compile script.

- **job-array/** Job array example, showing how to run an executable on multiple
similar input scripts in parallel.

- **job-array2/** Another job array example, except in this case the processing 
is simplified further as the file names (being analyzed by Python) do not need to
follow a regular naming scheme. In fact, the file names are completely arbitrary, 
the user just has to put them all in a subdirectory called **data** and then adjust
the array to the appropriate length. 

- **gpu-job/** GPU job example. This script loads HOOMD-Blue, a molecular dynamics
package that runs on NVIDIA GPUs.

- **pthread-job/** Multithreaded job example. This job runs a simple Hello World Posix
threads C code. Multithreaded jobs generally run on a single node and only require
a single task (i.e. process) that spawns a group of threads to execute across multiple
CPU cores. The --cpus-per-task option is needed in multithreaded programs.

- **openmp-job/** Multithreaded job example. This job runs a simple OpenMP vector addition
program with multithreading. Multithreaded jobs generally run on a single node and only require
a single task (i.e. process) that spawns a group of threads to execute across multiple
CPU cores. The --cpus-per-task option is needed in multithreaded programs.

- **epilog/** Epilog example. This job demonstrates how to invoke an epilog script after
your job for post-processing. This particular example looks for any files in your directory
that exceed 3 megabytes and compresses and archives those files. In practice, you might tweak
this to only compress larger files and to exclude any large input files you do not wish to compress.

- **julia-job/** Example of running Julia on the cluster in serial and in parallel.
