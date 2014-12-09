#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=2:00:00
#SBATCH --mem=500M
#SBATCH -o matlab_job_slurm.out

setpkgs -a matlab

matlab < vectorization.m
