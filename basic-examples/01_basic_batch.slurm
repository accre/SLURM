#!/bin/bash
#SBATCH --account=your_account_name
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=2:00:00
#SBATCH --partition=batch
#SBATCH --job-name=basic_example
#SBATCH --output=basic_example_%j.out

# This is a basic example SLURM script for CPU-only jobs
# It requests 1 node, 4 CPU cores, 8GB RAM, and 2 hours of time

# CRITICAL: Load ACCRE software stack before any module loads (if using provided software stack)
setup_accre_software_stack

# Load required software modules
# Use 'module avail' to see available modules
module load gcc/12.3 python/3.11.5 scipy-stack/2025a

# Print some job information
echo "========================================"
echo "Job Information"
echo "========================================"
echo "Job ID: $SLURM_JOB_ID"
echo "Job Name: $SLURM_JOB_NAME"
echo "Node: $SLURM_NODELIST"
echo "Number of tasks: $SLURM_NTASKS"
echo "CPUs per task: $SLURM_CPUS_PER_TASK"
echo "Working directory: $SLURM_SUBMIT_DIR"
echo "Started at: $(date)"
echo "========================================"

# Run your actual computation here
# Replace this with your own commands

# Example: Run a Python script
python hello_world.py

# Example: Run a matrix multiplication
python matrix_multiply.py

echo "========================================"
echo "Job finished at: $(date)"
echo "========================================"
