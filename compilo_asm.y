%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    #include "symbol_table.h"
    #include "assembleur.h"

    int ind = 0;
    int tmp = 0;

    int yylex(void);
    int yydebug = 1;

    void yyerror (char const *s) {
      extern int yylineno;
      fprintf (stderr, "ERROR (%d): %s\n", yylineno, s);
  }
    void exec_condition(char * condition){
        int first = get_last()-1;
        int second=get_last();
        int newAddr;
        if(strcmp(condition,"==")==0) {
            add_instruction("EQU",first ,first,second); 
        }
        else if(strcmp(condition,"!=")==0){
            newAddr= pushTmp();
            add_instruction("INF",newAddr ,first,second); 
            add_instruction("SUP",first ,first,second); 
            add_instruction("ADD",first ,first,newAddr); 
        }
        else if(strcmp(condition,">=")==0){
            newAddr= pushTmp();
            add_instruction("EQU",newAddr ,first,second); 
            add_instruction("SUP",first ,first,second); 
            add_instruction("ADD",first ,first,newAddr); 
        }
        else if(strcmp(condition,"<=")==0){
            newAddr= pushTmp();
            add_instruction("INF",newAddr ,first,second); 
            add_instruction("EQU",first ,first,second); 
            add_instruction("ADD",first ,first,newAddr); 
        }
        else if(strcmp(condition,">")==0){
            add_instruction("SUP",first ,first,second); 
        }
        else if(strcmp(condition,"<")==0){
            add_instruction("INF",first ,first,second); 
        }
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
%token  tMain tRET tCONST tPRINTF
%token<number> tIF tWHILE tELSE
%token  tCMP tINF tSUP tINFEQUAL tSUPEQUAL tNOTEQUAL

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
            |Declaration
            |IfStatement
            |While
            ;

IfStatement:tIF{printf("if starts here \n");} tOB Condition{
                int line = get_index_tab();
                printf("current=%d\n", line);
                add_instruction("JMPF",line,-1,-1);
                $1=line;
                }
             tCB tOA {globalDepth++;} Contenus{
                int current = get_index_tab();
                patch($1,current+2); 
                printf("patch=%d +2\n", current);
                add_instruction("JMP",current ,-1,-1);
                $1= current++;
            }
             tCA {globalDepth--;} Else {printf("if end here\n");} 
            ;

Else:       tELSE{printf("else here\n");} tOA {globalDepth++;}  Contenus  {
                int current = get_index_tab();
                patch($1,current+1);
                printf("patch=%d +1\n", current);
            } 
            tCA {globalDepth--;}
            |tELSE Contenu {
                int current = get_index_tab();
                printf("patch=%d +1\n", current);
                patch($1,current+1);
            } 
            |Vide
            ;

While:      tWHILE tOB Condition tCB tOA {
                globalDepth++; 
                int line = get_index_tab();
                $1= line;
            }
            Contenus{
                add_instruction("JMP",$1,-1,-1);
            } tCA {globalDepth--;}
            |tWHILE  tOB Condition tCB Contenu {printf("only 1 instruction in the loop\n");}
            ;

Condition:  tVAR tCMP E {exec_condition("==");}
            |tVAR tINF E {exec_condition("<");}
            |tVAR tSUP E {exec_condition(">");}
            |tVAR tINFEQUAL E {exec_condition("<=");}
            |tVAR tSUPEQUAL E {exec_condition(">=");}
            |tVAR tNOTEQUAL E {exec_condition("!=");}
            |E 
            ;

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


Aff:        tVAR {printSymbolTable();
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
            }tEQUAL E tSEMCOL {
                add_instruction("AFC", findSymbol($1,globalDepth),popTmp(), -1);
            }
            ;

E:          tREAL       {
                        //pushTmp();
                        printf("meet a float\n");
                       // printTmpTable();
                        printf("tmp = %d\n", tmp);
			            char name[4] = "tmp";
			            char tmp_ind[4];
                        snprintf(tmp_ind, 10, "%d", tmp);
                        strcat(name,tmp_ind);
                        tmp++;
                        pushSymbol(name,0,globalDepth);
                        add_instruction("AFC", ind, $1, -1);
                        add_instruction("STORE", findSymbol(name,globalDepth),ind,-1);
                        }
                        
            |tNUMBER    {
                        //pushTmp();
                        printf("meet a int\n");
                        //printTmpTable();
                        printf("tmp = %d\n", tmp);
			            char name[4] = "tmp";
			            char tmp_ind[4];
                        snprintf(tmp_ind, 10, "%d", tmp);
                        strcat(name,tmp_ind);
                        tmp++;
                        pushSymbol(name,0,globalDepth);
                        add_instruction("AFC", ind, $1, -1);
                        add_instruction("STORE", findSymbol(name,globalDepth),ind,-1);
                        }
                        
            |tVAR       {
                        int index=findSymbol($1,globalDepth);
                        printf("tVAR= %s",$1);
                        if(index){
                            if(!isInitialised($1,globalDepth)){
                                yyerror("non initialised variable");
                            }
                        printf("affection a faire en ASM\n"); };

                        }
            |E tADD E 
            {
                add_instruction("LOAD",ind, get_last(), -1 );
                //popTmp();
                popSymbol();
                ind++;
                printf("tmp = %d\n", tmp);
                tmp--;

                add_instruction("LOAD",ind, get_last(), -1 );
                popSymbol();
                printf("tmp = %d\n", tmp);
                tmp--;

                add_instruction("ADD",(ind -1), (ind -1), ind );
                ind--;

                char name[4]="tmp";
                char tmp_ind[4];
                snprintf(tmp_ind, 10, "%d", tmp);
                strcat(name,tmp_ind);
                tmp++;
                //pushTmp();
                pushSymbol(name,0,globalDepth);
                add_instruction("STORE",findSymbol(name,globalDepth),ind,-1);
            }
            |E tSUB E 
            {
                add_instruction("LOAD",ind, get_last(), -1 );
                //popTmp();
                popSymbol();
                ind++;
                printf("tmp = %d\n", tmp);
                tmp--;

                add_instruction("LOAD",ind, get_last(), -1 );
                //popTmp();
                popSymbol();
                printf("tmp = %d\n", tmp);
                tmp--;

                add_instruction("SUB",(ind -1), (ind -1), ind );
                ind--;

                char name[4]="tmp";
                char tmp_ind[4];
                snprintf(tmp_ind, 10, "%d", tmp);
                strcat(name,tmp_ind);
                tmp++;
                //pushTmp();
                pushSymbol(name,0,globalDepth);
                add_instruction("STORE",findSymbol(name,globalDepth),ind,-1);
            }
            |E tMUL E 
            {
                add_instruction("LOAD",ind, get_last(), -1 );
                //popTmp();
                popSymbol();
                ind++;
                printf("tmp = %d\n", tmp);
                tmp--;

                add_instruction("LOAD",ind, get_last(), -1 );
                //popTmp();
                popSymbol();
                printf("tmp = %d\n", tmp);
                tmp--;

                add_instruction("MUL",(ind -1), (ind -1), ind );
                ind--;

                char name[4]="tmp";
                char tmp_ind[4];
                snprintf(tmp_ind, 10, "%d", tmp);
                strcat(name,tmp_ind);
                tmp++;
                //pushTmp();
                pushSymbol(name,0,globalDepth);
                add_instruction("STORE",findSymbol(name,globalDepth),ind,-1);
            }
            |E tDIV E 
            {
                add_instruction("LOAD",ind, get_last(), -1 );
                //popTmp();
                popSymbol();
                ind++;
                printf("tmp = %d\n", tmp);
                tmp--;

                add_instruction("LOAD",ind, get_last(), -1 );
                //popTmp();
                popSymbol();
                printf("tmp = %d\n", tmp);
                tmp--;

                add_instruction("DIV",(ind -1), (ind -1), ind );
                ind--;

                char name[4]="tmp";
                char tmp_ind[4];
                snprintf(tmp_ind, 10, "%d", tmp);
                strcat(name,tmp_ind);
                tmp++;
                //pushTmp();
                pushSymbol(name,0,globalDepth);
                add_instruction("STORE",findSymbol(name,globalDepth),ind,-1);
            }
            ;      

%%
int main(void){
    yyparse();
    print_all();
    return 0;
}