# FFT FPGA & Convolution 3D Evaluation Archive

This repository archives quantitative reports from several codebases in a continuous manner that reflects the codebases' current state as well as keeps track of improvements for analysis and reference to scientific sources.  

## Where are the reports from?

1. [FFTFPGA](https://github.com/pc2/fft3d-fpga) : an OpenCL based library for Fast Fourier Transformations for FPGAs 
2. [ConvFPGA]() : an OpenCL based library for FFT-based convolution on FPGAs

## What am I archiving?
 
- [performance logs](https://git.uni-paderborn.de/arjunr/fftfpga-eval/-/tree/master/performance_logs) : measured runtime and throughput from executions of different configurations
- [power measurements](https://git.uni-paderborn.de/arjunr/fftfpga-eval/-/tree/master/power_measures) : average and peak power consumed from execution of different configurations on the FPGAs 
- [resource utilisation reports](https://git.uni-paderborn.de/arjunr/fftfpga-eval/-/tree/master/synth_reports) : aocl quartus reports obtained from synthesis on Intel FPGAs that provide information such as clock frequency of the synthesized bitstream, percentage of BRAMs used etc.

Follows a common folder hierarchy: 

```bash
report_type > fpga_name > SDK_BSP_ids > codebase_name > configuration_variant > report_name
```

for example:

```bash
synth_reports > 520N > 20.4sdk_19.4hpc > fft3d > ddr > fft3d_ddr_128_i100.log
```

## Where are they measured?

These reports are measured using the following FPGAs present in the [Noctua](https://pc2.uni-paderborn.de/hpc-services/available-systems/noctua1/) cluster of the Paderborn Center for Parallel Computing (PC2) at Paderborn University:

- [Bittware 520N](https://www.bittware.com/fpga/520n/) card with Intel Stratix 10 GX 2800 FPGA
- [Intel FPGA PAC D5005](https://www.intel.com/content/www/us/en/programmable/products/boards_and_kits/dev-kits/altera/intel-fpga-pac-d5005/overview.html) card with Intel Stratix 10 SX 2800 FPGA

## How are they measured?

This information can be found in the respective codebases. Just follow the links provided above.

## How does the continuous release work?

The release tags of this repository matches the release tags of the codebases.

## Publications and Releases

### v1.0

Links to codebases: FFTFPGA, ConvFPGA 

Papers:
1. Evaluating the Design Space for Offloading 3D FFT Calculations to an FPGA for High-Performance Computing : https://doi.org/10.1007/978-3-030-79025-7_21
2. Efficient Ab-Initio Molecular Dynamic Simulations by Offloading Fast Fourier Transformations to FPGAs : https://doi.org/10.1109/FPL50879.2020.00065


## Contact

- [Arjun Ramaswami](https://github.com/arjunramaswami)
- [Tobias Kenter](https://www.uni-paderborn.de/person/3145/)
- [Thomas D. Kühne](https://chemie.uni-paderborn.de/arbeitskreise/theoretische-chemie/kuehne/)
- [Christian Plessl](https://github.com/plessl)

## Acknowledgements

- [Marius Meyer](https://pc2.uni-paderborn.de/about-pc2/staff-board/staff/person/?tx_upbperson_personsite%5BpersonId%5D=40778&tx_upbperson_personsite%5Bcontroller%5D=Person&cHash=867dec7cae43afd76c85cd503d8da47b) for code reviews, testing and discussions.

