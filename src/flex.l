/* NOTE: % must be in the first column (no indentation) */
/* TODO add more regular expressions and returns for the other TOKEN types */


%option noyywrap
%option nounput
%option noinput

%{
   #include "flex.h"
%}

letter          [a-z|A-Z|_]
digit           [0-9]

float           {digit}+\.{digit}*
id              {letter}+({letter}{digit})*
int             {digit}+{digit}*
addop           [+-]
multop          [*/%]

%%

if          {return IF_TOKEN;}
{float}     {return FLOAT_TOKEN;}
"while"       {return WHILE_TOKEN;}
"print"     {return PRINT_TOKEN;}
"repeat"    {return REPEAT_TOKEN;}
{int}       {return INT_TOKEN;}
{id}        {return IDENT_TOKEN;}
\)          {return RPAREN_TOKEN;}
\(          {return LPAREN_TOKEN;}
=           {return ASSIGN_TOKEN;}
{addop}     {return ADDOP_TOKEN;}
{multop}    {return MULTOP_TOKEN;}
;           {return SEMICOLON_TOKEN;}

<<EOF>>     {return EOF_TOKEN;}
[ \n\r\t]   ; //skip whitespace
.           {printf("ERROR: invalid character: >>%s<<\n", yytext);}

%%

