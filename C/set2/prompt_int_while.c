//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdio.h>

int main() {

    short running = 1;

    float sum = 0;
    float ns = 0;

    do {
        float num;

        printf("Input a number: ");
        fscanf(stdin, "%f", &num);

        if (num == 0) {
            running = 0;
            printf("Average: %f", sum/ns);
        } else {
            ns++;
            sum += num;
        }

    } while (running == 1);

    return 0;
}