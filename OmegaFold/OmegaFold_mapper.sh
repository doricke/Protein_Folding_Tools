#!/bin/bash
#===============================================================================
#
#          FILE:  OmegaFold_mapper.sh
#
#         USAGE:  LLMapReduce mapper script
#
#   DESCRIPTION:  LLMapReduce mapper script for running OmegaFold
#
#  REQUIREMENTS:  omega.sif file
#         NOTES:  Developed to enable parallel computing with OmegaFold
#        AUTHOR:  Adam Michaleas, Adam.Michaleas@ll.mit.edu
#        AUTHOR:  Darrell Ricke, Darrell.Ricke@ll.mit.edu
#       COMPANY:  MIT Lincoln Laboratory
#       VERSION:  1.0
#       CREATED:  11/28/2022 07:45:51 AM EDT
#      REVISION:  ---
#===============================================================================

### Global Variable Declarations ###

FASTA_DIR=fasta_files
OUTPUT_DIR=io
SIF=omega.sif

singularity run -B io/:$OUTPUT_DIR,$FASTA_DIR:$FASTA_DIR $SIF $1 $OUTPUT_DIR
