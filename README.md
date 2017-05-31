# AP5

Assembly chamando C

nasm -f elf arquivo.asm -o objetoasm.o

gcc -c arquivoc.c

gcc -o objetofinal arquivoc.o objetoasm.o


No caso de C chamando Assembly

nasm -f elf codigo.asm

gcc -o programa arquivo.c codigo.o