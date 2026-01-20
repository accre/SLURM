# Intro to SLURM - Training Commands

Quick reference for the ACCRE SLURM training session. All commands have copy buttons - click to copy, then paste into your terminal.

---

## 1. Setup

```bash
mkdir ~/slurm-training
cd ~/slurm-training
git clone https://github.com/accre/slurm.git
cd slurm/basic-examples/
```

---

## 2. Check Your Resources

**Run this first!** Shows your accounts, partitions, and limits.

```bash
slurm_resources
```

Note your account names - you'll need them with different suffixes:
| Partition | Account Suffix | Example |
|-----------|----------------|---------|
| `batch` | (none) | `mygroup` |
| `interactive` | `_int` | `mygroup_int` |
| `batch_gpu` | `_acc` | `mygroup_acc` |
| `interactive_gpu` | `_iacc` | `mygroup_iacc` |

---

## 3. Software Stack

**Required before using modules!**

```bash
setup_accre_software_stack
```

Then load modules:

```bash
module spider python
module load gcc/12.3 python/3.11.5
python --version
```

---

## 4. Interactive Debug Session (CPU)

Jobs start immediately with debug QoS (30 min max).

```bash
srun --pty --partition=interactive --qos=debug_int \
     --account=YOUR_ACCOUNT_int \
     --cpus-per-task=2 --mem=2G --time=0:30:00 bash
```

This drops you directly into a shell on a compute node:

```bash
hostname
pwd
```

Exit when done:

```bash
exit
```

---

## 5. Submit a Batch Job

Edit the script to add your account name:

```bash
nano 00_interactive_debug.slurm
```

Change `your_account_name_int` to your actual account (e.g., `mygroup_int`).

Submit:

```bash
sbatch 00_interactive_debug.slurm
```

---

## 6. Monitor Your Jobs

Check job status:

```bash
squeue --me
```

Watch job status (updates every 5 seconds):

```bash
watch -n 5 squeue --me
```

Press `Ctrl+C` to stop watching.

View job output:

```bash
cat interactive_debug_*.out
```

---

## 7. Job History and Resource Usage

After job completes, check what it actually used:

```bash
sacct -j JOBID --format=JobID,Elapsed,MaxRSS,State
```

Or use ACCRE's helper:

```bash
rtracejob JOBID
```

---

## 8. GPU Debug Session

Jobs start immediately with debug QoS (30 min max).

### Option A: Interactive

```bash
srun --pty --partition=interactive_gpu --qos=debug_iacc \
     --account=YOUR_ACCOUNT_iacc \
     --cpus-per-task=2 --mem=2G --gres=gpu:1 --time=0:30:00 bash
```

Check GPU:

```bash
nvidia-smi
```

### Option B: Batch Script

Edit script with your account:

```bash
nano 00_gpu_debug.slurm
```

Submit:

```bash
sbatch 00_gpu_debug.slurm
```

---

## 9. Cancel a Job

```bash
scancel JOBID
```

Cancel all your jobs:

```bash
scancel --me
```

---

## Quick Reference

| Command | Purpose |
|---------|---------|
| `slurm_resources` | Check your accounts and limits |
| `sbatch script.slurm` | Submit a batch job |
| `squeue --me` | Check your job status |
| `scancel JOBID` | Cancel a job |
| `sacct -j JOBID` | View completed job info |
| `srun --pty ... bash` | Start interactive session |
| `sinfo -p PARTITION` | See partition status |

---

## Getting Help

- **Documentation**: https://help.accre.vanderbilt.edu
- **Email**: accre-help@vanderbilt.edu
- **Slack**: ACCRE Forum

---

**More examples in this folder:** `01_basic_batch.slurm`, `02_basic_gpu.slurm`, `03_job_array.slurm`
