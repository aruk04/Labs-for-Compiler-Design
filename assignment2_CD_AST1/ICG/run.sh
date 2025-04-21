for cmd 
bison -d parser.y
flex lexer.l
gcc -g parser.tab.c lex.yy.c quad_generation.c -o a.exe
a.exe < test_input1.c
a.exe < test_input2.c