#include "my_stdlib.h"
#include <stdio.h>

#define BUF_SIZE 1024

int main(int argc, const char **argv) {
  if (argc != 2) {
    puts("Expected one argument\n");
    return -1;
  }

  const char *filename = argv[1];
  int fd = sys_open(filename, 0, 0);
  if (fd == -1) {
    puts("Error opening file\n");
    return -2;
  }

  char buf[BUF_SIZE];
  int eof = 0;
  int line = 1;
  printf("%03d\t", line);
  while (!eof) {
    // If we read fewer bytes than the max amount, we reached EOF
    int read_bytes = sys_read(fd, buf, BUF_SIZE);
    eof = read_bytes < BUF_SIZE;

    // Print out the buffer, inserting line numbers as needed
    int i = 0;
    while (i < read_bytes) {
      char c = buf[i++];
      putchar(c);
      if (c == '\n' && i < read_bytes)
        printf("%03d\t", ++line);
    }
  }
  putchar('\n');

  return 0;
}
