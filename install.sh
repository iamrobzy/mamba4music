#!/bin/bash

# Script to set up the Audio-Mamba (AuM) environment and install dependencies

# Create a Conda environment
echo "Creating Conda environment 'aum' with Python 3.10.13..."
#conda create -n aum python=3.10.13 -y
#conda activate aum

# Setting up CUDA and CuDNN
echo "Installing CUDA and CuDNN..."
conda install nvidia/label/cuda-11.8.0::cuda-nvcc -y
conda install nvidia/label/cuda-11.8.0::cuda -y
conda install -c conda-forge cudnn -y

# Installing PyTorch and other dependencies
echo "Installing PyTorch and other dependencies..."
pip install torch==2.1.1 torchvision==0.16.1 torchaudio==2.1.1 --index-url https://download.pytorch.org/whl/cu118
pip install -r requirements.txt

# Installing Mamba related packages
echo "Installing Mamba related packages..."
pip install causal_conv1d==1.1.3.post1 mamba_ssm==1.1.3.post1

# Enabling Bidirectional SSM Processing
echo "Copying mamba_ssm folder to site-packages..."
cp -rf vim-mamba_ssm/mamba_ssm $CONDA_PREFIX/lib/python3.10/site-packages

echo "Setup complete! You can now use Audio-Mamba."