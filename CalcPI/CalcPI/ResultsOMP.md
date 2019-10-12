# Resuts
Results using different machines and functions (lineal and parallel)

| Type | Threads| 24kk | 48kk | 96kk |
|------|------|---|------|------|
|Sec Laptop| 1|0.232323 	| 0.429949 	| 0.856492 	|
| omp red2 Laptop	|6| 0.086350 	| 0.137980 	| 1.221836 	|
| omp Laptop|12|0.097469|0.115021|0.238490|
|omp Laptop|24|0.077775 |0.115681| 0.251382|
| omp Laptop|48|0.081792| 0.113364| 0.245422|



| Type | Threads| 24kk | 48kk | 96kk |
|------|------|---|------|------|
|Sec IDA| 1|0.120724 	| 0.151110 	| 0.299976 	|
| omp red2 IDA|6| 0.028640| 0.044224| 0.066043|
|omp IDA|12|0.016454| 0.025487 |0.041736|
|omp IDA|24|0.014935| 0.024172| 0.039453|
|omp IDA |48|0.012273| 0.014497| 0.025257|


### 04/oct/2019
## Secuential Laptop

Iterations 24000000     Execution time 0.232323

Iterations 48000000     Execution time 0.429949

Iterations 96000000     Execution time 0.856492

## Secuential IDA

Iterations 24000000     Execution time 0.120724

Iterations 48000000     Execution time 0.151110

Iterations 96000000     Execution time 0.299976 

## 6 threads
### Laptop reduction mypi

Iterations 24000000 - threads 6 Execution time 0.311634 

Iterations 48000000 - threads 6 Execution time 0.588268 

Iterations 96000000 - threads 6 Execution time 1.182929 
### Laptop reduction 2 mypi, ni

Iterations 24000000 - threads 6 Execution time 0.086350 

Iterations 48000000 - threads 6 Execution time 0.137980 

Iterations 96000000 - threads 6 Execution time 0.221836 

### IDA (reduction 2)

Iterations 24000000 - threads 6 Execution time 0.028640 

Iterations 48000000 - threads 6 Execution time 0.044224 

Iterations 96000000 - threads 6 Execution time 0.066043 

## 12 threads
### Laptop
Iterations 24000000 - threads 12        Execution time 0.097469 

Iterations 48000000 - threads 12        Execution time 0.115021 

Iterations 96000000 - threads 12        Execution time 0.238490 

### IDA
Iterations 24000000 - threads 12        Execution time 0.016454  

Iterations 48000000 - threads 12        Execution time 0.025487 

Iterations 96000000 - threads 12        Execution time 0.041736 
## 24 threads
### Laptop
Iterations 24000000 - threads 24        Execution time 0.077775  

Iterations 48000000 - threads 24        Execution time 0.115681 

Iterations 96000000 - threads 24        Execution time 0.251382 
### IDA
Iterations 24000000 - threads 24        Execution time 0.014935  

Iterations 48000000 - threads 24        Execution time 0.024172 

Iterations 96000000 - threads 24        Execution time 0.039453 
## 48 threads
### Laptop
 Iterations 24000000 - threads 48        Execution time 0.081792  

Iterations 48000000 - threads 48        Execution time 0.113364 

Iterations 96000000 - threads 48        Execution time 0.245422 

### IDA 
Iterations 24000000 - threads 48        Execution time 0.012273  

Iterations 48000000 - threads 48        Execution time 0.014497 

Iterations 96000000 - threads 48        Execution time 0.025257 

****
## IDA results
Iterations 24000000 - threads 24        Execution time 0.014935 

Iterations 48000000 - threads 24        Execution time 0.024172
 

Iterations 96000000 - threads 24        Execution time 0.039453
 

-bash-4.2$ ^C
-bash-4.2$ gcc task1.c -fopenmp
-bash-4.2$ ./a.out
Iterations 24000000 - threads 48        Execution time 0.012273
     

Iterations 48000000 - threads 48        Execution time 0.014497
         

Iterations 96000000 - threads 48        Execution time 0.025257
         
 
Iterations 24000000 - threads 1 Execution time 0.120627
        

Iterations 48000000 - threads 1 Execution time 0.149465
        

Iterations 96000000 - threads 1 Execution time 0.299023
       

Iterations 24000000 - threads 6 Execution time 0.028582
      

Iterations 48000000 - threads 6 Execution time 0.044241
      

Iterations 96000000 - threads 6 Execution time 0.066095
     

Iterations 24000000 - threads 12        Execution time 0.015265
        

Iterations 48000000 - threads 12        Execution time 0.025690
         

Iterations 96000000 - threads 12        Execution time 0.041984
         

Iterations 24000000 - threads 24        Execution time 0.008324
        

Iterations 48000000 - threads 24        Execution time 0.014115
         

Iterations 96000000 - threads 24        Execution time 0.027493
         

Iterations 24000000 - threads 48        Execution time 0.010721
         

Iterations 48000000 - threads 48        Execution time 0.016730
        

Iterations 96000000 - threads 48        Execution time 0.025159
        


## Laptop results
Iterations 24000000 - threads 1 Execution time 0.223679
        
Iterations 48000000 - threads 1 Execution time 0.414292
         
Iterations 96000000 - threads 1 Execution time 0.819332
        
Iterations 24000000 - threads 6 Execution time 0.070317
        
Iterations 48000000 - threads 6 Execution time 0.117852
         
Iterations 96000000 - threads 6 Execution time 0.232897
        
Iterations 24000000 - threads 12        Execution time 0.056116
         
Iterations 48000000 - threads 12        Execution time 0.110383
        
Iterations 96000000 - threads 12        Execution time 0.224435
       
Iterations 24000000 - threads 24        Execution time 0.069622
        
Iterations 48000000 - threads 24        Execution time 0.115412
        
Iterations 96000000 - threads 24        Execution time 0.224711
        
Iterations 24000000 - threads 48        Execution time 0.076540
        
Iterations 48000000 - threads 48        Execution time 0.114693
        
Iterations 96000000 - threads 48        Execution time 0.223487
        
