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
%token  tINT tFLOAT tCHAR tVOID tERROR
%token  tSEMCOL tSEP
%token  tMain tRET tWHILE tIF tELSE tCONST tPRINTF
%token  tCMP tINF tSUP tINFEQUAL tSUPEQUAL


%right  tEQUAL
%left   tADD tSUB
%left   tMUL tDIV


%start S 
%%

S:          FunctionMain {printf("Function main");}
            ;
FunctionMain: tINT {printf("prout\n");} tMain tOB tCB Body {printf("int main()");}
            |
            ;
Vide:       ;
Arg:        Type tVAR Args
            |Vide
            ;
Args:       tSEP Arg 
            |Vide
            ;
Type:       tINT {printf("int");}
            |tFLOAT {printf("float");}
            |tCHAR {printf("char");}
            ;
Body:       tOA Contenu tRET tINT tCA ;

Contenu:     Aff
            |Print
            |Declaration;
Declaration:Type tVAR Vars tSEMCOL;
Vars:       tSEP tVAR Vars 
            |Vide
            ;
Print:      tPRINTF tOB tVAR tCB tSEMCOL
            ;
Aff:        tVAR tEQUAL E tSEMCOL
            ;
E:          tREAL {printf("%f",$1);}
            |tNUMBER {printf("%d",$1);}
            |tVAR {printf("%s",$1);}
            |tOB E tCB
            |Exp
            ;
Exp:        E tADD E 
            |E tSUB E 
            |E tMUL E 
            |E tDIV E 
            ;           

%%
void yyerror(char *s){
printf("%s\n",s);

}
int main(void){
    yyparse();
}
