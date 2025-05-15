#ifndef IDT_H
#define IDT_H

#include <stdint.h>

#define ID_TIMER_TICK 0x20

typedef struct {
  uint16_t offset_l;
  uint16_t selector;
  uint8_t ist;
  uint8_t access;
  uint16_t offset_m;
  uint32_t offset_h;
  uint32_t zero;
} idt_descriptor_t;

extern void pic_master_mask(uint8_t mask);
extern void pic_slave_mask(uint8_t mask);

void set_interrupt_handler(int idx, void (*handler)());
void setup_idt();

#endif
