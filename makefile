
all : compilo
lex.yy.c : compilo.l
		flex compilo.l
compilo.tab.c : compilo.y
		yacc -d -v compilo_asm.y
symbol_table.o: symbol_table.c
		$(CC) $(CFLAGS) -c symbol_table.c
compilo : lex.yy.c y.tab.c symbol_table.o
		$(CC) $(CFLAGS) lex.yy.c y.tab.c -o compilo $(INC) symbol_table.o
clean:
		rm -rf compilo lex.yy.c y.tab.c *.o
test:
		./compilo < test.c


