%{
  #include <stdio.h>
  #include <stdlib.h>
%}

%%
END              { printf("END\n"); }
[;]              { printf("END_STATEMENT\n"); }
POINT            { printf("POINT\n"); }
LINE             { printf("LINE\n"); }
CIRCLE           { printf("CIRCLE\n"); }
RECTANGLE        { printf("RECTANGLE\n"); }
SET_COLOR        { printf("SET_COLOR\n"); }
[0-9]+           { printf("INT\n"); }
[0-9]+\.[0-9]+   { printf("FLOAT\n"); }
" "|\n|\t        ; // Ignore these chars!
.                { printf("*** ERROR '%s' on line %d\n", yytext, yylineno); }

%%

int main(int argc, char** argv){
    yylex();    // Start lexing!
    return 0;
}
