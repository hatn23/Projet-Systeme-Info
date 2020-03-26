#include "symbol_table.h"
#define TABLESIZE 100

//initialise symbol table
symbol *symbolTable[TABLESIZE];
int currentPosition = -1;

int ESP = 0;

tmp *tmpTable[TABLESIZE];
int addtmp = TABLESIZE + 1;
int stackpointer= -1;

void pushSymbol(T_Type type, char *name, int isConstant,int depth)
{
	//
	if (currentPosition >= TABLESIZE - 1)
	{
		printf("TABLE FULL\n");
	}
	else
	{
		symbol *s = createSymbol(type, name, isConstant,depth);
		//verify if the symbol doesnt exists in the table
		if (s != NULL)
		{
			currentPosition++;
			symbolTable[currentPosition] = s;
		}
	}
}

void pushTmp(T_Type type, char *name)
{
	//
	if (currentPosition >= TABLESIZE - 1)
	{
		printf("TABLE FULL\n");
	}
	else
	{
		tmp *s = createTmpSymbol(type, name);
		//verify if the symbol doesnt exists in the table
		if (s != NULL)
		{
			stackpointer++;
			tmpTable[stackpointer] = s;
		}
	}
}

//pop
void pop()
{
	symbol *s = symbolTable[currentPosition];
	free(s);
	if (currentPosition != -1)
	{
		currentPosition--;
	}
	else
	{
		printf("POP ERROR: the table is empty!\n");
	}
}


//create symbol
symbol *createSymbol(T_Type type, char *name, int isConstant, int depth)
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
	s->type = type;
	s->name = strdup(name);
	s->depth = depth;
	s->addr = ESP;
	ESP = ESP++; //on reserve 1 octet pour chaque symbol
	s->isInitialised = 0;
	s->isConstant = isConstant;
	return s;
}

tmp *createTmpSymbol(T_Type type, char *name)
{
	for (int i = 0; i < currentPosition; i++)
	{
		//if the variable is already existed in symbolTable
		if (strcmp(tmpTable[i]->name, name) == 0)
		{
			printf("Variable name already taken: %s", name);
			return NULL;
		}
	}

	tmp *s = malloc(sizeof(tmp));
	s->type = type;
	s->name = strdup(name);
	s->addr = addtmp;
	addtmp++;
	return s;
}

symbol getLastSymbol(){
	return *symbolTable[currentPosition];
}
//return 1 if the symbol is initialised
//else return 0
int isInitialised(symbol s)
{
	return s.isInitialised;
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
int isConstant(symbol s)
{
	return s.isConstant;
}

//Free temporary symbol
void freeTmp(symbol *s)
{
	free(s);
}

//print symbol
void printSymbol(symbol *s)
{
	printf("name = %s\ndepth = %d\naddr = %d\n", s->name, s->depth, s->addr);
}

//print symbol table
void printSymbolTable()
{
	printf("-------------------------\n");
	for (int i = 0; i < currentPosition + 1; i++)
	{
		printSymbol(symbolTable[i]);
	}
	printf("-------------------------\n");
}

int main()
{
	pushSymbol(Integer, "test", 1,0);
	printf("currentPosition=%d\n", currentPosition);
	pushSymbol(Integer, "test2", 1,0);
	printf("currentPosition=%d\n", currentPosition);
	pushSymbol(Integer, "test3", 1,0);
	printf("currentPosition=%d\n", currentPosition);
	printSymbolTable();
	//pop();
	printf("currentPosition=%d\n", currentPosition);
	int index = findSymbol("test3",0);
	printf("index= %d\n", index);
	printSymbolTable();
}