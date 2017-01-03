#!/bin/bash

# Specify colors for shell
red='tput setaf 1'              # red
green='tput setaf 2'            # green
yellow='tput setaf 3'           # yellow
blue='tput setaf 4'             # blue
violet='tput setaf 5'           # violet
cyan='tput setaf 6'             # cyan
white='tput setaf 7'            # white
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold red
bldgrn=${txtbld}$(tput setaf 2) # Bold green
bldblu=${txtbld}$(tput setaf 4) # Bold blue
bldcya=${txtbld}$(tput setaf 6) # Bold cyan
normal='tput sgr0'

./vendor/cm/colors
echo -e "";
tput setaf 1
echo "                                   ";
echo " _|_|_|     _|      _|   _|_|_|    ";
echo " _|    _|   _|_|    _|   _|    _|  ";
echo " _|    _|   _|  _|  _|   _|    _|  ";
echo " _|    _|   _|    _|_|   _|    _|  ";
echo " _|_|_|     _|      _|   _|_|_|    ";
echo "                                   ";
echo "                                   ";
echo -e "";
tput setaf 2
echo -e " √ Build is Successfully Done! ";
echo -e "";
