#include "idt.h"
#include <kbd.h>
#include <lib.h>
#include <moduleLoader.h>
#include <naiveConsole.h>
#include <rtc.h>
#include <stdint.h>
#include <string.h>

extern uint8_t text;
extern uint8_t rodata;
extern uint8_t data;
extern uint8_t bss;
extern uint8_t endOfKernelBinary;
extern uint8_t endOfKernel;

static const uint64_t PageSize = 0x1000;

static void *const sampleCodeModuleAddress = (void *)0x400000;
static void *const sampleDataModuleAddress = (void *)0x500000;

typedef int (*EntryPoint)();

void clearBSS(void *bssAddress, uint64_t bssSize) {
  memset(bssAddress, 0, bssSize);
}

void *getStackBase() {
  return (void *)((uint64_t)&endOfKernel +
                  PageSize * 8       // The size of the stack itself, 32KiB
                  - sizeof(uint64_t) // Begin at the top of the stack
  );
}

void *initializeKernelBinary() {
  char buffer[10];

  ncPrint("[x64BareBones]");
  ncNewline();

  ncPrint("CPU Vendor:");
  ncPrint(cpuVendor(buffer));
  ncNewline();

  ncPrint("[Loading modules]");
  ncNewline();
  void *moduleAddresses[] = {sampleCodeModuleAddress, sampleDataModuleAddress};

  loadModules(&endOfKernelBinary, moduleAddresses);
  ncPrint("[Done]");
  ncNewline();
  ncNewline();

  ncPrint("[Initializing kernel's binary]");
  ncNewline();

  clearBSS(&bss, &endOfKernel - &bss);

  ncPrint("  text: 0x");
  ncPrintHex((uint64_t)&text);
  ncNewline();
  ncPrint("  rodata: 0x");
  ncPrintHex((uint64_t)&rodata);
  ncNewline();
  ncPrint("  data: 0x");
  ncPrintHex((uint64_t)&data);
  ncNewline();
  ncPrint("  bss: 0x");
  ncPrintHex((uint64_t)&bss);
  ncNewline();

  ncPrint("[Done]");
  ncNewline();
  ncNewline();
  return getStackBase();
}

void printDateTime() {
  static const char *daysOfWeek[8] = {"NULL",    "Sunday",    "Monday",
                                      "Tuesday", "Wednesday", "Thursday",
                                      "Friday",  "Saturday"};
  static const char *months[13] = {
      "NULL", "January", "February",  "March",   "April",    "May",     "June",
      "July", "August",  "September", "October", "November", "December"};

  datetime_t datetime = rtc_getdatetime();
  ncPrint(daysOfWeek[datetime.date.dow]);
  ncPrint(", ");
  ncPrint(months[datetime.date.month]);
  ncPrint(" ");
  ncPrintHex(datetime.date.day);
  ncPrint(", ");
  ncPrintHex(datetime.date.year);
  ncPrint("; ");
  ncPrintHex(datetime.time.hours);
  ncPrint(":");
  ncPrintHex(datetime.time.minutes);
  ncPrint(":");
  ncPrintHex(datetime.time.seconds);
}

void timerTickHandler() {
  static int ticks = 0;

  ticks++;
  if (ticks >= 1) {
    ncNewline();
    ncPrint("Tick!");
    ncNewline();
    printDateTime();
    ncNewline();
    ticks -= 91;
  }
}

void exampleSyscall(int n) {
  ncNewline();
  ncPrint("example syscall called with parameter ");
  ncPrintDec(n);
  ncNewline();
}

extern void sys_example(int n);

int main() {
  // Set up IDT and interrupt handlers
  set_interrupt_handler(0, timerTickHandler);
  set_interrupt_handler(1, kbd_irq_handler);

  register_syscall(0, exampleSyscall);
  setup_idt();

  ncClear();

  ncPrintColor("Arquitectura de Computadoras",
               FG(C_GREEN) | BG(BRIGHT(C_WHITE)));
  ncNewline();
  ncNewline();

  ncPrint("The current date and time is:");
  ncNewline();
  printDateTime();

  int i = 1;

  while (1) {
    ncPrint(" ");
    ncPrintHex(kbd_getkey());

    sys_example(i++);
  }
}
