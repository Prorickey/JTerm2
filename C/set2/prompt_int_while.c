//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdio.h>

int main() {
    // Variable to run loop
    short running = 1;

    // Used later to do arithmetic and output
    // the average
    float sum = 0;
    float ns = 0;

    do {
        // Allow decimal inputs because output
        // is decimal aswell... why not
        float num;

        printf("Input a number: ");
        fscanf(stdin, "%f", &num);

        // If 0, end program and output average
        if (num == 0) {
            running = 0;
            printf("Average: %f", sum/ns);
        } else {
            // Increment and add values
            ns++;
            sum += num;
        }

    } while (running == 1);

    return 0;
}