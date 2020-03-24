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

Body:       tOA {incrementDepth()}  Contenus tCA {decrementDepth()}
            ;

Contenus:   Contenu Contenus
            |Contenu
            ;

Contenu:     Aff 
            |Print
            |Const
            |Declaration;


Declaration:Type tVAR Vars tSEMCOL 
            {
             push($1,$2,0);
             printf("Declaration variable : %s \n",$3);
             }
            ;

Const:      tCONST Type tVAR VarsConst tSEMCOL 
            {push($1,$2,1); 
            printf("Declaration constant : %s \n",$3);
            }
            ;

Vars:       tSEP tVAR Vars 
            {push($1,$2,0); 
            printf("Declaration variable ++ : %s \n",$3);}
            |Vide
            ;

VarsConst:   tSEP tVAR VarsConst 
            {push($1,$2,1); 
            printf("Declaration constant ++ : %s \n",$3);} 
            |Vide
            ;

Print:      tPRINTF tOB tVAR tCB tSEMCOL 
            {printf("printf %s \n", $3);}
            ;


Aff:        tVAR tEQUAL E tSEMCOL 
            {if(isExist($1)){
                if(!isConstant($1)){
                   // XXXXXXXXXXXX Mise a jour la valeur de symbol (AFC?)XXXXXXXXXXXXXXXXXXX
                }
            }
            }
            ;

E:          tREAL   {$$=$1;}
            |tNUMBER  {$$=$1;}
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
