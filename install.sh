#!/bin/bash
# create cell_profiler conda environment
conda create -n cell_profiler

# activate cell_profiler conda environment
conda activate cell_profiler

# install cellprofiler
conda install -c conda-forge cellprofiler

# test cellprofiler installation
cellprofiler --version