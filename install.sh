#!/bin/bash
# create cell_profiler conda environment
conda create -n cell_profiler

# initialize conda environment
eval "$(conda shell.bash hook)"

# activate cell_profiler conda environment
conda activate cell_profiler

# enable flatpak 
sudo apt install flatpak

# download the cellprofiler flatpak
wget https://cellprofiler-releases.s3.us-east-1.amazonaws.com/org.cellprofiler.CellProfiler-4.2.8.1-x86_64.zip

# unzip the cellprofiler flatpak
unzip org.cellprofiler.CellProfiler-4.2.8.1-x86_64.zip

# install the cellprofiler flatpak
sudo flatpak install --user org.cellprofiler.CellProfiler-4.2.8.1-x86_64

# install cellpose
pip install cellpose --upgrade