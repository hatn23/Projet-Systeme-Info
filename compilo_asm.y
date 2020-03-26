%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    #include <symbol_table.h>
%}

%union{
    char *str;
    int number;
    float reel;
}

int globalDepth =0 ;
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

S:          FunctionMain
            ;
FunctionMain:tMain  tOB tCB  Body 
            |
            ;

Vide:       ;

Arg:        Type tVAR Args
            |Vide
            ;
            
Args:       tSEP Arg 
            |Vide
            ;

Type:       tINT { $$ = T_Type = Integer; }
            |tCHAR { $$ =T_Type  = Character; }
            ;

Body:       tOA {globalDepth++}  Contenus tCA {globalDepth--;}
            ;

Contenus:   Contenu Contenus
            |Contenu
            ;

Contenu:     Aff 
            |Print
            |Const
            |Declaration;


Declaration:Type tVAR 
            {
             pushSymbol($1,$2,0,globalDepth);
            } AffectationDuringDeclaration MultipleDeclaration
            | tCONST tINT tVAR 
            {
                pushSymbol($1,$2,1,globalDepth);
            }AffectationDuringDeclaration MultipleDeclaration
            ;

MultipleDeclaration: tSEP tVAR{
                    if(isConstant(getLastSymbol())==1){
                        pushSymbol($1,$2,1,globalDepth);
                    }
                    else{
                        pushSymbol($1,$2,0,globalDepth);
                    } }AffectationDuringDeclaration MultipleDeclaration
                    | tSEMCOL
                    ;

AffectationDuringDeclaration: tEQUAL E{ exec_affectation(getLastSymbol()); };

Print:      tPRINTF tOB tVAR tCB tSEMCOL 
            {printf("printf %s \n", $3);}
            ;


Aff:        tVAR tEQUAL E tSEMCOL 
            {if(findSymbol($1)){
                if(!isConstant($1)){
                   exec_affectation($1);
                }
                else{
                    yyerror("Temptation to modify a constant ");
                }
            }else{
                yyerror("Variable is never declared");
            }
            }
            ;

E:          tREAL       {$$=$1;
                        pushTmp

                        }
            |tNUMBER    {$$=$1;}
            |tVAR       
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
