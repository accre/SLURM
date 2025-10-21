#!/usr/bin/env python3
"""
GPU availability check for ACCRE
Tests if GPU is accessible and prints GPU information
"""

import sys
import os
import subprocess

def check_cuda_available():
    """Check if CUDA is available via PyTorch or TensorFlow"""
    print("=" * 60)
    print("GPU Availability Check")
    print("=" * 60)

    # Check CUDA environment variable
    cuda_visible = os.environ.get('CUDA_VISIBLE_DEVICES', 'Not set')
    print(f"CUDA_VISIBLE_DEVICES: {cuda_visible}")
    print()

    # Try nvidia-smi
    print("Running nvidia-smi...")
    print("-" * 60)
    try:
        result = subprocess.run(['nvidia-smi'], capture_output=True, text=True)
        print(result.stdout)
    except FileNotFoundError:
        print("nvidia-smi not found in PATH")
    print()

    # Try PyTorch
    pytorch_available = False
    try:
        import torch
        pytorch_available = True
        print("PyTorch GPU Information:")
        print("-" * 60)
        print(f"PyTorch version: {torch.__version__}")
        print(f"CUDA available: {torch.cuda.is_available()}")

        if torch.cuda.is_available():
            print(f"CUDA version: {torch.version.cuda}")
            print(f"Number of GPUs: {torch.cuda.device_count()}")

            for i in range(torch.cuda.device_count()):
                print(f"\nGPU {i}:")
                print(f"  Name: {torch.cuda.get_device_name(i)}")
                print(f"  Memory allocated: {torch.cuda.memory_allocated(i) / 1e9:.2f} GB")
                print(f"  Memory cached: {torch.cuda.memory_reserved(i) / 1e9:.2f} GB")

                # Get total memory
                props = torch.cuda.get_device_properties(i)
                print(f"  Total memory: {props.total_memory / 1e9:.2f} GB")
                print(f"  Compute capability: {props.major}.{props.minor}")

            # Test simple computation
            print("\nTesting simple GPU computation...")
            try:
                x = torch.rand(1000, 1000).cuda()
                y = torch.rand(1000, 1000).cuda()
                z = torch.matmul(x, y)
                print(f"  Matrix multiplication successful!")
                print(f"  Result shape: {z.shape}")
                print(f"  Result sum: {z.sum().item():.2f}")
            except Exception as e:
                print(f"  Error during computation: {e}")
        else:
            print("CUDA is not available in PyTorch")
            print("This could mean:")
            print("  - No GPU was allocated to this job")
            print("  - PyTorch was not compiled with CUDA support")
            print("  - CUDA driver/toolkit mismatch")
    except ImportError:
        print("PyTorch not installed")
        print("To install: pip install torch (in a virtual environment)")

    print()

    print("=" * 60)

    if not pytorch_available:
        print("\nNote: For a full GPU test, install PyTorch or TensorFlow in a virtual environment.")
        print("Example: See https://help.accre.vanderbilt.edu/index.php?title=GPUs_at_ACCRE for more information.")

def main():
    check_cuda_available()

if __name__ == "__main__":
    main()
