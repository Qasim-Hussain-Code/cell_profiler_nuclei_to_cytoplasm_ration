#!/bin/bash
# create cell_profiler conda environment
conda create -n cell_profiler

# initialize conda environment
eval "$(conda shell.bash hook)"

# activate cell_profiler conda environment
conda activate cell_profiler

# Docker — least painful on Linux
docker run --rm -v "$PWD":/data cellprofiler/cellprofiler:4.2.8 \
  -c -r -p /data/yap_nc.cppipe -i /data/images -o /data/output

# Cellpose
pip install cellpose --upgrade