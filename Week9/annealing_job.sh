#!/bin/bash
#SBATCH --job-name=annealing_job
#SBATCH --nodes=1
#SBATCH --tasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --output=annealing_job.out
#SBATCH --error=annealing_job.err

# Load necessary modules and set paths
source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

# Set input and output directories
input_dir="Inputs/n360"
output_dir="Outputs"  

# Create the system
mpirun lmp -var configfile ${input_dir}/kalj_n360_create.lmp -var id 1 -in ${input_dir}/create_3d_binary.lmp

# Equilibrate at different temperatures
temperatures=(1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475)
for temp in "${temperatures[@]}"; do
    mpirun lmp -var configfile ${input_dir}/kalj_n360_T${temp}.lmp -var id 1 -in ${input_dir}/anneal_3d_binary.lmp
done