#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=4G
#SBATCH --time=00:05:00
#SBATCH --job-name=smemwatch-test

smemwatch -k 95 -d 50 -l memwatch-${SLURM_JOB_ID}.log $$ &

module load GCC Python OpenMPI numpy

echo "Consuming RSS memory >1GB 10s"
python -c 'import numpy; n = numpy.ones((1024, 1024, 128, 1)); import time; time.sleep(10)'

echo "Consuming RSS memory >2GB 1s"
python -c 'import numpy; n = numpy.ones((1024, 1024, 128, 2)); import time; time.sleep(1)'

echo "Consuming RSS memory >3GB 0.1s"
python -c 'import numpy; n = numpy.ones((1024, 1024, 128, 3)); import time; time.sleep(0.1)'

echo "Completed OK"
