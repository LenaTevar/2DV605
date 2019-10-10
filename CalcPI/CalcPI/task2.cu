#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <cuda_runtime.h>
#define PI 3.14159265358979323846264
__global__ void calcPi(int *iter, double *result){
	double m, ni, diff, mypi = 0.0; 
	m = 1.0/(double)*iter;

	for(int i = 0; i < *iter; i++){
		ni =((double)i + 0.5) * m;
		mypi += 4.0 / (1.0 + ni * ni);
	}

	mypi *= m;
	diff = mypi - PI;
	*result = diff;
}


int main (void) {
	printf("START\n");
	int arrLength = 3;
	int iteArr[3] = { 240, 480, 960 };
	double myResults[3];

	int *d_ite, ite;
	double *d_result, h_result;
	int sizeInt = sizeof(int);
	double sizeDou = sizeof(double);

/*
 * Allocate space for device copies
 */
	cudaMalloc((void**) &d_ite, sizeInt);
	cudaMalloc((void**) &d_result, sizeDou);

for(int j = 0; j < arrLength; j++){
	printf("Running %d j: %d\n", iteArr[j], j);
	ite = iteArr[j];
/*
* Copy input
*/
	cudaMemcpy(d_ite, &ite, sizeInt, cudaMemcpyHostToDevice);
	//cudaMemcpy(d_result, &result, sizeDou , cudaMemcpyHostToDevice);
/*
* Launch Kernel
*/
	calcPi<<<1,1>>>(d_ite, d_result);
/*
* Copy result back to host
*/
	cudaMemcpy(&h_result, d_result, sizeDou, cudaMemcpyDeviceToHost);
	//printf("result %.70f\n", h_result);

    myResults[j] = h_result;
    
	//printf("mypi %f\n", mypi[j]);
	
/*
* Clean up
*/
cudaFree(d_ite); cudaFree(d_result);


}//for loop

for(int k = 0; k < 3; k++){

	printf("RESULT %d =  %.70f\n", k, myResults[k]);
}
printf("PASSED\n");

return 0;


}
