%{
/* Seccion de definicion */
%}

/* Seccion de reglas */

%%

.|\n {return yytext[0];}

%%

int yywrap()
{
return 1;
}
 
