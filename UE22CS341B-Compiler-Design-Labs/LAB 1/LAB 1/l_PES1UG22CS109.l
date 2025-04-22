%{
    //#define YYSTYPE char*
    #include "y.tab.h"
    #include <stdio.h>
    extern void yyerror(const char*); // declare the error handling function
    
%}
%option yylineno
%option noyywrap

digit	[0-9]
letter	[a-zA-Z]
id	({letter}|_)({letter}|{digit}|_)*
num	{digit}+

%%

[\f\r\t ] ; // ignore whitespaces
\n		{++yylineno;}
do		{return T_DO;}
"int" 		{return T_INT;}
"char"		{return T_CHAR;}
"double"	{return T_DOUBLE;}
"float"	{return T_FLOAT;}
"main" 	{return T_MAIN;}
while		{return T_WHILE;}
if		{return T_IF;}
else		{return T_ELSE;}
","		{return *yytext;}
"("		{return *yytext;}
")"		{return *yytext;}
"{"         	{return *yytext;}
"}"         	{return *yytext;}
";"         	{return *yytext;}
"="         	{return *yytext;}
>		{return *yytext;}
"<"		{return *yytext;}
"=="		{return T_EQ;}
!=		{return T_NEQ;}
>=		{return T_GE;}
"<="		{return T_LE;}
{num}		{return T_NUM;}
{id}        	{return T_ID;}
.		{yyerror("Unrecognized token");}
%%







