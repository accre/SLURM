#!/bin/bash

setpkgs -a intel_cluster_studio_compiler
mpiicpc test.cpp -o test
