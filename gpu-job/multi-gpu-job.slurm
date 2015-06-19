#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --time=2:00:00     # 2 hours
#SBATCH --mem=16G
#SBATCH --output=multi-gpu-job.log
#SBATCH --partition=gpu
#SBATCH --account=accre_gpu     # substitute appropriate group here

setpkgs -a hoomd_1.0.5

mpirun -n 4 hoomd simple-script.py
