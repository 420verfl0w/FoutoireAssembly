#include <stdio.h>
#include <string.h>

// BOF - Buffer Overflow
// NX disable
// ASLR disable
// PIE disable
// STACK executable
// Canary : disable
// Objective execute shellcode and cat the flag

// gcc -m32 -fno-stack-protector -z execstack -o bof bof.c - 32 bits version
// gcc -m64 -fno-stack-protector -z execstack -o bof bof.c - 64 bits version

void    check_input(char *arg)
{
    char buf[64];
    strcpy(buf, arg);
    printf("%s\n", buf);
}

int main(int ac, char **av)
{
    if (ac > 1)
        check_input(av[1]);
    return (0);
}