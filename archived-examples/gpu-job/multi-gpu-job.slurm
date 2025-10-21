#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=4
#SBATCH --time=4:00:00                # 4 hours
#SBATCH --mem=40G                     # 40GB RAM               
#SBATCH --output=multi-gpu-job.log    # stdout/stderr file
#SBATCH --partition=maxwell           # low-latency RoCE network with 4 Titan X GPUs per node          
#SBATCH --account=accre_gpu           # substitute appropriate group here
#SBATCH --gres=gpu:4                  # request 4 GPUs per node

setpkgs -a hoomd_1.3.3_roce

srun hoomd simple-script.py
