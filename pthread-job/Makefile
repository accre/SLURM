CC=gcc
CFLAGS=-Wall -lpthread
SRC=mt_hello.c
EXE=hello

release : ${SRC}
	$(CC) -o ${EXE} $< ${CFLAGS}

debug : ${SRC}
	$(CC) -o ${EXE}_debug $< ${CFLAGS} -g

.PHONY: clean

clean:
	rm -f ${EXE} ${EXE}_debug