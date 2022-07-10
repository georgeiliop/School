1)
#include <stdio.h>
#include <stdlib.h>

int main()
{
	int*p;
	p=(int*)malloc(3*sizeof(int));
	scanf("%d %d %d",&p[0],&p[1],&p[2]);
	if(p[0]>p[1]&& p[0>p[2]])
	{
		printf("%d",p[0]);
	}
	else if (p[1]>p[0]&& p[1]>p[2])
	{
		printf("%d",p[1]);
	}
	else
	{
		printf("%d",p[2]);
	}
	return 0;
	
}
2)
#include <stdio.h>
struct book 
{
	char *title;	
	char *authors;
	int *code;
	double *prc;
};
int main()
{
	struct book *ptr;
	ptr=(struct book*)malloc(1*sizeof(struct book));
	(*ptr).title=(char*)malloc(100*sizeof(int));
	(*ptr).authors=(char*)malloc(100*sizeof(int));
	printf("Give the title :");
	scanf("%s",ptr->title);
	printf("Give the author :");
	scanf("%s",ptr->authors);
	printf("Give the code :");
	scanf("%d",&ptr->code);
	printf("Give prc :");
	scanf("%lf",&ptr->prc);
	printf("%s %s %d %f",ptr->title,ptr->authors,ptr->code,ptr->prc);
	return 0;
}

3)
#include <stdio.h>
 int func(int arr[10]);
int main(void) {
    int arr[10],i,a;
    for(i=0;i<10;i++)
    {
        scanf("%d",&arr[i]);
    }
    a=func(arr);
    if(a!=NULL)
	{
    	printf(" Number most repeated : %d",a);
    	
	}
	else
	{
		printf("No repeating numbers");
	}
    return 0;
}
int func(int arr[10])
{
    int i,j,p[10];
    for(i=0;i<10;i++)
    {
    	p[i]=-1;
	}
    for(i=0;i<10;i++)
    {
        for(j=0;j<10;j++)
        {
            if(arr[i]==arr[j])
            {
            	
                p[i]++;
                
            }
        }
    }
    int max=p[0];
    for(i=0;i<10;i++)
	{
        if(p[i]>max)
		{
            max=p[i];
        }
    }
    for(i=0;i<10;i++)
    {
        if(max!=0)
        {
            if(p[i]==max)
            {
            return arr[i];
            }

        }
        else{
            return NULL;
        }

    }

}


