#!/bin/bash
#SBATCH --mail-user=someone@emailservice.com  # email address
#SBATCH --mail-type=ALL  # Alerts sent when job begins, ends, or aborts
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=1G
#SBATCH --job-name=my_first_julia
#SBATCH --time=00-00:02:00  # Wall Clock time (dd-hh:mm:ss) [max of 14 days]
#SBATCH --output=my_first_julia.output  # output and error messages go to this file

julia my_first_julia_on_slurm.jl
