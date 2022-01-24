#include <stdio.h>
#include <stdlib.h>
#include <time.h> 

void input(int *, int *, int *);
void empty_grid(char **, int, int);
void print_grid(char **, int, int);
void put_mines(char **, int, int, int);
void cordinates(char **, int, int, int *, int *);
void count_mines(char **, int, int); 
int detection(char **, int, int, int, int);

int main(int argc, char **argv)
{
	system("chcp 1253");
	srand(time(NULL));
	
	int M, N, K;
	input(&M, &N, &K);
	
	char **minefield = (char **)malloc(M * sizeof(char *));
		
	int i;
	
	for (i = 0 ; i<M ; i++)
	{
		minefield[i] = (char*) malloc(N*sizeof(char));
	}

	
	empty_grid(minefield, M, N);		
	put_mines(minefield, M, N, K);
	count_mines(minefield, M, N);
	printf("\n\n");
	print_grid(minefield, M, N);
	
	
	return 0;;
}

void input(int *retM, int *retN, int *retK)
{
	printf("Εισάγετε τις διαστάσεις του πλέγματος καθός και το πλήθος των βομβών:\n\n");
	
	int lines, rows, bombs;
	
	do
	{
		printf("Γραμμές : ");
		scanf ("%d", &lines);
		
		if (lines<=0)
			printf("Το πλήθος των γραμμών πρέπει να είναι μεγαλήτερο του 0!\n\n");
	}
	while (lines<=0);
	
	do
	{
		printf("Στήλες  : ");
		scanf ("%d",&rows);
		
		if (rows<=0)
			printf("Το πλήθος των στηλών πρέπει να είναι μεγαλήτερο του 0!\n\n");
	}
	while (rows<=0);
	
	do
	{
		printf("Βόμβες  : ");
		scanf ("%d",&bombs);
		
		if (bombs<=0 || bombs==(lines*rows))
			printf("Το πλήθος των βομβών πρέπει να είναι μεγαλήτερο του 0 και μικρότερο του %d!\n\n",lines*rows);
	}
	while (bombs<=0 || bombs==(lines*rows));
	
	*retM = lines;
	*retN = rows;
	*retK = bombs;
}

void empty_grid(char **grid, int lines, int rows)
{
	int i, j;
	
	for (i = 0 ; i<lines ; i++)
		for (j = 0 ; j<rows ; j++)
		{
			grid[i][j] = ' ';
		}
}

void print_grid(char **grid, int lines, int rows)
{
	int i, j;
	
	printf(" ");
	for (i = 0 ; i<4*rows-1 ; i++)
	{
		printf("_");
	}
	printf("\n");
	
	for (i = 0 ; i<lines ; i++)
	{	
		for (j = 0 ; j<rows ; j++)
		{
				printf("|_%c_",grid[i][j]);					
		}
		printf("|\n");
	}
}

void put_mines(char **grid, int lines, int rows, int bombs)
{
	int i, x, y;
	
	for (i = 1 ; i<=bombs ; i++)
	{
		cordinates(grid, lines, rows , &x, &y);
		grid[x][y] = '*';
	}	
}


void cordinates(char **grid, int lines, int rows, int *retx, int *rety)
{
	int X,  Y;
	
	do
	{
		X = rand() % (lines);
		Y = rand() % (rows);
	}
	while (grid[X][Y]=='*');
	
	*retx = X;
	*rety = Y;		
}


void count_mines(char **grid, int lines, int rows)
{
	int i, j;
	int a;
	
	for (i = 0 ; i<lines ; i++)
		for (j = 0 ; j<rows ; j++)
		{
			if (grid[i][j]!='*')
			{	
				a = detection(grid, lines, rows, i, j);
			//	printf("det %c\n",a+'0');
				grid[i][j] = a + '0';
			}
		}
}

int outofbounds(int x, int y, int lines, int rows)
{
        return ((y < 0 || y > lines - 1) || (x < 0 || x > rows - 1));
}

int detection(char **grid, int lines, int rows, int x, int y)
{

        int bombCount = 0;


        if (!outofbounds(x, y+1, lines, rows) && grid[x][y+1]=='*')
                bombCount++;
        if (!outofbounds(x, y-1, lines, rows) && grid[x][y-1]=='*')
                bombCount++;
        if (!outofbounds(x+1, y, lines, rows) && grid[x+1][y]=='*')
                bombCount++;
        if (!outofbounds(x-1, y, lines, rows) && grid[x-1][y]=='*')
                bombCount++;
        if (!outofbounds(x-1, y-1, lines, rows) && grid[x-1][y-1]=='*')
                bombCount++;
        if (!outofbounds(x-1, y+1, lines, rows) && grid[x-1][y+1]=='*')
                bombCount++;
        if (!outofbounds(x+1, y-1, lines, rows) && grid[x+1][y-1]=='*')
                bombCount++;
        if (!outofbounds(x+1, y+1, lines, rows) && grid[x+1][y+1]=='*')
                bombCount++;

        return bombCount;

}

