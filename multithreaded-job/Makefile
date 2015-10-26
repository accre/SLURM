CC=gcc
CFLAGS=-Wall -lpthread
SRC=hello.c
EXE=hello

release : ${SRC}
	$(CC) -o ${EXE} $< ${CFLAGS} -O3

debug : ${SRC}
	$(CC) -o ${EXE}_debug $< ${CFLAGS} -g

.PHONY: clean

clean:
	rm ${EXE}
	rm ${EXE}_debug