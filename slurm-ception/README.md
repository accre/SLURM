#slurm-ception

This script launches a SLURM job, which recursively launches subsequent SLURM 
batch jobs using the same script. This is advantageous for keeping all your 
code in a single script file.

The basic usage is 
```
sbatch [options] inception.slurm LEVEL
```

where `LEVEL` specifies the levels or layers of recursion to perform. For 
each recursive call of the script, `LEVEL` is decremented by 1. Logically,
Level 0 should terminate the recursive loop, essentially by *not* calling 
another `sbatch` job.

Note that the script only checks that `LEVEL` is a non-negative integer,
but passing a very large value of `LEVEL` would be a bad idea.
