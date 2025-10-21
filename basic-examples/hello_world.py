#!/usr/bin/env python3
"""
Simple Hello World example for ACCRE SLURM training
Demonstrates basic Python execution on the cluster
"""

import sys
import platform
import os
from datetime import datetime

def main():
    print("=" * 50)
    print("Hello from ACCRE!")
    print("=" * 50)
    print(f"Current time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print(f"Python version: {sys.version}")
    print(f"Platform: {platform.platform()}")
    print(f"Processor: {platform.processor()}")
    print(f"Hostname: {platform.node()}")

    # Print SLURM environment variables if they exist
    slurm_vars = [
        'SLURM_JOB_ID',
        'SLURM_JOB_NAME',
        'SLURM_NODELIST',
        'SLURM_CPUS_PER_TASK',
        'SLURM_MEM_PER_NODE',
        'SLURM_ARRAY_TASK_ID'
    ]

    print("\nSLURM Environment:")
    print("-" * 50)
    for var in slurm_vars:
        value = os.environ.get(var, 'Not set')
        print(f"{var}: {value}")

    print("=" * 50)
    print("Hello World complete!")
    print("=" * 50)

if __name__ == "__main__":
    main()
