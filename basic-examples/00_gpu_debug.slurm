#!/bin/bash
#SBATCH --account=your_account_name_iacc
#SBATCH --partition=interactive_gpu
#SBATCH --qos=debug_iacc
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=2G
#SBATCH --gres=gpu:1
#SBATCH --time=0:30:00
#SBATCH --job-name=gpu_debug_test
#SBATCH --output=gpu_debug_%j.out

# ============================================================
# INTERACTIVE GPU DEBUG EXAMPLE - For Training and Quick Tests
# ============================================================
#
# This script uses the interactive_gpu partition with debug QoS.
# Jobs start within 2 minutes (usually immediately)!
#
# IMPORTANT:
#   - Account must end with _iacc (e.g., mygroup_iacc)
#   - QoS must be debug_iacc
#   - Partition must be interactive_gpu
#   - Time limit is 30 minutes max for debug
#
# ALTERNATIVE: Run interactively with srun:
#   srun --pty --partition=interactive_gpu --qos=debug_iacc \
#        --account=your_account_name_iacc \
#        --cpus-per-task=2 --mem=2G --gres=gpu:1 --time=0:30:00 bash
#
# This drops you directly into a shell on the GPU node.
# ============================================================

# Load ACCRE software stack
setup_accre_software_stack

# Load GPU modules
module load gcc/12.3
module load cuda/12.6

# Print job information
echo "========================================"
echo "Interactive GPU Debug Job"
echo "========================================"
echo "Job ID: $SLURM_JOB_ID"
echo "Partition: $SLURM_JOB_PARTITION"
echo "QoS: $SLURM_JOB_QOS"
echo "Node: $SLURM_NODELIST"
echo "CPUs per task: $SLURM_CPUS_PER_TASK"
echo "CUDA_VISIBLE_DEVICES: $CUDA_VISIBLE_DEVICES"
echo "Started at: $(date)"
echo "========================================"

# Verify GPU is available
echo ""
echo "GPU Information (nvidia-smi):"
nvidia-smi

echo ""
echo "CUDA Version:"
nvcc --version 2>/dev/null || echo "nvcc not in PATH (CUDA toolkit loaded)"

echo ""
echo "========================================"
echo "Job finished at: $(date)"
echo "========================================"
