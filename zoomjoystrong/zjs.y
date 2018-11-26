%{
  #include <stdio.h>
  #include "zoomjoystrong.h"

  void yyerror(const char* msg);
  int yylex();
  int yylineno;
  int yywrap;
  int yline = 1;
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
 {
   yline++;
}
;

command: line_command
       | point_command
       | circle_command
       | rectangle_command
       | set_color_command
;

line_command:  LINE num num num num
                { 
                  if($2 > WIDTH || $3 > HEIGHT || $4 > WIDTH || $5 > HEIGHT)
                  {
                    yyerror("line coordinates must be within the window size");
                    exit(1);
                  }
                  line($2, $3, $4, $5);
                }
;

point_command:  POINT num num
                {
                  if($2 > WIDTH || $3 > HEIGHT)
                  {
                    yyerror("point coordinates must be within the window size");
                    exit(1);
                  }

                  point($2, $3); 
                }
;

circle_command:  CIRCLE num num num
                { 
                  if($2 + $4 > WIDTH || $3 + $4 > HEIGHT)
                  {
                    yyerror("circle position and radius must be within the window size");
                    exit(1);
                  }
                  circle($2, $3, $4);
                }
;

rectangle_command:  RECTANGLE num num num num
                { 
                  if($2 > WIDTH || $3 > HEIGHT)
                  {
                    yyerror("rectangle position must be within the window size");
                    exit(1);
                  }

                  if($2 + $4 > WIDTH)
                  {
                    yyerror("rectangle width is beyond the bounds of the page");
                    exit(1);
                  }

                  if($3 + $5 > HEIGHT)
                  {
                    yyerror("rectangle height is beyond the bounds of the page");
                    exit(1);
                  }

                  rectangle($2, $3, $4, $5);
                }
;

set_color_command:  SET_COLOR num num num
                {
                  if($2 > 255 || $3 > 255 || $4 > 255)
                  {
                    yyerror("set_color values must be between 0 and 255");
                    exit(1);
                  }

                  set_color($2, $3, $4);
                }
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
	fprintf(stderr, "ERROR! %s on line %d!\n", msg, yline);
}