
# SLURM will run this file in the same way
# a file would run on your own computer if you'd open
# julia with the `-p` option specified.
#
# Since we asked for 4 processes in the `.slurm` file,
# this will execute as if you'd openned julia on your own computer
# with `julia -p 3` or as if you'd openned Julia and run
# `addprocs(3)`.

# See ids of our workers. Should be length 3.
# The output of this `println` command will appear in the
# SLURM output file julia_in_parallel.output
println(workers())

# Ask everyone to say hi
@everywhere begin
    worker_id = myid()
    println("Hello! I'm worker number $worker_id. Nice to meet you!")
end
