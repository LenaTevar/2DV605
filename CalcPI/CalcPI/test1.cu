#include <stdio.h>
#include <cuda.h>
#include <cuda.h>
#include <cuda_runtime.h>

#define NUM_BLOCK 256
#define NUM_THREAD 256
#define PI 3.14159265358979323846264

__global__
void calcPI(double *mypi, int iter, double m, int nthreads,
    int nblocks){
        
        double ni;
        int index = blockIdx.x * blockDim.x + threadIdx.x;
        for(int i = index; i < iter; i += nthreads*nblocks){
            ni = ((double)i + 0.5) * m;
            *mypi += 4.0 / (1.0 + ni * ni);
        }
        
}

int main (void) {
    printf("START\n");
    dim3 dimGrid(NUM_BLOCK,1,1);  // Grid dimensions
    dim3 dimBlock(NUM_THREAD,1,1);  // Block dimensions
    int iteArr[3] = { 24000000, 48000000, 94000000 };
    double size, m, *h_pi, *d_pi;
    size = sizeof(double);

    h_pi = (double*)malloc(size);
    cudaMalloc((void **) &d_pi, size);
/*
    for(int i = 0; i < 3; i++){
        m = 1.0 / iteArr[i];
        cudaMemset(d_pi, 0, size);
        calcPI<<<dimGrid, dimBlock>>>(d_pi,iteArr[i],m,NUM_THREAD,NUM_BLOCK);
        cudaMemcpy(h_pi,d_pi, size, cudaMemcpyDeviceToHost);
        h_pi *= m;
    }
*/
        int i = 0;
        m = 1.0 / (double)iteArr[i];
        cudaMemset(d_pi, 0, size);

        printf("iteArr = %d\n", iteArr[i]);
        printf("m = %d\n", m);
        printf("Threads = %d\n", NUM_THREAD);
        printf("Blocks = %d\n", NUM_BLOCK);

        calcPI<<<dimGrid, dimBlock>>>(d_pi,iteArr[i],m,NUM_THREAD,NUM_BLOCK);
        cudaMemcpy(h_pi,d_pi, size, cudaMemcpyDeviceToHost);
        printf("before mypi: %f\n", *h_pi);
        *h_pi *= m;
        printf("after mypi: %f\n", *h_pi);

    free(h_pi);
    cudaFree(d_pi);
    return 0;
}