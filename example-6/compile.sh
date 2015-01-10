#!/bin/bash

setpkgs -a gcc_compiler
gcc -Wall -o hello hello.c -lpthread