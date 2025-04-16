#include <stdio.h>

int factorial(int n) {
  int aux, fact;

  if (n == 0)
    return 1;

  aux = n;
  fact = factorial(n - 1);
  return fact * aux;
}

int main(int argc, const char **argv) {
  printf("%d\n", factorial(3));

  return 0;
}
