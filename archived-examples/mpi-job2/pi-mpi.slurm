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
# #SBATCH --nodes=4
# #SBATCH --tasks-per-node=12

echo "Starting calculation at $(date)"
srun ./pi-mpi
echo "Completed calculation at $(date)"
