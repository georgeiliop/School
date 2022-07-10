#include <stdio.h>
int times(int arr[]);

int main()
{
	system("chcp 1253");
	int arr[10],i,numb;
	printf("Δώσε 10 αριθμούς : \n");
	for(i=0;i<10;i++)
	{
		scanf("%d",&arr[i]);
	}
	numb=times(arr);
	printf("\n\n Μέγιστος αριθμός εμφανίσεων : %d\n",numb);
	system("pause");
	return 0;
}

int times(int arr[])
{
	int i,j,count,max=0;
	for(i=0;i<10;i++)
	{
		count=0;
		for(j=0;j<10;j++)
		{
			if(arr[i]==arr[j])
			{
				count++;
			}
		}
		if(count>max)
		{
			max=count;
		}
	}
	return max;
}
