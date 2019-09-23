#include "mpi.h"
#include <iostream>
#include <random>
#include <stdint.h>

using namespace std;

int main(int argc, char **argv)
{
    int myid, numprocs;
    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &myid);

    mt19937 generator(42 + myid);
    uniform_real_distribution<double> dis(0.0, 1.0);
    double x; double y;

    int64_t local_hits = 0LL;
    int64_t global_hits = 0LL;
    int64_t iters = 1000000000LL; // 1 billion

    for (int64_t i = 0LL; i<iters; i++) {
        x = dis(generator);
        y = dis(generator);
        if (x*x + y*y < 1.0) local_hits ++;
    }

    MPI_Reduce(&local_hits, &global_hits, 1, MPI_LONG, MPI_SUM, 0, MPI_COMM_WORLD);
    if(0 == myid) {
        cout.precision(17);
        cout << "Global attempts: " << iters * numprocs << endl;
        cout << "Global hits: " << global_hits << endl;
        double pi = 4.0 * (double) global_hits / (double) (iters * numprocs);
        cout << "Calculated pi: " << pi << endl;
        cout << "Ratio calc/actual: " << pi / 3.14159265358979323846 << endl;
    }
    return 0;
}
