#include <stdio.h>

int sum(int a, int b)
{
    return (a + b);
}

int main(int ac, char **av)
{
    printf("%d\n", sum(2, 3));
    return (0);
}