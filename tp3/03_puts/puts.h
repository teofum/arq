#ifndef __PUTS_H
#define __PUTS_H

#define STDOUT 1

extern int sys_write(unsigned int fd, void *buf, unsigned int len);

int puts(const char *str);

#endif
