#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define PI 3.14159265358979323846264

int main(int argc, char* argv[])
{
	int iterations = 1000000000;
	calcPI(iterations);

}

int calcPI(iterations) {
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
	printf("the time of dif is %f\n", difTime);
	printf("MyPI = %.100f\n", mypi);
	printf("MyPI - PI = %.100f\n", (mypi - PI));
	return 0;
}


/*
CALCULATING TIME 
	clock_t begin = clock();
	calcPI(iterations); //TIME CONSUMING JOB
	clock_t end = clock();
	double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	printf("time spent %d", time_spent);
*/