#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=3
#SBATCH --tasks-per-node=8     # 8 MPI processes per node
#SBATCH --time=7-00:00:00
#SBATCH --mem=4G     # 4 GB RAM per node
#SBATCH --output=mpi_job_slurm.log
setpkgs -a openmpi_1.8.4
echo $SLURM_JOB_NODELIST
srun --mpi=pmi2 ./test  # srun is SLURM's version of mpirun/mpiexec
date
