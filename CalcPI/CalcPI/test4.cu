#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <cuda_runtime.h>

#include <iostream>
#include <math.h>
#define PI 3.14159265358979323846264
// Kernel function to add the elements of two arrays
__global__
void calcPI(int iter, double *m, double *ni, double *mypi)
{
    /*
    *m = 1.0/(double) iter;

    for(int i = 0; i < iter; i++){
        *ni = ((double) i + 0.5) * *m;
        *mypi += 4.0 / (1.0 + *ni * *ni);
    }
    *mypi *= *m;  
    */
    int index = threadIdx.x;
    int stride = blockDim.x;
    *m = 1.0/(double) iter;

    for(int i = index; i < iter; i+= stride){
        *ni = ((double) i + 0.5) * *m;
        *mypi  += 4.0 / (1.0 + *ni * *ni);
    }
    *mypi  *= *m; 
}

int main(void)
{
    printf("===TEST N 19===\n");
    
    int N;
    double *m;
    double *ni;
    double *mypi;
    int iteArr[3] = { 24000000, 48000000, 94000000 };
    //int iteArr[3] = { 100,200,300};

    double results[3] = { 0, 0, 0 };

    // Allocate Unified Memory – accessible from CPU or GPU
    cudaMallocManaged(&m, sizeof(double));
    cudaMallocManaged(&ni, sizeof(double));
    cudaMallocManaged(&mypi, sizeof(double));
    
    for(int i = 0; i < 3; i++){
        // initialize variables on the host
        *m = 0.0;
        *ni = 0.0;
        *mypi = 0.0;
    
        N = iteArr[i];
        
        // Run kernel on  the GPU
        calcPI<<<1, 1>>>(N, m, ni, mypi);

        // Wait for GPU to finish before accessing on host
        cudaDeviceSynchronize();
        
        
        // Check for errors (all values should be 3.0f)
        results[i] = *mypi;
        printf("Result in loop: %d %f \n", N, *mypi);
    }
    
    for (int j = 0; j < 3; j++){
        printf("\n- Result array: %f\n", results[j]);
    }


    // Free memory
    cudaFree(m);
    cudaFree(ni);
    cudaFree(mypi);
    return 0;
}