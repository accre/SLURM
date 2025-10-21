#!/bin/bash
#SBATCH --account=your_account_name
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=12:00:00
#SBATCH --mem=16G
#SBATCH --output=gpu-job.log
#SBATCH --partition=batch_gpu
#SBATCH --gres=gpu:nvidia_rtx_a4000:1

# GPU Job Example - Updated for current ACCRE configuration
#
# IMPORTANT:
# - Use partition=batch_gpu (NOT maxwell, pascal, or turing)
# - MUST specify GPU type in --gres (e.g., nvidia_rtx_a6000)
# - Available GPU types: (see slurm_resources command)
# - Check availability: sinfo -p batch_gpu OR sinfo -p interactive_gpu

# CRITICAL: Load ACCRE software stack before any module loads
setup_accre_software_stack

# Load required modules
# For GPU work, you typically need CUDA
module load gcc/12.3
module load cuda/12.2
module load python/3.11.5

# Verify GPU is available
nvidia-smi

# Run your GPU program
# Replace with your actual GPU code
python simple-script.py
