#include <stdio.h>

void Affiche(int Tab[],int Taille)
{
    int i;
    for (i=0;i<Taille;i++)
    {
        printf("%d ",Tab[i]);
    }
    printf("\n");
}

int main(void)
{
    
    Affiche(Tab,Max);
    /* Tri */
    int i, Aux, Ok = 1, j = 0;
    while (Ok)
    {
        Ok = 0;

        if(Ok==0) printf("OK");
    }
    printf("Tableau trié: ");
    Affiche(Tab,Max);
    return 0;
}