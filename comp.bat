@echo off
set NAME=boot

:: Uncomment to ask for filename
::set /p NAME="File Name: "

:: Change .img to .bin if you are trying to run on unix
nasm -f bin src/%NAME%.asm -o build/%NAME%.img