#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=12:00:00         # 12 hours
#SBATCH --mem=10G               # 10 GB RAM 
#SBATCH --output=gpu-job.log    # output file
#SBATCH --partition=maxwell     # low-latency RoCE network and 4 Titan X GPUs per node
#SBATCH --account=accre_gpu     # substitute appropriate group here
#SBATCH --gres=gpu:1            # single GPU job

setpkgs -a hoomd_1.3.3_roce

srun hoomd simple-script.py
