#include <naiveConsole.h>

static uint32_t uintToBase(uint64_t value, char *buffer, uint32_t base);

static char buffer[64] = {'0'};
static uint8_t *const video = (uint8_t *)0xB8000;
static uint8_t *currentVideo = (uint8_t *)0xB8000;
static const uint32_t width = 80;
static const uint32_t height = 25;

void ncPrint(const char *string) { ncPrintColor(string, FG(C_WHITE)); }

void ncPrintChar(char character) { ncPrintCharColor(character, FG(C_WHITE)); }

void ncPrintColor(const char *str, uint8_t color) {
  for (int i = 0; str[i] != 0; i++)
    ncPrintCharColor(str[i], color);
}

void ncPrintCharColor(char c, uint8_t color) {
  currentVideo[0] = c;
  currentVideo[1] = color;
  currentVideo += 2;
}

void ncNewline() {
  do {
    ncPrintChar(' ');
  } while ((uint64_t)(currentVideo - video) % (width * 2) != 0);
}

void ncPrintDec(uint64_t value) { ncPrintBase(value, 10); }

void ncPrintHex(uint64_t value) { ncPrintBase(value, 16); }

void ncPrintBin(uint64_t value) { ncPrintBase(value, 2); }

void ncPrintBase(uint64_t value, uint32_t base) {
  uintToBase(value, buffer, base);
  ncPrint(buffer);
}

void ncClear() {
  int i;

  for (i = 0; i < height * width; i++)
    ((uint16_t *)video)[i] = 0;
  currentVideo = video;
}

static uint32_t uintToBase(uint64_t value, char *buffer, uint32_t base) {
  char *p = buffer;
  char *p1, *p2;
  uint32_t digits = 0;

  // Calculate characters for each digit
  do {
    uint32_t remainder = value % base;
    *p++ = (remainder < 10) ? remainder + '0' : remainder + 'A' - 10;
    digits++;
  } while (value /= base);

  // Terminate string in buffer.
  *p = 0;

  // Reverse string in buffer.
  p1 = buffer;
  p2 = p - 1;
  while (p1 < p2) {
    char tmp = *p1;
    *p1 = *p2;
    *p2 = tmp;
    p1++;
    p2--;
  }

  return digits;
}
