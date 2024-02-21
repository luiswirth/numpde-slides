#!/usr/bin/env sh

zathura out/slides.pdf &
typst watch src/slides/week01.typ out/slides.pdf --root src
