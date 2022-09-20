%{

#include<stdio.h>
#include "lex.yy.c"
#include <stdbool.h>
#define boleanoPrint(b) ((b) ? "true" : "false")
int vectorVariables[10];

%}

// Definimos los tokens

%token EXIT PRINT AND OR NOT XOR IF ELSE THEN

// Definimos union que puede ser un numero int o una cadena

%union
{
       int numero;
       char string[100];
}

// Definimos los tokens con su tipo 

%token <numero> VAR
%token <numero> NUM
%token <string> CAD

// Y el tipo de las reglas

%type <numero> W
%type <numero> S
%type <numero> E
%type <string> cadena

// Definimos operadores a la izq y la derecha, los primeros tienen mayor precedencia

%left AND OR XOR
%right NOT
%right '='


%%

// Hacemos el bucle que pide constantemente expresiones por consola

inicio  : inicio W '\n'
	|
	;

// W puede ser una asignacion, expresion o printear una cadena

W:      
 	VAR '=' S { vectorVariables[$1] = $3 ; $$=$3;}
	|   S { $$=$1; }
	| PRINT cadena { printf("%s\n", $2); } 
	;

// Expresion

S: 
        PRINT S { printf("%s\n", boleanoPrint((int)$2));}
   	|
	EXIT    {exit(1); YYACCEPT;}   // Salimos del programa usando la directiva YYACCEPT
	|
	E 	{$$ = $1;}
	|
	IF E THEN S {if($2==1){$$=$4;}else{$$=0;}} // Implementacion del condicional simple
	|
	IF E THEN E ELSE E {if($2==1){$$=$4;}else{$$=$6;}} // Implemntacion del condicional doble
	;

// Cadena

cadena: 
   	CAD { strcpy($$,$1);}
	|
	IF E THEN cadena {{if($2==1){ strcpy($$,$4);}else{ strcpy($$,"\"\"");}}} // Implementacion cond simple con cadena
	|
	IF E THEN cadena ELSE cadena {if($2==1){ strcpy($$,$4);}else{strcpy($$,$6);}} // Implementacion cond doble con cadena
	;

// Definicion de las operaciones AND, OR, XOR, NOT

E:
 
	E AND E  { $$=$1&$3;}  | // Vale uno si los dos son 1
 
	E OR E     { $$=$1|$3;}  |   // Si alguno de los dos es un 1 

	NOT E     {$$=!$2;}     |   // Cambia true a false y viceversa

	E XOR E    {$$=($1&(!$3))| ((!$1)&$3);} | // Si los dos son iguales vale 0, en caso contrario 1

	'('E')'    {$$=$2;} |

	NUM  {$$=$1;} |

	VAR {$$=vectorVariables[$1];} // Leemos el valor de la variable del vector

;
 
%%

int main(){
	int i = 0;

	// Relleno el vector de variables, inicializandolas todas a 0, valor False

	for(i=0; i<10; i++){
		vectorVariables[i] = 0;
	}
        yyparse();
}

int yyerror(char *msg){
	printf("Ha ocurrido un error...\n");
	exit(0);
}

