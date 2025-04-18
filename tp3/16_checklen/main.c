#include <stdio.h>

extern int checklen(const char *str, int expected);

int main(int argc, const char **argv) {
  char string[20] = "Hello, world!";

  string[14] = 13;
  printf("%d\n", checklen(string, 13)); // 0
  printf("%d\n", checklen(string, 15)); // -2

  string[14] = 10;
  printf("%d\n", checklen(string, 13)); // -3

  string[14] = 16;
  printf("%d\n", checklen(string, 13)); // 3

  return 0;
}
