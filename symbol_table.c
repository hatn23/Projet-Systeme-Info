#include "symbol_table.h"
#define TABLESIZE 100

//initialise symbol table
symbol* symbolTable[TABLESIZE];
int currentPosition=-1;
int globalDepth=0;
int ESP=0;
char* tmpTable;

void push(T_Type type, char* name){
	//
	if (currentPosition>=TABLESIZE-1){
		printf("TABLE FULL\n");
	}
	else {
		
		symbol* s =createSymbol(type,name);
		//verify if the symbol doesnt exists in the table
		if(s!=NULL){
		//find the corresponding element in the table
			// int found=0;
			// int index=TABLESIZE;
			// while(index>0 || !found){
			// 	if(strcmp(symbol_table[i].name,name)==0){
			// 		found = 1;
			// 	}
			// }
			currentPosition++;
			symbolTable[currentPosition]=s;	
		}
	}
}

//pop 
void pop(){
	symbol* s= symbolTable[currentPosition];
	free(s);
	if (currentPosition!=-1){
		currentPosition--;
	}
	else{
		printf("POP ERROR: the table is empty!\n");
	}
}

//create symbol
symbol* createSymbol(T_Type type, char* name){
	//if symbolTable is not empty
	if(currentPosition!=-1){
		for (int i=0;i<currentPosition;i++){
			//if the variable is already existed in symbolTable
			if(strcmp(symbolTable[i]->name,name)==0){
				printf("Variable name already taken: %s", name);
				return NULL;
			}
		}
	}
	symbol* s=malloc(sizeof(symbol));
	s->type=type;
	s->name=strdup(name);
	s->depth=globalDepth;
	s->addr=ESP;
	ESP=ESP + 4; //on reserve 1 octet pour chaque symbol
	s->isInitialised=0;
	return s;
}

//return 1 if the symbol is initialised
//else return 0
int isInitialised(symbol s){
	return s.isInitialised;
}

//return 0 if the symbol is a temporary symbol
//else return negative
int isTmp(symbol s){
	return strcmp(s.name, tmpTable) == 0;
}

//Free temporary symbol
void freeTmp(symbol* s){
	free(s);
}

//print symbol
void printSymbol(symbol* s){
	printf("name = %s\ndepth = %d\naddr = %d\n",s->name,s->depth,s->addr);
}

//print symbol table
void printSymbolTable(){
	for (int i=0;i<currentPosition+1;i++){
		printSymbol(symbolTable[i]);
	}
}


int main() {
	push(Integer,"test");
	printf("currentPosition=%d\n",currentPosition);
	printSymbolTable();
	push(Integer,"test2");
	printf("currentPosition=%d\n",currentPosition);
	printSymbolTable();
	pop();
	printf("currentPosition=%d\n",currentPosition);
	printSymbolTable();
}