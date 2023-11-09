#!/bin/bash

# Define the range of densities to scan
densities="0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5"

for density in $densities; do
    mpirun lmp -var density $density -in Inputs/3dWCA.in
done