#ifndef __flex_h_
#define __flex_h_

#include <stdio.h>

// TODO complete the TOKEN enum
typedef enum {
    EOF_TOKEN,
    IF_TOKEN,
    FLOAT_TOKEN,
    IDENT_TOKEN,
    INT_TOKEN,
    WHILE_TOKEN,
    RPAREN_TOKEN,
    LPAREN_TOKEN,
    PRINT_TOKEN,
    REPEAT_TOKEN,
    SEMICOLON_TOKEN,
    ADDOP_TOKEN,
    MULTOP_TOKEN,
    ASSIGN_TOKEN
    //etc
} TOKEN;

int yylex(void);
void yyerror(char *s);

#endif
