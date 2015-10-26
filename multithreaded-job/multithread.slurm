#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1 
#SBATCH --cpus-per-task=4  # 4 threads per task
#SBATCH --time=02:00:00   # two hours
#SBATCH --mem=4G
#SBATCH --output=multithread.out
#SBATCH --mail-user=vunetid@vanderbilt.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name=multithreaded_example

# Run multi-threaded application
setpkgs -a gcc_compiler
make
./hello