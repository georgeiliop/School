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
