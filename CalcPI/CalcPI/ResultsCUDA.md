# CUDA
## 256/256
==87256== Profiling result:

Time(%)      Time     Calls       Avg       Min       Max  Name

 99.47%  28.537ms         3  9.5123ms  4.1279ms  16.159ms  cal_pi(double*, int, double, int, int)

## 256/1024
==87601== Profiling result:

Time(%)      Time     Calls       Avg       Min       Max  Name

 97.60%  21.445ms         3  7.1484ms  3.1014ms  12.141ms  cal_pi(double*, int, double, int, int)

 ## 128/1024
 
==87654== Profiling result:

Time(%)      Time     Calls       Avg       Min       Max  Name

 98.66%  21.678ms         3  7.2262ms  3.1425ms  12.259ms  cal_pi(double*, int, double, int, int)

## 512/1024
==87706== Profiling result:

Time(%)      Time     Calls       Avg       Min       Max  Name

 86.35%  19.898ms         3  6.6326ms  2.8804ms  11.258ms  cal_pi(double*, int, double, int, int)
## 768/1024
==87962== Profiling result:

Time(%)      Time     Calls       Avg       Min       Max  Name

 76.27%  19.484ms         3  6.4948ms  2.8218ms  11.025ms  cal_pi(double*, int, double, int, int)

# GPU specs
Number of Devices: 1
  Device Number: 0
  Device name: GeForce GTX TITAN X
  Memory Clock Rate (KHz): 3505000
  Memory Bus Width (bits): 384
  Peak Memory Bandwidth (GB/s): 336.480000
  Number of SMs: 24
  Number of Cores (SMs * 128): 3072
  Clock Rate (GHz): 1.076000
  Warp Size: 32
  maxThreadsPerBlock: 1024
  Total Global Memory (bytes): 4209639424
  Hello GeForce GTX TITAN X World!
