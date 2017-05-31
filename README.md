# AP5

Para comecar, tem que fazer isso...  
LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LIBRARY_PATH  
export LIBRARY_PATH  
sudo apt-get install g++-multilib libc6-dev-i386  

#Assembly chamando C  

nasm -f elf -o aprendizado.o aprendizado.asm   
gcc -m32 -o exe aprendizado.o imprimir.c   
./exe  

Insira o numero que sera convertido para float  
16  
O valor eh: 16.000000  

Se so for usar printf  
nasm -f elf printf1.asm  
gcc -m32 -o printf1 printf1.o  
./printf1  


