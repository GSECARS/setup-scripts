# Installation Guide: GenX3 for RCC

This file includes the basic instructions for a clean GenX3 installation on the Midway2 
General Access System from RCC.

## Usage
- Clone this repository and navigate to the genx3 directory
  ```
  git clone https://github.com/GSECARS/setup-scripts.git && cd setup-scripts/genx3/
  ```
- Run make to configure the installation
  ```
  make
  ```
- Run make install to install GenX3
  ```
  make install
  ```
- Run make clean to run the cleanup process
  ```
  make clean
  ```
  
## After installation
Make sure to move the ``start_genx3.sh`` file to the directory you want to run it from. With RCC we can't add any files
to the ``/usr/local/bin`` directory, so you will always need to navigate to the executable file (or a link to that) in
order to run the application.

<br />

[Christofanis Skordas](mailto:skordasc@uchicago.edu) - Last updated: 03-Mar-2022 