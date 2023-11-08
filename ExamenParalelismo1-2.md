Programacion de Paralelismo - Examen Parcial 2

Explicacion:
Los codigos muestran una tabla de datos la cual se distribulle de la siguiente manera.
    -Que tipo de Accion se esta llevando a cabo.
    -El porcentage de tiempo que tomo ralizar una accion.
    -El tiempo realizado en hacer la funcion.
    -La cantidad de veces en las que se realizo la funcion.
    -El tiempo promedio que tomo realizar esa funcion.
    -El Tiempo Minimo que tomo realizar esa funcion.
    -El Tiempo Maximo que tomo realizar esa funcion.
    -Nombre de la funcion Realizada.

-----------------------------------------------------------------------
Primer Codigo:

==1011== NVPROF is profiling process 1011, command: ./simpleMathAoS
==1011== Warning: Unified Memory Profiling is not supported on the current configuration because a pair of devices without peer-to-peer support is detected on this multi-GPU setup. When peer mappings are not available, system falls back to using zero-copy memory. It can cause kernels, which access unified memory, to run slower. More details can be found at: http://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#um-managed-memory
==1011== Profiling application: ./simpleMathAoS
==1011== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:   80.19%  23.304ms         2  11.652ms  8.6804ms  14.623ms  [CUDA memcpy DtoH]
                   18.05%  5.2457ms         1  5.2457ms  5.2457ms  5.2457ms  [CUDA memcpy HtoD]
                    0.88%  256.10us         1  256.10us  256.10us  256.10us  warmup(innerStruct*, innerStruct*, int)
                    0.88%  255.85us         1  255.85us  255.85us  255.85us  testInnerStruct(innerStruct*, innerStruct*, int)
      API calls:   88.83%  566.38ms         2  283.19ms  376.90us  566.01ms  cudaMalloc
                    5.61%  35.742ms         1  35.742ms  35.742ms  35.742ms  cudaDeviceReset
                    4.90%  31.267ms         3  10.422ms  6.6946ms  15.576ms  cudaMemcpy
                    0.34%  2.1562ms         1  2.1562ms  2.1562ms  2.1562ms  cuDeviceGetPCIBusId
                    0.19%  1.2200ms         2  610.00us  446.90us  773.10us  cudaFree
                    0.11%  669.90us         2  334.95us  334.90us  335.00us  cudaDeviceSynchronize
                    0.03%  161.60us         2  80.800us  63.500us  98.100us  cudaLaunchKernel
                    0.00%  14.600us       101     144ns     100ns  1.3000us  cuDeviceGetAttribute
                    0.00%  6.1000us         1  6.1000us  6.1000us  6.1000us  cudaSetDevice
                    0.00%  5.8000us         2  2.9000us  2.6000us  3.2000us  cudaGetLastError
                    0.00%  4.7000us         1  4.7000us  4.7000us  4.7000us  cudaGetDeviceProperties
                    0.00%  1.4000us         3     466ns     200ns  1.0000us  cuDeviceGetCount
                    0.00%     800ns         2     400ns     100ns     700ns  cuDeviceGet
                    0.00%     600ns         1     600ns     600ns     600ns  cuDeviceGetName
                    0.00%     400ns         1     400ns     400ns     400ns  cuDeviceTotalMem
                    0.00%     200ns         1     200ns     200ns     200ns  cuDeviceGetUuid
Explicacion:
    Se utilisa un AoS para almacenar datos y ver el desempeño de la GPU.
    se utilizo tambien cudaMalloc para asignar Bytes de memoria lineal en el dispositivo y manda un puntero a la memopria asignada, la importancia de esto es dar un valor y que este no sea borrado en un futuro.

-[CUDA memcpy DtoH]: Copia la memoria del dispositivo y la manda al host.
-[CUDA memcpy HtoD]: Copia la memoria del host y la manda al dispositivo.
-warmup(innerStruct*, innerStruct*, int): guarda valores temporales de X e Y para una matriz
-testInnerStruct(innerStruct*, innerStruct*, int): ingresa los valores a una matriz
-cudaMalloc: asigna Bytes de memoria lineal al dispositivo y manda un puntero a la memopria asignada.
-cudaDeviceReset: Limpia el uso de recursos del  dispositivo asignado.
-cudaMemcpy: Copia los datos del dispositivo asignado.
-cuDeviceGetPCIBusId: manda la configuracion de la memoria compartida al dispositivo actual.
-cudaFree: Libera Espacio en la memoria del dispositivo actual.
-cudaDeviceSynchronize: hace que el dispositivo seleccionado espere a terminar sus acciones.
-cudaLaunchKernel: Inicia el Kernel en el Dispositivo Actual.
-cuDeviceGetAttribute: Imprime informacion del Dispositivo actual.
-cudaSetDevice: Setea el dispositivo actual para realizar ejecuciones como GPU.
-cudaGetLastError: Imprime el ultimo Error.
-cudaGetDeviceProperties: Imprime informacion sobre el Dispositivo actual.
-cuDeviceGetCount: Imprime el numero de dispositivos disponibles.
-cuDeviceGet: imprime un id al dispositivo
-cuDeviceGetName: imprime una cadena de id's para el dispositivo.
-cuDeviceTotalMem: Imprime la cantidad total de memoria del dispositivo.
-cuDeviceGetUuid: Imprime un UUID para el Dispositivo.

------------------------------------------------------------------------------------
Segundo Codigo:

==1027== NVPROF is profiling process 1027, command: ./simpleMathSoA
==1027== Warning: Unified Memory Profiling is not supported on the current configuration because a pair of devices without peer-to-peer support is detected on this multi-GPU setup. When peer mappings are not available, system falls back to using zero-copy memory. It can cause kernels, which access unified memory, to run slower. More details can be found at: http://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#um-managed-memory
==1027== Profiling application: ./simpleMathSoA
==1027== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:   73.35%  12.215ms         2  6.1076ms  3.7599ms  8.4554ms  [CUDA memcpy DtoH]
                   23.58%  3.9265ms         1  3.9265ms  3.9265ms  3.9265ms  [CUDA memcpy HtoD]
                    1.54%  256.42us         1  256.42us  256.42us  256.42us  warmup2(InnerArray*, InnerArray*, int)
                    1.54%  256.03us         1  256.03us  256.03us  256.03us  testInnerArray(InnerArray*, InnerArray*, int)
      API calls:   90.98%  584.89ms         2  292.45ms  380.00us  584.51ms  cudaMalloc
                    5.47%  35.165ms         1  35.165ms  35.165ms  35.165ms  cudaDeviceReset
                    2.89%  18.564ms         3  6.1881ms  3.9129ms  9.2690ms  cudaMemcpy
                    0.39%  2.4897ms         1  2.4897ms  2.4897ms  2.4897ms  cuDeviceGetPCIBusId
                    0.15%  981.80us         2  490.90us  359.80us  622.00us  cudaFree
                    0.11%  682.20us         2  341.10us  302.90us  379.30us  cudaDeviceSynchronize
                    0.01%  94.200us         2  47.100us  43.700us  50.500us  cudaLaunchKernel
                    0.00%  16.500us       101     163ns     100ns  1.4000us  cuDeviceGetAttribute
                    0.00%  5.9000us         1  5.9000us  5.9000us  5.9000us  cudaSetDevice
                    0.00%  5.1000us         1  5.1000us  5.1000us  5.1000us  cudaGetDeviceProperties
                    0.00%  4.7000us         2  2.3500us  2.3000us  2.4000us  cudaGetLastError
                    0.00%  1.4000us         3     466ns     200ns  1.0000us  cuDeviceGetCount
                    0.00%  1.2000us         1  1.2000us  1.2000us  1.2000us  cuDeviceGetName
                    0.00%  1.1000us         2     550ns     100ns  1.0000us  cuDeviceGet
                    0.00%     300ns         1     300ns     300ns     300ns  cuDeviceTotalMem
                    0.00%     200ns         1     200ns     200ns     200ns  cuDeviceGetUuid

Este Utilisa una SoA, lo que lo diferencia al anterior es que este almacena datos den el dispositivo actual pero de una manera mas eficiente, aun que solo por unis milisegundos.

-[CUDA memcpy DtoH]: Copia la memoria del dispositivo y la manda al host.
-[CUDA memcpy HtoD]: Copia la memoria del host y la manda al dispositivo.

-warmup2(InnerArray*, InnerArray*, int): Envia los datos hacia la matriz y los coloca en sus espacios correspondientes.
-testInnerArray(InnerArray*, InnerArray*, int): Coloca los valores en el arreglo.

-cudaMalloc: asigna Bytes de memoria lineal al dispositivo y manda un puntero a la memopria asignada.
-cudaDeviceReset: Limpia el uso de recursos del  dispositivo asignado.
-cudaMemcpy: Copia los datos del dispositivo asignado.
-cuDeviceGetPCIBusId: manda la configuracion de la memoria compartida al dispositivo actual.
-cudaFree: Libera Espacio en la memoria del dispositivo actual.
-cudaDeviceSynchronize: hace que el dispositivo seleccionado espere a terminar sus acciones.
-cudaLaunchKernel: Inicia el Kernel en el Dispositivo Actual.
-cuDeviceGetAttribute: Imprime informacion del Dispositivo actual.
-cudaSetDevice: Setea el dispositivo actual para realizar ejecuciones como GPU.
-cudaGetDeviceProperties: Imprime informacion acerca del dispositivo actual.
-cudaGetLastError: Imprime el ultimo Error.
-cudaGetDeviceProperties: Imprime informacion sobre el Dispositivo actual.
-cuDeviceGetCount: Imprime el numero de dispositivos disponibles.
-cuDeviceGetName: imprime una cadena de id's para el dispositivo.
-cuDeviceGet: imprime un id al dispositivo
-cuDeviceTotalMem: Imprime la cantidad total de memoria del dispositivo.
-cuDeviceGetUuid: Imprime un UUID para el Dispositivo.

------------------------------------------------------------------------------------
Tercer Codigo:

==1049== NVPROF is profiling process 1049, command: ./sumArrayZerocpy
==1049== Warning: Unified Memory Profiling is not supported on the current configuration because a pair of devices without peer-to-peer support is detected on this multi-GPU setup. When peer mappings are not available, system falls back to using zero-copy memory. It can cause kernels, which access unified memory, to run slower. More details can be found at: http://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#um-managed-memory
==1049== Profiling application: ./sumArrayZerocpy
==1049== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:   33.33%  3.5200us         1  3.5200us  3.5200us  3.5200us  sumArraysZeroCopy(float*, float*, float*, int)
                   22.73%  2.4000us         2  1.2000us  1.1840us  1.2160us  [CUDA memcpy DtoH]
                   22.12%  2.3360us         1  2.3360us  2.3360us  2.3360us  sumArrays(float*, float*, float*, int)
                   21.82%  2.3040us         2  1.1520us     864ns  1.4400us  [CUDA memcpy HtoD]
      API calls:   94.24%  583.14ms         3  194.38ms  1.8000us  583.14ms  cudaMalloc
                    5.09%  31.475ms         1  31.475ms  31.475ms  31.475ms  cudaDeviceReset
                    0.35%  2.1756ms         1  2.1756ms  2.1756ms  2.1756ms  cuDeviceGetPCIBusId
                    0.16%  988.60us         2  494.30us  3.8000us  984.80us  cudaHostAlloc
                    0.06%  368.90us         2  184.45us  4.5000us  364.40us  cudaFreeHost
                    0.06%  358.00us         4  89.500us  33.100us  129.40us  cudaMemcpy
                    0.04%  218.20us         3  72.733us  2.5000us  208.10us  cudaFree
                    0.01%  60.300us         2  30.150us  28.600us  31.700us  cudaLaunchKernel
                    0.00%  14.900us       101     147ns     100ns  1.0000us  cuDeviceGetAttribute
                    0.00%  6.2000us         1  6.2000us  6.2000us  6.2000us  cudaSetDevice
                    0.00%  2.3000us         1  2.3000us  2.3000us  2.3000us  cudaGetDeviceProperties
                    0.00%  2.1000us         2  1.0500us     600ns  1.5000us  cudaHostGetDevicePointer
                    0.00%  1.6000us         3     533ns     200ns  1.0000us  cuDeviceGetCount
                    0.00%  1.1000us         2     550ns     200ns     900ns  cuDeviceGet
                    0.00%     700ns         1     700ns     700ns     700ns  cuDeviceGetName
                    0.00%     300ns         1     300ns     300ns     300ns  cuDeviceTotalMem
                    0.00%     200ns         1     200ns     200ns     200ns  cuDeviceGetUuid

El codigo muestra como la memoria Zero-copy elimina la necesidad de utilizar memcpy disminullendo asi el tiempo que tarca la GPU en realizar sus operaciones.

-sumArraysZeroCopy(float*, float*, float*, int): Suma dos arrays y los introduce en otro array.
-[CUDA memcpy DtoH]: Hace copias de la memoria desde el device hacia el host.
-sumArrays(float*, float*, float*, int): Suma dos arrays y los introduce en otro array.
-[CUDA memcpy HtoD]: Hace copias de la memoria desde el host hacia el device.

El orden de las siguentes funciones no es el correcto pero las ponde abajo porque las estoy copiando y pegando del problema anterior.

-cudaMalloc: asigna Bytes de memoria lineal al dispositivo y manda un puntero a la memopria asignada.
-cudaDeviceReset: Limpia el uso de recursos del  dispositivo asignado.
-cuDeviceGetPCIBusId: manda la configuracion de la memoria compartida al dispositivo actual.
-cudaFree: Libera Espacio en la memoria del dispositivo actual.
-cudaDeviceSynchronize: hace que el dispositivo seleccionado espere a terminar sus acciones.
-cudaLaunchKernel: Inicia el Kernel en el Dispositivo Actual.
-cuDeviceGetAttribute: Imprime informacion del Dispositivo actual.
-cudaSetDevice: Setea el dispositivo actual para realizar ejecuciones como GPU.
-cudaGetDeviceProperties: Imprime informacion acerca del dispositivo actual.
-cudaGetLastError: Imprime el ultimo Error.
-cudaGetDeviceProperties: Imprime informacion sobre el Dispositivo actual.
-cuDeviceGetCount: Imprime el numero de dispositivos disponibles.
-cuDeviceGetName: imprime una cadena de id's para el dispositivo.
-cuDeviceGet: imprime un id al dispositivo
-cuDeviceTotalMem: Imprime la cantidad total de memoria del dispositivo.
-cuDeviceGetUuid: Imprime un UUID para el Dispositivo.

------------------------------------------------------------------------------------
Cuarto Codigo:

==1071== NVPROF is profiling process 1071, command: ./sumMatrixGPUManaged
==1071== Warning: Unified Memory Profiling is not supported on the current configuration because a pair of devices without peer-to-peer support is detected on this multi-GPU setup. When peer mappings are not available, system falls back to using zero-copy memory. It can cause kernels, which access unified memory, to run slower. More details can be found at: http://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#um-managed-memory
==1071== Profiling application: ./sumMatrixGPUManaged
==1071== Profiling result:
            Type  Time(%)      Time     Calls       Avg       Min       Max  Name
 GPU activities:  100.00%  12.948ms         2  6.4741ms  288.67us  12.660ms  sumMatrixGPU(float*, float*, float*, int, int)
      API calls:   91.39%  815.38ms         4  203.85ms  27.532ms  731.17ms  cudaMallocManaged
                    3.45%  30.801ms         1  30.801ms  30.801ms  30.801ms  cudaDeviceReset
                    3.31%  29.569ms         4  7.3922ms  7.2484ms  7.4490ms  cudaFree
                    1.52%  13.583ms         1  13.583ms  13.583ms  13.583ms  cudaDeviceSynchronize
                    0.24%  2.1681ms         1  2.1681ms  2.1681ms  2.1681ms  cuDeviceGetPCIBusId
                    0.07%  644.20us         2  322.10us  11.200us  633.00us  cudaLaunchKernel
                    0.00%  14.100us       101     139ns     100ns     900ns  cuDeviceGetAttribute
                    0.00%  5.8000us         1  5.8000us  5.8000us  5.8000us  cudaSetDevice
                    0.00%  4.0000us         1  4.0000us  4.0000us  4.0000us  cudaGetDeviceProperties
                    0.00%  1.2000us         3     400ns     100ns     900ns  cuDeviceGetCount
                    0.00%  1.1000us         2     550ns     100ns  1.0000us  cuDeviceGet
                    0.00%     900ns         1     900ns     900ns     900ns  cudaGetLastError
                    0.00%     700ns         1     700ns     700ns     700ns  cuDeviceGetName
                    0.00%     300ns         1     300ns     300ns     300ns  cuDeviceTotalMem
                    0.00%     200ns         1     200ns     200ns     200ns  cuDeviceGetUuid

A diferencia de los ejemplos anteriores la GPU solo se encarga de ralizar Una suma de matrises mediante sumMatrixGPU

-sumMatrixGPU(float*, float*, float*, int, int): Realiza una suma de matrices bidimensionales.
-cudaMallocManaged: Asigna memoria que sera administrada por el sistema de memoria unificada

-cudaDeviceReset: Limpia el uso de recursos del  dispositivo asignado.
-cuDeviceGetPCIBusId: manda la configuracion de la memoria compartida al dispositivo actual.
-cudaFree: Libera Espacio en la memoria del dispositivo actual.
-cudaDeviceSynchronize: hace que el dispositivo seleccionado espere a terminar sus acciones.
-cudaLaunchKernel: Inicia el Kernel en el Dispositivo Actual.
-cuDeviceGetAttribute: Imprime informacion del Dispositivo actual.
-cudaSetDevice: Setea el dispositivo actual para realizar ejecuciones como GPU.
-cudaGetDeviceProperties: Imprime informacion acerca del dispositivo actual.
-cudaGetLastError: Imprime el ultimo Error.
-cudaGetDeviceProperties: Imprime informacion sobre el Dispositivo actual.
-cuDeviceGetCount: Imprime el numero de dispositivos disponibles.
-cuDeviceGetName: imprime una cadena de id's para el dispositivo.
-cuDeviceGet: imprime un id al dispositivo
-cuDeviceTotalMem: Imprime la cantidad total de memoria del dispositivo.
-cuDeviceGetUuid: Imprime un UUID para el Dispositivo.