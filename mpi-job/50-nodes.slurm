#!/bin/bash
#SBATCH --mail-user=william.r.french@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=50
#SBATCH --tasks-per-node=8
#SBATCH --time=7-00:00:00
#SBATCH --mem=3840M
#SBATCH -o mpi_job_slurm.log
export I_MPI_PMI_LIBRARY=/usr/scheduler/slurm/lib/libpmi.so
date
echo $SLURM_JOB_NODELIST
time srun -n 400 ./test
date
