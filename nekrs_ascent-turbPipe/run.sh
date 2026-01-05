#!/bin/bash

NNODES=`wc -l < $PBS_NODEFILE`
NRANKS=4
NDEPTH=8
NTOTRANKS=$(( NNODES * NRANKS ))

module restore
module swap PrgEnv-nvhpc PrgEnv-gnu
module load cudatoolkit-standalone
module load cmake
module load ascent
module unload cray-libsci
export CRAY_ACCEL_TARGET=nvidia80
export MPICH_GPU_SUPPORT_ENABLED=1

export FI_OFI_RXM_RX_SIZE=8192

ulimit -s unlimited
export NEKRS_HOME=/eagle/ExaNek_NEUP_IRP2/hlin/nekrs-ascent/install
export NEKRS_GPU_MPI=1
export ROMIO_HINTS=$NEKRS_HOME/examples/turbPipe/.romio_hint

mpiexec -np $NTOTRANKS -ppn $NRANKS -d $NDEPTH --cpu-bind depth $NEKRS_HOME/bin/nekrs --backend CUDA --setup turbPipe
