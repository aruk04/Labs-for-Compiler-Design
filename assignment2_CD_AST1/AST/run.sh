for cmd 
bison -d parser.y
flex lexer.l
gcc -o ast parser.tab.c lex.yy.c abstract_syntax_tree.c 
ast.exe < test_input1.c
ast.exe < test_input2.c
ast.exe < test_input3.c