# Projet-Systeme-Info

Pour compiler le lex: <br/>
`flex compilo.l` <br/>


Pour compiler le yacc: <br/>
`yacc -d compilo.y`

Pour compiler les deux fichiers
`gcc lex.yy.c y.tab.c -o rest` <br/>

## Test:
`./a.out < test.c` <br/>
(ici, test.c est un fichier de C quelconque) <br/>
