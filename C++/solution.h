#ifndef EULER_SOLUTION_H_
#define EULER_SOLUTION_H_

#include <chrono>
#include <stdio.h>

double executeSolution();

int main() {
    auto started = std::chrono::high_resolution_clock::now();

    double answer = executeSolution();

    auto finished = std::chrono::high_resolution_clock::now();
    int millis = std::chrono::duration_cast<std::chrono::milliseconds>(finished - started).count();

    printf("Answer: %f\n", answer);
    printf("Time taken: %ims\n", millis);
}
#endif
