#!/bin/bash
#SBATCH --mail-user=<myemail@vanderbilt.edu>
#SBATCH --mail-type=ALL
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=4  # 4 threads per task
#SBATCH --time=02:00:00    # two hours
#SBATCH --mem=1G           # 1 GB RAM per node
#SBATCH --output=multithread.out

# Run multi-threaded application
module load GCC
make
./parfor
