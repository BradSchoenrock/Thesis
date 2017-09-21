#!/bin/bash

for file in "$@"   # "$@" contains all the command line arguments passed to the program
do
  aspell --add-tex-command="eqref p" --add-tex-command="psfrag pP" --add-tex-command="special p" --encoding=iso-8859-1 -t check $file
done
