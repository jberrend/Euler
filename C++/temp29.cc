#include <math.h>
#include <unordered_set>
#include "solution.h"

double executeSolution() {
    std::unordered_set<double> nums;
    nums.reserve(10000);

    for(int i = 2; i <= 100; i++) {
        for (int j = 2; j <= 100; j++) {
            nums.insert(pow(i, j));
        }
    }
    return (double) nums.size();
}
