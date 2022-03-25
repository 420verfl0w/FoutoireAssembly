#include <stdio.h>
#include <stdlib.h>

// BOF - Buffer Overflow
// NX disable
// ASLR disable
// PIE disable
// STACK executable
// Canary : disable

// gcc -m32 -fno-stack-protector -o bof bof.c - 32 bits version
// gcc -m64 -fno-stack-protector -o bof bof.c - 64 bits version

void    check_input(char *arg)
{
    char buf[64];
    strcpy(buf, arg);
}

int main(int ac, char **av)
{
    char buf[0x100];
    char input[64];

    strcpy(buf, "flag{test123}");
    fgets(input, 80, stdin);
    if (ac > 1)
        printf(input)
    return (0);
}