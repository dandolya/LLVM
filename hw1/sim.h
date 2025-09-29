#ifndef SIM_H
#define SIM_H

#define SIM_X_SIZE 1024
#define SIM_Y_SIZE 512
#define BUFFER_SIZE 6200

#ifndef __sim__
void simInit();
void app();
void simExit();
void simFlush();
void simPutPixel(int x, int y, int argb);
void simPutPixels(int x[], int y[], int argb, int count);
int simRand(void);
#endif // __sim__

#endif // SIM_H
