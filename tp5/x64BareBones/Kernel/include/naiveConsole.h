#ifndef NAIVE_CONSOLE_H
#define NAIVE_CONSOLE_H

#include <stdint.h>

typedef enum {
  C_BLACK = 0x0,
  C_BLUE,
  C_GREEN,
  C_CYAN,
  C_RED,
  C_MAGENTA,
  C_YELLOW,
  C_WHITE,
  C_BRIGHT = 0x8
} color_t;

#define FG(x) (x)
#define BG(x) ((x) << 4)
#define BRIGHT(x) ((x) | C_BRIGHT)

void ncPrint(const char *string);
void ncPrintChar(char character);
void ncPrintColor(const char *str, uint8_t color);
void ncPrintCharColor(char c, uint8_t color);
void ncNewline();
void ncPrintDec(uint64_t value);
void ncPrintHex(uint64_t value);
void ncPrintBin(uint64_t value);
void ncPrintBase(uint64_t value, uint32_t base);
void ncClear();

#endif