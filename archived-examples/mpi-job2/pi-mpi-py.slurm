#!/bin/bash

#SBATCH --tasks=48
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=00:05:00
#SBATCH --job-name=pi-mpi
#SBATCH --partition=production
#SBATCH --constraint=skylake

# Additional directives can control how
# tasks should be distributed to individual nodes
# #SBATCH --nodes=2
# #SBATCH --tasks-per-node=24

module load GCC OpenMPI Python numpy mpi4py

echo "Starting calculation at $(date)"
srun python pi-mpi.py
echo "Completed calculation at $(date)"
