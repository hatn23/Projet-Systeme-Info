#include "symbol_table.h"
#define TABLESIZE 100

//initialise symbol table
symbole symbolTable[TABLESIZE];
int currentPositon=-1;
int globalDepth=0;
int ESP=0;
char* tmpTable;

//Question: push quand le symbole existe deja dans le tableau?
void push(T_Type type, char* name){
	//
	if (currentPositon==TABLESIZE-1){
		printf("TABLE FULL\n");
	}
	else {
		//verify if the symbol doesnt exists in the table
		if(createSymbol(type,name)!=NULL){
		//find the corresponding element in the table
			// int found=0;
			// int index=TABLESIZE;
			// while(index>0 || !found){
			// 	if(strcmp(symbol_table[i].name,name)==0){
			// 		found = 1;
			// 	}
			// }
			currentPositon++;
			if(currentPositon<TABLESIZE){
				symbole s = createSymbol(type,name);
				symbolTable[currentPositon]=s;
			}
		}
	}
}

//pop 
void pop(){
	if (currentPositon!=-1){
		currentPositon--;
	}
}

//create symbol
symbol createSymbol(T_Type type, char* name){
	//if symbolTable is not empty
	if(currentPositon!=-1){
		for (i=0;i<currentPosition;i++){
			//if the variable is already existed in symbolTable
			if(strcmp(symbol_table[i],name)==0){
				yyerror("Variable name already taken: %s", name);
				return NULL;
			}
		}
	}
	symbol s;
	s.type=type;
	nom=malloc(sizeof(name));
	s.name=nom;
	s.depth=globalDepth;
	s.addr=ESP;
	ESP=ESP + 4; //on reserve 1 octet pour chaque symbol
	s.isInitialised=0;
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
void printSymbol(symbol sym){
	printf("name = %s \n depth = %d\n addr = %d \n",s.name,s.depth,s.addr);
}

//print symbol table
void printSymbolTable(symbol symTab){
	for (i=0;i<TABLESIZE;i++){
		printSymbol(symTab[i]);
	}
}


/*int main() {

}*/