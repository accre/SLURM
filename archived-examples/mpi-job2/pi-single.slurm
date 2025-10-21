#!/bin/bash

#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=00:05:00
#SBATCH --job-name=pi-single
#SBATCH --partition=production
#SBATCH --constraint=skylake

echo "Starting calculation at $(date)"
./pi-single
echo "Completed calculation at $(date)"
