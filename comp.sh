#!/bin/bash

NAME=boot

# Uncomment to ask for filename
#read -p "File Name: " NAME

nasm -f bin $NAME.asm -o $NAME.bin
qemu-system-x86_64 $NAME.bin