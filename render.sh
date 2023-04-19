#!/bin/sh
mkdir -p docs
pandoc -V documentclass=report -V classoption=oneside -V geometry:vmargin=14.5mm -V lang:de --fail-if-warnings --output=docs/modsim_SS23_IN2010_merge.pdf md/*.md