//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdio.h>

int main() {
  char str[1024] = "";

  fgets(str, 1024, stdin);

  /* Another simple solution for a more "complex" problem.
   * Just loop from the end of the array and replace spaces
   * with newlines to achieve the goal.
   */
  for (int i = 1023; i >= 0; i--) {
    if (str[i] == '\0' || str[i] == '\n') {
      continue;
    }
    if (str[i] == ' ') {
      printf("%s", "\n");
    } else {
      printf("%c", str[i]);
    }
  }

  return 0;
}
