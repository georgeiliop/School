#include<stdio.h>


int main()
{
	int city[100],i,temp,u,j;
	printf("Give population\n");
	scanf("%d",&city[0]);
	for(i=1;i<100;i++)
	{
		
		printf("Give population\n");
		scanf("%d",&city[i]);
		u=i;
		for(j=i-1;j>=0;j--)
		{
			if(city[u]<city[j])
			{
				temp=city[j];
				city[j]=city[u];
				city[u]=temp;
			}
			else
			{
				break;
			}
			u--;
			
		}
	}
	printf("\n\n");
	for(i=0;i<100;i++)
	{
		printf("%d\n",city[i]);
	}
	system("pause");
	return 0;
}
