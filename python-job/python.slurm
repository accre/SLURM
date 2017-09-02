#!/bin/bash
#SBATCH --mail-user=<myemail@vanderbilt.edu>
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:10:00
#SBATCH --mem=500M
#SBATCH --output=python_job_slurm.out

# Load the Anaconda distribution of Python, which comes
# pre-bundled with many of the popular scientific computing tools like
# numpy, scipy, pandas, scikit-learn, etc.
module load Anaconda3

# Pass your Python script to the Anaconda3 python intepreter for execution
python vectorization.py
