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


int main(void)
{
    int auth = 0;
    char input[64];

    setbuf(stdout, NULL);
    gets(input);

    if (auth)
        printf("Yess you have buffer overflow !");
    else
        printf("Try again !\n");
    return (0);
}