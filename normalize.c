#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

    if (argc == 1) {
        printf("Usage: normalize x1 x2 x3 ...\n");
        return 1;
    }

    double min = atof(argv[1]);
    double max = atof(argv[1]);

    /* znajdowanie min i max */
    for (int i = 2; i < argc; i++) {
        double val = atof(argv[i]);
        if (val < min) min = val;
        if (val > max) max = val;
    }

    /* normalizacja */
    for (int i = 1; i < argc; i++) {
        double x = atof(argv[i]);
        double normalized = (x - min) / (max - min);
        printf("%.6f ", normalized);
    }

    printf("\n");
    return 0;
}
