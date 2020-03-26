#include "symbol_table.h"
#include "assembleur.h"

#define MAX_TABLESIZE 4000

instruction tab_instruction[MAX_TABLESIZE];
int index_tab = 0;
int index_execute = 0;

void add_instruction(int operation,int r1, int r2, int r3){
    struct instruction add;
    add.operation = operation;
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
    struct instruction instruction = tab_instruction[index_execute];
    switch (instruction.type){
        case ADD:
            break;
        case MUL:
            break;
        case SOU:
            break;
        case DIV:
            break;
        case COP:
            break;
        case AFC:
            break;
        case JMP:
            break;
        case JMF:
            break;
        case INF:
            break;
        case SUP:
            break;
        case EQU:
            break;
        case PRI:
            break;

    }
    

}

char *str_instructions[7] = {"COP", "AFC", "PRI", "ADD", "SOU", "MUL", "DIV"};

            



}

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