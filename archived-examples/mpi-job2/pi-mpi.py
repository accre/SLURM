"""
Inefficient calculation of Pi using random numbers and mpi4py

Note that this will only run 100 million iterations per task,
as opposed to 1 billion in the C++ version. The pure-python
calculation is considerably slower.

This uses a trivial numpy array of one 64-bit integer to
communicate between processes as (AFAICT) the reduce operation
is not supported for arbitrary python objects like the standard
arbitrary size integer.
"""
import math
import random

import numpy
from mpi4py import MPI


comm = MPI.COMM_WORLD
rank = comm.Get_rank()
size = comm.Get_size()

random.seed(42 + rank)
local_hits = numpy.array([0], dtype=numpy.int64)
global_hits = numpy.array([0], dtype=numpy.int64)

iters = 100_000_000

for idx in range(iters):
    x = random.random()
    y = random.random()
    if x**2 + y**2 < 1.0:
        local_hits[0] += 1

comm.Reduce(local_hits, global_hits, MPI.SUM, 0)

if rank == 0:
   print("Global Attempts: {}".format(iters * size))
   print("Global Hits: {}".format(global_hits[0]))
   pi = 4.0 * global_hits[0] / (iters * size)
   print("Calculated Pi: {}".format(pi))
   print("Ratio calc/actual: {}".format(pi / math.pi))
