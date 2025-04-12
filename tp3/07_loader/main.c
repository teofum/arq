#include <stdio.h>

int main(int argc, const char **argv) {
  printf("Hello, world! I am a C program loaded from ASM.\n");

  printf("I have %d args, and they are: \n", argc);

  for (int i = 0; i < argc; i++)
    printf("%s\n", argv[i]);

  return 0;
}
