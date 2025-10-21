# GPU-based Molecular Dynamics Simulations in HOOMD-Blue

Included in this directory is a HOOMD script (simple-script.py) and SLURM
scripts for running this simulation across a single GPU (gpu-job.slurm)
and four nodes with four GPUs per node (multi-gpu-job.slurm).

Notes
-----

- HOOMD-Blue 1.3.3 was built with OpenMPI 1.10.2 with support for running multi-node jobs across the low-latency RoCE network.
- SLURM's ```srun``` command will automatically spawn as many processes (i.e. tasks) as you've requested in your SLURM script.
