#!/usr/bin/env sh

FILE=$1

typst watch src/"$FILE".typ out/"$FILE".pdf --root src &

while :
do
  zathura out/"$FILE".pdf
done
