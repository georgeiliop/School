#include <stdio.h>

int main()
{
    printf("How many rows do you want?\n");
    int rows, i, j, k = -1;
    scanf("%d", &rows);
    for (i = 0; i < rows; i++) /*����� �����*/
    {
        for (j = -1; j < i; j++) {
            printf("*");
        }
        printf("\n\n");
    }
    for (i = 0; i < rows; i++) /*������� �����*/
    {
        for (j = 0; j < rows - (i + 1); j++) {
            printf(" ");
        }
        for (j = 0; j < rows - (rows - (i + 1)); j++) {

            printf("*");
        }
        printf("\n\n");
    }
    for (i = 0; i < rows; i++) /*����� �����*/
    {
        for (j = 0; j < rows - (i + 1); j++) {
            printf(" ");
        }
        k = k + 2;
        for (j = 0; j < k; j++) {
            printf("*");
        }
        printf("\n\n");
    }
    for (i = 0; i < rows; i++) /* ������� ����� */
    {
        for (j = 0; j < rows; j++) {

            if (i == rows - 1 || i == 0 || j == rows - 1 || j == 0) {
                printf("*");
            }
            else if (i == j || j == rows - i - 1) {
                printf(".");
            }
            else {
                printf(" ");
            }
        }
        printf("\n\n");
    }
    system("pause");
    return 0;
}
