#!/usr/bin/env python3
"""
CPU-based matrix multiplication example
Demonstrates numpy computation on ACCRE cluster
Tests multiple CPU cores if available
"""

import numpy as np
import time
import os
import sys

def matrix_multiply_benchmark(size=2000, num_iterations=3):
    """
    Perform matrix multiplication benchmark

    Args:
        size: Size of square matrices (size x size)
        num_iterations: Number of times to run the multiplication
    """
    print("=" * 60)
    print("Matrix Multiplication Benchmark")
    print("=" * 60)
    print(f"Matrix size: {size} x {size}")
    print(f"Number of iterations: {num_iterations}")

    # Check for SLURM CPU allocation
    cpus = os.environ.get('SLURM_CPUS_PER_TASK', 'Not set')
    print(f"SLURM CPUs per task: {cpus}")

    # Numpy should automatically use multiple threads via BLAS
    print(f"Numpy version: {np.__version__}")
    print(f"Numpy BLAS info:")
    try:
        np.show_config()
    except:
        print("  BLAS config not available")

    print("-" * 60)

    # Create random matrices
    print(f"Creating random matrices...")
    np.random.seed(42)
    A = np.random.rand(size, size)
    B = np.random.rand(size, size)

    # Perform multiplications
    times = []
    for i in range(num_iterations):
        print(f"\nIteration {i+1}/{num_iterations}")
        start_time = time.time()
        C = np.dot(A, B)
        end_time = time.time()

        elapsed = end_time - start_time
        times.append(elapsed)

        # Calculate GFLOPS (approximate)
        # Matrix multiplication of N x N matrices requires ~2*N^3 operations
        operations = 2 * size**3
        gflops = (operations / elapsed) / 1e9

        print(f"  Time: {elapsed:.3f} seconds")
        print(f"  Performance: {gflops:.2f} GFLOPS")
        print(f"  Result shape: {C.shape}")
        print(f"  Result sum (verification): {C.sum():.2f}")

    # Summary statistics
    print("\n" + "=" * 60)
    print("Summary")
    print("=" * 60)
    print(f"Mean time: {np.mean(times):.3f} seconds")
    print(f"Std dev: {np.std(times):.3f} seconds")
    print(f"Min time: {np.min(times):.3f} seconds")
    print(f"Max time: {np.max(times):.3f} seconds")

    avg_gflops = (2 * size**3 / np.mean(times)) / 1e9
    print(f"Average performance: {avg_gflops:.2f} GFLOPS")
    print("=" * 60)

def main():
    # Default parameters
    size = 2000
    iterations = 3

    # Parse command line arguments if provided
    if len(sys.argv) > 1:
        size = int(sys.argv[1])
    if len(sys.argv) > 2:
        iterations = int(sys.argv[2])

    matrix_multiply_benchmark(size, iterations)

if __name__ == "__main__":
    main()
