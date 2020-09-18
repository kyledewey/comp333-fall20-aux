#include <stdio.h>

// int* p = NULL;
//
// ... // some extra code
// *p 
// ...
//
// if (p == NULL) {
//   accessDenied();
// } else {
//   accessPermitted();
// }

int add(int x, int y) {
  return x + y;
}

int main() {
  int arr[3];
  int* pointer = NULL;
  int result = add((int)pointer, (int)pointer);

  printf("%i\n", result);

  arr[0] = 5;
  arr[1] = 7;
  arr[2] = 3;

  printf("%i\n", arr[700052]);
  return 0;
}
