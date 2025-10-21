#include <stdio.h>
#include <omp.h>
#define CHUNKSIZE 100
#define N     3000

int main() 
{

   int i, chunk;
   float a[N], b[N], c[N];

   /* Some initializations */
   for (i=0; i < N; i++)
      a[i] = b[i] = i * 1.0;
   chunk = CHUNKSIZE;

   #pragma omp parallel shared(a,b,c,chunk) private(i)
   {

      int tid = omp_get_thread_num();

      #pragma omp for schedule(dynamic,chunk) nowait
      for (i=0; i < N; i++)
      {
         c[i] = a[i] + b[i];
         printf("thread id: %d, i: %d c[i]: %f\n",tid,i,c[i]);
      }

   }  /* end of parallel section */

   return 0;

}