#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum Type {
    Integer,
    Character,
    Boolean,
    Void,
    Error
} T_Type;

typedef struct{
    T_Type type;
	char* name;	
	unsigned int depth; //size of each element
	unsigned int addr; //address in the memory
    int isInitialised;		
} symbol;

//push 
void push(T_Type type, char* name);

//pop 
void pop();

//create symbol
symbol* createSymbol(T_Type type, char* name);

//return 1 if the symbol is initialised
//else return 0
int isInitialised(symbol s);

//return 1 if the symbol is a temporary symbol
//else return 0
int isTmp(symbol s);

//Free temporary symbol
void freeTmp(symbol* s);

//print symbol
void printSymbol(symbol* sym);

//print symbol table
void printSymbolTable();



