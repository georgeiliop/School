

%option noyywrap
%x error



%{

#include <stdio.h>
#include <string.h>
#include <stdlib.h>


#include "simple-parser.tab.h"

extern int flag;
extern int line;
int lex_warn=0;



void yyerror (const char *msg);

void prn(char *s);

%}


DELIMITERS  [ \t\r]+
INTCONST    0[xX]?[0-9A-Fa-f]{2,8}|-?[0-9]+
FLOAT       -?[0-9]+\.?[0-9]+([eE][-+]?[0-9]+)?
VARIABLE   [_A-Za-z][_A-Za-z0-9]*
TYPE        int|long|float|short
COMP        "<"|">"|"<="|">="|"=="
OPERATOR    "+"|"-"|"*"|"/"|"%"|"="|"+="|"-="|"*="|"/="|"!"|"&&"|"||"|"=="|"!="|"++"|"--"|"<"|">"|"<="|">="|"&"
COMMENT    \/\/[^\n\r]*[\n\r]
MULCOM      [/][*][^*]*[*]+([^*/][^*]*[*]+)*[/]  
STRING      \"(\\.|[^"\\])*\"
NEWLINE     "\n"
BACKSLASH   "\\"


%%

{DELIMITERS}    { }
"+"              {prn("PLUS"); return PLUS; }
"-"              {prn("MINUS"); return MINUS; }
"*"              {prn("MUL"); return MUL; }
"/"              {prn("DIV"); return DIV; }
"^"              {prn("POWER"); return POWER; }

"<"              {prn("LT"); return LT; }
"=="             {prn("EQ"); return EQ; }
">="             {prn("GREQ"); return GREQ; }
"<="             {prn("LREQ"); return LREQ; }
">"              {prn("GT"); return GT; }

";"             {prn("SEMI"); return SEMI;}
","             {prn("COMA"); return COMA;}
"="             {prn("EQUAL"); return EQUAL; }
"["             {prn("LBRACKET"); return LBRACKET;}
"]"             {prn("RBRACKET"); return RBRACKET;}
"("             {prn("LBRACK"); return LBRACK;}
")"             {prn("RBRACK"); return RBRACK;}
"{"             {prn("LB"); return LB;}
"}"             {prn("RB"); return RB;}


"len"           {prn("LEN"); return LEN; }
"scan"          {prn("SCAN"); return SCAN; }
"cmp"           {prn("CMP"); return CMP; }
"print"         {prn("PRINT"); return PRINT; }

"if"              {prn("IF"); return IF; }
"while"           {prn("WHILE"); return WHILE; }
"do"              {prn("DO"); return DO;}
"for"             {prn("FOR"); return FOR; }
"then"            {prn("THEN"); return THEN; }
"0"				{prn("ZERO"); return ZERO;}

{INTCONST}      {prn("INTCONST");yylval=atof(yytext); return INTCONST; }
{FLOAT}         {prn("FLOAT");yylval=atof(yytext); return FLOAT; }
{TYPE}          {prn("TYPE"); return TYPE; }
{COMP}          {prn("COMP"); return COMP;}
{OPERATOR}      {prn("OPERATOR"); return OPERATOR;}
{VARIABLE}      {prn("VARIABLE"); return VARIABLE; }
{STRING}        {prn("STRING"); return STRING; }
{NEWLINE}       { }
{BACKSLASH}     { }
{COMMENT}       { }
{MULCOM}        { }

. 				{ yyerror ("Unrecognized character(s) encountered!"); lex_warn++; BEGIN(error);
                  return TOKEN_ERROR;}
<error>[ \t]+   { BEGIN(0); printf("\t\t%d character(s) ignored so far\n", lex_warn); }
<error>.        { lex_warn++; }
<error>\n       { BEGIN(0); printf("\t\t%d character(s) ignored so far\n", lex_warn);
 return NEWLINE; }




%%

//sunarthsh epistrofhs mhnumatos gia errors
void yyerror (const char *msg)
{	
    fprintf(yyout, "\tLine %d at lexeme \'%s\' : %s\n",line, yytext, msg);
}

//sunarthsh epistrofhs mhnumatos anagnwrishs token
void prn(char *s)
{
	printf("\n\t%s: %s ", s, yytext);
	return;
}
