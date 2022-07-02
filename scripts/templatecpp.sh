#!/usr/bin/env bash

# Creates a file based on a C++ template for competitive programming.
# Takes one argument: the file path.

filepath=$1
echo "Creating file from CP template..."
cp ~/cp-template/template.cpp "$PWD"/"${filepath}.cpp"
