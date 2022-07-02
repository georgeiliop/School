#include <stdio.h>


int main ()
{
	printf("How many numbers you want to test? : \n\n");
	int N;
	scanf("%d",&N);
	printf("Now give the numbers, type 0 if you want to stop and continue with the programm : \n\n ");
	int numbers[N-1],count=0,i,positive=0,CountPositive=0,negative=1,even=0,odd[N-1],oddcount=0; // ÌåôáâëÞôåò ãéá ôï ðñüãñáììá 
	scanf("%d",&numbers[count]);
	
	do {
		if(numbers[count] != 0 && N != 1){
			count=count+1;
			scanf("%d",&numbers[count]);
			
		}
		
		
	} while( numbers[count] != 0   && count < N-1 && N != 1 );
	
	for(i=0;i <= count;i++){
		
		if (numbers[i]>0){
			positive=positive+numbers[i];
			CountPositive++;
			
		}
		else {
			negative=negative*numbers[i];
		}
		if ((numbers[i] % 2 == 0) != 1){
			odd[oddcount]=numbers[i];
			oddcount++;
			
		}
		else {
			even++;
		}
		
	}
	printf("*******************************************************************************\n\n");
	printf("The average of positive numbers is : %d \n\n",positive/CountPositive);
	
	
	printf("*******************************************************************************\n\n");
	if (negative != 1){
		printf("The product of the negative numbers is : %d \n\n",negative);
	}
	else{
		printf("There were no negative numbers \n\n");
	}
	
	
	printf("*******************************************************************************\n\n");
	printf("The square of each odd number is : \n\n");
	
	
	
	for(i=0;i <oddcount; i++){
		printf("The square of %d is : %d \n\n",odd[i],odd[i]*odd[i]);
	}
	
	
	printf("*******************************************************************************\n\n");
	printf("The number of even numbers is : %d \n\n",even);
	return 0;
}
