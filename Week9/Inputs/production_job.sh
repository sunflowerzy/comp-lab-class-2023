#!/bin/bash
#SBATCH --job-name=production_job
#SBATCH --nodes=1
#SBATCH --tasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --time=0:20:00  # Adjust as needed
#SBATCH --output=production_job.out
#SBATCH --error=production_job.err

# Load necessary modules and set paths
source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

# Set input and output directories
input_dir="production_3d_binary.lmp"
output_dir="Outputs/3d"  # Adjust the output directory as needed

# Production simulations at different temperatures
temperatures=(1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475)
for temp in "${temperatures[@]}"; do
    mpirun lmp -var configfile ${input_dir}/production_3d_binary.lmp -var id 1 -in ${input_dir}/production_3d_binary.lmp -var temperature ${temp}
done