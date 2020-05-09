%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
%}

%union{
    char *str;
    int number;
    float reel;
}

%token<number>  tNUMBER 
%token<reel> tREAL
%token<str> tVAR
%token  tADD tSUB tDIV tMUL tEQUAL
%token  tOB tCB tOA tCA
%token  tINT tCHAR tVOID tERROR
%token  tSEMCOL tSEP
%token  tMain tRET tWHILE tIF tELSE tCONST tPRINTF
%token  tCMP tINF tSUP tINFEQUAL tSUPEQUAL


%left tSEP 
%right tEQUAL tADD tSUB tMUL tDIV 
%left tCMP 
%left tINF tSUP tINFEQUAL tSUPEQUAL



%start S 
%%

S:          FunctionMain {printf("Function main\n");}
            ;
FunctionMain:tMain {printf("tMain ");} tOB{printf("tOB ");} tCB {printf("tCB ");} Body 
            |
            ;

Vide:       ;

Arg:        Type tVAR Args
            |Vide
            ;
            
Args:       tSEP Arg 
            |Vide
            ;

Type:       tINT {printf("int ");}
            |tCHAR {printf("char ");}
            ;

Body:       tOA {printf("tOA ");} Contenus tCA{printf("tCA ");} 
            ;

Contenus:   Contenu Contenus
            |Contenu
            ;

Contenu:     Aff 
            |Print
            |Declaration;

Declaration:Type tVAR Vars tSEMCOL {printf("Declaration \n");}
            ;

Vars:       tSEP tVAR Vars 
            |Vide
            ;

Print:      tPRINTF tOB tVAR tCB tSEMCOL {printf("tPrintf \n ");}
            ;

Aff:        tVAR tEQUAL E tSEMCOL {printf("Affectation \n");}
            ;

E:          tREAL {printf("tREAL ");}
            |tNUMBER  {printf("tNUMBER ");}
            |tVAR  {printf("tVAR ");}
            |tOB E tCB
            |Exp
            ;

Exp:        E tADD E {printf(" + ");}
            |E tSUB E  {printf(" - ");}
            |E tMUL E {printf(" x ");}
            |E tDIV E {printf(" / ");}
            ;           

%%
void yyerror(char *s){
printf("%s\n",s);

}
int main(void){
    yyparse();
}
