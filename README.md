SLURM Examples for ACCRE
=========================

## ⭐ START HERE: Basic Examples (Updated October 2025)

**NEW USERS**: Go to the **[basic-examples/](basic-examples/)** directory first! See https://help.accre.vanderbilt.edu/index.php?title=Overview for the most up to date information.

These examples use **current ACCRE configuration** and are recommended for all users:

- ✅ Current partitions (batch, batch_gpu, interactive, interactive_gpu)
- ✅ Proper `setup_accre_software_stack` usage
- ✅ Current GPU types and syntax
- ✅ Up-to-date module loading

**Quick start**:
```bash
cd basic-examples/
cat README.md
# Edit script to add your account name, then:
sbatch 01_basic_batch.slurm
```

**⚠️ IMPORTANT**: All job scripts require `#SBATCH --account=your_account_name`. Find your account with: `sacctmgr show user $USER`

---

## ✅ Updated Examples (Safe to Use)

The following directories contain **verified, up-to-date** examples:

- **basic-examples/** (⭐ START HERE) - Comprehensive examples for new users

## 📦 Archived Examples

**archived-examples/** contains **severely** outdated examples that need updating before use. These examples are missing `setup_accre_software_stack` and may use deprecated module names or partition names. See the [archived-examples/README.md](archived-examples/README.md) for details.

---

## SLURM Commands Reference

- **slurm-commands.sh**: contains lots of examples of SLURM commands
and how to customize the output of each command

---

## Current Example Directories

To submit any script:
```bash
sbatch SCRIPT_NAME.slurm
```

Make sure to change the email if you want to submit these scripts.

### ✅ Verified Current Examples

- **basic-examples/** (⭐ **START HERE**) - Up-to-date examples for new users with current ACCRE configuration. Includes:
  - Basic batch (CPU) jobs
  - GPU jobs with correct partition and gres syntax
  - Job arrays
  - Python example scripts
  - Comprehensive README

### 📦 Archived Examples

- **archived-examples/** - Contains examples that need updating before use (mpi-job, openmp-job, pthread-job, julia-job, epilog, job-array2, srun, memory-optimization). See [archived-examples/README.md](archived-examples/README.md) for details on what needs fixing.
