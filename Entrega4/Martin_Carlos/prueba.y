%{

/* Seccion de definicion */

#include<stdio.h>
#include "lex.yy.c"

%}

/* Seccion de reglas  */

%%

I: S '\n' { printf("Cadena Correcta\n"); } // Caso cadena correcta
 ;

a: '/''*'			           // Definicion del componente lexico
					   // a apertura de comentario /*

b: '*''/'	                           // Definicion del componente lexico
                                           // b cierre de comentario */

// Definicion de la gramatica

S: a S b S { printf("S -> a S b S \n"); }

| { printf("S->epsilon \n"); }

;

%%

// Mensaje de error en caso de que la cadena sea invalida

int yyerror(char *msg)
{
	printf("Cadena Invalida\n");
	exit(0);
}

// Main 

int main()
{
	yyparse();
	exit(1);
}

