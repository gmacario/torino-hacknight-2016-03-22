#!/bin/bash

set -e

echo "INFO: Install pip"
curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py

echo "INFO: Install AXEMAS"
pip install axemas

echo "INFO: Create a new AXEMAS project"
gearbox axemas-quickstart -n ProjectName -p com.company.example

echo "TODO"

# EOF
