LEX = flex
YACC = bison -d
compilo: compilo.c compilo.tab.c lex.yy.c
$(CC) -o compilo compilo.tab.c lex.yy.c compilo.c
compilo.tab.c: compilo.y
$(YACC) compilo.y
lex.yy.c: compilo.l
$(LEX) compilo.l