%{

#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#include <string.h>
%}

%option caseless

%%

t|true  { 

yylval.numero = 1; 
return NUM;

}
 
f|false {

yylval.numero = 0;
return NUM;

}

and { return AND; }

or { return OR; }

not { return NOT;}

xor { return XOR; }

[\n] { return  yytext[0]; }

[v][0-9] {
	yylval.numero = atoi(yytext+1);
 	return VAR;
}

exit {    return EXIT; }

print {  return PRINT; }

[()] {	return yytext[0]; }

[=]  {  return yytext[0]; }

[ \t] ; 

if { return IF; }

else { return ELSE; }

then { return THEN; }

[a-z0-9]+ { 
	strcpy(yylval.string, yytext); 
	return CAD; 
}

%%

int yywrap(){
      exit(1);
}

