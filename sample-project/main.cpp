#include <iostream>
#include <cstdlib>

/**
 * @brief Function to duplicate (multiply) an integer by 2
 * @param num The integer to duplicate
 * @return The input integer multiplied by 2
 */
int duplicate(int num) {
    return num * 2;
}

int main(int argc, char** argv) {

    // Ensure a number is entered as command-line argument
    if(argc < 2) {
        std::cout << "Please provide a number as a command line argument.\n";
        return 1;
    }

    // Parsing the first command-line argument to an integer
    int num = std::atoi(argv[1]);

    // Just print the result
    std::cout << duplicate(num) << std::endl;
    return 0;
}