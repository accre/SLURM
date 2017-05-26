CC=gcc
CFLAGS=-Wall -fopenmp

parfor : parallel_for.c
	$(CC) -o $@ $< $(CFLAGS)

.PHONY: clean

clean :
	rm -f parfor