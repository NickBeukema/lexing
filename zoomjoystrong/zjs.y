%{
  #include <stdio.h>
  #include "zoomjoystrong.h"

  void yyerror(const char* msg);
  int yylex();
  int yylineno;
  int yywrap;
%}

%union { int i; float f; }

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token <i> INT
%token <f> FLOAT

%type <i> num


%%
program:  statement_list END
;

statement_list: statement
              | statement_list statement
;

statement:  command END_STATEMENT
;

command: line_command
       | point_command
       | circle_command
       | rectangle_command
       | set_color_command
;

line_command:  LINE num num num num
               { line($2, $3, $4, $5); }
;

point_command:  POINT num num
               { point($2, $3); }
;

circle_command:  CIRCLE num num num
               { circle($2, $3, $4); }
;

rectangle_command:  RECTANGLE num num num num
               { rectangle($2, $3, $4, $5); }
;

set_color_command:  SET_COLOR num num num
               { set_color($2, $3, $4); }
;


num:  INT
;

%%

int main(int argc, char** argv){
  setup();
	yyparse();
  finish();
	return 0;
}

void yyerror(const char* msg){
	fprintf(stderr, "ERROR! %s on line %d!\n", msg, yylineno);
}