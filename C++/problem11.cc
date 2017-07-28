#include <vector>
#include <iostream>
#include <fstream>

// easier way to access an element of the grid (also templates)
template <typename T>
T gridElement(std::vector<std::vector<T>*> vec, int i, int j) {
    return vec.at(i)->at(j);
}

int main() {

    // define the grid that the numbers will be stored in
    std::vector<std::vector<int>*> grid(20);
    for (int i = 0; i < 20; i++) {
        grid[i] = new std::vector<int>(20);
    }

    // Load the numbers into the the grid
    std::ifstream file;
    file.open("problem11.txt", std::ifstream::in);
    for (int i = 0; i < 20; i++) {
        for (int j = 0; j < 20; j++) {
            file >> grid.at(i)->at(j);
        }
    }

    int largest_product = -1;
    int product = 0;

    for (int i = 0; i < 20; i++) {
        for (int j = 0; j < 20; j++) {
            // horizontal
            if (i <= 16) {
                product = gridElement(grid, i, j) * gridElement(grid, i + 1, j) * gridElement(grid, i + 2, j) * gridElement(grid, i + 3, j);
                largest_product = (largest_product < product) ? product : largest_product;
            }

            // vertical
            if (j <= 16) {
                product = gridElement(grid, i, j) * gridElement(grid, i, j + 1) * gridElement(grid, i, j + 2) * gridElement(grid, i, j + 3);
                largest_product = (largest_product < product) ? product : largest_product;
            }

            // Diagonal to the down right
            if (i <= 16 && j <= 16) {
                product = gridElement(grid, i, j) * gridElement(grid, i + 1, j + 1) * gridElement(grid, i + 2, j + 2) * gridElement(grid, i + 3, j + 3);
                largest_product = (largest_product < product) ? product : largest_product;
            }

            // Diagonal to the down left
            if (i >= 3 && j <= 16) {
                product = gridElement(grid, i, j) * gridElement(grid, i - 1, j + 1) * gridElement(grid, i - 2, j + 2) * gridElement(grid, i - 3, j + 3);
                largest_product = (largest_product < product) ? product : largest_product;
            }
        }
    }

    std::cout << "Answer: " << largest_product << std::endl;
    std::cout << gridElement(grid, 19, 19) << std::endl;

    // clear that heap memory
    for (int i = 0; i < 20; i++) {
        delete grid[i];
    }

    return 0;
}
