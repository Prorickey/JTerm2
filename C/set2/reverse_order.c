//
// Created by Trevor Bedson on 1/29/25.
//

#include <stdlib.h>
#include <stdio.h>

int main() {
    int count = 0;
    int capacity = 1;
    int* array = malloc(capacity * sizeof(int));

    if (array == NULL) {
        printf("Error: Memory allocation failed.\n");
        return 1;
    }

    int running = 1;

    do {
        int num = 0;

        printf("Input a number: ");
        fscanf(stdin, "%d", &num);

        if (num == 0) {
            running = 0;

            for (int i = count - 1; i >= 0; i--) {
                printf("%d ", array[i]);
            }
            printf("\n");
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

    } while (running == 1);

    free(array);
    return 0;
}
