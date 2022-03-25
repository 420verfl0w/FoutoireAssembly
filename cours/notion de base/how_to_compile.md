## compile from ld

```bash
nasm -f elf64 hello_world.s && ld hello_world.o -o hello
```

## compile from gcc

```bash
nasm -f elf64 hello_world.s && gcc hello_world.o -nostartfiles --entry=_start -o hello
```