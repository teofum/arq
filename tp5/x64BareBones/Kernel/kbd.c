#include <kbd.h>
#include <string.h>

#define KBD_BUF_SIZE 16

#define scantokey(sc) ((sc) & 0x7f)
#define released(sc) (((sc) & 0x80) >> 7)

uint8_t key_buffer[KBD_BUF_SIZE] = {0};
int buf_first = 0;
int buf_last = 0;

uint8_t current_keys[128];
uint8_t last_keys[128];

void kbd_addKeyEvent(uint8_t scancode) {
  key_buffer[buf_last] = scancode;
  buf_last = (buf_last + 1) % KBD_BUF_SIZE;

  // If we ran into the start of the queue, get rid of the older events
  if (buf_last == buf_first)
    buf_first = (buf_first + 1) % KBD_BUF_SIZE;
}

/*
 *
 */
void kbd_pollevents() {
  memcpy(last_keys, current_keys, 128);

  while (buf_first != buf_last) {
    uint8_t scancode = key_buffer[buf_first];
    current_keys[scantokey(scancode)] = !released(scancode);

    buf_first = (buf_first + 1) % KBD_BUF_SIZE;
  }
}

int kbd_keydown(uint8_t key) { return current_keys[key]; }

int kbd_keypressed(uint8_t key) { return current_keys[key] && !last_keys[key]; }

int kbd_keyreleased(uint8_t key) {
  return !current_keys[key] && last_keys[key];
}

uint8_t kbd_getkey() {
  uint8_t key = 0;
  while (!key) {
    while (buf_first == buf_last)
      ;

    uint8_t scancode = key_buffer[buf_first];

    key = released(scancode) ? 0 : scantokey(scancode);
    buf_first = (buf_first + 1) % KBD_BUF_SIZE;
  }

  return key;
}
