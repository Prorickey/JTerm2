//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdio.h>

int main() {
    // Define variable name with length 255
    char name[255];

    // Scan stdin and store in name
    fscanf(stdin, "%s", name);

    // Print string with name
    printf("Hello %s", name);
    return 0;
}