#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#define PI 3.14159265358979323846264

int main(int argc, char* argv[])
{
	int iterations = 10;
	calcPI(iterations);
}

int calcPI(iterations) {
	double m, ni, mypi = 0.0;
	int i;
	

	m = 1.0 / (double)iterations;
	for (i = 0; i < iterations; i++)
	{
		ni = ((double)i + 0.5) * m;
		mypi += 4.0 / (1.0 + ni * ni);
	}
	mypi *= m;
	printf("MyPI = %.100f\n", mypi);
	printf("MyPI - PI = %.100f\n", (mypi - PI));
}

