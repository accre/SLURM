#!/bin/bash
#SBATCH --mail-user=<myemail@vanderbilt.edu>
#SBATCH --mail-type=ALL
#SBATCH --ntasks=1
#SBATCH --time=2:00:00
#SBATCH --mem=500M
#SBATCH --array=1-5   # go from 1 to the number of files in your data/ directory
#SBATCH --output=python_array_job_slurm_%A_%a.out

arrayfile=`ls data/ | awk -v line=$SLURM_ARRAY_TASK_ID '{if (NR == line) print $0}'`

# Load the Anaconda distribution of Python, which comes 
# pre-bundled with many of the popular scientific computing tools like
# numpy, scipy, pandas, sckit-learn, etc.
module load Anaconda2

python data/$arrayfile
