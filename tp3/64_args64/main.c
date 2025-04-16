#include <stdio.h>
#include <string.h>

#define STDOUT 1

extern int sys_write(unsigned int fd, const char *buf, size_t len);

int my_puts(const char *str) { return sys_write(STDOUT, str, strlen(str)); }

int main(int argc, const char **argv) {
  my_puts("Hello, world!\n");

  return 0;
}
