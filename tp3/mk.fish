#!/opt/homebrew/bin/fish

argparse -i 'c/make-c' 'C/main-c' 's/make-asm' 'S/main-asm' 'a/arch=' -- $argv

set -l arch "32"
if set -ql _flag_a
    set arch $_flag_a[1]
end

set -l num $argv[1]
set -l name $argv[2]
set -l dir_name (string join _ $num $name)

set -l libs $argv[3..]

mkdir $dir_name

set -l exec_deps "$dir_name/main.o"

# Create ASM source file
if set -ql _flag_S
echo "section .text
global main

main:

    mov eax, 0      ; exit with code 0, success
    ret

section .data" >> $dir_name/main.s
else if set -ql _flag_s
echo "section .text

section .data" >> $dir_name/$name.s
set exec_deps (string join " " $exec_deps "$dir_name/$name.o")
end

# Create C source file
if set -ql _flag_C
echo "#include <stdio.h>

int main(int argc, const char** argv) {
    printf(\"Hello, world!\\n\");
    
    return 0;
}" >> $dir_name/main.c
else if set -ql _flag_c
echo "" >> $dir_name/$name.c
set exec_deps (string join " " $exec_deps "$dir_name/$name.o")
end

# Update makefile
# Main executable target
echo "
$name: $exec_deps $libs
	gcc -g -m$arch $exec_deps $libs -o $name" >> Makefile

# Main obj target
if set -ql _flag_S
echo "
$dir_name/main.o: $dir_name/main.s
	nasm -g -F dwarf -f elf$arch $dir_name/main.s -o $dir_name/main.o" >> Makefile
else if set -ql _flag_C
echo "
$dir_name/main.o: $dir_name/main.c
	gcc -c -g -F dwarf -m$arch $dir_name/main.c -o $dir_name/main.o" >> Makefile
end

# Auxiliary source target
if set -ql _flag_s
echo "
$dir_name/$name.o: $dir_name/$name.s
	nasm -g -F dwarf -f elf$arch $dir_name/$name.s -o $dir_name/$name.o" >> Makefile
else if set -ql _flag_c
echo "
$dir_name/$name.o: $dir_name/$name.c
	gcc -c -g -F dwarf -m$arch $dir_name/$name.c -o $dir_name/$name.o" >> Makefile
end
