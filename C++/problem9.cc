//
// Created by jon on 6/8/18.
//

#include <math.h>
#include <iostream>

long pythagoreanTriplet(long a, long b, long c) {
    if (pow(a, 2) + pow(b, 2) == pow(c, 2) && (a + b + c == 1000)) {
        return a * b * c;
    } else if (c == 0) {
        return -1;
    } else if (b == 0) {
        return pythagoreanTriplet(c - 3, c - 2, c - 1);
    } else if (a == 0) {
        return pythagoreanTriplet(b - 2, b - 1, c);
    } else {
        return pythagoreanTriplet(a - 1, b, c);
    }
}

long problem9() {
    return pythagoreanTriplet(498, 499, 500);
}

int main() {
    std::cout << problem9() << std::endl;
}

