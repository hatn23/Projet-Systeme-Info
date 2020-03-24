// ADD @résultat @opérande1 @opérande2
// MUL @résultat @opérande1 @opérande2
// SOU @résultat @opérande1 @opérande2
// DIV @résultat @opérande1 @opérande2
// COP @résultat @opérande
// AFC @résultat val_const
// JMP num_inst
// JMF @cond     num_inst
// INF @résultat @opérande1 @opérande2
// SUP @résultat @opérand1 @opérand2
// EQU @résultat @opérand1 @opérand2
// PRI @résultat


#include "symbol_table.h"
#define TEXT_ASSEMBLY
//#define DEBUG

#if defined(TEXT_ASSEMBLY)

    #define r0   "0"
    #define r1   "1"
    #define r2   "2"
    #define esp  "3"
    #define tmpR "4"
    #define retR "5"

    #define ADD   "ADD  " // 0x01
    #define MUL   "MUL  " // 0x02
    #define SOU   "SOU  " // 0x03
    #define DIV   "DIV  " // 0x04

    #define COP   "COP  " // 0x05
    #define AFC   "AFC  " // 0x06
    #define LOAD  "LOAD " // 0x07
    #define STORE "STORE" // 0x08

    #define EQU   "EQU  " // 0x09
    #define INF   "INF  " // 0x0A
    // #define INFE  "INFE"  // 0x0B
    // #define SUP   "SUP"   // 0x0C
    // #define SUPE  "SUPE"  // 0x0D

    #define PRINT "PRINT" // 0x0B
    #define SCANF "SCANF" // 0x0C

    #define JMPR  "JMPR " // 0x0D
    #define JMP   "JMP  " // 0x0E
    #define JMPC  "JMPC " // 0x0F

    #define PUSH  "PUSH " // 0x10
    #define POP   "POP  " // 0x11

    #define NOP   "NOP  " // 0x90

#else // defined(TEXT_ASSEMBLY)

    #define r0  "00"
    #define r1  "01"
    #define r2  "02"
    #define esp "03"
    #define tmpR "04"
    #define retR "05"

    #define ADD   "0x01"
    #define MUL   "0x02"
    #define SOU   "0x03"
    #define DIV   "0x04"

    #define COP   "0x05"
    #define AFC   "0x06"
    #define LOAD  "0x07"
    #define STORE "0x08"

    #define EQU   "0x09"
    #define INF   "0x0A"
    // #define INFE  "B"
    // #define SUP   "C"
    // #define SUPE  "D"

    #define PRINT "0x0B"
    #define SCANF "0x0C"

    #define JMPR  "0x0D"
    #define JMP   "0x0E"
    #define JMPC  "0x0F"

    #define NOP   "0x90"

#endif

typedef struct instruction {
    char operation;
    int r1;
    int r2;
    int r3;
} instruction;

void ajouter_operation(char *operation,int r1, int r2, int r3 );
int current_line();
symbol *binary_affectation();
void interpreter();





