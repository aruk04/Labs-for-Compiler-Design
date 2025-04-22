%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	void yyerror(const char*); // error handling function
	int yylex(); // declare the function performing lexical analysis
	extern int yylineno; // track the line number
	extern char* yytext;
	
%}
/* declare tokens */
%token T_INT T_CHAR T_DOUBLE T_ID T_FLOAT T_MAIN T_NUM T_DO T_WHILE T_EQ T_NEQ T_GE T_LE T_IF T_ELSE


%%
START : PROG { printf("Valid syntax\n"); }	
	;


	  
PROG :  |MAIN 				/* main function  */
	;

STMT: DECLR ';'STMT			/* declarations   */	
	| ASSGN ';' STMT
	| T_DO '{' STMT '}'T_WHILE '(' COND ')' STMT
	| T_IF '(' COND ')' '{' STMT '}' T_ELSE '{' STMT '}' STMT
        | T_IF '(' COND ')' '{' STMT '}' STMT
        |		
	;

	 
/* Grammar for main function */
MAIN : TYPE T_MAIN '(' ')' '{' STMT '}'
	;

/* Grammar for variable declaration */
DECLR : TYPE LISTVAR
	;	


LISTVAR : LISTVAR ',' T_ID 
	  | T_ID
	  ;
	
TYPE : T_INT
       | T_FLOAT
       | T_DOUBLE
       | T_CHAR
       ;
     
ASSGN : T_ID '=' T_NUM 
	;

COND: E R E
	;

R: '>' | '<' | T_NEQ | T_EQ |T_GE | T_LE
	;

E : E '+' T 	
	| E '-' T 	
	| T 	
	;
	
	
T : T '*' F 	
	| T '/' F 	
	| F 
	;

F : '(' E ')'
	| T_ID 
	| T_NUM 	
	;

       
%%


/* error handling function */
void yyerror(const char* s)
{
	printf("Error: %s,line number: %d,token: %s\n",s,yylineno,yytext);
	
}


int main(int argc, char* argv[])
{
	yyparse();
	return 0;

}
