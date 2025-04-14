#include <stdio.h>
#include <stdlib.h>

extern int fib_asm(int);

int fib_c(int n) {
  if (n <= 1)
    return n;

  return fib_c(n - 1) + fib_c(n - 2);
}

int main(int argc, const char **argv) {
  int n = atoi(argv[1]);

  printf("%d\n", fib_c(n));
  printf("%d\n", fib_asm(n));

  return 0;
}
