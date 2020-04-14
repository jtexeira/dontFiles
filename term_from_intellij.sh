#!/bin/sh

st sh -c "cd $(xdotool search JetBrains getwindowname | perl -ne 's/.*\[(.*)].*/\1/g and print'); bash"
