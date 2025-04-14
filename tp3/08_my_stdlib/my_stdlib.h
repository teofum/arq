#ifndef __MY_STDLIB_H
#define __MY_STDLIB_H

extern void sys_exit(int code);
extern int sys_write(unsigned int fd, const char *buf, unsigned int len);
extern int sys_read(unsigned int fd, char *buf, unsigned int len);
extern int sys_open(const char *filename, int flags, int mode);
extern int sys_close(unsigned int fd);

#endif
