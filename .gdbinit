set architecture i8086
target remote localhost:26000
b *0x7c00
layout asm
layout reg
