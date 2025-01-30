//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdio.h>

int main() {

    char sentence[1024];

    fgets(sentence, sizeof(sentence), stdin);

    for (int i = 0; i < 1024; i++) {
        if (sentence[i] == ' ') {
            sentence[i] = '\n';
        }
    }

    printf("%s", sentence);

    return 0;
}