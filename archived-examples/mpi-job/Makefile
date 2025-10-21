CC=mpicxx
CFLAGS=-Wall
SRC=compute_pi.cpp
EXE=mpi_pi

release : ${SRC}
	$(CC) -o ${EXE} $< ${CFLAGS}

debug : ${SRC}
	$(CC) -o ${EXE}_debug $< ${CFLAGS} -g

.PHONY: clean

clean:
	rm -f ${EXE} ${EXE}_debug