#!/bin/bash

setpkgs -a openmpi_1.8.4
mpicxx test.cpp -o mpi_exec
