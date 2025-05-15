#include <asm_utils.h>
#include <idt.h>

extern void _irq_00_handler();

idt_descriptor_t *idt = (idt_descriptor_t *)0x0;

void (*irq_handlers[256])();

void set_interrupt_handler(int idx, void (*handler)()) {
  irq_handlers[idx] = handler;
}

static void setup_idt_entry(int idx, void *handler) {
  uint64_t offset = (uint64_t)handler;

  idt[idx].offset_l = offset & 0xffff;
  idt[idx].selector = 0x08;
  idt[idx].ist = 0x0;
  idt[idx].access = 0x8e;
  idt[idx].offset_m = (offset >> 16) & 0xffff;
  idt[idx].offset_h = (offset >> 32) & 0xffffffff;
  idt[idx].zero = 0x0;
}

void setup_idt() {
  _cli();

  // Timer tick
  setup_idt_entry(ID_TIMER_TICK, &_irq_00_handler);

  pic_master_mask(0xfe);
  pic_slave_mask(0xff);

  _sti();
}

void irq_dispatch(uint64_t irq) { irq_handlers[irq](); }
