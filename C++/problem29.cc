#include <stdio.h>
#include <math.h>
#include <chrono>
#include <unordered_set>

int main() {
    // benchmark the algorithm
    auto started = std::chrono::high_resolution_clock::now();
    std::unordered_set<double> nums;
    nums.reserve(10000);

    for (int i = 2; i <= 100; i++) {
        for (int j = 2; j <= 100; j++) {
            nums.insert(pow(i, j));
        }
    }
    auto finished = std::chrono::high_resolution_clock::now();
    int millis = std::chrono::duration_cast<std::chrono::milliseconds>(finished - started).count();
    printf("Answer: %i\n", (int) nums.size());
    printf("Time taken: %ims\n", millis);
    return 0;
}
