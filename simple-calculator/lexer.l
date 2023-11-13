%option noyywrap
%{
    #include <stdio.h>
    #include "parser.tab.h"
%}

SIMBOLORESTA [-]


%%
-?\d+("."\d*)? {yylval.real = atof(yytext); return NUMBER;}

'+' {return SUMA;}
SIMBOLORESTA {return RESTA;}
[*] {return MULTIPLICACION;}
[/] {return DIVISION;}
\n {return EOL;}
. {}

%%