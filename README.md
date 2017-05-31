# AP5

Assembly chamando C

nasm -f elf arquivo.asm -o objetoasm.<br />
gcc -c arquivoc.c<br />
gcc -o objetofinal arquivoc.o objetoasm.o<br />


No caso de C chamando Assembly

nasm -f elf codigo.asm<br />
gcc -o programa arquivo.c codigo.o<br />