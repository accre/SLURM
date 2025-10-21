# Archived SLURM Examples

⚠️ **These examples are OUTDATED and need updating before use!**

## Why These Are Archived

These examples have **not yet been updated** to match current ACCRE configuration. They are missing critical components and may reference deprecated features.

### Common Issues in These Examples

All examples in this directory have one or more of the following problems:

1. **Missing `setup_accre_software_stack`** - This command is **REQUIRED** before any `module load` commands at ACCRE
2. **Old module names** - References to `Anaconda2`, `Anaconda3`, or other deprecated modules
3. **Potentially outdated partition names** - May reference old partitions
4. **Incomplete or outdated documentation**

## DO NOT Use These Examples Directly!

**Instead, use:**
- **[../basic-examples/](../basic-examples/)** - Current, verified examples for new users
- **[../python-job/](../python-job/)** - Updated Python job example
- **[../gpu-job/](../gpu-job/)** - Updated GPU job example
- **[../job-array/](../job-array/)** - Updated job array example

## What Needs To Be Fixed

Before any example in this archive can be used, it must be updated to include:

### 1. Add setup_accre_software_stack
```bash
# CRITICAL: Load ACCRE software stack before any module loads
setup_accre_software_stack
```

### 2. Update module names
**Old (WRONG):**
```bash
module load Anaconda2
module load Anaconda3
setpkgs -a some_package
```

**New (CORRECT):**
```bash
setup_accre_software_stack
module load GCC/11.3.0 Python/3.10.4
# Or for specific needs:
# module load GCC/11.3.0 OpenMPI/4.1.4
```

### 3. Verify partition names
- Use `batch` (not `production`)
- Use `batch_gpu` (not `maxwell`, `pascal`, `turing`)
- GPU jobs need `--gres=gpu:TYPE:COUNT` (e.g., `--gres=gpu:nvidia_rtx_a6000:1`)

## Contents of This Archive

- **job-array2/** - Alternative job array example (needs module updates)
- **epilog/** - Post-processing epilog example (needs module updates)
- **julia-job/** - Julia examples (needs module updates)
- **memory-optimization/** - Memory optimization example (needs review)
- **mpi-job/** - MPI job example (needs setup_accre_software_stack)
- **mpi-job2/** - Alternative MPI example (needs setup_accre_software_stack)
- **openmp-job/** - OpenMP multithreading example (needs setup_accre_software_stack)
- **pthread-job/** - Pthread multithreading example (needs setup_accre_software_stack)
- **srun/** - Basic srun examples (needs review)

## When Will These Be Updated?

These examples will be reviewed and updated as time permits. In the meantime:
- Use the **basic-examples/** directory for current, working examples
- Check the main README.md for other updated examples (marked with ✅)

## For Advanced Users

If you understand SLURM and the ACCRE environment, you can use these as a **starting point** but you **must**:
1. Add `setup_accre_software_stack` before any module loads
2. Update module names to current versions (check with `module avail`)
3. Verify partition names match current ACCRE configuration
4. Test thoroughly before use

---

**Last Updated**: October 2025
