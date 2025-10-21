#!/bin/bash
#SBATCH --account=your_account_name
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --ntasks=1
#SBATCH --time=2:00:00
#SBATCH --mem=500M
#SBATCH --array=0-2
#SBATCH --output=python_array_job_slurm_%A_%a.out

echo "SLURM_JOBID: " $SLURM_JOBID
echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "SLURM_ARRAY_JOB_ID: " $SLURM_ARRAY_JOB_ID

# CRITICAL: Load ACCRE software stack before any module loads
setup_accre_software_stack

# Load GCC and Python
# Use 'module avail' to see available versions
module load GCC/11.3.0 Python/3.10.4

# Use array task ID to process different files
python vectorization_${SLURM_ARRAY_TASK_ID}.py
