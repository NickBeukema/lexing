# Zoomjoystrong

To compile the lexer, run the following:

    flex zjs.lex; clang lex.yy.c -lfl; ./a.out

## Available Tokens

* `END` - This statement exits the interpreter.
* `END_STATEMENT` - All commands should end with a semicolon.
* `POINT` - When we match the command to plot a point.
* `LINE` - When we match the command to draw a line.
* `CIRCLE` - When we match the command to draw a circle.
* `RECTANGLE` - When we match the command to draw a rectangle.
* `SET_COLOR` - Matches the command to change colors.
* `INT` - Matches an integer value.
* `FLOAT` - Matches a floating-point value.

## Other Matching

* A way to match tabs, spaces, or newlines, and to ignore them.
* A way to match anything not listed above, and to tell the user they messed up, and on which line.
