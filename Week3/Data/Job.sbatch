#!/bin/bash
#SBATCH --nodes=20
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=24:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=Zhenyan_assignment
#SBATCH --output=Zhenyan_assignment.out
module purge
module load gromacs/openmpi/intel/2020.4
#note, srun command replaces mpirun for multi node jobs
mpirun -np 1 gmx_mpi mdrun -v -deffnm md_0_1