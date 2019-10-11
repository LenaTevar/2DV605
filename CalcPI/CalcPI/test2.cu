#include <stdio.h>
#include <cuda.h>
/*
Tested blocks/threads: 
256/256
256/1024
128/1024
512/1024
*/
#define NUM_BLOCK  512  
#define NUM_THREAD  1024  
#define PI  3.14159265358979323846  

/* Kernel function */
__global__ void cal_pi(double *mypi, int iter, 
    double m, int nthreads, int nblocks) {
	int i;
	double ni;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  
    // Sequential thread index across the blocks
	for (i = idx; i< iter; i += nthreads * nblocks) {
		ni = (i + 0.5) * m;
		mypi[idx] += 4.0/(1.0 + ni * ni);
	}
}


int main(void) {
    double pi = 0;
	clock_t start,end;
    int iteArr[3] = { 24000000, 48000000, 94000000 };
    //double iteArr[3] = { 24000000000, 48000000000, 94000000000 };
    //int iteArr[3] = { 1, 2, 4 };

    /* Setting upt grid and block dimesions */
    dim3 dimGrid(NUM_BLOCK,1,1);  
    dim3 dimBlock(NUM_THREAD,1,1); 
    printf("REPORT # of blocks = %d, # of threads/block = %d\n", NUM_BLOCK, NUM_THREAD);

    /* Host and Device variables (arrays) */
    double *h_pi, *d_pi;  
    for (int i = 0; i < 3; i++){
        int currentIter = iteArr[i];

        start = clock(); // because why not...
        double step = 1.0 / currentIter;  
        size_t size = NUM_BLOCK*NUM_THREAD*sizeof(double);  
        
        /* Allocate on host*/
        h_pi = (double *)malloc(size);  
    
        /*Allocate on device*/
        cudaMalloc((void **) &d_pi, size);  
        /* Set d_pi to zero */
        cudaMemset(d_pi, 0, size);
        /* Run Kernel */
        cal_pi <<<dimGrid, dimBlock>>> (d_pi, currentIter, 
            step, NUM_THREAD, NUM_BLOCK); 
    
        /* Copy results from device to the host*/
        cudaMemcpy(h_pi, d_pi, size, cudaMemcpyDeviceToHost);
        
        /* Finish pi in host */
        for( int j = 0; j < NUM_THREAD*NUM_BLOCK; j++)
            pi += h_pi[j];
        pi *= step;
        printf("\tMyPI = %20.18f \n",pi);
        printf("\tMyPI - PI = %20.18f \n",pi-PI);
        end = clock();
 
        /* Print Report */
        printf("\tTime estimation in CPU : %f s.\n\n",(end-start)/(float)CLOCKS_PER_SEC);
    }

    printf("\tCheck nvprof for more time estimation.\n");
    	
    /* Clean host and device var*/
	free(h_pi); 
	cudaFree(d_pi);

	return 0;
}