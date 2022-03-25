#include <stdio.h>
#include <string.h>

// BOF - Buffer Overflow
// NX disable
// ASLR disable
// PIE disable
// Canary : disable

// gcc -m32 -fno-stack-protector -o bof bof.c - 32 bits version
// gcc -m64 -fno-stack-protector -o bof bof.c - 64 bits version

void    win(void)
{
    puts("You are the winner !")
}

void    check_input(char *arg)
{
    char buf[64];
    strcpy(buf, arg);
}

int main(int ac, char **av)
{
    if (ac > 1)
        check_input(av[1]);
    return (0);
}