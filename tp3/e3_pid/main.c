#include <stdio.h>

extern unsigned int getpid();

int main(int argc, const char **argv) {
  unsigned int pid = getpid();
  printf("My PID is %u\n", pid);

  return 0;
}
