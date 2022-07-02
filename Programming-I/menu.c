#include <stdio.h>
#include <string.h>
int menu();
double one(double x, double y);
double* two(double x, double y);
double three(double x, double y);

int main()
{
    int sunolo1 = 0, sunolo2 = 0, sunolo3 = 0;
    const char *ap[3], *ap2 = "oxi";
    do {

        printf("Dwse to A kai to B\n");
        int A, B, x;
        scanf("%d %d", &A, &B);
        x = menu();
        if (x == 1) {

            double t;
            t = one(A, B);
            printf("%f\n", t);
            sunolo1 = sunolo1 + 1;
        }
        else if (x == 2) {
            double* t;
            t = two(A, B);
            printf("A!=%f , B!= %f\n", t[0], t[1]);
            sunolo2 = sunolo2 + 1;
        }
        else {
            double t;
            t = three(A, B);
            if (t != 0) {
                printf("%f\n", t);
            }
            else {
                printf("Adunato , den uparxei arnhtiko paragwgiko enws arithmou\n");
            }
            sunolo3 = sunolo3 + 1;
        }
        printf("Theleis na kaneis kai allh energeia? (An oxi ,plhktrologise 'oxi' , alliws 'nai')\n");

        scanf("%s", ap);
        if (strcmp(ap, ap2) == 0) {
            printf("Xrhsimopoihsew %d fores thn 1) , %d fores thn 2 , %d fores thn 3\n", sunolo1, sunolo2, sunolo3);
        }

    } while (strcmp(ap, ap2) != 0);

    system("pause");
    return 0;
}
int menu()
{
    printf("Epelekse mia apo tis 3 leitourgeies ( dwse 1,2 h 3)\n 1) Ypologimsos ths dunamhns A hs thn B \n 2) Ypologismos tou A! h tou B! \n 3)Ypologismos tou plhthous A ana B\n");
    int a;
    scanf("%d", &a);
    return a;
}
double one(double x, double y)
{
    int i;
    double u = 1;
    for (i = 0; i < y; i++) {

        u = u * x;
    }

    return u;
}
double* two(double x, double y)
{
    double u = x;
    int i;
    for (i = 1; i < x; i++) {

        u = u * i;
    }

    double k = y;
    for (i = 1; i < y; i++) {
        k = k * i;
    }
    static double s[2];
    s[0] = u;
    s[1] = k;
    return s;
}
double three(double x, double y)
{
    int i;
    double p;
    if (x >= y) {

        double u = 1;
        for (i = 1; i <= x; i++) {
            u = u * i;
        }
        double k = 1;
        for (i = 1; i <= y; i++) {
            k = k * i;
        }
        double s = 1;
        for (i = 1; i <= x - y; i++) {
            s = s * i;
        }
        printf("%f %f %f\n", u, k, s);
        p = u / (k * s);
    }
    else {
        p = 0;
    }
    return p;
}
