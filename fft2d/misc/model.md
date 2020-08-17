# Modelling Latency of 2D FFT

## Kernel Latency

Following shows the stages and its respective latency in cycles.

1. Fetch: $`\frac{N}{8}`$
2. FFT: $`\frac{N}{8} - 1`$
3. xy Transpose: $`\frac{N^{2}}{8}`$
4. FFT: $`\frac{N}{8} - 1`$
5. yx Transpose: $`\frac{N^{2}}{8}`$
5. Store: $`\frac{N^{2}}{8}`$

Total Latency: $`\frac{3N}{8} + \frac{3N^{2}}{8} - 2`$

| \# points | Model<br>Kernel Execution<br>(ms) |
|:---------:|:---------------------------------:|
|   32$^2$  |               0.001               |
|   64$^2$  |               0.005               |
|  128$^2$  |               0.020               |
|  256$^2$  |               0.082               |
|  512$^2$  |               0.328               |
|  1024$^2$ |               1.311               |