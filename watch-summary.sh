#!/usr/bin/env sh

zathura out/summary.pdf &
typst watch src/summary/main.typ out/summay.pdf --root src
