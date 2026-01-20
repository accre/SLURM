# Basic SLURM Examples for ACCRE

**START HERE if you're new to SLURM at ACCRE!**

These examples use **current ACCRE configuration** and best practices. See https://help.accre.vanderbilt.edu/index.php?title=SLURM for more information.

---

## Training Session Quick Start

If you're following along with ACCRE's SLURM training:

```bash
# 1. Clone this repo (if you haven't already)
git clone https://github.com/accre/slurm.git
cd slurm/basic-examples/

# 2. Find your account name
slurm_resources

# 3. Edit the interactive debug script
nano 00_interactive_debug.slurm
# Change "your_account_name_int" to your actual account (e.g., mygroup_int)

# 4. Submit your first job!
sbatch 00_interactive_debug.slurm

# 5. Check job status
squeue --me
```

---

## Debug Examples (For Training & Testing)

These use the **debug QoS** - jobs start immediately! Use these for training and quick tests.

### CPU Debug Job
**File**: `00_interactive_debug.slurm`

Uses `interactive` partition + `debug_int` QoS.

```bash
# Edit to add your account name with _int suffix
sbatch 00_interactive_debug.slurm
```

**Or run interactively:**
```bash
srun --pty --partition=interactive --qos=debug_int \
     --account=your_account_int --cpus-per-task=2 --mem=2G --time=0:30:00 bash
```

### GPU Debug Job
**File**: `00_gpu_debug.slurm`

Uses `interactive_gpu` partition + `debug_iacc` QoS.

```bash
# Edit to add your account name with _iacc suffix
sbatch 00_gpu_debug.slurm
```

**Or run interactively:**
```bash
srun --pty --partition=interactive_gpu --qos=debug_iacc \
     --account=your_account_iacc --cpus-per-task=2 --mem=2G \
     --gres=gpu:1 --time=0:30:00 bash
```

---

## Production Examples (For Real Work)

These use the **batch** partitions - jobs are scheduled based on fair-share.

### 1. Basic Batch Job (CPU)
**File**: `01_basic_batch.slurm`

Simple CPU job for production work.

```bash
sbatch 01_basic_batch.slurm
```

**Use this for**: Data processing, statistical analysis, most Python/R workloads

### 2. GPU Batch Job
**File**: `02_basic_gpu.slurm`

GPU-accelerated job for production work.

```bash
sbatch 02_basic_gpu.slurm
```

**Use this for**: Machine learning training, molecular dynamics, CUDA applications

**Important**: Must specify GPU type! Use `slurm_resources` to see available GPUs.

### 3. Job Array
**File**: `03_job_array.slurm`

Run many similar jobs with one script.

```bash
sbatch 03_job_array.slurm
```

**Use this for**: Parameter sweeps, processing multiple files, ensemble runs

---

## Account Suffixes - IMPORTANT!

Different partitions require different account suffixes:

| Partition | Account Suffix | QoS (for debug) | Example |
|-----------|----------------|-----------------|---------|
| `batch` | (none) | N/A | `--account=mygroup` |
| `interactive` | `_int` | `debug_int` | `--account=mygroup_int` |
| `batch_gpu` | `_acc` | N/A | `--account=mygroup_acc` |
| `interactive_gpu` | `_iacc` | `debug_iacc` | `--account=mygroup_iacc` |

**Find your accounts with:** `slurm_resources`

---

## Python Examples

- `hello_world.py` - Basic test script, shows SLURM environment
- `matrix_multiply.py` - CPU benchmark
- `gpu_check.py` - GPU availability checker (requires PyTorch/TensorFlow)
- `array_task_example.py` - Job array demo with parameter variation

---

## Key ACCRE Requirements

### CRITICAL: Software Stack

**ALL scripts using modules MUST include `setup_accre_software_stack` first:**

```bash
setup_accre_software_stack
module load gcc/12.3 python/3.11.5
```

Without `setup_accre_software_stack`, modules will NOT work!

### Resource Limits

- **Default time**: 30 minutes
- **Max time**: 14 days
- **Default memory**: 1 GB/core
- **Max memory**: 20 GB/core (jobs requesting more get extra cores automatically)

**Important**: At ACCRE, 1 CPU = 1 PHYSICAL CORE (not threads!)

---

## Getting Help

- **Documentation**: https://help.accre.vanderbilt.edu
- **Email**: help@accre.vanderbilt.edu
- **Slack**: ACCRE Forum

---

**Last Updated**: January 2026
