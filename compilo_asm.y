%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    #include "symbol_table.h"
    //#include "assembleur.h"

    int yylex(void);
    int yydebug = 1;

    void yyerror (char const *s) {
      extern int yylineno;
      fprintf (stderr, "ERROR (%d): %s\n", yylineno, s);
  }

    int globalDepth =0 ;
%}

%union{
    char* str;
    int number;
    float reel;
}

%token<number>  tNUMBER 
%token<reel> tREAL
%token<str> tVAR
%token  tDIV tMUL tADD tSUB  tEQUAL
%token  tOB tCB tOA tCA
%token  tINT tCHAR tVOID tERROR tFLOAT
%token  tSEMCOL tSEP
%token  tMain tRET tWHILE tIF tELSE tCONST tPRINTF
%token  tCMP tINF tSUP tINFEQUAL tSUPEQUAL

%left tSEP 
%right tEQUAL tADD tSUB tMUL tDIV 
%left tCMP 
%left tINF tSUP tINFEQUAL tSUPEQUAL



%start S 
%%

S:          FunctionMain
            ;
FunctionMain:tINT tMain  tOB tCB  Body 
            |
            ;

Vide:       ;

Type:       tINT 
            |tCHAR 
            ;

Body:       tOA {globalDepth++;}  Contenus tCA {globalDepth--;}
            ;

Contenus:   Contenu Contenus
            |Contenu
            ;

Contenu:     Aff 
            |Print
            |Declaration;


Declaration:Type tVAR 
            {
             pushSymbol($2,0,globalDepth);
             printf("Declaration 1\n");
             printSymbolTable();
            } AffectationDuringDeclaration MultipleDeclaration tSEMCOL
            | tCONST tINT tVAR 
            {
             pushSymbol($3,1,globalDepth);
             printf("Declaration 1 const\n");
             printSymbolTable();
            }AffectationDuringDeclaration MultipleDeclaration tSEMCOL
            ;

MultipleDeclaration: tSEP tVAR{
                    if(isConstant(getLastSymbol().name,getLastSymbol().depth)==1){
                        pushSymbol($2,1,globalDepth);
                        printf("Multiple declaration const\n");
                        printSymbolTable();
                    }
                    else{
                        pushSymbol($2,0,globalDepth);
                        printf("Multiple declaration\n");
                        printSymbolTable();
                    } }AffectationDuringDeclaration MultipleDeclaration
                    | Vide
                    ;

AffectationDuringDeclaration: tEQUAL E{ printf("affection a faire en ASM\n"); }
                              |Vide;

Print:      tPRINTF tOB tVAR {printf("printf %s\n", $3); } tCB tSEMCOL 
            
            ;


Aff:        tVAR 
            {printSymbolTable();
            printf("traitement d'affectation de %s\n", $1);
            if(findSymbol($1,globalDepth)!=-1){
                if(isConstant($1,globalDepth)==0){
                   printf("affection a faire en ASM\n");
                }
                else{
                    yyerror("Temptation to modify a constant ");
                }
            }else{
                yyerror("Variable is never declared");
            }
            }tEQUAL E tSEMCOL 
            ;

E:          tREAL       {
                        pushTmp();
                        printf("meet a float\n");
                        printTmpTable();}
            |tNUMBER    {
                        pushTmp();
                        printf("meet a int\n");
                        printTmpTable();}
            |tVAR       {int index=findSymbol($1,globalDepth);
                        if(index){
                            if(!isInitialised($1,globalDepth)){
                                yyerror("non initialised variable");
                            }
                        printf("affection a faire en ASM\n"); };

                        }
            |E tADD E 
            |E tSUB E 
            |E tMUL E 
            |E tDIV E 
            ;      

%%
int main(void){
    yyparse();
    return 0;
}
