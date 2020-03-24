#include "symbol_table.h"
#include "assembleur.h"

#define MAX_TABLESIZE 4000

instruction tab_instruction[MAX_TABLESIZE];
int index_tab = 0;

void add_instruction2(char *operation, int r1, r2) {
    struct instruction add;
    add.operation = strdup(operation);
    add.r1 = r1;
    add.r2 = r2;
    add.r3 = 0;
    tab_instruction[index_tab] = add;
    index_tab ++;
}

void add_instruction3(char *operation,int r1, int r2, int r3){
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

void interpreter(){
    for (int i = 0;i++; i<line){

    }

}

/*int main(){

}*/