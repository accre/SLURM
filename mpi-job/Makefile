CC=mpicxx
CFLAGS=-Wall
SRC=test.cpp
EXE=mpi_exec

release : ${SRC}
	$(CC) -o ${EXE} $< ${CFLAGS} -O3

debug : ${SRC}
	$(CC) -o ${EXE}_debug $< ${CFLAGS} -g

.PHONY: clean

clean:
	rm ${EXE}
	rm ${EXE}_debug