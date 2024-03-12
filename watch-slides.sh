#!/usr/bin/env sh

zathura out/slides.pdf &
typst watch src/slides/week03.typ out/slides.pdf --root src
