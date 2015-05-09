#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=2:00:00     # 2 hours
#SBATCH --mem=100M
#SBATCH --output=gpu-job.log
#SBATCH --partition=gpu
#SBATCH --account=accre_gpu     # substitute appropriate group here

setpkgs -a hoomd

pwd 
date

hoomd simple-script.py

date
