#!/bin/bash
#SBATCH --account=your_account_name
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --time=30:00
#SBATCH --partition=batch
#SBATCH --job-name=array_example
#SBATCH --output=array_example_%A_task_%a.out
#SBATCH --array=1-10

# This is an example of a SLURM job array
# Job arrays allow you to submit many similar jobs with one script
#
# --array=1-10 means this script will run 10 times
# Each run gets a unique SLURM_ARRAY_TASK_ID (1, 2, 3, ..., 10)
# Use this ID to process different input files, parameters, etc.
#
# Output filenames:
# %A = Array master job ID
# %a = Array task ID
# So you get separate output files: array_example_12345_task_1.out, etc.

# You can also use ranges and steps:
# --array=0-99              # 100 tasks, IDs 0-99
# --array=1-100:10          # 10 tasks, IDs 1,11,21,...,91
# --array=1,5,10,15         # 4 tasks with specific IDs
# --array=1-1000%50         # 1000 tasks, but only 50 running at once

setup_accre_software_stack
module load gcc/12.3 python/3.11.5

# Print task information
echo "========================================"
echo "Job Array Task Information"
echo "========================================"
echo "Array Master Job ID: $SLURM_ARRAY_JOB_ID"
echo "Array Task ID: $SLURM_ARRAY_TASK_ID"
echo "Node: $SLURM_NODELIST"
echo "Started at: $(date)"
echo "========================================"

# Example 1: Process different input files
# Assume you have files: input_1.txt, input_2.txt, ..., input_10.txt
# INPUT_FILE="input_${SLURM_ARRAY_TASK_ID}.txt"
# echo "Processing $INPUT_FILE"
# python process.py --input $INPUT_FILE --output output_${SLURM_ARRAY_TASK_ID}.txt

# Example 2: Run same script with different parameters
# python simulation.py --seed ${SLURM_ARRAY_TASK_ID} --output results_${SLURM_ARRAY_TASK_ID}.csv

# Example 3: Use task ID as array index for parameter file
python array_task_example.py --task-id ${SLURM_ARRAY_TASK_ID}

echo "========================================"
echo "Task $SLURM_ARRAY_TASK_ID finished at: $(date)"
echo "========================================"
