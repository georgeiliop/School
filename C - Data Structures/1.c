#include <stdio.h>
void function(float pin[] , float numb , float *min , float *max , float *avg );


int main()
{	int i;
	float arr[100],numb,min,max,avg,one;
	
	do
	{	
		scanf("%f",&arr[i]);
		
		numb++;
		i++;
		
	} while(arr[i-1]!=-1);
	
	function(arr,numb,&min,&max,&avg);
	printf("%f %f %f",min,max,avg);
	getchar();
	return 0;
	

	
}

void function(float pin[],float numb,float *min,float *max,float *avg)
{
	int i=0;
	float minimum=pin[0],maximum=pin[0], sum=0;
	while(pin[i]!=-1)
	{
		if(pin[i]<minimum)
		{
			minimum=pin[i];
		}
		if(pin[i]>maximum)
		{
			maximum=pin[i];
		}
		sum=sum+pin[i];
		i++;
		
		
	}
	printf("%f\n",numb);
	*avg=sum/(numb-1);
	*min=minimum;
	*max=maximum;
	
}
