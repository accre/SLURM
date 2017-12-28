# To run parallel jobs in SLURM, we need the
# ClusterManagers package, which
# can be installed with the command
# `Pkg.add("ClusterManagers")`

# Recall we asked for 4 processes in the `.slurm` file.
# These are created using either `addprocs_slurm(4)` or
# `addprocs(SlurmManager(4))`.

# This will create worker instances that work the same way as
# the workers that would be created if you'd launched julia
# on your own computer with `julia -p 4` or as if you'd
# openned Julia and run
# `addprocs(4)`.

using ClusterManagers

# Here we create our parallel julia processes
addprocs_slurm(4)

# See ids of our workers. Should be length 4.
# The output of this `println` command will appear in the
# SLURM output file julia_in_parallel.output
println(workers())

# Here we ask everyone to say hi!
# Output will appear in julia_in_parallel.output
g = @parallel (vcat) for w in workers()
    worker_id = myid()
    worker_host = gethostname()
    "Hello! I'm worker number $worker_id, and I reside on machine $worker_host. Nice to meet you!"
end

for i in g
   println(i)
end
