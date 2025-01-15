#!/bin/bash

NAME=boot

# Uncomment to ask for filename
#read -p "File Name: " NAME

nasm -f bin src/$NAME.asm -o build/$NAME.bin
qemu-system-x86_64 build/$NAME.bin