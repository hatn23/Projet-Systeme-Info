#include <stdio.h>
#include <stdlib.h>
#include <string.h>


//indice de tableau = address
typedef struct{
	char* name;	
	unsigned int depth; // porte de variable
    int isInitialised;
    int isConstant; //=1 		
} symbol;

int pushSymbol(char* name, int isConstant, int depth);

int pushTmp( );

void popSymbol();

int popTmp();

//return the last symbol read by the parser
symbol getLastSymbol();

//return address of the temporary variable if the variable is found in the table
//else return -1
int getaddrtmp(char* name);

//return 1 if the symbol is initialised
//else return 0
int isInitialised(char* name,int depth);

//return index(address) if the symbol is found in the symbolTable
//else return 0
int findSymbol(char* name,int depth);

//return 1 if the symbol is constant
//else return 0
int isConstant(char* name,int depth);

//print symbol table
void printSymbolTable();

void printTmpTable();

