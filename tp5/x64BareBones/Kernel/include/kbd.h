#ifndef KBD_H
#define KBD_H

#include <stdint.h>

extern void kbd_irq_handler();

uint8_t kbd_getkey();
void kbd_pollevents();
int kbd_keydown(uint8_t key);
int kbd_keypressed(uint8_t key);
int kbd_keyreleased(uint8_t key);

#endif
