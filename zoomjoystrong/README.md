# Zoomjoystrong

To compile the language, run the following:

    flex zjs.l
    bison -d zjs.y
    gcc -o zjs zoomjoystrong.c lex.yy.c zjs.tab.c -lSDL2 -lm

There are two test files includes to use, `test.zjs` and `gv.zjs`. Once compiled, use the following command to process a script:

    ./zjs < gv.zjs

**Note** When running there is a bus error once the program ends. After talking with the professor, we were unable to figure out the cause. The program still runs, it apparantly just doesn't clean up correctly.

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
