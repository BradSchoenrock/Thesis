#!/bin/bash

for file in "$@"   # "$@" contains all the command line arguments passed to the program
do
  aspell --add-tex-command="eqref p" --add-tex-command="psfrag pP" --add-tex-command="special p" --encoding=iso-8859-1 -t check $file
done


#bash spellcheck.sh main.tex Introduction.tex Experiment.tex DataTriggers.tex ObjectReconstruction.tex EventSimulation.tex EventSelection.tex Analysis.tex Results.tex Conclusion.tex 
