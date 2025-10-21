#!/usr/bin/env python3
"""
Example script for SLURM job arrays
Demonstrates using SLURM_ARRAY_TASK_ID to process different data
"""

import sys
import argparse
import os
import time
import random
import json
from datetime import datetime

def process_task(task_id, output_dir="results"):
    """
    Simulate processing for a specific task ID
    In a real workflow, this might:
    - Load different input files
    - Use different parameters
    - Process different data subsets
    """
    print("=" * 60)
    print(f"Processing Task {task_id}")
    print("=" * 60)
    print(f"Started at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")

    # Example: Different parameters based on task ID
    # In real use, you might load these from a config file
    parameters = {
        'task_id': task_id,
        'learning_rate': 0.001 * (task_id % 5 + 1),  # Vary learning rate
        'batch_size': 32 * (2 ** (task_id % 3)),     # Vary batch size
        'seed': task_id * 42,                          # Different random seed
        'epochs': 10
    }

    print("\nParameters:")
    print("-" * 60)
    for key, value in parameters.items():
        print(f"  {key}: {value}")

    # Simulate some computation
    print("\nSimulating computation...")
    random.seed(parameters['seed'])

    # Simulate training epochs
    results = []
    for epoch in range(parameters['epochs']):
        # Simulate some work
        time.sleep(0.5)

        # Simulate metrics
        loss = 1.0 / (epoch + 1) + random.gauss(0, 0.1)
        accuracy = min(1.0, 0.5 + epoch * 0.05 + random.gauss(0, 0.02))

        result = {
            'epoch': epoch + 1,
            'loss': loss,
            'accuracy': accuracy
        }
        results.append(result)

        print(f"  Epoch {epoch+1}/{parameters['epochs']}: "
              f"Loss={loss:.4f}, Accuracy={accuracy:.4f}")

    # Save results
    os.makedirs(output_dir, exist_ok=True)
    output_file = os.path.join(output_dir, f"task_{task_id}_results.json")

    output_data = {
        'task_id': task_id,
        'parameters': parameters,
        'results': results,
        'final_loss': results[-1]['loss'],
        'final_accuracy': results[-1]['accuracy'],
        'completed_at': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    }

    with open(output_file, 'w') as f:
        json.dump(output_data, f, indent=2)

    print("\n" + "=" * 60)
    print(f"Task {task_id} Complete!")
    print(f"Final loss: {results[-1]['loss']:.4f}")
    print(f"Final accuracy: {results[-1]['accuracy']:.4f}")
    print(f"Results saved to: {output_file}")
    print("=" * 60)

    return output_data

def main():
    parser = argparse.ArgumentParser(
        description="Example array task processing script"
    )
    parser.add_argument(
        '--task-id',
        type=int,
        help='Task ID (usually from SLURM_ARRAY_TASK_ID)'
    )
    parser.add_argument(
        '--output-dir',
        type=str,
        default='results',
        help='Output directory for results'
    )

    args = parser.parse_args()

    # Get task ID from command line or environment variable
    task_id = args.task_id
    if task_id is None:
        task_id = os.environ.get('SLURM_ARRAY_TASK_ID')
        if task_id is not None:
            task_id = int(task_id)
        else:
            print("Error: No task ID provided and SLURM_ARRAY_TASK_ID not set")
            print("Usage: python array_task_example.py --task-id <id>")
            sys.exit(1)

    # Process the task
    process_task(task_id, args.output_dir)

if __name__ == "__main__":
    main()
