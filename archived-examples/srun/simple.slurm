#!/bin/bash
#SBATCH --mail-user=<myemail@vanderbilt.edu>
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=1G
#SBATCH --time=0-00:02:00     # 2 minutes
#SBATCH --output=my.stdout

# This will be run once for a single process
/bin/hostname 

# These commands will be run by each process
# -l flag prepends the task number to each line of output
srun -l /bin/hostname
srun -l /bin/pwd
