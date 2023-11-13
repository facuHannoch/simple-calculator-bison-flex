%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror(const char *s);
%}

%union { double real; }

%token SUMA RESTA MULTIPLICACION DIVISION
%token<real> NUMBER
%token EOL
%type<real> exp

%%

input: 
    | linea input

linea: exp EOL { printf("%d\n", $1); }
    | EOL;

exp: NUMBER { $$ = $1 ; }
    | exp SUMA exp { $$ = $1 + $3; }
    | exp RESTA exp { $$ = $1 - $3; }
    | exp MULTIPLICACION exp { $$ = $1 * $3; }
    | exp DIVISION exp { if ($3 != 0) $$ = $1 / $3; else { printf("division por 0");} }

%%

int main(void) {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("\n%s", s);
}