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
"main"      {return (tMain);}
"int"       {return (tINT);}
"const"     {return (tCONST);}
"char"      {return (tCHAR);}
"float"     {return (tFLOAT);}
"void"      {return (tVOID);}
"printf"    {return(tPRINTF);}
"if"        {return (tIF);}
"else"      {return (tELSE);}
"return"    {return (tRET);}
{SPACE}       {}
{TAB}       {}
{NEWLINE}   {}
{NUMBER}    {yylval.number=atoi(yytext);
             return (tNUMBER);}
{REAL}      {yylval.reel=atof(yytext);
             return (tREAL);} 
{ALPHANUM}  {yylval.str=yytext;
             return (tVAR);}

"+"         {return (tADD);}
"-"         {return (tSUB);}
"*"         {return (tMUL);}
"/"         {return (tDIV);}
"="         {return (tEQUAL);}
"("         {return (tOB);}
")"         {return (tCB);}
"=="        {return (tCMP);}
","         {return (tSEP);}
";"         {return (tSEMCOL);}
"<"         {return (tINF);}
">"         {return (tSUP);}
"<="        {return (tINFEQUAL);}
">="        {return (tSUPEQUAL);}
"{"         {return (tOA);}
"}"         {return (tCA);}
.           {return (tERROR);}

%%
int yywrap(void){
    return 1;
}


