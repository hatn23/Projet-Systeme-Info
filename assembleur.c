#include "symbol_table.h"
#include "assembleur.h"

#define MAX_TABLESIZE 4000

instruction tab_instruction[MAX_TABLESIZE];
int line = 0;


void ajouter_instruction(char *operation,int r1, int r2, int r3){
    tab_instruction[line] -> operation = strdup(operation);
    tab_instruction[line] -> r1 = r1;
    tab_instruction[line] -> r2 = r2;
    tab_instruction[line] -> r3 = r3;
    line ++;
}

int current_line() {
    return line;
}

void interpreter(){
    for (int i = 0;i++; i<line){

    }

}

/*int main(){

}*/