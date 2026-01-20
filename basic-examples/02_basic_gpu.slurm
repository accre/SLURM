#!/bin/bash
#SBATCH --account=your_account_name_acc
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --time=1:00:00
#SBATCH --partition=batch_gpu
#SBATCH --gres=gpu:nvidia_rtx_a4000:1
#SBATCH --job-name=gpu_example
#SBATCH --output=gpu_example_%j.out

# This is a basic example SLURM script for GPU jobs
#
# CRITICAL - GPU jobs require THREE things:
#   1. --partition=batch_gpu (or interactive_gpu)
#   2. --account=your_account_acc (NOTE: must use _acc suffix for batch_gpu!)
#   3. --gres=gpu:TYPE:COUNT (specify GPU type and count)

# Available GPU types at ACCRE (check your current available list with: slurm_resources):

# CRITICAL: Load ACCRE software stack
setup_accre_software_stack

# Load GPU-enabled software
# Example: CUDA toolkit and Python
module load gcc/12.3
module load cuda/12.6
module load python/3.11.5

# Print job information
echo "========================================"
echo "GPU Job Information"
echo "========================================"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Name: $SLURM_JOB_NAME"
echo "Node: $SLURM_NODELIST"
echo "Number of GPUs: $CUDA_VISIBLE_DEVICES"
echo "GPU type requested: nvidia_rtx_a4000"
echo "Started at: $(date)"
echo "========================================"

# Verify GPU is available
nvidia-smi

echo "========================================"

# Run your GPU-accelerated code here
# Replace with your own GPU computation

# Example: Check GPU availability from Python
# For enhanced testing functionality, you must create a virtual environment and install PyTorch or TensorFlow
# See https://help.accre.vanderbilt.edu/index.php?title=GPUs_at_ACCRE#:~:text=environment%0Asource%20setup_accre_runtime_dir-,python,-%2Dm%20venv%20%24%7BACCRE_RUNTIME_DIR
python gpu_check.py

echo "========================================"
echo "Job finished at: $(date)"
echo "========================================"
