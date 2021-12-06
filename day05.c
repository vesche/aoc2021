#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define INPUT "inputs/day05.txt"

int cpf(int x, int y) {
    return ((x + y)*(x + y + 1)/2) + y;
}

int solve(bool part2)
{
    FILE *fp;
    char *line = NULL;
    size_t len = 0;

    fp = fopen(INPUT, "r");
    if (fp == NULL) {
        perror(INPUT);
        exit(1);
    }

    int length = cpf(1000, 1000);
    int intersections[length];
    memset(intersections, 0, sizeof intersections);

    while (getline(&line, &len, fp) != -1) {
        line[strcspn(line, "\r\n")] = 0;
        int x1, y1, x2, y2;
        sscanf(line, "%d,%d -> %d,%d", &x1, &y1, &x2, &y2);
        int diff, stable, low;
        if (!(x1 == x2 || y1 == y2)) {
            if (!part2) {
                continue;
            }
            int x_low, x_high, y_low, y_high;
            if (x1 < x2) {
                x_low = x1;
                x_high = x2;
                y_low = y1;
                y_high = y2;
            } else {
                x_low = x2;
                x_high = x1;
                y_low = y2;
                y_high = y1;
            }
            if (y_low < y_high) {
                for (int i=x_low; i <= x_high; i++) {
                    intersections[cpf(i,(i-x_low)+y_low)] += 1;
                }
            } else {
                for (int i=y_low; i >= y_high; i--) {
                    intersections[cpf((y_low-i)+x_low,i)] += 1;
                }
            }
        } else if (x1 == x2) {
            diff = abs(y1 - y2);
            stable = x1;
            if (y1 > y2) {
                low = y2;
            } else {
                low = y1;
            }
            for (int i=low; i <= low+diff; i++) {
                intersections[cpf(stable, i)] += 1;
            }
        } else if (y1 == y2) {
            diff = abs(x1 - x2);
            stable = y1;
            if (x1 > x2) {
                low = x2;
            } else {
                low = x1;
            }
            for (int i=low; i <= low+diff; i++) {
                intersections[cpf(i, stable)] += 1;
            }
        }
    }

    int count = 0;
    for (int i = 0; i < length; i++) {
        if (intersections[i] > 1) {
            count += 1;
        }
    }
    return count;
}

int main() {
    int part1 = solve(false);
    printf("part 1: %d\n", part1);
    int part2 = solve(true);
    printf("part 2: %d\n", part2);
    return 0;
}