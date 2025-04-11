#include <stdio.h>

extern int seven();

int main(int argc, const char **argv) {
  printf("This is the number seven: %d\n", seven());

  return 0;
}
