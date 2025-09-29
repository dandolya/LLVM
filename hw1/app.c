#include "sim.h"

#define min(a, b) ((a) < (b) ? (a) : (b))

#define ITERS 1000000000
#define MAX_GRAINS 5000
#define WHITE 0xFFFFFF
#define BLACK 0

static int imgPrev[SIM_X_SIZE][SIM_Y_SIZE];
static int imgNext[SIM_X_SIZE][SIM_Y_SIZE];
static int bufferX[BUFFER_SIZE];
static int bufferY[BUFFER_SIZE];

void paint(int color) {
    int bufferCount = 0;
    for (int i = 0; i < SIM_X_SIZE; i++) {
        for (int j = 0; j < SIM_Y_SIZE; j++) {
            if (imgNext[i][j] != imgPrev[i][j] && imgNext[i][j] == color) {
                if (bufferCount >= BUFFER_SIZE) {
                    continue;
                }
                bufferX[bufferCount] = i;
                bufferY[bufferCount] = j;
                bufferCount++;
                imgPrev[i][j] = imgNext[i][j];
            }
        }
    }
    simPutPixels(bufferX, bufferY, color, bufferCount);
}

void app() {
    for (int i = 0; i < SIM_X_SIZE; i++) {
        for (int j = 0; j < SIM_Y_SIZE; j++) {
            imgPrev[i][j] = BLACK;
            imgNext[i][j] = BLACK;
        }
    }

    for (int iter = 0; iter < ITERS; iter++) {
        int count = 0;

        // moving
        for (int i = 0; i < SIM_X_SIZE; i++) {
            for (int j = SIM_Y_SIZE - 2; j >= 0; j--) {
                if (imgNext[i][j] != BLACK && imgNext[i][j + 1] == BLACK) {
                    imgNext[i][j] = BLACK;
                    imgNext[i][j + 1] = WHITE;
                    count++;
                }
            }
        }

        int height = SIM_Y_SIZE - 2;
        // looking for mountains
        for (int i = 0; i < SIM_X_SIZE; i++) {
            int left = 0;
            int right = 0;
            for (int j = SIM_Y_SIZE - 2; j >= 0 && imgNext[i][j] != 0; j--) {
                height = min(height, j);
                if (i > 0 && imgNext[i - 1][j] == BLACK) {
                    left++;
                } else {
                    left = 0;
                }
                if (i < SIM_X_SIZE - 1 && imgNext[i + 1][j] == BLACK) {
                    right++;
                } else {
                    right = 0;
                }
                if (left == 3 && right == 3) {
                    imgNext[i][j] = BLACK;
                    imgNext[i][j + 1] = BLACK;
                    imgNext[i - 1][j + 2] = WHITE;
                    imgNext[i + 1][j - 2] = WHITE;
                    break;
                }
                if (left == 3) {
                    imgNext[i][j] = BLACK;
                    imgNext[i - 1][j - 1] = WHITE;
                    break;
                }
                if (right == 3) {
                    imgNext[i][j] = BLACK;
                    imgNext[i + 1][j - 1] = WHITE;
                    break;
                }
            }
        }

        // wind
        for (int i = 0; i < height; i++) {
            int c = imgNext[0][i];
            for (int j = 0; j < SIM_X_SIZE - 1; j++) {
                imgNext[j][i] = imgNext[j + 1][i];
            }
            imgNext[SIM_X_SIZE - 1][i] = c;
        }

        // creating
        for (int i = 0; i < 7; i++) {
            if (count < MAX_GRAINS) {
                int x = simRand() % SIM_X_SIZE;
                if (imgNext[x][0] == 0) {
                    imgNext[x][0] = WHITE;
                    count++;
                }
            }
        }

        // painting
        paint(BLACK);
        paint(WHITE);

        simFlush();
    }
}