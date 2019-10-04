#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#define PI 3.14159265358979323846264



void calcPI(int iterations) {
	double m, ni, mypi = 0.0;
	double difTime;
	int i;
	double start = omp_get_wtime();

	m = 1.0 / (double)iterations;


	for (i = 0; i < iterations; i++)
	{
		ni = ((double)i + 0.5) * m;
		mypi += 4.0 / (1.0 + ni * ni);
	}

	mypi *= m;
	double end = omp_get_wtime();
	difTime = end - start;

	printf("Iterations %d \tExecution time %f\n", iterations, difTime);
	printf("\tMyPI = %.70f\n", mypi);
	printf("\tMyPI - PI = %.70f\n\n", (mypi - PI));
	
}

int main(int argc, char* argv[])
{
	int iterations = 1000000000;
	int iteArr[3] = { 24000000, 48000000, 96000000 };

	for (int i = 0; i < 3; i++) {
		calcPI(iteArr[i]);
	}
}