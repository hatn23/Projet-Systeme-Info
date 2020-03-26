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
	unsigned int depth; // porte de variable
	unsigned int addr; //address in the memory
    int isInitialised;
    int isConstant; // const =1 		
} symbol;

typedef struct{
    T_Type type;
    char* name;	
	unsigned int addr; //address in the memory
}tmp;

void pushSymbol(T_Type type, char* name, int isConstant, int depth);

void pushTmp(T_Type type, char* name);

//create symbol
symbol* createSymbol(T_Type type, char* name, int isInitialised, int depth);

//create symbol temporaire
tmp *createTmpSymbol(T_Type type, char* name);

//return the last symbol read by the parser
symbol getLastSymbol();

//return 1 if the symbol is initialised
//else return 0
int isInitialised(symbol s);

//return index if the symbol is found in the symbolTable
//else return 0
int findSymbol(char* name,int depth);

//return 1 if the symbol is constant
//else return 0
int isConstant(symbol s);

//Free temporary symbol
void freeTmp(symbol* s);

//print symbol
void printSymbol(symbol* sym);

//print symbol table
void printSymbolTable();



