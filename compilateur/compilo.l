%{
    #include <stdlib.h>
    #include "y.tab.h"
%}

SPACE       [" "]+
TAB         [\t]+
NEWLINE     [\n]+
DIGIT       [0-9]
NUMBER      {DIGIT}+
EXP         [eE][+-]?{NUMBER}
REAL        {NUMBER}("."{NUMBER})?{EXP}?
ALPHABET    [A-Za-z]
ALPHANUM    {ALPHABET}({ALPHABET}|{NUMBER}|"_")*?

%%
{SPACE}     {}
{TAB}       {}
{NEWLINE}   {}


"main"      {return (tMain);}
"{"         {return (tOA);}
"}"         {return (tCA);}
"("         {return (tOB);}
")"         {return (tCB);}
"int"       {return (tINT);}
"const"     {return (tCONST);}
"char"      {return (tCHAR);}
"float"     {return (tFLOAT);}
"void"      {return (tVOID);}
"+"         {return (tADD);}
"-"         {return (tSUB);}
"*"         {return (tMUL);}
"/"         {return (tDIV);}
"="         {return (tEQUAL);}
"if"        {return (tIF);}
"else"      {return (tELSE);}
"while"     {return (tWHILE);}
"return"    {return (tRET);}
"=="        {return (tCMP);}
","         {return (tSEP);}
";"         {return (tSEMCOL);}
"<"         {return (tINF);}
">"         {return (tSUP);}
"<="        {return (tINFEQUAL);}
">="        {return (tSUPEQUAL);}
"!="        {return (tNOTEQUAL);}
"printf"    {return(tPRINTF);}
{NUMBER}    {yylval.number=atoi(yytext);
             return (tNUMBER);}
{REAL}      {yylval.reel=atof(yytext);
             return (tREAL);} 
{ALPHANUM}  {yylval.str=yytext;
             return (tVAR);}


.           {return (tERROR);}

%%
int yywrap(void){
    return 1;
}


