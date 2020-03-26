#include "symbol_table.h"
#define TABLESIZE 100

//initialise symbol table
symbol *symbolTable[TABLESIZE];
int currentPosition = -1;

int ESP = 0;

char* tmpTable[TABLESIZE];
int stackpointer= -1;

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

int pushTmp(char *name)
{
	if (currentPosition >= TABLESIZE - 1)
	{
		printf("TABLE FULL\n");
	}
	else
	{
		char *s = malloc(sizeof(name));
		stackpointer++;
		tmpTable[stackpointer] = s;
	}
	return stackpointer;
}

void popSymbol()
{
	free(symbolTable[currentPosition]);
	currentPosition--;
}

void popTmp(){
	free(tmpTable[stackpointer]);
	stackpointer--;
}

symbol getLastSymbol(){
	return *symbolTable[currentPosition];
}

//return address of the temporary variable if the variable is found in the table
//else return -1
int getaddrtmp(char* name){
	for(int i=0;i<=stackpointer;i++){
		if(!strcmp(symbolTable[i]->name, name))
            return TABLESIZE+i; //le table de variable temporaire se trouve juste apres le table de symbol
	}
	return -1;
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
		printSymbol(symbolTable[i]);
	}
	printf("-------------------------\n");
}

void printTmpTable(){

	printf("-------------------------\n");
	printf(" %d temporary variable now\n", stackpointer);
	// for (int i = 0; i < stackpointer + 1; i++)
	// {
	// 	printf("name = %s  \n", tmpTable[i]->name);
	// }
	printf("-------------------------\n");
}

// int main()
// {
// 	pushSymbol( "test", 1,0);
// 	pushSymbol( "test2", 1,0);
// 	pushSymbol( "test3", 1,0);
// 	printSymbolTable();
// 	popSymbol();
// 	printSymbolTable();
// 	// int index = findSymbol("test3",0);
// 	// printf("index= %d\n", index);
// 	// printSymbolTable();
// }