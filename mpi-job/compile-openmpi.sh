#!/bin/bash

setpkgs -a gcc_compiler
setpkgs -a openmpi_gcc
mpicxx test.cpp -o test-openmpi
