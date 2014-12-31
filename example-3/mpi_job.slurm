#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=3
#SBATCH --tasks-per-node=8
#SBATCH --time=7-00:00:00
#SBATCH --mem=3840M
#SBATCH --mem-per-cpu=160M
#SBATCH --output=mpi_job_slurm.log
export I_MPI_PMI_LIBRARY=/usr/scheduler/slurm/lib/libpmi.so
date
echo $SLURM_JOB_NODELIST
time srun ./test
date
