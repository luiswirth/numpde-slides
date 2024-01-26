#!/usr/bin/env sh

zathura out/main.pdf &
typst watch src/main.typ out/main.pdf
