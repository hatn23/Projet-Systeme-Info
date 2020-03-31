//#include "symbol_table.h"
#include "assembleur.h"
#define MAX_TABLESIZE 4000

instruction tab_instruction[MAX_TABLESIZE];
int index_tab = 0;
int index_execute = 0;
int registre[15];

void add_instruction(char *operation,int r1, int r2, int r3){
    struct instruction add;
    strcpy(add.operation, operation);
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
           // ADD @résultat @opérande1 @opérande2
			registre[r1] = registre[r2] + registre[r3];
            printf("r%d = r%d + r%d = %d + %d = %d\n",r1, r2, r3, registre[r2],registre[r3],registre[r1]);
        } 
        else if (!strcmp(operation, "MUL")) {
            // MUL @résultat @opérande1 @opérande2
            registre[r1] = registre[r2] * registre[r3];
            printf("r%d = r%d * r%d = %d * %d = %d\n",r1, r2, r3,registre[r2],registre[r3],registre[r1]);
        }
        else if (!strcmp(operation, "SOU")) {
            // SOU @résultat @opérande1 @opérande2
            registre[r1] = registre[r2] - registre[r3];
            printf("r%d = r%d - r%d = %d - %d = %d\n",r1, r2, r3, registre[r2],registre[r3], registre[r1]);
        }
        else if (!strcmp(operation, "DIV")) {
            // DIV @résultat @opérande1 @opérande2
            registre[r1] = registre[r2] / registre[r3];
            printf("r%d = r%d / r%d = %d / %d = %d\n",r1, r2, r3,  registre[r2],registre[r3], registre[r1]);
        }
        else if (!strcmp(operation, "COP")) {
            // COP @résultat @opérande
            registre[r1] = registre[r2];
        }
        else if (!strcmp(operation, "AFC")) {
            // AFC @résultat val_const
            registre[r1] = r2;
            printf("r%d = %d\n", r1, registre[r1]);

        }
        else if (!strcmp(operation, "JMP")) {
            // JMP num_inst
            index_execute = r1 - 1;
            printf("Jump to instruction %d\n", r1);

        }
        else if (!strcmp(operation, "JMF")) {
            // JMF @cond     num_inst
            if (registre[r1] == 0) {
                index_execute = r2 - 1;
                printf("Jump to instruction %d\n", r2);

            }
            else {
                printf("Condition is true, don't jump");
            }

        }
        else if (!strcmp(operation, "INF")) {
            // INF @résultat @opérande1 @opérande2
            printf("r%d = %d, r%d = %d", r2, registre[r2], r3, registre[r3]);
            if (registre[r2] < registre[r3]) {
				registre[r1] = 1;
                printf("r%d < r%d, r%d = %d\n", r2,r3,r1, registre[r1]);
			} else {
				registre[r1] = 0;
                printf("r%d >= r%d, r%d = %d\n", r2,r3,r1, registre[r1]);
			}
        }
        else if (!strcmp(operation, "SUP")) {
            // SUP @résultat @opérand1 @opérand2
            printf("r%d = %d, r%d = %d", r2, registre[r2], r3, registre[r3]);
            if (registre[r2] > registre[r3]) {
            printf("r%d > r%d, r%d = %d\n", r2,r3,r1, registre[r1]);
			} else {
				registre[r1] = 0;
                printf("r%d <= r%d, r%d = %d\n", r2,r3,r1, registre[r1]);
			}
        }
        else if (!strcmp(operation, "EQU")) {
            // EQU @résultat @opérand1 @opérand2
             printf("r%d = %d, r%d = %d", r2, registre[r2], r3, registre[r3]);
            if (registre[r3] == registre[r2]) {
				registre[r1] = 1;
                printf("r%d = r%d, r%d = %d\n", r2,r3,r1, registre[r1]);
			} else {
				registre[r1] = 0;
                printf("r%d /= r%d, r%d = %d\n", r2,r3,r1, registre[r1]);
			}
        }
        else if (!strcmp(operation, "PRI")) {
            // PRI @résultat
            printf("%d \n", registre[r1]);
        }
        index_execute++;
    }
}

void print_instruction(instruction i){
    printf("Operation :   %s | Registre 1 : %d | Registre 2 : %d | Registre 3 : %d\n", i.operation, i.r1, i.r2, i.r3);
}

void print_all(){
    for (int i = 0; i < index_tab; i++){
        printf("%d. ", i);
        print_instruction(tab_instruction[i]);
    }
}

int main(){
    printf("index execute : %d \n", index_execute);
    add_instruction("AFC", 1, 2, -1 );
    add_instruction("AFC", 2, 4, -1 );
    add_instruction("ADD", 3, 1, 2 );
    add_instruction("MUL", 4, 1, 2 );
    print_all();
    interpreter();
    printf("index execute : %d \n", index_execute);
}