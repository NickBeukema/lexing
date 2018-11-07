%{
  #include "zjs.tab.h"
  #include <stdio.h>
  #include <stdlib.h>
%}


%%
END                     { return END; }
[;]                     { return END_STATEMENT; }
POINT|point             { return POINT; }
LINE|line               { return LINE; }
CIRCLE|circle           { return CIRCLE; }
RECTANGLE|rectangle     { return RECTANGLE; }
SET_COLOR|set_color     { return SET_COLOR; }
[0-9]+                  { yylval.i = atoi(yytext); return INT; }
[0-9]+\.[0-9]+          { yylval.f = atof(yytext); return FLOAT; }
" "|\n|\t               ; // Ignore these chars!
.                       { printf("*** ERROR '%s' on line %d\n", yytext, yylineno); }

%%

// %%
// END                     { printf("END\n"); }
// [;]                     { printf("END_STATEMENT\n"); }
// POINT|point             { printf("POINT\n"); }
// LINE|line               { printf("LINE\n"); }
// CIRCLE|circle           { printf("CIRCLE\n"); }
// RECTANGLE|rectangle     { printf("RECTANGLE\n"); }
// SET_COLOR|set_color     { printf("SET_COLOR\n"); }
// [0-9]+                  { printf("INT\n"); }
// [0-9]+\.[0-9]+          { printf("FLOAT\n"); }
// " "|\n|\t               ; // Ignore these chars!
// .                       { printf("*** ERROR '%s' on line %d\n", yytext, yylineno); }

// %%
// int main(int argc, char** argv){
//     yylex();    // Start lexing!
//     return 0;
// }
