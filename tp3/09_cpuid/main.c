#include <stdio.h>

extern void get_cpuid(char *buf);

int main(int argc, const char **argv) {
  char buf[13] = {0};
  get_cpuid(buf);
  printf("CPU vendor is %s\n", buf);

  return 0;
}
