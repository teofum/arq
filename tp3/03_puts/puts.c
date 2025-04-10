#include "puts.h"
#include <string.h>

int puts(const char *str) {
  return sys_write(STDOUT, (void *)str, strlen(str));
}
