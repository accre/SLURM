#!/bin/bash

#SBATCH --mem=50M
#SBATCH --time=00:10:00

if [ "$#" -ne 1 ]; then
    echo "USAGE: SBATCH [OPTION] $0 LEVEL"; exit 1
fi

LEVEL=$1

# test if level is non-negative number
re='^[0-9]+$'
if ! [[ $LEVEL =~ $re ]] ; then
    echo "error: LEVEL must be non-negative integer" >&2; exit 1
fi

echo "LEVEL: $1 JOB_ID: $SLURM_JOB_ID NODE: $SLURM_JOB_NODELIST \
    NTASKS_PER_NODE $SLURM_NTASKS_PER_NODE"

NEXT_LEVEL=$((LEVEL-1))

if (( LEVEL == 0 )); then
    echo "End of the Line!!"
else
    sbatch --ntasks-per-node=2 $0 $NEXT_LEVEL
fi
