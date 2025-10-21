#!/bin/bash
#SBATCH --account=your_account_name
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:10:00
#SBATCH --mem=500M
#SBATCH --output=python_job_slurm.out

# CRITICAL: Load ACCRE software stack before any module loads
setup_accre_software_stack

# Load GCC and Python
# Use 'module avail' to see available versions
module load GCC/11.3.0 Python/3.10.4

# Pass your Python script to the Python interpreter for execution
python vectorization.py
