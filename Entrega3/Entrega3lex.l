%%


" CARLOS MARTIN SANZ "


"1. Elimina comentario de una unica linea"

\/\/(.*) ;

"2. Sustituye los numeros enteros por INT y los punto flotante por FLOAT"

[0-9]+   fprintf(yyout, "%s", "INT");
[0-9]+[.][0-9]+ fprintf(yyout, "%s", "FLOAT");
[0-9]+[Ee][0-9]+ fprintf(yyout, "%s", "FLOAT");

"3. Cambia if y else por IF ELSE"

if[ ]    fprintf(yyout, "%s", "IF ");
else[ ]  fprintf(yyout, "%s", "ELSE ");

"4. Sustituir por la palabra ID, seguida del identificador y su longitud"

[a-zA-Z][a-zA-Z0-9]* fprintf(yyout, " ID (%s, %d) ",yytext,yyleng);

"5.Elimina comentario multilinea"

\/\*.*\*\/

;
 
%%

// Recibe como primer parametro el archivo de prueba y redirecciona la salida a un archivo .c
// salidaCambiada 
 
int main(int k,char **argcv)
{
        yyin=fopen(argcv[1],"r");
        yyout=fopen("salidaCambiada.c","w");
        yylex();
        return 0;
}

