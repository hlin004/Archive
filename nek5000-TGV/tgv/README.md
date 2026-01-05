# Case: TGV

**Code:** Nek5000  
**Purpose:** Nek5000 vs NekLBM comparision for dissipation rate, energy evolution, and velocity profile for specific time 12.11  
**Status:** Used in "A flux bounce-back scheme for the filtered Spectral Element Lattice Boltzmann Method"  
**Location:** https://github.com/hlin004/nek5000-TGV/tree/main/tgv  

## Geometry/Mesh
- Length L = 1
- Length scale L0 = 1/(2*pi)
- Re and time scale based on L0
- Mesh generated with genbox (ms0.box)
- 16^3 elements

## Physics
- Re = 1600
- Incompressible

## Numerics
- Polynomial order: N = 12
- Filtering: explicit

## How to run
```bash
./script.sh
