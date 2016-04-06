#!/bin/bash
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:10:00
#SBATCH --mem=500M
#SBATCH --output=python_job_slurm.out

setpkgs -a python2.7.8

# The epilog script must be executable (a script can be made executable by typing "chmod +x script.sh")
# In practice, you probably would want to keep this epilog at a top-level directory in your home directory
# for convenient reuse.
srun --task-epilog=${SLURM_SUBMIT_DIR}/compress_large_files python vectorization.py
