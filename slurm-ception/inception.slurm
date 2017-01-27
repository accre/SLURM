#!/bin/bash

#SBATCH --mem=50M
#SBATCH --time=00:10:00

if [ "$#" -ne 1 ]; then
    echo "USAGE: SBATCH [OPTION] $0 LEVEL"; exit 1
fi

LEVEL=$1

# test if level is non-negative number
re='^[0-9]$'
if ! [[ $LEVEL =~ $re ]] ; then
    echo "error: LEVEL must be an integer between 0 and 9,\
        inclusive." >&2; exit 1
fi

echo "LEVEL: $1"
echo "SLURM_JOB_ID: $SLURM_JOB_ID"
echo "SLURM_JOB_NODELIST: $SLURM_JOB_NODELIST"
echo "SLURM_NTASKS_PER_NODE: $SLURM_NTASKS_PER_NODE"


NEXT_LEVEL=$((LEVEL-1))

if (( LEVEL == 0 )); then
    # Here's where the recursion loop terminates.
    echo "End of the Line!!"
elif (( LEVEL == 1 )); then
    echo "Only one more level to go!"
    # Here's where you can run specific code depending on the level
    
    # Launch another SLURM job here.
    # Note that passing SLURM options as command line arguments to
    # sbatch will override the defaults listed at the top of this file.
    # The last line passes the name of this file and NEXT_LEVEL as
    # arguments to the sbatch command.
    sbatch \
        --ntasks-per-node=3 \
        --mem=40 \
        --output="my-custom-output.log" \
        $0 $NEXT_LEVEL
else
    # You can recurse with this file without using SLURM also. Just run 
    # the file as a bash script.
    echo "Skipping levels"
    sh $0 $NEXT_LEVEL
fi
