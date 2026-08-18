#!/bin/bash
# create cell_profiler conda environment; needs python and pip installed explicitly
conda create -n cell_profiler -c conda-forge python=3.11 pip numpy scipy pandas scikit-image tifffile

# initialize conda environment
eval "$(conda shell.bash hook)"

# activate cell_profiler conda environment
conda activate cell_profiler

# enable flatpak
sudo apt install flatpak

# download the cellprofiler flatpak, -c resumes rather than restarting 467 MB
wget -c https://cellprofiler-releases.s3.us-east-1.amazonaws.com/org.cellprofiler.CellProfiler-4.2.8.1-x86_64.zip

# unzip the cellprofiler flatpak, -o skips the replace prompt on a re-run
unzip -o org.cellprofiler.CellProfiler-4.2.8.1-x86_64.zip

# the bundle carries CellProfiler but not the freedesktop runtime it links against
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# install the cellprofiler flatpak — no sudo, flatpak refuses it alongside --user,
# and the argument is the unzipped .flatpak, not the zip name
flatpak install --user org.cellprofiler.CellProfiler.flatpak

# let the sandbox read the image folder, otherwise the file browser sees an empty home
flatpak override --user --filesystem="$HOME/cell_profiler_nuclei_to_cytoplasm_ration" org.cellprofiler.CellProfiler

# install cellpose
pip install cellpose --upgrade