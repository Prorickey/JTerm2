//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdio.h>

int main() {
    char name[255];

    fscanf(stdin, "%s", name);

    printf("Hello %s", name);
    return 0;
}