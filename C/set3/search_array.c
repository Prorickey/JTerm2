//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

int main() {
    int count = 0;
    int capacity = 1;
    int* array = malloc(capacity * sizeof(int));

    if (array == NULL) {
        printf("Error: Memory allocation failed.\n");
        free(array);
        return 1;
    }

    int running = 0;

    do {
        int num = 0;

        printf("Input a number: ");
        int ret = fscanf(stdin, "%d", &num);

        if (ret == EOF) {
            running = 1;
            printf("\nBeginning Search...\n");
        } else {
            if (count == capacity) {
                capacity *= 2;
                int* temp = realloc(array, capacity * sizeof(int));

                if (temp == NULL) {
                    printf("Error: Memory reallocation failed.\n");
                    free(array);
                    return 1;
                }

                array = temp;
                temp = NULL;
            }

            array[count] = num;
            count++;
        }

    } while (running == 0);

    // Because the Control+D inputs an EOF, stdin is closed...
    // although this can be fixed by using this function below
    // to collect more input
    clearerr(stdin);

    int num = 0;

    fprintf(stdout, "Input a number: ");
    fscanf(stdin, "%d", &num);

    bool found = false;

    for (int i = count - 1; i >= 0; i--) {
        if (array[i] == num) {
            found = true;
        }
    }

    if (found) {
        printf("Found the number!\n");
    } else {
        printf("Did not find the number ;(\n");
    }

    free(array);

    return 0;
}
