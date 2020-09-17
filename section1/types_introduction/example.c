#include <stdio.h>

int* danglingPointer() {
  int pointer = 27;
  return &pointer;
}

int add(int x, int y) {
  return x + y;
}

int main() {
  int array[3];
  int* pointer = NULL;
  int result = add((int)pointer, (int)pointer);
  printf("%i\n", result);

  pointer = danglingPointer();
  *pointer = 32;
  printf("%i\n", *pointer);

  array[0] = 0;
  array[1] = 2;
  array[2] = 90;

  printf("%i\n", array[70002]);
}
