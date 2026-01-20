#!/bin/bash
#SBATCH --account=your_account_name_int
#SBATCH --partition=interactive
#SBATCH --qos=debug_int
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=2G
#SBATCH --time=0:30:00
#SBATCH --job-name=debug_test
#SBATCH --output=debug_test_%j.out

# ============================================================
# INTERACTIVE DEBUG EXAMPLE - For Training and Quick Tests
# ============================================================
#
# This script uses the interactive partition with debug QoS.
# Jobs start within 2 minutes (usually immediately)!
#
# IMPORTANT:
#   - Account must end with _int (e.g., mygroup_int)
#   - QoS must be debug_int
#   - Time limit is 30 minutes max for debug
#
# ALTERNATIVE: Run interactively with srun:
#   srun --pty --partition=interactive --qos=debug_int \
#        --account=your_account_name_int \
#        --cpus-per-task=2 --mem=2G --time=0:30:00 bash
#
# This drops you directly into a shell on the compute node.
# ============================================================

# Load ACCRE software stack
setup_accre_software_stack

# Load modules
module load gcc/12.3 python/3.11.5

# Print job information
echo "========================================"
echo "Interactive Debug Job"
echo "========================================"
echo "Job ID: $SLURM_JOB_ID"
echo "Partition: $SLURM_JOB_PARTITION"
echo "QoS: $SLURM_JOB_QOS"
echo "Node: $SLURM_NODELIST"
echo "CPUs per task: $SLURM_CPUS_PER_TASK"
echo "Started at: $(date)"
echo "========================================"

# Your test commands here
echo "Hello from $(hostname)!"
echo "Python version: $(python --version)"

# Show environment
echo ""
echo "SLURM Environment Variables:"
echo "  SLURM_JOB_ID=$SLURM_JOB_ID"
echo "  SLURM_JOB_NAME=$SLURM_JOB_NAME"
echo "  SLURM_SUBMIT_DIR=$SLURM_SUBMIT_DIR"
echo "  SLURM_NTASKS=$SLURM_NTASKS"
echo "  SLURM_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK"

echo ""
echo "========================================"
echo "Job finished at: $(date)"
echo "========================================"
