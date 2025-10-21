#include <iostream>
#include <random>
#include <stdint.h>

using namespace std;

int main(int argc, char **argv)
{
    mt19937 generator(42);
    uniform_real_distribution<double> dis(0.0, 1.0);
    double x; double y;

    int64_t local_hits = 0LL;
    int64_t iters = 1000000000LL; // 1 billion

    for (int64_t i = 0LL; i<iters; i++) {
        x = dis(generator);
        y = dis(generator);
        if (x*x + y*y < 1.0) local_hits ++;
    }

    cout.precision(17);
    cout << "Local attempts: " << iters << endl;
    cout << "Local hits: " << local_hits << endl;
    double pi = 4.0 * (double) local_hits / (double) iters;
    cout << "Calculated pi: " << pi << endl;
    cout << "Ratio calc/actual: " << pi / 3.14159265358979323846 << endl;

    return 0;
}
