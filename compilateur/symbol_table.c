#include "symbol_table.h"
#define TABLESIZE 100

//initialise symbol table
symbol *symbolTable[TABLESIZE];
int currentPosition = -1;

int ESP = 0;

int stackpointer= TABLESIZE;

symbol *createSymbol(char *name, int isConstant, int depth)
{
	//if symbolTable is not empty
	if (currentPosition != -1)
	{
		for (int i = 0; i < currentPosition; i++)
		{
			//if the variable is already existed in symbolTable
			if (strcmp(symbolTable[i]->name, name) == 0)
			{
				printf("Variable name already taken: %s", name);
				return NULL;
			}
		}
	}
	symbol *s = malloc(sizeof(symbol));
	s->name = strdup(name);
	s->depth = depth;
	s->isInitialised = 0;
	s->isConstant = isConstant;
	return s;
}

int pushSymbol(char *name, int isConstant,int depth)
{
	if (currentPosition >= TABLESIZE - 1)
	{
		printf("TABLE FULL\n");
	}
	else
	{
		symbol *s = createSymbol(name, isConstant,depth);
		//verify if the symbol doesnt exists in the table
		if (s != NULL)
		{
			currentPosition++;
			symbolTable[currentPosition] = s;
		}
	}
	return currentPosition;
}

int pushTmp()
{
	stackpointer++;
	return stackpointer;
}

int popTmp()
{
	stackpointer--;
	return stackpointer+1;
}

void popSymbol()
{
	free(symbolTable[currentPosition]);
	currentPosition--;
}


symbol getLastSymbol(){
	return *symbolTable[currentPosition];
}

//return address of the temporary variable if the variable is found in the table
//else return -1
int getaddrtmp(){
	return stackpointer;
}

//return 1 if the symbol is initialised
//else return 0
int isInitialised(char* name,int depth)
{
	int i=findSymbol(name,depth);
	return symbolTable[i]->isInitialised;
}

//return index if the symbol is found in the table
//else return -1
int findSymbol(char* name,int depth)
{
	for(int i=0;i<=currentPosition;i++){
		if(symbolTable[i]->depth <= depth)
            if(!strcmp(symbolTable[i]->name, name))
                return i;
	}
	return -1;
}

//return 1 if the symbol is constant
//else return 0
int isConstant(char* name,int depth)
{
	int i=findSymbol(name,depth);
	return symbolTable[i]->isConstant;
}

int setInitialised (char* name,int depth){
	int index= findSymbol(name, depth);
	if(index!=-1){
		symbolTable[index]->isInitialised=1;
		return 0;
	}
	else return -1;
}

//print symbol
void printSymbol(symbol *s)
{
	printf("name = %s  depth = %d  const = %d \n", s->name, s->depth, s->isConstant);
}

//print symbol table
void printSymbolTable()
{
	printf("-------------------------\n");
	printf("currentPosition = %d\n", currentPosition);
	for (int i = 0; i < currentPosition + 1; i++)
	{
		printf("[%d]",i);
		printSymbol(symbolTable[i]);
	}
	printf("-------------------------\n");
}

void printTmpTable(){

	printf("-------------------------\n");
	printf(" stackpointer = %d\n", stackpointer);
	printf("-------------------------\n");
}

int get_last(){
	return currentPosition;
}

// int main()
// {
// 	pushSymbol( "test", 1,0);
// 	pushSymbol( "test2", 1,0);
// 	pushSymbol( "test3", 1,0);
// 	printSymbolTable();
// 	// popSymbol();
// 	printSymbolTable();
// 	int index = findSymbol("test3",0);
// 	printf("index= %d\n", index);
// 	printSymbolTable();
// }