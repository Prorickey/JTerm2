//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdio.h>
#include <string.h>

void main() {

    bool active = true;

    printf("You've opened the nerd terminal\n");

    do {
        int cmdSize = 200;
        char cmd[200] = "";

        printf("> ");
        if (fgets(cmd, cmdSize, stdin) != NULL) {
            cmd[strcspn(cmd, "\n")] = 0; // Remove newline character
        } else {
            if (feof(stdin)) {
                clearerr(stdin);
                active = false;
                printf("\nGoodbye!");
                continue;
            }

            // Prevent the user from exploiting this thing or sum
            printf("Malformed command input. Make sure your input is not longer than 200 characters");
            continue;
        }

        if (strcmp(cmd, "exit") == 0) {
            active = false;
            printf("\nGoodbye!");
            continue;
        }

        for (int i = 0; i < cmdSize; i++) {
            if (cmd[i] == '|') {
                cmd[i] = '\n';

                // Remove that little space if it is present
                // Almost like javascript's .trim()
                if (cmd[i+1] == ' ') {
                    for (int j = i+1; j < cmdSize; j++) {
                        cmd[j] = cmd[j+1];
                    }
                }
            }
        }

        printf("%s\n", cmd);

    } while (active);
}
