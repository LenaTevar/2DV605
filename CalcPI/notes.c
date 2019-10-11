

float time;
cudaEvent_t start, stop;

HANDLE_ERROR( cudaEventCreate(&start) );
HANDLE_ERROR( cudaEventCreate(&stop) );
HANDLE_ERROR( cudaEventRecord(start, 0) );

kernel_call<<<dimGrid, dimBlock, 0>>>();

HANDLE_ERROR( cudaEventRecord(stop, 0) );
HANDLE_ERROR( cudaEventSynchronize(stop) );
HANDLE_ERROR( cudaEventElapsedTime(&time, start, stop) );

printf("Time to generate:  %3.1f ms \n", time);

    numBlocks = 3;

    numThreadsPerBlock = 256;

    dim3 dimGrid(numBlocks);

    dim3 dimBlock(numThreadsPerBlock);

    func <<< dimGrid, dimBlock >>> (myArray)