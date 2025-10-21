/*
 *  * hello.c -- forks off four threads that print their ids
 *   */

#include <pthread.h>
#include <stdio.h>

void *printme(void *ip)
{
  int *i;

  i = (int *) ip;
  printf("Hi.  I'm thread %d\n", *i);
  return NULL;
}

int main()
{
  int i, vals[4];
  pthread_t tids[4];
  void *retval;

  for (i = 0; i < 4; i++) {
    vals[i] = i;
    pthread_create(tids+i, NULL, printme, vals+i);
  }

  for (i = 0; i < 4; i++) {
    printf("Trying to join with tid %d\n", i);
    pthread_join(tids[i], &retval);
    printf("Joined with tid %d\n", i);
  }

  return 0;

}