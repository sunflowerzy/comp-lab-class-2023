#!/bin/bash

#SBATCH --nodes=20
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=24:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=gzy_week3
#SBATCH --output=gzy_assignment.out

module load gromacs/openmpi/intel/2020.4

mpirun -np 1 gmx_mpi grompp -f md.mdp -o 1AKI-md_0_1.tpr -t 1AKI-md_0_1.cpt -c 1AKI-npt.gro -p topol.top
mpirun gmx_mpi mdrun -v -deffnm 1AKI-md_0_1
