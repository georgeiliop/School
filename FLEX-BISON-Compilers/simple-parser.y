
%{


#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
int line=1;
int errflag=0;
extern int lex_warn;
int par_warn=0;
void yyerror (const char *msg);


%}
//tokens pou anagnwrizontai apo to lex analuth

%token DELIMITERS SEMI INTCONST FLOAT VARIABLE TYPE COMMENT MULCOM OPERATOR BACKSLASH COMP
STRING UNKNOWN COMA  EQUAL LBRACKET RBRACKET LBRACK RBRACK NEWLINE LB RB TOKEN_ERROR
IF THEN WHILE DO FOR ZERO
LT EQ GREQ LREQ GT
LEN SCAN CMP PRINT 

//proteraiothta praxewn

%left POWER
%left PLUS MINUS
%left MUL DIV 

%start program

%%

program:
        |program expr { line++;}
        //panic method gia anagnwrish opoioudhpote suntaktikou lathous
        |program error  {printf("\tERROR ! \n");line++; yyerrok; yyclearin; par_warn++; } 
        | program expr TOKEN_ERROR NEWLINE {
 printf("\t TOKEN_ERROR !\n"); }
        
        ;

//basikes ekfraseis
expr:	decl 
		|array
		|built SEMI
		|calculation SEMI { printf("\n RESULT =%d",$$);}	
		|comparison   { printf("\n Comparison =%d",$$);}
		|loop
		|COMMENT 
		|MULCOM 
		|expr BACKSLASH expr
		
component: INTCONST {$$=$1;}
	       |VARIABLE {$$=$1;}
	       |FLOAT	{$$=$1;}

component2: INTCONST
	        |VARIABLE
	        |STRING

//periexomeno pinaka
ar:    INTCONST
	   |VARIABLE
	   |FLOAT
	   |STRING
	   |ar COMA ar

//dhlwsh pinakwn
array:  VARIABLE EQUAL LBRACKET ar RBRACKET SEMI {printf("\n Array Accepted\n");}	
		|LBRACKET ar RBRACKET PLUS LBRACKET ar RBRACKET SEMI {printf("\n Array Connection \n");}			

//anatheseis kai dhlwseis metablhtwn
decl: TYPE VARIABLE SEMI {printf("\n Declaration Accepted");}
	|VARIABLE EQUAL component SEMI {printf("\n Assignment Accepted");}
	|error TYPE EQUAL TYPE SEMI {yyerrok;}
	|TYPE VARIABLE EQUAL component SEMI {printf("\n Assignment Accepted");}

//built in sunarthseis
built 	:     LEN LBRACK component2 RBRACK  {printf("\n[BISON] strcmp function recognised"); }
   			| CMP LBRACK component2 COMA component2 RBRACK  {printf("\n[BISON] strcmp function recognised"); }
   			| SCAN LBRACK component2 RBRACK  {printf("\n[BISON] scan function recognised"); }
			| PRINT LBRACK component2 RBRACK  {printf("\n[BISON] print function recognised"); }
			| PRINT LBRACK built RBRACK  {printf("\n[BISON] print function recognised"); }

//basikes mathimatikes praxeis
calculation : component PLUS component  		{$$= $1 + $3;	 }
			   |component MINUS component  		{$$= $1 - $3;	 }
			   |component MUL component     	{$$= $1 * $3;	 }
	//panic method gia diairesh me to mhden
			   |error component DIV ZERO 		{yyerrok;}
			   |component DIV component     	{$$ = $1 / $3; }
			   |component POWER component   	{$$= pow($1,$3); }

//sugkriseis
comparison :  component LT component  			{ $$= $1 < $3;   }		
			 | component EQ component   		{ $$= $1 == $3;  }	
	//panic method gia sugkrish me ena ison
			 | error component EQUAL component  { yyerrok;}	
			 | component GREQ component 		{ $$= $1 >= $3;  }		
			 | component LREQ component 		{ $$= $1 <= $3;  }		
			 | component GT component	 		{ $$= $1 > $3;   }	

//anagnwrish basikwn broxwn epanalipsis
loop :  IF LBRACK comparison RBRACK THEN LB program RB  {printf("\n If statement found");}
		|WHILE LBRACK comparison RBRACK  LB program RB {printf("\n while statement found");}
		|FOR LBRACK component EQUAL component SEMI comparison SEMI component OPERATOR SEMI RBRACK LB program RB {printf("\n for statement found");}



%%




FILE *yyin;



int main(int argc,char **argv)
{
	//anoigma input file gia read
	if(argc == 2)
		yyin=fopen(argv[1],"r");
	else
		yyin=stdin;

	int parse = yyparse();

//elegxos parsing kai metrhth lathwn gia ektupwsh katallhlou mynhmatos
	if (errflag==0 && parse==0)
		{
		 printf("\nINPUT FILE: PARSING SUCCEEDED.\n", parse);
			if (par_warn > 0) printf(" (with %d warning(s))\n", par_warn);
 				printf("\n");
 		}
	else
		printf("\nINPUT FILE: PARSING FAILED.\n", parse);

	return 0;
}