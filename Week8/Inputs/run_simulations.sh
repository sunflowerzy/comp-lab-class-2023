#!/bin/bash

# Set paths
input_dir="/Inputs"
output_dir="/Outputs"  # Adjust the output directory as needed
log_dir="${output_dir}/Logs"

# Create directory if it doesn't exist
mkdir -p ${log_dir}

# Loop over densities
for density in $(seq 0.5 0.1 1.1); do
    density_value=$(printf "%.1f" ${density})  # Format density to one decimal place
    log_file="${log_dir}/LOGFILE_density_${density_value}.log"

    # Run simulation and save log
    mpirun lmp -var density ${density_value} -in ${input_dir}/your_simulation_script.in -log ${log_file} > /dev/null
done