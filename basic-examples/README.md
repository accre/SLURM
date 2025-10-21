# Basic SLURM Examples for ACCRE

**START HERE if you're new to SLURM at ACCRE!**

These examples use **current ACCRE configuration** and best practices as of October 2025. See https://help.accre.vanderbilt.edu/index.php?title=SLURM for more information.

---

## Quick Start

**BEFORE submitting any job**: Edit the script and replace `your_account_name` with your actual SLURM account name!

### 1. Basic Batch Job (CPU only)
**File**: `01_basic_batch.slurm`

Simple CPU job - your starting point for most work.

```bash
# Edit the script first to add your account name!
sbatch 01_basic_batch.slurm
```

**Use this for**: Data processing, statistical analysis, most Python/R workloads

---

### 2. GPU Job
**File**: `02_basic_gpu.slurm`

GPU-accelerated job with correct partition and gres syntax.

```bash
sbatch 02_basic_gpu.slurm
```

**Use this for**: Machine learning, molecular dynamics, CUDA applications

**Important**: Must specify GPU type! See comments in script for available types.

---

### 3. Job Array
**File**: `03_job_array.slurm`

Run many similar jobs with one script.

```bash
sbatch 03_job_array.slurm
```

**Use this for**: Parameter sweeps, processing multiple files, ensemble runs

---

## Python Examples

- `hello_world.py` - Basic test script, shows SLURM environment
- `matrix_multiply.py` - CPU benchmark
- `gpu_check.py` - GPU availability checker (requires PyTorch/TensorFlow)
- `array_task_example.py` - Job array demo with parameter variation

---

## Key ACCRE Requirements

### ⚠️ CRITICAL Requirements

**1. ALL scripts MUST include --account parameter:**

```bash
#SBATCH --account=your_account_name
```

Replace `your_account_name` with your SLURM account. Find yours with: `slurm_resources`

**2. ALL scripts MUST include setup_accre_software_stack before module loads if using ACCRE provided software stack:**

```bash
setup_accre_software_stack
module load gcc/12.3 python/3.11.5
```

Without `setup_accre_software_stack`, modules will NOT work!

### Current Partitions

- **batch** (default) - CPU jobs, fair-share based
- **batch_gpu** - GPU jobs (must specify `--gres=gpu:type:count`)
- **interactive** - QoS-based, immediate access (advanced)
- **interactive_gpu** - QoS-based GPU access (advanced)

### Current GPU Types

Use with `--gres=gpu:TYPE:COUNT`:

See dashboard for gpu types, usage, and availability. Use `slurm_resources` command to see what gpu's your account has access to.

Check availability: `sinfo -p batch_gpu`

### Resource Limits

- **Default time**: 30 minutes
- **Max time**: 14 days
- **Default memory**: 1 GB/core
- **Max memory**: 20 GB/core

**Important**: At ACCRE, 1 CPU = 1 PHYSICAL CORE (not threads!)

---

## Getting Help

- **Documentation**: https://help.accre.vanderbilt.edu
- **Email**: help@accre.vanderbilt.edu
- **Slack**: ACCRE Forum

---

**Last Updated**: October 2025
