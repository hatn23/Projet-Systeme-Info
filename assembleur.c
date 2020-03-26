#include "symbol_table.h"
#include "assembleur.h"

#define MAX_TABLESIZE 4000

instruction tab_instruction[MAX_TABLESIZE];
int index_tab = 0;
int index_execute = 0;
int registre[15];

void add_instruction(char *operation,int r1, int r2, int r3){
    struct instruction add;
    add.operation = strdup(operation);
    add.r1 = r1;
    add.r2 = r2;
    add.r3 = r3;
    tab_instruction[index_tab] = add;
    index_tab ++;
}

int get_index_tab() {
    return index_tab;
}

int get_index_execute(){
    return index_execute;
}

void interpreter(){
    while (index_execute < index_tab){
       char operation[5];
       strcpy(operation,tab_instruction[index_execute].operation);
       int r1 = tab_instruction[index_execute].r1;
       int r2 = tab_instruction[index_execute].r2;
       int r3 = tab_instruction[index_execute].r3;
       if (!strcmp(operation, "ADD")) {
			registre[r1] = registre[r3] + registre[r2];
        } 
        else if (!strcmp(operation, "MUL")) {
            registre[r1] = registre[r3] * registre[r2];
        }
        else if (!strcmp(operation, "SOU")) {
            registre[r1] = registre[r3] - registre[r2];
        }
        else if (!strcmp(operation, "DIV")) {
            registre[r1] = registre[r3] / registre[r2];
        }
        else if (!strcmp(operation, "COP")) {

        }
        else if (!strcmp(operation, "AFC")) {

        }
        else if (!strcmp(operation, "JMP")) {

        }
        else if (!strcmp(operation, "JMF")) {

        }
        else if (!strcmp(operation, "INF")) {

        }
        else if (!strcmp(operation, "SUP")) {

        }
        else if (!strcmp(operation, "EQU")) {

        }
        else if (!strcmp(operation, "PRI")) {

        }
        index_execute++;



    }
    

}

// ADD @résultat @opérande1 @opérande2
// MUL @résultat @opérande1 @opérande2
// SOU @résultat @opérande1 @opérande2
// DIV @résultat @opérande1 @opérande2
// COP @résultat @opérande
// AFC @résultat val_const
// JMP num_inst
// JMF @cond     num_inst
// INF @résultat @opérande1 @opérande2
// SUP @résultat @opérand1 @opérand2
// EQU @résultat @opérand1 @opérand2
// PRI @résultat


void print_instruction(instruction i){
    printf("Operation :   %s | Registre 1 : %d | Registre 2 : %d | Registre 3 : %d\n", i.operation, i.r1, i.r2, i.r3);
}

void print_all(){
    for (int i = 0, i <= index_tab, i++){
        printf("%d. ", i);
        print_instruction(tab_instruction[i]);
        printf("\n");
    }
}

/*int main(){

}*/