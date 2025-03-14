#include <stdio.h>
#include <ctype.h>

int main(int argc, const char** argv) {
    if (argc != 2) {
        printf("Usage: mystrings <file>");
        return 0;
    }

    const char* filename = argv[1];
    FILE* f = fopen(filename, "rb");

    int c;
    char buf[4] = {0}; // 3 chars + null terminator
    int len = 0;

    while ((c = fgetc(f)) != EOF) {
        if (isprint(c)) {
            if (len < 3) {
                buf[len++] = c;
            } else {
                if (len == 3) printf("%s", buf);
                putchar(c);
                len++;
            }
        } else {
            if (len > 3) putchar('\n');
            len = 0;
        }
    }

    return 0;
}
