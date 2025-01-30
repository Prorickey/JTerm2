//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdio.h>

int main() {
  int num;

  printf("Input a number: ");
  fscanf(stdin, "%d", &num);

  printf("Address: %p\n", &num);
  printf("Num: %d\n", num);

  printf("Your number x 50: %d", num*50);
  return 0;
}