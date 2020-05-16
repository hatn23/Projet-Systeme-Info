#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef ASSEMBLEUR_H
#define ASSEMBLEUR_H

//#include "symbol_table.h"

#define ADD   01
#define MUL   02
#define SOU   03
#define DIV   04
#define COP   05
#define AFC   06
#define LOAD  07
#define STORE 08


typedef struct instruction {
    char operation[5];
    int r1;
    int r2;
    int r3;
} instruction;
void add_instruction(char *operation,int r1, int r2, int r3 );
int get_index_tab();
int get_index_execute();
void interpreter();
void print_instruction(instruction i);
void print_all();
void print_binaire();
void patch(int from, int to);

#endif






