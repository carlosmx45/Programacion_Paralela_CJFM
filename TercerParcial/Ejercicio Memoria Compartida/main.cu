#include <cuda_runtime.h>
#include <stdio.h>

#define ARRAY_SIZE 128
#define BANK_SIZE 32

__global__ void padArray(int* array) {
// Shared memory with padding
    __shared__ int sharedArray[ARRAY_SIZE + ARRAY_SIZE / BANK_SIZE];

    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int index = bid * blockDim.x + tid;

// Load data into shared memory with padding
    sharedArray[tid] = array[index];
    __syncthreads();

// Access all keys from the original bank 0 in one clock pulse
    int offset = tid / BANK_SIZE;
    int newIndex = tid + offset;

// Use the modified index for accessing the padded shared memory
    int result = sharedArray[newIndex];

// Print the result for demonstration
    printf("Thread %d: Original Value: %d, Padded Value: %d\n", tid, array[index], result);
}

int main() {
    int array[ARRAY_SIZE];

// Initialize array values (you can replace this with your data)
    for (int i = 0; i < ARRAY_SIZE; ++i) {
        array[i] = i * 2;
    }

    int* d_array;

// Allocate device memory
    cudaMalloc((void**)&d_array, ARRAY_SIZE * sizeof(int));

// Copy array from host to device
    cudaMemcpy(d_array, array, ARRAY_SIZE * sizeof(int), cudaMemcpyHostToDevice);

// Define block and grid dimensions
    dim3 blockDim(BANK_SIZE);
    dim3 gridDim((ARRAY_SIZE + blockDim.x - 1) / blockDim.x);

// Launch kernel
    padArray<<<gridDim, blockDim>>>(d_array);

// Synchronize device to ensure print statements are displayed
    cudaDeviceSynchronize();

// Free allocated memory
    cudaFree(d_array);

    return 0;
}