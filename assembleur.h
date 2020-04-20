#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifndef ASSEMBLEUR_H
#define ASSEMBLEUR_H

//#include "symbol_table.h"
/* 
#define ADD   1
#define MUL   2
#define SOU   3
#define DIV   4
#define COP   5
#define AFC   6
#define JMP   7
#define JMF   8
#define INF   9
#define SUP   10
#define EQU   11 
#define PRI   12 */


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
void patch(int from, int to);

#endif






