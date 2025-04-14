#include <stdio.h>

typedef struct {
  int foo;         // 4 bytes
  int bar;         // 4 bytes (offset 4)
  char string[20]; // 20 bytes (offset 8)
  // total 28 bytes, c will add 4 bytes padding for alignment
} some_struct;

extern int get_foo(some_struct the_struct);
extern int get_bar(some_struct the_struct);
extern int get_bar_ptr(some_struct *struct_ptr);

extern some_struct return_a_struct(int a, int b);

int main(int argc, const char **argv) {
  some_struct the_struct = return_a_struct(25, 15);
  // some_struct the_struct = {40, 10, "hello world"};

  printf("foo = %d\n", the_struct.foo);
  printf("bar = %d\n", the_struct.bar);
  printf("string = %s\n", the_struct.string);

  printf("get_foo = %d\n", get_foo(the_struct));
  printf("get_bar = %d\n", get_bar(the_struct));
  printf("get_bar_ptr = %d\n", get_bar_ptr(&the_struct));

  return 0;
}
