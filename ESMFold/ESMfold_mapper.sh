#!/bin/bash
#===============================================================================
#
#          FILE:  ESMFold_mapper.sh
#
#         USAGE:  LLsub ./ESMFold_mapper.sh
#
#   DESCRIPTION:  LLMapReduce mapper script for running ESMFold
#
#       OPTIONS:  ---
#  REQUIREMENTS:  esmfold.sif
#  REQUIREMENTS:  Must be run on a GPU node (or remove --nv option)
#          BUGS:  ---
#         NOTES:  Developed to enable parallel computing with ESMFold
#        AUTHOR:  Adam Michaleas, Adam.Michaleas@ll.mit.edu
#        AUTHOR:  Darrell O. Ricke, Ph.D., Darrell.Ricke@ll.mit.edu
#       COMPANY:  MIT Lincoln Laboratory
#       VERSION:  1.0
#       CREATED:  12/06/2022 17:31:34 PM EDT
#      REVISION:  ---
#===============================================================================

# $1: input FASTA file

singularity run --nv -B io/:/io/ esmfold.sif $1
