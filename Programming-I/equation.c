#include <stdio.h>
#include <math.h>

int main()
{
    float a, b, c, D;
    printf("Give the coefficients of the equation in order a*x+b*x+c (give the a,b,c)\n");
    scanf("%f %f %f", &a, &b, &c);
    if (a != 0) {

        D = b * b - 4 * a * c;
        printf("Discriminant is equal to:\n");
        printf("%f \n", D);
        if (D > 0) {
            printf("Since the discriminant is positive the equation has two roots,x1 and x2 :\n");
            float x1, x2;
            x1 = (-b + sqrt(D)) / (2 * a);
            x2 = (-b - sqrt(D)) / (2 * a);
            printf(" x1 is %f and x2 is %f \n", x1, x2);
        }
        else if (D == 0) {

            printf("Since the discriminant is equal to 0 the equation has one root, x :\n");
            float x;
            x = -b / 2 * a;
            printf(" x= %f\n", x);
        }
        else {
            float real, imaginary;
            printf("Sice the discriminat is negative , the equation has two complex roots , x1 and x2\n");
            real = -b / (2 * a);
            imaginary = sqrt(-D) / (2 * a);
            printf("x1 = %f+%fi and x2 = %f-%fi", real, imaginary, real, imaginary);
        }
    }
    else {
        float x;
        if (b != 0) {
            x = -c / b;
            printf("The equation has one root x that is equal to %f\n", x);
        }
        else if (b == 0 && c != 0) {
            printf("The equation has no roots\n");
        }
        else {
            printf("the equation has infinite solutions\n");
        }
    }
    system("pause");
    return 0;
}
