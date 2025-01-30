//
// Created by Trevor Bedson on 1/29/25.
//

#include <stdlib.h>
#include <stdio.h>

int main() {
    int count = 0;
    int capacity = 1;
    // Allocate memory for array. I wanted to start with a capacity of
    // 1 or 2 so that doubling the size later could be done quicker
    int* array = malloc(capacity * sizeof(int));

    // Check for failure
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
            // If at capacity, double size of array
            if (count == capacity) {
                capacity *= 2;
                int* temp = realloc(array, capacity * sizeof(int));

                if (temp == NULL) {
                    printf("Error: Memory reallocation failed.\n");
                    free(array);
                    return 1;
                }

                // I do this so that if realloc fails, I don't lose the array before.
                // Documentation suggests that if realloc fails, it returns NULL, BUT does
                // not free previous array, leaving opportunity for leaking memory
                array = temp;
                temp = NULL;
            }

            // Add number to array and increment count
            array[count] = num;
            count++;
        }

    } while (running == 1);

    // Make sure to free array at end!
    free(array);
    return 0;
}
