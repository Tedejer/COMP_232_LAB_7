# COMP 232 LAB 7 Parse and Evaluate
### Student: Ternel Edejer
### worked with Jericho Perdon

## Description:
This lab introduces the tool flex in order to build a lexer that uses regular expression to identify token strings.
Given a certain grammar, this program is tasked to output each token of the program with it's appropriate name and value.

## Grammar:
```
<program> ::= <statement> | <statement> <program>
<statement> ::= <assignStmt> | <ifStmt> | <whileStmt> | <repeatStmt> | <printStmt>

<assignStmt> ::= <id> = <expr> ;
<ifStmt> ::= if ( <expr> ) <statement>
<whileStmt> ::= while ( <expr> ) <statement>
<repeatStmt> ::= repeat ( <expr> ) <statement>
<printStmt> ::= print <expr> ;

<expr> ::= <term> | <term> <addop> <expr>
<term> ::= <factor> | <factor> <multop> <term>
<factor> ::= <id> | <number> | <addop> <factor> | ( <expr> )

<number> ::= <int> | <float>
<int> ::= <digit> | <int> <digit>
<float> ::= <digit>. | <digit> <float> | <float> <digit>

<id> ::= <letter> | <id> <letter> | <id> <digit>

<addop> ::= + | -
<multop> ::= * | / | %

<digit> ::= 0 | 1 | 2 | ... | 9
<letter> ::= a | b | ... | z | A | B | ... | Z | _
```

## Sample Runs:

input program:
```
while (0.4) abc_1_2 = agd + 1;
if (condition) print (hello) ;
```
output:
```
{<while> "while"}
{<rparen> "("}
{<float> "0.4"}
{<lparen> ")"}
{<ident> "abc_1_2"}
{<assign> "="}
{<ident> "agd"}
{<addop> "+"}
{<int> "1"}
{<semicolon> ";"}
{<if> "if"}
{<rparen> "("}
{<ident> "condition"}
{<lparen> ")"}
{<print> "print"}
{<rparen> "("}
{<ident> "hello"}
{<lparen> ")"}
{<semicolon> ";"}
{<eof> ""}
Process finished with exit code 0
```
input program:
```
var_1 = 100;
var_2 = 200;
print var_1 + var_2;
```
output:
```
{<ident> "var_1"}
{<assign> "="}
{<int> "100"}
{<semicolon> ";"}
{<ident> "var_2"}
{<assign> "="}
{<int> "200"}
{<semicolon> ";"}
{<print> "print"}
{<ident> "var_1"}
{<addop> "+"}
{<ident> "var_2"}
{<semicolon> ";"}
{<eof> ""}
Process finished with exit code 0
```
input program:
```
var1 = 1;
var2 = 3;
while var2;
print var1;
```
output:
```
{<ident> "var1"}
{<assign> "="}
{<int> "1"}
{<semicolon> ";"}
{<ident> "var2"}
{<assign> "="}
{<int> "3"}
{<semicolon> ";"}
{<while> "while"}
{<ident> "var2"}
{<semicolon> ";"}
{<print> "print"}
{<ident> "var1"}
{<semicolon> ";"}
{<eof> ""}
Process finished with exit code 0
```
