SLURM
=====

== Test Commnads ==

- slurm-commands.sh: contains lots of examples of SLURM commands
and how to customize the output of each command

== Test Scripts ==

Make sure to change the email if you want to submit these scripts.
To submit to the cluster type:

sbatch SCRIPT_NAME.slurm

- example-1: This runs a few very simple commands, one with a single
process, and another few with multiple processes.
Demonstrates the use of srun.

- example-2: Demonstrates a simple Matlab job, using a single CPU core.
Note that a user must purchase a Matlab license from Vanderbilt to run
Matlab on the cluster.

- example-3: Example of a MPI job running across 3 nodes and 24 CPU cores.
A simple MPI C++ code is also included, along with a compile script.

- example-4: Job array example, showing how to run an executable on multiple
similar input scripts in parallel.

- example-5: GPU job example. This script loads HOOMD-Blue, a molecular dynamics
package that runs on NVIDIA GPUs.

- example-6: Multithreaded job example. This job runs a simple Hello World Posix
threads C code. Multithreaded jobs generally run on a single node and only require
a single task (i.e. process) that forks a group of threads to execute across multiple
CPU cores. The --cpus-per-task option is needed in multithreaded programs.
