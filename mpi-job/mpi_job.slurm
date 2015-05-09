#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=3
#SBATCH --tasks-per-node=8     # 8 MPI processes per node
#SBATCH --time=7-00:00:00
#SBATCH --mem=3840M     # memory per node
#SBATCH --output=mpi_job_slurm.log
setpkgs -a intel_cluster_studio_compiler  # Use Intel MPI
date
echo $SLURM_JOB_NODELIST
time srun ./test  # srun is SLURM's version of mpirun/mpiexec
date
