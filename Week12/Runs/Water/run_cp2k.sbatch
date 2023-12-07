#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --cpus-per-task=1
#SBATCH --mem=20G
#SBATCH --time=6:00:00
#SBATCH --output=cp2k_job.out
#SBATCH --error=cp2k_job.err

# Load CP2K module
module load cp2k/openmpi/intel/20201212

# Run CP2K
mpirun -np 12 cp2k.popt -i water.inp -o Week12.log