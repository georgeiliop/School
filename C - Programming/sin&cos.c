#include <stdio.h>
#include <math.h>
float eisagwgh(float x);
double metgwnias(float x);
double singwnias(double x);
double cosgwnias(double x);
double sugkrish(double x, double y, double z);
#define PI 3.14159
int main()
{
    double singwnia, cosgwnia;
    float x, moires, gwnia;
    moires = eisagwgh(x);
    gwnia = metgwnias(moires);
    singwnia = singwnias(gwnia);
    cosgwnia = cosgwnias(gwnia);
    sugkrish(singwnia, cosgwnia, gwnia);

    system("pause");

    return 0;
}
float eisagwgh(float x)
{
    float moires;
    int flag = 0;
    printf("Give the degrees ( from 0 to 360) : \n");
    do {

        scanf("%f", &moires);
        if (moires >= 0 && moires <= 360)
            flag = 1;
        else
            printf("The answer wasn't valid , please try again :\n");
    } while (flag == 0);

    return moires;
}

double metgwnias(float x)
{
    double gwnia;
    gwnia = x * PI / 180;
    return gwnia;
}

double singwnias(double x)
{
    double para, oros, sum, pros, proros;
    pros = -1;
    para = 3;
    oros = x;
    sum = x;
    do {

        proros = oros;
        oros = proros * (x * x) / (para * (para - 1));

        para = para + 2;
        sum = sum + oros * pros;

        pros = pros * -1;

    } while (fabs(oros - proros) > 0.00001);

    return sum;
}

double cosgwnias(double x)
{
    double para, oros, sum, pros, proros;
    pros = -1;
    para = 2;
    oros = 1;
    sum = 1;
    do {
        proros = oros;
        oros = proros * (x * x) / (para * (para - 1));
        para = para + 2;
        sum = sum + oros * pros;
        pros = pros * -1;

    } while (fabs(oros - proros) > 0.00001);
    return sum;
}

double sugkrish(double x, double y, double z)
{
    double truecos, truesin;
    truesin = sin(z);
    truecos = cos(z);
    if (truesin == x && truecos == y) {
        printf("The sin is %f and the cos is %f :\n", x, y);
    }
    else if (truesin == x) {
        printf("Cos is wrong\n");
    }
    else if (truecos == y) {
        printf("Sin is wrong\n");
    }
    else {
        printf("The results are wrong \n");
    }
    printf("%f %f %f %f\n", truesin, x, truecos, y);
    /*Φαίνονται ίσα , αλλά δεν είναι 100% */
}
