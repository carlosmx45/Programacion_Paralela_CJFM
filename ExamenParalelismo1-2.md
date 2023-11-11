# Examen Programacion de Paralelismo 1-2

## Reporte 1 memTransfer
==935== NVPROF is profiling process 935, command: ./memTransfer

==935== Profiling application: ./memTransfer

==935== Profiling result:

|            Type | Time(%) |     Time  |   Calls |      Avg |      Min |      Max | Name|
|      :---:      | :---:   |  :---:    |  :---:  |  :---:   |   :---:  |   :---:  |:---:|
| GPU activities: |  51.53% | 4.4243ms  |       1 | 4.4243ms | 4.4243ms | 4.4243ms | [CUDA memcpy DtoH]|
|                 |  48.47% | 4.1616ms  |       1 | 4.1616ms | 4.1616ms | 4.1616ms | [CUDA memcpy HtoD]|
|      API calls: |  93.40% | 667.18ms  |       1 | 667.18ms | 667.18ms | 667.18ms | cudaMalloc|
|                 |   4.85% | 34.645ms  |       1 | 34.645ms | 34.645ms | 34.645ms | cudaDeviceReset|
|                 |   1.28% | 9.1722ms  |       2 | 4.5861ms | 4.1593ms | 5.0129ms | cudaMemcpy|
|                 |   0.40% | 2.8733ms  |       1 | 2.8733ms | 2.8733ms | 2.8733ms | cuDeviceGetPCIBusId|
|                 |   0.05% | 365.89us  |       1 | 365.89us | 365.89us | 365.89us | cudaFree|
|                 |   0.00% | 22.965us  |     101 |    227ns |    130ns | 1.1720us | cuDeviceGetAttribute|
|                 |   0.00% | 18.164us  |       1 | 18.164us | 18.164us | 18.164us | cudaSetDevice|
|                 |   0.00% | 4.9690us  |       1 | 4.9690us | 4.9690us | 4.9690us | cudaGetDeviceProperties|
|                 |   0.00% | 1.8930us  |       3 |    631ns |    230ns | 1.3420us | cuDeviceGetCount|
|                 |   0.00% | 1.1820us  |       2 |    591ns |    170ns | 1.0120us | cuDeviceGet|
|                 |   0.00% |    852ns  |       1 |    852ns |    852ns |    852ns | cuDeviceGetName|
|                 |   0.00% |    421ns  |       1 |    421ns |    421ns |    421ns | cuDeviceTotalMem|
|                 |   0.00% |    221ns  |       1 |    221ns |    221ns |    221ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 2 actividades de GPU:
- CUDA memcpy HtoD
    - Esta funcion se ejecuta en la linea 40
    - Se encarga de copiar datos desde el host al dispositivo
    - Esta operacion tomo un 52.15% del tiempo de ejecucion con un total de 2.11 ms y fue llamado 1 vez

- CUDA memcpy DtoH
    - Esta funcion se ejecuta en la linea 43
    - Se encarga de copiar datos desde el dispositivo al host
    - Esta operacion tomo un 47.85% del tiempo de ejecucion con un total de 1.93 ms y fue llamado 1 vez

### Actividades de la API
#### Se realizaron 13 actividades de la API:
- cudaMalloc
    - Esta funcion se ejecuta en la linea 34
    - Se encarga de asignar memoria en el dispositivo CUDA
    - Esta operacion tomo un 93.74% del tiempo de ejecucion con un total de 577.35 ms y fue llamado 1 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en la linea 50
    - Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - Esta operacion tomo un 5.15% del tiempo de ejecucion con un total de 31.72 ms y fue llamado 1 vez

- cudaMemcpy
    - Esta funcion se ejecuta en la linea 40 en modo CPU a GPU y la linea 43 en modo GPU a CPU
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - Esta operacion tomo un 0.71% del tiempo de ejecucion con un total de 4.38 ms y fue llamado 2 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - Esta operacion tomo un 0.34% del tiempo de ejecucion con un total de 2.09 ms y fue llamado 1 vez

- cudaFree
    - Esta funcion se ejecuta en la linea 46
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - Esta operacion tomo un 0.05% del tiempo de ejecucion con un total de 306.30 us y fue llamado 1 vez

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 14.70 us y fue llamado 101 veces

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 16
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 8.00 us y fue llamado 1 vez

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 24
    - Sirve para obtener informacion acerca de la GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 2.80 us y fue llamado 1 vez

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.40 us y fue llamado 3 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 900 ns y fue llamado 2 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 900 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 400 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez

---
## Reporte 2 pinMemTransfer
==947== NVPROF is profiling process 947, command: ./pinMemTransfer

==947== Profiling application: ./pinMemTransfer

==947== Profiling result:

|            Type | Time(%) |     Time  |   Calls |      Avg |      Min |      Max | Name|
|      :---:      | :---:   |  :---:    |  :---:  |  :---:   |   :---:  |   :---:  |:---:|
| GPU activities: |  52.30% | 3.2299ms  |       1 | 3.2299ms | 3.2299ms | 3.2299ms | [CUDA memcpy DtoH]|
|                 |  47.70% | 2.9458ms  |       1 | 2.9458ms | 2.9458ms | 2.9458ms | [CUDA memcpy HtoD]|
|      API calls: |  93.45% | 692.70ms  |       1 | 692.70ms | 692.70ms | 692.70ms | cudaHostAlloc|
|                 |   4.81% | 35.636ms  |       1 | 35.636ms | 35.636ms | 35.636ms | cudaDeviceReset|
|                 |   0.88% | 6.5215ms  |       2 | 3.2608ms | 3.1202ms | 3.4013ms | cudaMemcpy|
|                 |   0.41% | 3.0659ms  |       1 | 3.0659ms | 3.0659ms | 3.0659ms | cuDeviceGetPCIBusId|
|                 |   0.30% | 2.2360ms  |       1 | 2.2360ms | 2.2360ms | 2.2360ms | cudaFreeHost|
|                 |   0.09% | 692.67us  |       1 | 692.67us | 692.67us | 692.67us | cudaMalloc|
|                 |   0.05% | 362.56us  |       1 | 362.56us | 362.56us | 362.56us | cudaFree|
|                 |   0.00% | 19.865us  |     101 |    196ns |    130ns | 1.5730us | cuDeviceGetAttribute|
|                 |   0.00% | 13.686us  |       1 | 13.686us | 13.686us | 13.686us | cudaSetDevice|
|                 |   0.00% | 5.2500us  |       1 | 5.2500us | 5.2500us | 5.2500us | cudaGetDeviceProperties|
|                 |   0.00% | 2.4440us  |       3 |    814ns |    280ns | 1.7440us | cuDeviceGetCount|
|                 |   0.00% | 2.2040us  |       2 | 1.1020us |    250ns | 1.9540us | cuDeviceGet|
|                 |   0.00% | 1.0320us  |       1 | 1.0320us | 1.0320us | 1.0320us | cuDeviceGetName|
|                 |   0.00% |    411ns  |       1 |    411ns |    411ns |    411ns | cuDeviceTotalMem|
|                 |   0.00% |    251ns  |       1 |    251ns |    251ns |    251ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 2 actividades de GPU:
- CUDA memcpy HtoD
    - Esta funcion se ejecuta en la linea 53
    - se encarga de copiar datos desde el host al dispositivo
    - Esta operacion tomo un 50.57% del tiempo de ejecucion con un total de 1.30 ms y fue llamado 1 vez

- CUDA memcpy DtoH
    - Esta funcion se ejecuta en la linea 56
    - se encarga de copiar datos desde el dispositivo al host
    - Esta operacion tomo un 49.43% del tiempo de ejecucion con un total de 1.27 ms y fue llamado 1 vez

### Actividades de la API
#### Se realizaron 15 actividades de la API:
- cudaHostAlloc
    - No encontre esta funcion en el codigo.
    - Se encarga de asignar memoria en el host
    - Esta operacion tomo un 93.65% del tiempo de ejecucion con un total de 564.84 ms y fue llamado 1 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en las lineas 30 y 63
    - Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - Esta operacion tomo un 5.15% del tiempo de ejecucion con un total de 31.05 ms y fue llamado 1 vez

- cudaMemcpy
    - Esta funcion se ejecuta en las lineas 53 y 56
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - Esta operacion tomo un 0.45% del tiempo de ejecucion con un total de 2.73 ms y fue llamado 2 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - Esta operacion tomo un 0.34% del tiempo de ejecucion con un total de 2.06 ms y fue llamado 1 vez

- cudaFreeHost
    - Esta funcion se ejecuta en la linea 60
    - Sirve para liberar memoria de tipo page-locked
    - Esta operacion tomo un 0.30% del tiempo de ejecucion con un total de 1.80 ms y fue llamado 1 vez

- cudaMalloc
    - Esta funcion se ejecuta en la linea 45
    - Se encarga de asignar memoria en el dispositivo CUDA
    - Esta operacion tomo un 0.06% del tiempo de ejecucion con un total de 342.90 us y fue llamado 1 vez

- cudaFree
    - Esta funcion se ejecuta en la linea 59
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - Esta operacion tomo un 0.04% del tiempo de ejecucion con un total de 261.00 us y fue llamado 1 vez

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 15.40 us y fue llamado 101 veces

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 17
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 7.20 us y fue llamado 1 vez

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 25
    - Sirve para obtener informacion acerca de la GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 2.40 us y fue llamado 1 vez

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.00 us y fue llamado 3 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.00 us y fue llamado 2 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 600 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 400 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez

---
## Reporte 3 readSegment
==963== NVPROF is profiling process 963, command: ./readSegment

==963== Profiling application: ./readSegment

==963== Profiling result:

|            Type | Time(%) |     Time   |  Calls |      Avg |      Min |      Max | Name|
|      :---:      | :---:   |  :---:     |  :---: |  :---:   |   :---:  |   :---:  |:---:|
| GPU activities: |  52.31% | 1.7676ms   |      2 | 883.82us | 861.14us | 906.51us | [CUDA memcpy HtoD]|
|                 |  42.67% | 1.4420ms   |      1 | 1.4420ms | 1.4420ms | 1.4420ms | [CUDA memcpy DtoH]|
|                 |   2.53% | 85.569us   |      1 | 85.569us | 85.569us | 85.569us | warmup(float*, float*, float*, int, int)|
|                 |   2.49% | 84.002us   |      1 | 84.002us | 84.002us | 84.002us | readOffset(float*, float*, float*, int, int)|
|      API calls: |  93.54% | 651.44ms   |      3 | 217.15ms | 730.69us | 649.95ms | cudaMalloc|
|                 |   5.09% | 35.479ms   |      1 | 35.479ms | 35.479ms | 35.479ms | cudaDeviceReset|
|                 |   0.62% | 4.2860ms   |      3 | 1.4287ms | 1.0987ms | 2.0832ms | cudaMemcpy|
|                 |   0.53% | 3.6576ms   |      1 | 3.6576ms | 3.6576ms | 3.6576ms | cuDeviceGetPCIBusId|
|                 |   0.12% | 818.01us   |      3 | 272.67us | 189.53us | 425.11us | cudaFree|
|                 |   0.09% | 623.48us   |      2 | 311.74us | 138.17us | 485.30us | cudaDeviceSynchronize|
|                 |   0.01% | 88.408us   |      2 | 44.204us | 13.075us | 75.333us | cudaLaunchKernel|
|                 |   0.00% | 19.024us   |    101 |    188ns |    130ns | 1.4430us | cuDeviceGetAttribute|
|                 |   0.00% | 9.9490us   |      1 | 9.9490us | 9.9490us | 9.9490us | cudaGetDeviceProperties|
|                 |   0.00% | 6.1410us   |      1 | 6.1410us | 6.1410us | 6.1410us | cudaSetDevice|
|                 |   0.00% | 2.1940us   |      3 |    731ns |    240ns | 1.2630us | cuDeviceGetCount|
|                 |   0.00% | 1.5340us   |      2 |    767ns |    722ns |    812ns | cudaGetLastError|
|                 |   0.00% | 1.2930us   |      2 |    646ns |    241ns | 1.0520us | cuDeviceGet|
|                 |   0.00% | 1.0720us   |      1 | 1.0720us | 1.0720us | 1.0720us | cuDeviceGetName|
|                 |   0.00% |    451ns   |      1 |    451ns |    451ns |    451ns | cuDeviceTotalMem|
|                 |   0.00% |    260ns   |      1 |    260ns |    260ns |    260ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 4 actividades de GPU:
- CUDA memcpy HtoD
    - Esta funcion se ejecuta en la linea 133
    - Se encarga de copiar datos desde el host al dispositivo
    - Esta operacion tomo un 49.71% del tiempo de ejecucion con un total de 992.10 us y fue llamado 1 vez

- CUDA memcpy DtoH
    - Esta funcion ejecutada en las lineas 112 y 113
    - Se encarga de copiar datos desde el dispositivo al host
    - Esta operacion tomo un 45.41% del tiempo de ejecucion con un total de 906.47 us y fue llamado 2 veces

- readOffset
    - Esta funcion es declarada en la linea 56 y es ejecutada en la linea 125
    - Se encarga de realizar la suma de un elemento en 2 arreglos y guardar el resultado en un tercero
    - Esta operacion tomo un 2.48% del tiempo de ejecucion con un total de 49.40 us y fue llamado 1 vez

- warmup
    - Esta funcion es declarada en la linea 48 y es ejecutada en la linea 117
    - Sirve para hacer la misma operacion que readOffset, recibe los mismos atributos
    - Esta operacion tomo un 2.40% del tiempo de ejecucion con un total de 48.00 us y fue llamado 1 vez

### Actividades de la API
#### Se realizaron 16 actividades de la API:
- cudaMalloc
    - Esta funcion se ejecuta en las lineas 107, 108 y 109
    - Se encarga de asignar memoria en el dispositivo CUDA
    - Esta operacion tomo un 93.88% del tiempo de ejecucion con un total de 603.77 ms y fue llamado 3 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en la linea 144
    - Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - Esta operacion tomo un 5.02% del tiempo de ejecucion con un total de 32.29 ms y fue llamado 1 vez

- cudaMemcpy
    - Esta funcion se ejecuta en las lineas 112, 113 y 133
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - Esta operacion tomo un 0.52% del tiempo de ejecucion con un total de 3.36 ms y fue llamado 3 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - Esta operacion tomo un 0.40% del tiempo de ejecucion con un total de 2.54 ms y fue llamado 1 vez

- cudaFree
    - Esta funcion se ejecuta en las lineas 137, 138 y 139
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - Esta operacion tomo un 0.13% del tiempo de ejecucion con un total de 833.20 us y fue llamado 3 vez

- cudaDeviceSynchronize
    - Esta funcion se ejecuta en las lineas 118 y 126
    - Sirve para esperar a que el dispositivo termine
    - Esta operacion tomo un 0.03% del tiempo de ejecucion con un total de 206.30 us y fue llamado 2 veces

- cudaLaunchKernel
    - No encontre esta funcion en el codigo.
    - Se encarga de ejecutar una funcion de la GPU
    - Esta operacion tomo un 0.01% del tiempo de ejecucion con un total de 65.80 us y fue llamado 2 veces

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 15.80 us y fue llamado 101 veces

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 73
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.50 us y fue llamado 1 vez

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 70
    - Sirve para obtener informacion acerca de la GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 4.90 us y fue llamado 1 vez

- cudaGetLastError
    - Esta funcion se ejecuta en las lineas 122 y 130
    - Sirve para retornar el ultimo error que se a producido en el programa y resetearlo a cudaSuccess
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.20 us y fue llamado 2 veces

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 900 ns y fue llamado 3 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 800 ns y fue llamado 2 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 800 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 500 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez
    
---
## Reporte 4 readSegmentUnroll
==985== NVPROF is profiling process 985, command: ./readSegmentUnroll

==985== Profiling application: ./readSegmentUnroll

==985== Profiling result:

|            Type | Time(%) |     Time   |  Calls |      Avg |      Min |      Max | Name|
|      :----:     |  :---:  |  :----:    | :----: |  :----:  |  :----:  |   :---:  |:---:|
| GPU activities: |  59.86% | 3.2882ms   |      3 | 1.0961ms | 868.94us | 1.5457ms | [CUDA memcpy DtoH]|
|                 |  31.90% | 1.7523ms   |      2 | 876.14us | 857.20us | 895.09us | [CUDA memcpy HtoD]|
|                 |   2.02% | 110.91us   |      4 | 27.728us | 26.561us | 28.928us | [CUDA memset]|
|                 |   1.58% | 86.657us   |      1 | 86.657us | 86.657us | 86.657us | readOffsetUnroll4(float*, float*, float*, int, int)|
|                 |   1.56% | 85.729us   |      1 | 85.729us | 85.729us | 85.729us | warmup(float*, float*, float*, int, int)|
|                 |   1.54% | 84.801us   |      1 | 84.801us | 84.801us | 84.801us | readOffsetUnroll2(float*, float*, float*, int, int)|
|                 |   1.54% | 84.482us   |      1 | 84.482us | 84.482us | 84.482us | readOffset(float*, float*, float*, int, int)|
|      API calls: |  92.85% | 643.00ms   |      3 | 214.33ms | 511.27us | 641.93ms | cudaMalloc|
|                 |   5.34% | 37.016ms   |      1 | 37.016ms | 37.016ms | 37.016ms | cudaDeviceReset|
|                 |   1.03% | 7.1436ms   |      5 | 1.4287ms | 1.0554ms | 2.7758ms | cudaMemcpy|
|                 |   0.42% | 2.9003ms   |      1 | 2.9003ms | 2.9003ms | 2.9003ms | cuDeviceGetPCIBusId|
|                 |   0.17% | 1.2059ms   |      4 | 301.47us | 214.76us | 492.97us | cudaDeviceSynchronize|
|                 |   0.13% | 892.63us   |      3 | 297.54us | 177.67us | 489.14us | cudaFree|
|                 |   0.03% | 174.78us   |      4 | 43.695us | 32.993us | 48.763us | cudaMemset|
|                 |   0.02% | 164.32us   |      4 | 41.080us | 15.550us | 83.809us | cudaLaunchKernel|
|                 |   0.00% | 19.819us   |    101 |    196ns |    120ns | 1.4330us | cuDeviceGetAttribute|
|                 |   0.00% | 11.221us   |      1 | 11.221us | 11.221us | 11.221us | cudaGetDeviceProperties|
|                 |   0.00% | 6.8230us   |      1 | 6.8230us | 6.8230us | 6.8230us | cudaSetDevice|
|                 |   0.00% | 4.4580us   |      4 | 1.1140us |    942ns | 1.5830us | cudaGetLastError|
|                 |   0.00% | 1.7840us   |      3 |    594ns |    230ns | 1.2130us | cuDeviceGetCount|
|                 |   0.00% | 1.5930us   |      2 |    796ns |    271ns | 1.3220us | cuDeviceGet|
|                 |   0.00% | 1.0920us   |      1 | 1.0920us | 1.0920us | 1.0920us | cuDeviceGetName|
|                 |   0.00% |    541ns   |      1 |    541ns |    541ns |    541ns | cuDeviceTotalMem|
|                 |   0.00% |    251ns   |      1 |    251ns |    251ns |    251ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 7 actividades de GPU:
- CUDA memcpy DtoH
    - Esta funcion se ejecuta en las lineas 166, 180 y 194
    - Se encarga de copiar datos desde el dispositivo al host
    - Esta operacion tomo un 64.13% del tiempo de ejecucion con un total de 2.06 ms y fue llamado 3 veces

- CUDA memcpy HtoD
    - Esta funcion se ejecuta en las lineas 143 y 144
    - Se encarga de copiar datos desde el host al dispositivo
    - Esta operacion tomo un 27.79% del tiempo de ejecucion con un total de 895.65 us y fue llamado 2 veces

- CUDA memset
    - Esta funcion se ejecuta en las lineas 154, 168, 182 y 196
    - Se usa para inicializar o establecer la memoria de la GPU a un valor
    - Esta operacion tomo un 1.94% del tiempo de ejecucion con un total de 62.59 us y fue llamado 4 veces

- readOffsetUnroll4
    - Esta funcion es declarada en la linea 78 y es ejecutada en la linea 186
    - Se encarga de realizar una suma de valores en 2 arreglos y guardarlo en un tercer arreglo, la diferencia con readOffset es que este segmenta la suma 4 veces
    - Esta operacion tomo un 1.56% del tiempo de ejecucion con un total de 50.36 us y fue llamado 1 vez

- warmup
    - Esta funcion es declarada en la linea 49 y es ejecutada en la linea 148
    - Sirve para hacer la misma operacion que readOffset, recibe los mismos atributos
    - Esta operacion tomo un 1.49% del tiempo de ejecucion con un total de 47.90 us y fue llamado 1 vez

- readOffsetUnroll2
    - Esta funcion es declarada en la linea 66 y es ejecutada en la linea 172
    - Se encarga de realizar una suma de valores en 2 arreglos y guardarlo en un tercer arreglo, la diferencia con readOffset es que este segmenta la suma 2 veces
    - Esta operacion tomo un 1.54% del tiempo de ejecucion con un total de 49.63 us y fue llamado 1 vez

- readOffset
    - Esta funcion es declarada en la linea 57 y es ejecutada en la linea 158
    - Se encarga de realizar la suma de un elemento en 2 arreglos y guardar el resultado en un tercero
    - Esta operacion tomo un 1.55% del tiempo de ejecucion con un total de 49.98 us y fue llamado 1 vez

### Actividades de la API
#### Se realizaron 17 actividades de la API:
- cudaMalloc
    - Esta funcion se ejecuta en las lineas 138, 139 y 140
    - Se encarga de asignar memoria en el dispositivo CUDA
    - Esta operacion tomo un 93.30% del tiempo de ejecucion con un total de 592.46 ms y fue llamado 3 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en la linea 206
    - Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - Esta operacion tomo un 5.46% del tiempo de ejecucion con un total de 34.67 ms y fue llamado 1 vez

- cudaMemcpy
    - Esta funcion se ejecuta en las lineas 143, 144, 166, 180 y 194
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - Esta operacion tomo un 0.69% del tiempo de ejecucion con un total de 4.40 ms y fue llamado 5 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - Esta operacion tomo un 0.32% del tiempo de ejecucion con un total de 2.06 ms y fue llamado 1 vez

- cudaFree
    - Esta funcion se ejecuta en las lineas 199, 200 y 201
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - Esta operacion tomo un 0.12% del tiempo de ejecucion con un total de 749.60 us y fue llamado 3 vez

- cudaDeviceSynchronize
    - Esta funcion se ejecuta en las lineas 149, 159, 173 y 187
    - Sirve para esperar a que el dispositivo termine
    - Esta operacion tomo un 0.06% del tiempo de ejecucion con un total de 357.30 us y fue llamado 4 veces

- cudaMemset
    - Esta funcion se ejecuta en las lineas 154, 168, 182 y 196
    - Sirve para inicializar o establecer la memoria de la GPU a un valor
    - Esta operacion tomo un 0.02% del tiempo de ejecucion con un total de 144.90 us y fue llamado 4 veces

- cudaLaunchKernel
    - No encontre esta funcion en el codigo.
    - Se encarga de ejecutar una funcion de la GPU
    - Esta operacion tomo un 0.01% del tiempo de ejecucion con un total de 91.30 us y fue llamado 4 veces

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 14.60 us y fue llamado 101 veces

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 101
    - Sirve para obtener informacion acerca de la GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 6.90 us y fue llamado 1 vez

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 104
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.70 us y fue llamado 1 vez

- cudaGetLastError
    - Esta funcion se ejecuta en las lineas 153, 163, 177 y 191
    - Sirve para retornar el ultimo error que se a producido en el programa y resetearlo a cudaSuccess
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 2.40 us y fue llamado 4 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.50 us y fue llamado 2 veces

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.20 ns y fue llamado 3 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 800 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 400 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez
---

## Reporte 5 simpleMathAoS
==1011== NVPROF is profiling process 1011, command: ./simpleMathAoS

==1011== Profiling application: ./simpleMathAoS

==1011== Profiling result:

|            Type | Time(%) |     Time   |  Calls |      Avg |      Min |      Max | Name|
|      :----:     |  :---:  |  :----:    | :----: |  :----:  |  :----:  |   :---:  |:---:|
| GPU activities: |  77.15% | 28.510ms   |      2 | 14.255ms | 8.5563ms | 19.953ms | [CUDA memcpy DtoH]|
|                 |  20.44% | 7.5520ms   |      1 | 7.5520ms | 7.5520ms | 7.5520ms | [CUDA memcpy HtoD]|
|                 |   1.21% | 447.34us   |      1 | 447.34us | 447.34us | 447.34us | warmup(innerStruct*, innerStruct*, int)|
|                 |   1.21% | 446.70us   |      1 | 446.70us | 446.70us | 446.70us | testInnerStruct(innerStruct*, innerStruct*, int)|
|      API calls: |  89.80% | 740.49ms   |      2 | 370.25ms | 729.44us | 739.76ms | cudaMalloc|
|                 |   4.91% | 40.489ms   |      3 | 13.496ms | 8.7933ms | 20.596ms | cudaMemcpy|
|                 |   4.66% | 38.446ms   |      1 | 38.446ms | 38.446ms | 38.446ms | cudaDeviceReset|
|                 |   0.35% | 2.9273ms   |      1 | 2.9273ms | 2.9273ms | 2.9273ms | cuDeviceGetPCIBusId|
|                 |   0.17% | 1.4021ms   |      2 | 701.05us | 580.99us | 821.11us | cudaDeviceSynchronize|
|                 |   0.09% | 732.33us   |      2 | 366.17us | 250.51us | 481.82us | cudaFree|
|                 |   0.01% | 90.432us   |      2 | 45.216us | 43.833us | 46.599us | cudaLaunchKernel|
|                 |   0.00% | 23.890us   |    101 |    236ns |    160ns | 2.0940us | cuDeviceGetAttribute|
|                 |   0.00% | 12.474us   |      1 | 12.474us | 12.474us | 12.474us | cudaGetDeviceProperties|
|                 |   0.00% | 10.921us   |      1 | 10.921us | 10.921us | 10.921us | cudaSetDevice|
|                 |   0.00% | 5.6000us   |      2 | 2.8000us | 2.6050us | 2.9950us | cudaGetLastError|
|                 |   0.00% | 2.2030us   |      3 |    734ns |    250ns | 1.4830us | cuDeviceGetCount|
|                 |   0.00% | 1.6630us   |      2 |    831ns |    241ns | 1.4220us | cuDeviceGet|
|                 |   0.00% |    972ns   |      1 |    972ns |    972ns |    972ns | cuDeviceGetName|
|                 |   0.00% |    561ns   |      1 |    561ns |    561ns |    561ns | cuDeviceTotalMem|
|                 |   0.00% |    351ns   |      1 |    351ns |    351ns |    351ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 4 actividades de GPU:
- CUDA memcpy DtoH
    - Esta funcion se ejecuta en las lineas 148 y 159
    - Se encarga de copiar datos desde el dispositivo al host
    - Esta operacion tomo un 80.19% del tiempo de ejecucion con un total de 23.30 ms y fue llamado 2 veces

- CUDA memcpy HtoD
    - Esta funcion se ejecuta en la linea 130
    - Se encarga de copiar datos desde el host al dispositivo
    - Esta operacion tomo un 18.05% del tiempo de ejecucion con un total de 5.24 ms y fue llamado 1 veces

- warmup
    - Esta funcion es declarada en la linea 90 y es ejecutada en la linea 143
    - Sirve para agregar 10 y 20 a los componentes X e Y correspondientemente del struct data
    - Esta operacion tomo un 0.88% del tiempo de ejecucion con un total de 256.10 us y fue llamado 1 vez

- testInnerStruct
    - Esta funcion es declarada en la linea 76 y es ejecutada en la linea 154
    - Sirve para lo mismo que warmup
    - Esta operacion tomo un 0.88% del tiempo de ejecucion con un total de 255.85 us y fue llamado 1 vez

### Actividades de la API
#### Se realizaron 16 actividades de la API:
- cudaMalloc
    - Esta funcion se ejecuta en las lineas 126 y 127
    - Se encarga de asignar memoria en el dispositivo CUDA
    - Esta operacion tomo un 88.83% del tiempo de ejecucion con un total de 566.38 ms y fue llamado 2 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en la linea 171
    -Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - Esta operacion tomo un 5.61% del tiempo de ejecucion con un total de 35.74 ms y fue llamado 1 vez

- cudaMemcpy
    - Esta funcion se ejecuta en las lineas 130, 148 y 159
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - Esta operacion tomo un 4.90% del tiempo de ejecucion con un total de 31.26 ms y fue llamado 3 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - Esta operacion tomo un 0.34% del tiempo de ejecucion con un total de 2.15 ms y fue llamado 1 vez

- cudaFree
    - Esta funcion se ejecuta en las lineas 164 y 165
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - Esta operacion tomo un 0.19% del tiempo de ejecucion con un total de 1.2200 ms y fue llamado 2 vez

- cudaDeviceSynchronize
    - Esta funcion se ejecuta en las lineas 144 y 155
    - Sirve para esperar a que el dispositivo termine
    - Esta operacion tomo un 0.11% del tiempo de ejecucion con un total de 669.90 us y fue llamado 2 veces

- cudaLaunchKernel
    - No encontre esta funcion en el codigo.
    - Se encarga de ejecutar una funcion de la GPU
    - Esta operacion tomo un 0.03% del tiempo de ejecucion con un total de 161.60 us y fue llamado 2 veces

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 14.60 us y fue llamado 101 veces

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 111
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 6.10 us y fue llamado 1 vez

- cudaGetLastError
    - Esta funcion se ejecuta en las lineas 150 y 161
    - Sirve para retornar el ultimo error que se a producido en el programa y resetearlo a cudaSuccess
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.80 us y fue llamado 2 veces

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 108
    - Sirve para obtener informacion acerca de la GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 4.70 us y fue llamado 1 vez

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.40 ns y fue llamado 3 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 800 ns y fue llamado 2 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 600 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 400 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez
---

## Reporte 6 simpleMathSoA
==1027== NVPROF is profiling process 1027, command: ./simpleMathSoA

==1027== Profiling application: ./simpleMathSoA

==1027== Profiling result:

|            Type | Time(%) |     Time   |  Calls |      Avg |      Min |      Max | Name|
|      :----:     |  :---:  |  :-----:   | :----: |  :----:  |  :----:  |   :---:  |:---:|
| GPU activities: |  74.25% | 26.942ms   |      2 | 13.471ms | 10.969ms | 15.973ms | [CUDA memcpy DtoH]|
|                 |  23.26% | 8.4404ms   |      1 | 8.4404ms | 8.4404ms | 8.4404ms | [CUDA memcpy HtoD]|
|                 |   1.25% | 452.84us   |      1 | 452.84us | 452.84us | 452.84us | warmup2(InnerArray*, InnerArray*, int)|
|                 |   1.23% | 447.98us   |      1 | 447.98us | 447.98us | 447.98us | testInnerArray(InnerArray*, InnerArray*, int)|
|      API calls: |  88.91% | 708.51ms   |      2 | 354.26ms | 645.71us | 707.87ms | cudaMalloc|
|                 |   5.25% | 41.868ms   |      1 | 41.868ms | 41.868ms | 41.868ms | cudaDeviceReset|
|                 |   5.04% | 40.145ms   |      3 | 13.382ms | 11.418ms | 16.745ms | cudaMemcpy|
|                 |   0.49% | 3.9005ms   |      1 | 3.9005ms | 3.9005ms | 3.9005ms | cuDeviceGetPCIBusId|
|                 |   0.19% | 1.5441ms   |      2 | 772.05us | 619.34us | 924.76us | cudaDeviceSynchronize|
|                 |   0.10% | 792.47us   |      2 | 396.24us | 297.70us | 494.78us | cudaFree|
|                 |   0.01% | 93.537us   |      2 | 46.768us | 46.007us | 47.530us | cudaLaunchKernel|
|                 |   0.00% | 20.399us   |    101 |    201ns |    140ns | 1.5030us | cuDeviceGetAttribute|
|                 |   0.00% | 12.133us   |      1 | 12.133us | 12.133us | 12.133us | cudaGetDeviceProperties|
|                 |   0.00% | 8.4660us   |      1 | 8.4660us | 8.4660us | 8.4660us | cudaSetDevice|
|                 |   0.00% | 6.8630us   |      2 | 3.4310us | 3.2560us | 3.6070us | cudaGetLastError|
|                 |   0.00% | 2.3850us   |      3 |    795ns |    251ns | 1.7330us | cuDeviceGetCount|
|                 |   0.00% | 1.3130us   |      1 | 1.3130us | 1.3130us | 1.3130us | cuDeviceGetName|
|                 |   0.00% | 1.2730us   |      2 |    636ns |    191ns | 1.0820us | cuDeviceGet|
|                 |   0.00% |    481ns   |      1 |    481ns |    481ns |    481ns | cuDeviceTotalMem|
|                 |   0.00% |    261ns   |      1 |    261ns |    261ns |    261ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 4 actividades de GPU:
- CUDA memcpy DtoH
    - Esta funcion se ejecuta en las lineas 160 y 170
    - Se encarga de copiar datos desde el dispositivo al host
    - Esta operacion tomo un 73.35% del tiempo de ejecucion con un total de 12.21 ms y fue llamado 2 veces

- CUDA memcpy HtoD
    - Esta funcion se ejecuta en la linea 142
    - Se encarga de copiar datos desde el host al dispositivo
    - Esta operacion tomo un 23.58% del tiempo de ejecucion con un total de 3.92 ms y fue llamado 1 veces

- warmup2
    - Esta funcion es declarada en la linea 99 y es ejecutada en la linea 155
    - Funciona de la misma forma que warmup desimpleMathAoS pero modificado para funcionar con un struct que almacena arreglos de flotantes y no flotantes en si
    - Esta operacion tomo un 1.54% del tiempo de ejecucion con un total de 256.42 us y fue llamado 1 vez

- testInnerArray
    - Esta funcion es declarada en la linea 82 y es ejecutada en la linea 165
    - Sirve para lo mismo que warmup
    - Esta operacion tomo un 1.54% del tiempo de ejecucion con un total de 256.03 us y fue llamado 1 vez

### Actividades de la API
#### Se realizaron 16 actividades de la API:
- cudaMalloc
    - Esta funcion se ejecuta en las lineas 138 y 139
    - Se encarga de asignar memoria en el dispositivo CUDA
    - Esta operacion tomo un 90.98% del tiempo de ejecucion con un total de 584.89 ms y fue llamado 2 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en la linea 181
    -Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - Esta operacion tomo un 5.47% del tiempo de ejecucion con un total de 35.16 ms y fue llamado 1 vez

- cudaMemcpy
    - Esta funcion se ejecuta en las lineas 142, 160 y 170
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - Esta operacion tomo un 2.89% del tiempo de ejecucion con un total de 18.56 ms y fue llamado 3 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - Esta operacion tomo un 0.39% del tiempo de ejecucion con un total de 2.48 ms y fue llamado 1 vez

- cudaFree
    - Esta funcion se ejecuta en las lineas 174 y 175
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - Esta operacion tomo un 0.15% del tiempo de ejecucion con un total de 981.80 us y fue llamado 2 veces

- cudaDeviceSynchronize
    - Esta funcion se ejecuta en las lineas 156 y 166
    - Sirve para esperar a que el dispositivo termine
    - Esta operacion tomo un 0.11% del tiempo de ejecucion con un total de 682.20 us y fue llamado 2 veces

- cudaLaunchKernel
    - No encontre esta funcion en el codigo.
    - Se encarga de ejecutar una funcion de la GPU
    - Esta operacion tomo un 0.01% del tiempo de ejecucion con un total de 94.20 us y fue llamado 2 veces

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 16.50 us y fue llamado 101 veces

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 123
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.90 us y fue llamado 1 vez

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 120
    - Sirve para obtener informacion acerca de la GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.10 us y fue llamado 1 vez

- cudaGetLastError
    - Esta funcion se ejecuta en las lineas 162 y 172
    - Sirve para retornar el ultimo error que se a producido en el programa y resetearlo a cudaSuccess
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.80 us y fue llamado 2 veces

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.40 ns y fue llamado 3 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 600 ns y fue llamado 1 vez

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.10 us y fue llamado 2 veces

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 300 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez
---

## Reporte 7 sumArrayZerocpy
==1049== NVPROF is profiling process 1049, command: ./sumArrayZerocpy

==1049== Profiling application: ./sumArrayZerocpy

==1049== Profiling result:

|            Type | Time(%) |     Time   |  Calls |      Avg |      Min |      Max | Name|
|      :---:      | :---:   |  :---:     | :---:  |  :---:   |   :---:  |   :---:  |:---:|
| GPU activities: |  34.41% | 5.1200us   |      1 | 5.1200us | 5.1200us | 5.1200us | sumArraysZeroCopy(float*, float*, float*, int)|
|                 |  24.52% | 3.6480us   |      2 | 1.8240us | 1.6960us | 1.9520us | [CUDA memcpy DtoH]|
|                 |  21.51% | 3.2000us   |      1 | 3.2000us | 3.2000us | 3.2000us | sumArrays(float*, float*, float*, int)|
|                 |  19.57% | 2.9120us   |      2 | 1.4560us | 1.4400us | 1.4720us | [CUDA memcpy HtoD]|
|      API calls: |  93.65% | 862.99ms   |      3 | 287.66ms | 3.5360us | 862.98ms | cudaMalloc|
|                 |   5.39% | 49.623ms   |      1 | 49.623ms | 49.623ms | 49.623ms | cudaDeviceReset|
|                 |   0.52% | 4.8311ms   |      1 | 4.8311ms | 4.8311ms | 4.8311ms | cuDeviceGetPCIBusId|
|                 |   0.15% | 1.3551ms   |      2 | 677.53us | 11.131us | 1.3439ms | cudaHostAlloc|
|                 |   0.11% | 1.0459ms   |      4 | 261.48us | 101.90us | 550.08us | cudaMemcpy|
|                 |   0.10% | 912.48us   |      2 | 456.24us | 27.752us | 884.73us | cudaFreeHost|
|                 |   0.06% | 567.78us   |      3 | 189.26us | 4.4680us | 544.50us | cudaFree|
|                 |   0.01% | 119.40us   |      2 | 59.698us | 44.725us | 74.672us | cudaLaunchKernel|
|                 |   0.00% | 23.325us   |    101 |    230ns |    160ns | 1.4930us | cuDeviceGetAttribute|
|                 |   0.00% | 15.279us   |      1 | 15.279us | 15.279us | 15.279us | cudaSetDevice|
|                 |   0.00% | 6.1820us   |      1 | 6.1820us | 6.1820us | 6.1820us | cudaGetDeviceProperties|
|                 |   0.00% | 3.3670us   |      2 | 1.6830us |    682ns | 2.6850us | cudaHostGetDevicePointer|
|                 |   0.00% | 2.1330us   |      3 |    711ns |    270ns | 1.4730us | cuDeviceGetCount|
|                 |   0.00% | 1.6140us   |      2 |    807ns |    251ns | 1.3630us | cuDeviceGet|
|                 |   0.00% | 1.1420us   |      1 | 1.1420us | 1.1420us | 1.1420us | cuDeviceGetName|
|                 |   0.00% |    521ns   |      1 |    521ns |    521ns |    521ns | cuDeviceTotalMem|
|                 |   0.00% |    301ns   |      1 |    301ns |    301ns |    301ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 4 actividades de GPU:
- sumArraysZeroCopy
    - Esta funcion es declarada en la linea 60 y es ejecutada en la linea 173
    - Se encarga de sumar dos valores de dos arreglos y guardar el resultado en un tercero
    - Esta operacion tomo un 33.33% del tiempo de ejecucion con un total de 3.52 us y fue llamado 1 vez

- CUDA memcpy DtoH
    - Esta funcion ejecutada en las lineas 141 y 176
    - Se encarga de copiar datos desde el dispositivo al host
    - Esta operacion tomo un 22.73% del tiempo de ejecucion con un total de 2.40 us y fue llamado 2 veces

- sumArrays
    - Esta funcion es declarada en la linea 53 y es ejecutada en la linea 138
    - Funciona de la misma forma que sumArraysZeroCopy
    - Esta operacion tomo un 22.12% del tiempo de ejecucion con un total de 2.33 us y fue llamado 1 vez

- CUDA memcpy HtoD
    - Esta funcion ejecutada en las lineas 130 y 131
    - Se encarga de copiar datos desde el host al dispositivo
    - Esta operacion tomo un 21.82% del tiempo de ejecucion con un total de 2.30 us y fue llamado 2 veces

### Actividades de la API
#### Se realizaron 17 actividades de la API:
- cudaMalloc
    - Esta funcion se ejecuta en las lineas 125, 126 y 127
    - Se encarga de asignar memoria en el dispositivo CUDA
    - Esta operacion tomo un 94.24% del tiempo de ejecucion con un total de 583.14 ms y fue llamado 3 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en las lineas 81 y 190
    -Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - Esta operacion tomo un 5.09% del tiempo de ejecucion con un total de 31.47 ms y fue llamado 2 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - Esta operacion tomo un 0.35% del tiempo de ejecucion con un total de 2.17 ms y fue llamado 1 vez

- cudaHostAlloc
    - Esta funcion se ejecuta en las lineas 156 y 157
    - Sirve para apartar memoria en el host
    - Esta operacion tomo un 0.16% del tiempo de ejecucion con un total de 988.60 us y fue llamado 2 veces

- cudaFreeHost
    - Esta funcion se ejecuta en las lineas 183 y 184
    - Sirve para lirverar memoria en el host
    - Esta operacion tomo un 0.06% del tiempo de ejecucion con un total de 368.90 us y fue llamado 2 veces

- cudaMemcpy
    - Esta funcion se ejecuta en las lineas 130, 131, 141 y 176
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - Esta operacion tomo un 0.06% del tiempo de ejecucion con un total de 358.00 us y fue llamado 4 veces

- cudaFree
    - Esta funcion se ejecuta en las lineas 182 183 y 184
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - Esta operacion tomo un 0.04% del tiempo de ejecucion con un total de 218.20 us y fue llamado 3 veces

- cudaLaunchKernel
    - No encontre esta funcion en el codigo.
    - Se encarga de ejecutar una funcion de la GPU
    - Esta operacion tomo un 0.01% del tiempo de ejecucion con un total de 60.30 us y fue llamado 2 veces

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 14.90 us y fue llamado 101 veces

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 71
    - sirve para establecer que dispositivo se usara para las operaciones de GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 6.20 us y fue llamado 1 vez

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 75
    - Sirve para obtener informacion acerca de la GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 2.30 us y fue llamado 1 vez

- cudaHostGetDevicePointer
    - Esta funcion se ejecuta en las lineas 166 y 167
    - Sirve para devolver un apuntador en el host asignado por cudaHostAlloc
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 2.10 us y fue llamado 2 veces

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.60 ns y fue llamado 3 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.10 us y fue llamado 2 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 700 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 300 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez
---

## Reporte 8 sumMatrixGPUManaged
==1071== NVPROF is profiling process 1071, command: ./sumMatrixGPUManaged

==1071== Profiling application: ./sumMatrixGPUManaged

==1071== Profiling result:

|            Type | Time(%) |     Time   |  Calls |      Avg |      Min |      Max | Name|
|      :---:      | :---:   |  :---:     |  :---: |  :---:   |   :---:  |   :---:  |:---:|
| GPU activities: | 100.00% | 21.021ms   |      2 | 10.511ms | 509.58us | 20.511ms | sumMatrixGPU(float*, float*, float*, int, int)|
|      API calls: |  89.02% | 784.84ms   |      4 | 196.21ms | 32.232ms | 673.02ms | cudaMallocManaged|
|                 |   4.06% | 35.835ms   |      4 | 8.9587ms | 8.5160ms | 9.3401ms | cudaFree|
|                 |   4.04% | 35.644ms   |      1 | 35.644ms | 35.644ms | 35.644ms | cudaDeviceReset|
|                 |   2.48% | 21.876ms   |      1 | 21.876ms | 21.876ms | 21.876ms | cudaDeviceSynchronize|
|                 |   0.32% | 2.8215ms   |      1 | 2.8215ms | 2.8215ms | 2.8215ms | cuDeviceGetPCIBusId|
|                 |   0.07% | 616.83us   |      2 | 308.41us | 8.5160us | 608.31us | cudaLaunchKernel|
|                 |   0.00% | 20.001us   |    101 |    198ns |    120ns | 1.8830us | cuDeviceGetAttribute|
|                 |   0.00% | 10.911us   |      1 | 10.911us | 10.911us | 10.911us | cudaGetDeviceProperties|
|                 |   0.00% | 9.1170us   |      1 | 9.1170us | 9.1170us | 9.1170us | cudaSetDevice|
|                 |   0.00% | 1.9630us   |      3 |    654ns |    240ns | 1.3520us | cuDeviceGetCount|
|                 |   0.00% | 1.7140us   |      2 |    857ns |    201ns | 1.5130us | cuDeviceGet|
|                 |   0.00% | 1.5230us   |      1 | 1.5230us | 1.5230us | 1.5230us | cudaGetLastError|
|                 |   0.00% | 1.1920us   |      1 | 1.1920us | 1.1920us | 1.1920us | cuDeviceGetName|
|                 |   0.00% |    431ns   |      1 |    431ns |    431ns |    431ns | cuDeviceTotalMem|
|                 |   0.00% |    241ns   |      1 |    241ns |    241ns |    241ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizo 1 actividad de GPU:
- sumMatrixGPU
    - Esta funcion es declarada en la linea 72 y es ejecutada en la linea 139 y 144
    - Se encarga de sumar matrices usando la GPU
    - Esta operacion tomo un 100.00% del tiempo de ejecucion con un total de 12.94 ms y fue llamado 2 vez

### Actividades de la API
#### Se realizaron 15 actividades de la API:
- cudaMallocManaged
    - Esta funcion se ejecuta en las lineas 110, 111, 112 y 113
    - Sirve para asignar memoria que sera utilizada por el systema de memoria unificada
    - Esta operacion tomo un 91.39% del tiempo de ejecucion con un total de 815.38 ms y fue llamado 4 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en la linea 164
    - Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - Esta operacion tomo un 3.45% del tiempo de ejecucion con un total de 30.80 ms y fue llamado 1 veces

- cudaFree
    - Esta funcion se ejecuta en las lineas 158, 159, 160 y 161
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - Esta operacion tomo un 3.31% del tiempo de ejecucion con un total de 29.56 ms y fue llamado 4 veces

- cudaDeviceSynchronize
    - Esta funcion se ejecuta en la linea 146
    - Sirve para esperar a que el dispositivo termine
    - Esta operacion tomo un 1.52% del tiempo de ejecucion con un total de 13.58 ms y fue llamado 1 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - Esta operacion tomo un 0.24% del tiempo de ejecucion con un total de 2.16 ms y fue llamado 1 vez

- cudaLaunchKernel
    - No encontre esta funcion en el codigo.
    - Se encarga de ejecutar una funcion de la GPU
    - Esta operacion tomo un 0.07% del tiempo de ejecucion con un total de 644.20 us y fue llamado 2 veces

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 14.10 us y fue llamado 101 veces

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 94
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.80 us y fue llamado 1 vez

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 92
    - Sirve para obtener informacion acerca de la GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 4.00 us y fue llamado 1 vez

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.20 ns y fue llamado 3 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.10 us y fue llamado 2 veces

- cudaGetLastError
    - Esta funcion se ejecuta en la linea 152
    - Sirve para retornar el ultimo error que se a producido en el programa y resetearlo a cudaSuccess
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 900 ns y fue llamado 1 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 700 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 300 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez
---

## Reporte 9 sumMatrixGPUManual
==1089== NVPROF is profiling process 1089, command: ./sumMatrixGPUManual

==1089== Profiling application: ./sumMatrixGPUManual

==1089== Profiling result:

|            Type | Time(%) |     Time   |  Calls |      Avg |      Min |      Max | Name|
|      :---:      | :---:   |  :---:     | :---:  |  :---:   |   :---:  |   :---:  |:---:|
| GPU activities: |  56.34% | 42.887ms   |      1 | 42.887ms | 42.887ms | 42.887ms | [CUDA memcpy DtoH]|
|                 |  40.11% | 30.532ms   |      2 | 15.266ms | 15.164ms | 15.368ms | [CUDA memcpy HtoD]|
|                 |   2.42% | 1.8432ms   |      2 | 921.60us | 508.59us | 1.3346ms | sumMatrixGPU(float*, float*, float*, int, int)|
|                 |   1.13% | 857.14us   |      2 | 428.57us | 428.52us | 428.62us | [CUDA memset]|
|      API calls: |  84.71% | 724.12ms   |      3 | 241.37ms | 1.0040ms | 722.10ms | cudaMalloc|
|                 |  10.32% | 88.257ms   |      3 | 29.419ms | 16.257ms | 43.771ms | cudaMemcpy|
|                 |   4.29% | 36.639ms   |      1 | 36.639ms | 36.639ms | 36.639ms | cudaDeviceReset|
|                 |   0.34% | 2.9157ms   |      1 | 2.9157ms | 2.9157ms | 2.9157ms | cuDeviceGetPCIBusId|
|                 |   0.20% | 1.7193ms   |      1 | 1.7193ms | 1.7193ms | 1.7193ms | cudaDeviceSynchronize|
|                 |   0.12% | 986.04us   |      3 | 328.68us | 228.09us | 509.11us | cudaFree|
|                 |   0.01% | 61.329us   |    101 |    607ns |    130ns | 31.069us | cuDeviceGetAttribute|
|                 |   0.01% | 57.099us   |      2 | 28.549us | 7.4840us | 49.615us | cudaMemset|
|                 |   0.01% | 46.499us   |      2 | 23.249us | 15.780us | 30.719us | cudaLaunchKernel|
|                 |   0.00% | 11.321us   |      1 | 11.321us | 11.321us | 11.321us | cudaSetDevice|
|                 |   0.00% | 9.8890us   |      1 | 9.8890us | 9.8890us | 9.8890us | cudaGetDeviceProperties|
|                 |   0.00% | 2.0340us   |      3 |    678ns |    350ns | 1.3330us | cuDeviceGetCount|
|                 |   0.00% | 1.7020us   |      2 |    851ns |    280ns | 1.4220us | cuDeviceGet|
|                 |   0.00% | 1.2030us   |      1 | 1.2030us | 1.2030us | 1.2030us | cuDeviceTotalMem|
|                 |   0.00% | 1.1720us   |      1 | 1.1720us | 1.1720us | 1.1720us | cuDeviceGetName|
|                 |   0.00% |    762ns   |      1 |    762ns |    762ns |    762ns | cudaGetLastError|
|                 |   0.00% |    330ns   |      1 |    330ns |    330ns |    330ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 4 actividades de GPU:
- CUDA memcpy HtoD
    - Esta funcion se ejecuta en las lineas 147 y 148
    - Se encarga de copiar datos desde el host al dispositivo
    - Esta operacion tomo un 65.525% del tiempo de ejecucion con un total de 27.10 ms y fue llamado 2 veces

- CUDA memcpy DtoH
    - Esta funcion se ejecuta en la linea 158
    - Se encarga de copiar datos desde el dispositivo al host
    - Esta operacion tomo un 30.63% del tiempo de ejecucion con un total de 12.66 ms y fue llamado 1 veces

- sumMatrixGPU
    - Esta funcion es declarada en la linea 67 y es ejecutada en la linea 143 y 151
    - Se encarga de sumar matrices usando la GPU
    - Esta operacion tomo un 2.69% del tiempo de ejecucion con un total de 1.11 ms y fue llamado 2 vez

- CUDA memset
    - Esta funcion se ejecuta en las lineas 118 y 119
    - Se encarga de inicializar o establecer la memoria del device a un valor
    - Esta operacion tomo un 1.13% del tiempo de ejecucion con un total de 1.11 ms y fue llamado 2 vez


### Actividades de la API
#### Se realizaron 15 actividades de la API:
- cudaMalloc
    - Esta funcion se ejecuta en las lineas 129, 130 y 131
    - Se encarga de asignar memoria en el dispositivo CUDA
    - Esta operacion tomo un 87.57% del tiempo de ejecucion con un total de 607.17 ms y fue llamado 3 vez

- cudaMemcpy
    - Esta funcion se ejecuta en las lineas 147, 148 y 158
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - Esta operacion tomo un 6.50% del tiempo de ejecucion con un total de 45.03 ms y fue llamado 3 veces

- cudaFree
    - Esta funcion se ejecuta en las lineas 158, 159, 160 y 161
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - Esta operacion tomo un 3.31% del tiempo de ejecucion con un total de 29.56 ms y fue llamado 4 veces

- cudaDeviceSynchronize
    - Esta funcion se ejecuta en la linea 146
    - Sirve para esperar a que el dispositivo termine
    - Esta operacion tomo un 1.52% del tiempo de ejecucion con un total de 13.58 ms y fue llamado 1 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - Esta operacion tomo un 0.24% del tiempo de ejecucion con un total de 2.16 ms y fue llamado 1 vez

- cudaLaunchKernel
    - No encontre esta funcion en el codigo.
    - Se encarga de ejecutar una funcion de la GPU
    - Esta operacion tomo un 0.07% del tiempo de ejecucion con un total de 644.20 us y fue llamado 2 veces

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 14.10 us y fue llamado 101 veces

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 94
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.80 us y fue llamado 1 vez

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 92
    - Sirve para obtener informacion acerca de la GPU
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 4.00 us y fue llamado 1 vez

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.20 ns y fue llamado 3 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.10 us y fue llamado 2 veces

- cudaGetLastError
    - Esta funcion se ejecuta en la linea 152
    - Sirve para retornar el ultimo error que se a producido en el programa y resetearlo a cudaSuccess
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 900 ns y fue llamado 1 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 700 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 300 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - Esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez
---

## Reporte 10 transpose
==1111== NVPROF is profiling process 1111, command: ./transpose

==1111== Profiling application: ./transpose

==1111== Profiling result:

|            Type | Time(%) |     Time   |  Calls |      Avg |      Min |      Max | Name|
|      :---:      | :---:   |  :---:     | :---:  |  :---:   |   :---:  |   :---:  |:---:|
| GPU activities: |  92.45% | 5.8141ms   |      1 | 5.8141ms | 5.8141ms | 5.8141ms | [CUDA memcpy HtoD]|
|                 |   3.85% | 242.40us   |      1 | 242.40us | 242.40us | 242.40us | warmup(float*, float*, int, int)|
|                 |   3.69% | 232.23us   |      1 | 232.23us | 232.23us | 232.23us | copyRow(float*, float*, int, int|)
|      API calls: |  93.98% | 789.23ms   |      2 | 394.61ms | 506.63us | 788.72ms | cudaMalloc|
|                 |   4.45% | 37.391ms   |      1 | 37.391ms | 37.391ms | 37.391ms | cudaDeviceReset|
|                 |   0.75% | 6.2932ms   |      1 | 6.2932ms | 6.2932ms | 6.2932ms | cudaMemcpy|
|                 |   0.58% | 4.8993ms   |      1 | 4.8993ms | 4.8993ms | 4.8993ms | cuDeviceGetPCIBusId|
|                 |   0.11% | 945.44us   |      2 | 472.72us | 303.27us | 642.17us | cudaDeviceSynchronize|
|                 |   0.11% | 922.80us   |      2 | 461.40us | 320.98us | 601.82us | cudaFree|
|                 |   0.01% | 64.132us   |      2 | 32.066us | 15.239us | 48.893us | cudaLaunchKernel|
|                 |   0.00% | 36.431us   |    101 |    360ns |    190ns | 1.8840us | cuDeviceGetAttribute|
|                 |   0.00% | 11.983us   |      1 | 11.983us | 11.983us | 11.983us | cudaGetDeviceProperties|
|                 |   0.00% | 7.7350us   |      1 | 7.7350us | 7.7350us | 7.7350us | cudaSetDevice|
|                 |   0.00% | 3.5560us   |      2 | 1.7780us |    881ns | 2.6750us | cudaGetLastError|
|                 |   0.00% | 3.1250us   |      3 | 1.0410us |    371ns | 1.4220us | cuDeviceGetCount|
|                 |   0.00% | 1.9530us   |      2 |    976ns |    410ns | 1.5430us | cuDeviceGet|
|                 |   0.00% | 1.4930us   |      1 | 1.4930us | 1.4930us | 1.4930us | cuDeviceGetName|
|                 |   0.00% |    702ns   |      1 |    702ns |    702ns |    702ns | cuDeviceTotalMem|
|                 |   0.00% |    340ns   |      1 |    340ns |    340ns |    340ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 3 actividades de GPU:
- CUDA memcpy HtoD
    - Esta funcion se ejecuta en la linea 259
    - Se encarga de copiar datos desde el host al dispositivo
    - En este caso esta operacion tomo un 86.82% del tiempo de ejecucion con un total de 1.98 ms y fue llamado 1 veces

- copyRow
    - Esta funcion es declarada en la linea 80 y es ejecutada en la linea 277
    - Se encarga de copiar un arreglo in en un arreglo out
    - En este caso esta operacion tomo un 6.62% del tiempo de ejecucion con un total de 151.49 us y fue llamado 1 veces

- warmup
    - Esta funcion es declarada en la linea 68 y es ejecutada en la linea 263
    - Tiene el mismo funcionamiento que copyRow
    - En este caso esta operacion tomo un 6.56% del tiempo de ejecucion con un total de 150.02 us y fue llamado 1 veces

### Actividades de la API
#### Se realizaron 16 actividades de la API:
- cudaMalloc
    - Esta funcion es usada en las lineas 155 y 156
    - Se encarga de asignar memoria en el dispositivo CUDA
    - En este caso esta operacion tomo un 86.44% del tiempo de ejecucion con un total de 634.10 ms y fue llamado 2 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en la linea 347
    - Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - En este caso esta operacion tomo un 12.79% del tiempo de ejecucion con un total de 93.79 ms y fue llamado 1 vez

- cudaMemcpy
    - Esta funcion se ejecuta en la linea 335
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - En este caso esta operacion tomo un 0.32% del tiempo de ejecucion con un total de 2.36 ms y fue llamado 1 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - En este caso esta operacion tomo un 0.31% del tiempo de ejecucion con un total de 2.25 ms y fue llamado 1 vez

- cudaFree
    - Esta funcion es usada en las lineas 340 y 341
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - En este caso esta operacion tomo un 0.07% del tiempo de ejecucion con un total de 549.80 us y fue llamado 2 vez

- cudaDeviceSynchronize
    - Esta funcion es usada en las lineas 264 y 322
    - Sirve para esperar a que el dispositivo termine
    - En este caso esta operacion tomo un 0.06% del tiempo de ejecucion con un total de 404.50 us y fue llamado 2 veces

- cudaLaunchKernel
    - No encontre esta funcion en el codigo.
    - Se encarga de ejecutar una funcion de la GPU
    - En este caso esta operacion tomo un 0.01% del tiempo de ejecucion con un total de 57.00 us y fue llamado 2 veces

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 16.50 us y fue llamado 101 veces

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 214
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.40 us y fue llamado 1 vez

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 211
    - Sirve para obtener informacion acerca de la GPU
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 5.00 us y fue llamado 1 vez

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.40 ns y fue llamado 3 veces

- cudaGetLastError
    - Esta funcion es usada en las lineas 267 y 330
    - Sirve para retornar el ultimo error que se a producido en el programa y resetearlo a cudaSuccess
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.30 us y fue llamado 2 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.00 us y fue llamado 2 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 600 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 400 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez
---

## Reporte 11 writeSegment
==1127== NVPROF is profiling process 1127, command: ./writeSegment

==1127== Profiling application: ./writeSegment

==1127== Profiling result:

|            Type | Time(%) |     Time   |  Calls |      Avg |      Min |      Max | Name|
|      :---:      | :---:   |  :---:     | :---:  |  :---:   |   :---:  |   :---:  |:---:|
| GPU activities: |  62.08% | 3.3433ms   |      3 | 1.1144ms | 831.70us | 1.6687ms | [CUDA memcpy DtoH]|
|                 |  33.35% | 1.7961ms   |      2 | 898.05us | 843.06us | 953.04us | [CUDA memcpy HtoD]|
|                 |   1.57% | 84.706us   |      1 | 84.706us | 84.706us | 84.706us | writeOffset(float*, float*, float*, int, int)|
|                 |   1.56% | 84.161us   |      1 | 84.161us | 84.161us | 84.161us | warmup(float*, float*, float*, int, int)|
|                 |   0.86% | 46.369us   |      1 | 46.369us | 46.369us | 46.369us | writeOffsetUnroll2(float*, float*, float*, int, int)|
|                 |   0.57% | 30.529us   |      1 | 30.529us | 30.529us | 30.529us | writeOffsetUnroll4(float*, float*, float*, int, int)|
|      API calls: |  93.31% | 768.78ms   |      3 | 256.26ms | 665.75us | 767.37ms | cudaMalloc|
|                 |   5.11% | 42.084ms   |      1 | 42.084ms | 42.084ms | 42.084ms | cudaDeviceReset|
|                 |   0.86% | 7.0858ms   |      5 | 1.4172ms | 817.79us | 3.0512ms | cudaMemcpy|
|                 |   0.43% | 3.5527ms   |      1 | 3.5527ms | 3.5527ms | 3.5527ms | cuDeviceGetPCIBusId|
|                 |   0.13% | 1.0964ms   |      4 | 274.10us | 156.90us | 524.63us | cudaDeviceSynchronize|
|                 |   0.13% | 1.0760ms   |      3 | 358.67us | 279.10us | 471.99us | cudaFree|
|                 |   0.02% | 197.64us   |      4 | 49.409us | 21.040us | 64.974us | cudaLaunchKernel|
|                 |   0.00% | 23.462us   |    101 |    232ns |    160ns | 2.2640us | cuDeviceGetAttribute|
|                 |   0.00% | 15.469us   |      1 | 15.469us | 15.469us | 15.469us | cudaGetDeviceProperties|
|                 |   0.00% | 9.2970us   |      1 | 9.2970us | 9.2970us | 9.2970us | cudaSetDevice|
|                 |   0.00% | 5.0780us   |      4 | 1.2690us |    961ns | 1.4620us | cudaGetLastError|
|                 |   0.00% | 2.2450us   |      3 |    748ns |    331ns | 1.5030us | cuDeviceGetCount|
|                 |   0.00% | 1.6540us   |      2 |    827ns |    251ns | 1.4030us | cuDeviceGet|
|                 |   0.00% | 1.3530us   |      1 | 1.3530us | 1.3530us | 1.3530us | cuDeviceGetName|
|                 |   0.00% |    511ns   |      1 |    511ns |    511ns |    511ns | cuDeviceTotalMem|
|                 |   0.00% |    291ns   |      1 |    291ns |    291ns |    291ns | cuDeviceGetUuid|
---

## Explicacion
### Actividades de GPU
#### Se realizaron 6 actividades de GPU:
- CUDA memcpy DtoH
    - Esta funcion se ejecuta en las lineas 161, 174 y 187
    - Se encarga de copiar datos desde el dispositivo al host
    - En este caso esta operacion tomo un 65.98% del tiempo de ejecucion con un total de 2.11 ms y fue llamado 3 veces

- CUDA memcpy HtoD
    - Esta funcion se ejecuta en las lineas 139 y 140
    - Se encarga de copiar datos desde el host al dispositivo
    - En este caso esta operacion tomo un 29.36% del tiempo de ejecucion con un total de 940.23 us y fue llamado 2 veces

- writeOffset
    - Esta funcion es declarada en la linea 47 y es ejecutada en la linea 153
    - Se encarga de sumar dos datos y guardarlos con un offset
    - En este caso esta operacion tomo un 1.55% del tiempo de ejecucion con un total de 49.50 us y fue llamado 1 veces

- writeOffsetUnroll2
    - Esta funcion es declarada en la linea 64 y es ejecutada en la linea 166
    - Tiene el mismo funcionamiento que writeOffset pero divide la carga en 2
    - En este caso esta operacion tomo un 0.91% del tiempo de ejecucion con un total de 29.12 us y fue llamado 1 veces

- writeOffsetUnroll4
    - Esta funcion es declarada en la linea 77 y es ejecutada en la linea 179
    - Tiene el mismo funcionamiento que writeOffset pero divide la carga en 4
    - En este caso esta operacion tomo un 0.72% del tiempo de ejecucion con un total de 23.07 us y fue llamado 1 veces

### Actividades de la API
#### Se realizaron 16 actividades de la API:
- cudaMalloc
    - Esta funcion se ejecuta en las lineas 134, 135 y 136
    - Se encarga de asignar memoria en el dispositivo CUDA
    - En este caso esta operacion tomo un 92.61% del tiempo de ejecucion con un total de 579.23 ms y fue llamado 3 vez

- cudaDeviceReset
    - Esta funcion se ejecuta en la linea 198
    - Se encarga de liberar cualquier espacio en memoria que tenga que ver con el programa actual y resetear sus valores
    - En este caso esta operacion tomo un 6.01% del tiempo de ejecucion con un total de 37.57 ms y fue llamado 1 vez

- cudaMemcpy
    - Esta funcion se ejecuta en las lineas 139, 140, 161, 174 y 187
    - Esta funcion se encarga de copiar datos entre la CPU y la GPU
    - En este caso esta operacion tomo un 0.83% del tiempo de ejecucion con un total de 5.18 ms y fue llamado 5 veces

- cuDeviceGetPCIBusId
    - No encontre esta funcion en el codigo.
    - Esta función se utiliza para obtener la identificación del bus PCI del dispositivo CUDA
    - En este caso esta operacion tomo un 0.34% del tiempo de ejecucion con un total de 2.15 ms y fue llamado 1 vez

- cudaFree
    - Esta funcion se ejecuta en las lineas 191, 192 y 193
    - Esta funcion se encarga de liberar un espacio de memoria especifico en la GPU
    - En este caso esta operacion tomo un 0.11% del tiempo de ejecucion con un total de 687.50 us y fue llamado 3 vez

- cudaDeviceSynchronize
    - Esta funcion se ejecuta en las lineas 145, 154, 167 y 180
    - Sirve para esperar a que el dispositivo termine
    - En este caso esta operacion tomo un 0.06% del tiempo de ejecucion con un total de 399.00 us y fue llamado 4 veces

- cudaLaunchKernel
    - No encontre esta funcion en el codigo.
    - Se encarga de ejecutar una funcion de la GPU
    - En este caso esta operacion tomo un 0.04% del tiempo de ejecucion con un total de 225.60 us y fue llamado 4 veces

- cuDeviceGetAttribute
    - No encontre esta funcion en el codigo.
    - Se utiliza para obtener atributos específicos del dispositivo CUDA 
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 14.40 us y fue llamado 101 veces

- cudaGetDeviceProperties
    - Esta funcion se ejecuta en la linea 97
    - Sirve para obtener informacion acerca de la GPU
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 4.90 us y fue llamado 1 vez

- cudaSetDevice
    - Esta funcion se ejecuta en la linea 100
    - Sirve para establecer que dispositivo se usara para las operaciones de GPU
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 4.10 us y fue llamado 1 vez

- cudaGetLastError
    - Esta funcion se ejecuta en las lineas 149, 158, 171 y 184
    - Sirve para retornar el ultimo error que se a producido en el programa y resetearlo a cudaSuccess
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 3.30 us y fue llamado 4 veces

- cuDeviceGetCount
    - No encontre esta funcion en el codigo.
    - se utiliza para obtener el número total de dispositivos CUDA disponibles en el sistema.
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.20 ns y fue llamado 3 veces

- cuDeviceGet
    - No encontre esta funcion en el codigo.
    - No pude encontrar una descripcion mas alla de imprime un id al dispositivo CUDA
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 1.10 us y fue llamado 2 veces

- cuDeviceGetName
    - No encontre esta funcion en el codigo.
    - Retorna el nombre del dispositivo CUDA
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 700 ns y fue llamado 1 vez

- cuDeviceTotalMem
    - No encontre esta funcion en el codigo.
    - Retorna cuanta memoria existe en total en el dispositivo
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 300 ns y fue llamado 1 vez

- cuDeviceGetUuid
    - No encontre esta funcion en el codigo.
    - Retorna un UUID para el dispositivo
    - En este caso esta operacion tomo un 0.00% del tiempo de ejecucion con un total de 200 ns y fue llamado 1 vez