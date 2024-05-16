#!/usr/bin/env sh

fd "week\d+.typ" src -x typst compile {} out/{/.}.pdf --root src
