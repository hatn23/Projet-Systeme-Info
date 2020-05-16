%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    #include "symbol_table.h"
    #include "assembleur.h"

    int globalDepth =0 ;

    int yylex(void);
    int yydebug = 1;
    int cpt_err=0;
    int saveLine;
    char* var;
    void yyerror (char const *s) {
        cpt_err++;
        fprintf (stderr, "ERROR (%d): %s\n", cpt_err, s);
    }

//comment faire la comparaison entre un symbol et un var temporaire ou entre deux symboles
    void exec_condition(char * condition){
        int second=popTmp();
        int first=popTmp();
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
        pushTmp();
    }

    void exec_operation(char* opt){
        
        int second = popTmp();
        int first = popTmp();
        add_instruction(opt, first,first,second);
        pushTmp();
    }
    
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

IfStatement:tIF{printf("if \n");} Condition{
                int line = get_index_tab();
                printf("current=%d\n", line); 
                int condition_status= popTmp();
                add_instruction("JMF",condition_status,line,-1);
                saveLine=line;
                }
             tOA {globalDepth++;} Contenus{
                int current = get_index_tab();
                patch(saveLine,current+1); 
                printf("patch=%d +2\n", current);
                add_instruction("JMP",current+1 ,-1,-1);
                saveLine= current++;
            }
             tCA {globalDepth--;} Else {printf("end if\n");} 
            ;

Else:       tELSE{printf("else here\n");} tOA {globalDepth++;}  Contenus  {
                int current = get_index_tab();
                printf("patch=%d +1   %d\n", current, saveLine);
                patch(saveLine,current);
                
            } 
            tCA {globalDepth--;}
            |tELSE Contenu {
                int current = get_index_tab();
                printf("patch=%d +1\n", current);
                patch(saveLine,current);
            } 
            |Vide
            ;

// IfStatement:tIF{printf("if \n");} Condition{
//                 int line = get_index_tab();
//                 //printf("current=%d\n", line); 
//                 int condition_status= popTmp();
//                 add_instruction("JMF",line,condition_status,-1);
//                 $1=line;
//                 }
//              Body{
//                 int current = get_index_tab();
//                 patch($1,current+1); 
//                 printf("patch=%d +2\n", current);
//                 add_instruction("JMP",current +2 ,-1,-1);
//                 $1= current++;
//             }
//              tELSE Body 
//              {
//                 int current = get_index_tab();
//                 patch($1,current);
//              } 
//             ;


While:      tWHILE  Condition {
                int line = get_index_tab();
                int condition_status= popTmp();
                add_instruction("JMF",line,condition_status,-1);
                $1=line;
            } Body{
                int current = get_index_tab();
                add_instruction("JMP",$1-1 ,-1,-1);
                patch($1,current+1);
                $1= current++;
            }
            ;

Condition:  tOB E tCMP E tCB{exec_condition("==");}
            |tOB E tINF E tCB {exec_condition("<");}
            |tOB E tSUP E tCB {exec_condition(">");}
            |tOB E tINFEQUAL E tCB {exec_condition("<=");}
            |tOB E tSUPEQUAL E tCB {exec_condition(">=");}
            |tOB E tNOTEQUAL E tCB {exec_condition("!=");}
            |tOB E 
            ;

Declaration:Type tVAR 
            {
             var=malloc(sizeof($2));
             strcpy(var,$2);
             pushSymbol($2,0,globalDepth);
             printf("Declaration 1\n");
             //printSymbolTable();
            } AffectationDuringDeclaration MultipleDeclaration tSEMCOL
            | tCONST tINT tVAR 
            {
             var=malloc(sizeof($3));
             strcpy(var,$3);
             pushSymbol($3,1,globalDepth);
             printf("Declaration 1 const\n");
             //printSymbolTable();
            }AffectationDuringDeclaration MultipleDeclaration tSEMCOL
            ;

MultipleDeclaration: tSEP tVAR{
                    var=malloc(sizeof($2));
                    strcpy(var,$2);
                    if(isConstant(getLastSymbol().name,getLastSymbol().depth)==1){
                        pushSymbol($2,1,globalDepth);
                        printf("Multiple declaration const\n");
                    }
                    else{
                        pushSymbol($2,0,globalDepth);
                        printf("Multiple declaration\n");
                    } }AffectationDuringDeclaration MultipleDeclaration
                    | Vide
                    ;

AffectationDuringDeclaration: tEQUAL E 
                            {
                            add_instruction("STORE",popTmp(), findSymbol(var,globalDepth), -1);
                            setInitialised(var,globalDepth);
                            free(var);
                            }
                            |Vide;

Print:      tPRINTF tOB tVAR    {printf("printf %s\n", $3);
                                if(findSymbol($3,globalDepth)!=-1 && isInitialised($3,globalDepth)==1) add_instruction("PRI",findSymbol($3,globalDepth),-1, -1);
                                else yyerror("Variable is never declared or never initialised");
                                } tCB tSEMCOL                        
            ;


Aff:        tVAR 
            {
                var=malloc(sizeof($1));
                strcpy(var,$1);
            } 
            tEQUAL E tSEMCOL 
            {
                printf("Affectation %s \n",var);
                if(findSymbol(var,globalDepth)!=-1){
                    if(isConstant(var,globalDepth)==1){
                        yyerror("Temptation to modify a constant ");
                    } 
                    else {
                        add_instruction("STORE",popTmp(), findSymbol(var,globalDepth), -1);
                        setInitialised(var,globalDepth);
                        free(var);
                    }
                }else{
                    yyerror("Variable is never declared");
                }
            }
            ;

E:          tREAL       {
                        printf("float %f\n",$1);
                        int tmp=pushTmp();
                        add_instruction("AFC", tmp, $1, -1);
                        }
                        
            |tNUMBER    {
                        printf("int %d\n",$1);
			            int tmp=pushTmp();
                        add_instruction("AFC", tmp, $1, -1);
                        }
                        
            |tVAR       {
                        int index=findSymbol($1,globalDepth);
                        printf("tVAR= %s\n",$1);
                        if(index && !isInitialised($1,globalDepth))
                            yyerror("non initialised variable");
                        else{
                            int tmp=pushTmp();
                            add_instruction("LOAD",tmp,index,-1);
                        }
                        }
                        ;
            |E tADD E {exec_operation("ADD");};
           
            |E tSUB E {exec_operation("SUB");};
            
            |E tMUL E{exec_operation("MUL");};

            |E tDIV E {exec_operation("DIV");};
           
%%
int main(void){    
    
    yyparse();
    print_all();
    printSymbolTable();
    return 0;
}