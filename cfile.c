#include <stdio.h>

extern double compute_acceleration(double V_final, double V_initial, double time);

int main() {
    double V_final, V_initial, time, acceleration;

    printf("Enter final velocity (m/s): ");
    scanf("%lf", &V_final);
    printf("Enter initial velocity (m/s): ");
    scanf("%lf", &V_initial);
    printf("Enter time (s): ");
    scanf("%lf", &time);

    acceleration = compute_acceleration(V_final, V_initial, time);

    printf("The acceleration is: %.2f m/s^2\n", acceleration);

    return 0;
}