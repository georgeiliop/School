#include <stdio.h>
#include <string.h>

int strcomp(char str1[],char str2[]);
int main()
{
	system("chcp 1253");
	char str1[100],str2[100];
	int res;
	printf("���� ��� 1�\n");
	scanf("%s",&str1);
	printf("���� ��� 2�\n");
	scanf(" %s",&str2);
	res=strcomp(str1,str2);
	if(res==1)
	{
		printf(" ��� , �� ������� ������������� ���������� ��� �����\n");
	}
	else
	{
		printf(" ��� ,�� ������� ������������� ��� ���������� ��� ����� \n");
	}
	getchar();
	return 0;
}

int strcomp(char str1[],char str2[])
{
	int count1,count2,count3,flag,i;
	count1=strlen(str1);
	count2=strlen(str2);
	int j=count2;
	for(i=count1;i>=count1-count2;i--)
	{
		if(str1[i]==str2[j])
		{
			flag=1;
		}
		else
		{
			flag=0;
			break;
		}	
		j--;
				
	}

	return flag;
}

