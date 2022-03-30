#!/bin/bash
#SBATCH -J "h2o_custom_cp2k"
#SBATCH -A pc2-mitarbeiter
#SBATCH -p all
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -t 01:30:00

module reset
module use $PC2SW/CHEM_PHYS_SW/modules
module load chem/CP2K/8.1_gnu

inp_folder="input_files/"
out_folder="result/"

# string array of input file names
declare -a inp=("h2o_32.inp" "h2o_64.inp"
"h2o_128.inp" "h2o_256.inp"
"h2o_512.inp")

declare -a size=(32 64 128 256 512)

# prefix with folder path to every array string
inp_files=( "${inp[@]/#/${inp_folder}}" )

export OMP_STACKSIZE=100m
export OMP_PLACES=core
export OMP_PROC_BIND=core

# Iterate over input files for diff threads ran over an iter times
for ((i=0; i<${#inp_files[@]};i++));
do
  echo "${inp_files[i]}"
  echo ""
  for th in {1..40..1}
  do
    export OMP_NUM_THREADS=$th
    echo "OMP_THREADS: $OMP_NUM_THREADS"

    mkdir -p ${out_folder}/${size[i]}/${th}

    for it in {1..10..1}
    do

      # Create output file path for each inp file by prepending and substitution
      out=$(echo "${out_folder}${size[i]}/${th}/${inp[i]}_t${th}_iter${it}.out" | sed -e "s/.inp//g")
      #echo $out
      cp2k.psmp -i ${inp_files[i]} > ${out} 2> err
    done 

  done
  echo ""
done
#mpirun --report-bindings cp2k.psmp -i ${appl} > ${appl}.out 2> err
