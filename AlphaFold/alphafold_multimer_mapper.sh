#!/bin/bash
#===============================================================================
#
#          FILE:  alphafold_reduced_multimer_mapper.sh
#
#         USAGE:  LLMapReduce mapper script
#
#   DESCRIPTION:  LLMapReduce mapper script for running AlphaFold
#
#  REQUIREMENTS:  Alphafold.sif and genetics database squashfs file
#  REQUIREMENTS:  Must be run on a Xeon-G6 GPU node
#         NOTES:  Developed to enable parallel computing with AlphaFold
#        AUTHOR:  Adam Michaleas, Adam.Michaleas@ll.mit.edu
#        AUTHOR:  Darrell Ricke, Darrell.Ricke@ll.mit.edu
#       COMPANY:  MIT Lincoln Laboratory
#       VERSION:  1.0
#       CREATED:  10/28/2022 16:20:51 PM EDT
#      REVISION:  ---
#===============================================================================

# Copyright (c) 2022 MIT Lincoln Laboratory

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# $1: input directory

### Global Variable Declarations ###

SIF=AlphaFold_11012022.sif
FS=alphafold_11042022.fs
TMP_DIR=tmp_dir
OUTPUT_DIR=output_full_multimer
FASTA_DIR=fasta_files
MODEL_PRESET=multimer
DB_PRESET=full_dbs
MAX_TEMPLATE_DATE=$(date "+%Y-%m-%d")


singularity run --nv -B $FS:/db:image-src=/,$OUTPUT_DIR:/output,$FASTA_DIR:$FASTA_DIR,$TMP_DIR:/mnt/alphafold/tmp $SIF --fasta_paths=$1 --model_preset=$MODEL_PRESET --db_preset=$DB_PRESET --data_dir=/db/ --output_dir=/output --uniref90_database_path=/db/uniref90/uniref90.fasta --mgnify_database_path=/db/mgnify/mgy_clusters_2018_12.fa --template_mmcif_dir=/db/pdb_mmcif/mmcif_files/ --use_gpu_relax=1 --obsolete_pdbs_path=/db/pdb_mmcif/mmcif_files/obsolete.dat --max_template_date=$MAX_TEMPLATE_DATE --bfd_database_path=/db/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --pdb_seqres_database_path=/db/pdb_seqres/pdb_seqres.txt --uniprot_database_path=/db/uniprot/uniprot.fasta --uniclust30_database_path=/db/uniclust30/uniclust30_2018_08/uniclust30_2018_08
