#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=1G
#SBATCH --time=0-00:02:00     # 10 seconds
#SBATCH --output=my.stdout
#SBATCH --mail-user=william.r.french@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="just_a_test"

# This will be run once for a single process
/bin/hostname 

# These commands will be run by each process
# -l flag prepends the task number to each line of output
srun -l /bin/hostname
srun -l /bin/pwd
