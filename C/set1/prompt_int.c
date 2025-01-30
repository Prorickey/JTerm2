//
// Created by Trevor Bedson on 1/29/25.
//
#include <stdio.h>

int main() {
  // Create variable num
  int num;

  // Get input num from user
  printf("Input a number: ");
  fscanf(stdin, "%d", &num);

  // *not part of the problem but I wrote this to explain
  // to my friend how pointers worked in C and what they
  // were lol
  printf("Address: %p\n", &num);
  printf("Num: %d\n", num);

  // Do arithmetic on the number and print it
  printf("Your number x 50: %d", num*50);
  return 0;
}