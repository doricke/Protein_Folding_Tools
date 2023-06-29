### Instructions for running the G01 DeepMind AlphaFold Singularity container ###

**Authors:** Adam Michaleas (Adam.Micheas@ll.mit.edu) and
             Darrell O. Ricke, Ph.D. (Darrell.Ricke@ll.mit.edu) 

**RAMS request ID 1022407**

**Overview:**
This is a Singularity container of DeepMind AlphaFold tool.

**Citation:** None

**Disclaimer:**
DISTRIBUTION STATEMENT A. Approved for public release. Distribution is unlimited.

This material is based upon work supported by the Department of the Air Force under 
Air Force Contract No. FA8702-15-D-0001. Any opinions, findings, conclusions or 
recommendations expressed in this material are those of the author(s) and do not 
necessarily reflect the views of the Department of the Air Force.

© 2023 Massachusetts Institute of Technology.

Subject to FAR52.227-11 Patent Rights - Ownership by the contractor (May 2014)

The software/firmware is provided to you on an As-Is basis

Delivered to the U.S. Government with Unlimited Rights, as defined in DFARS 
Part 252.227-7013 or 7014 (Feb 2014). Notwithstanding any copyright notice, 
U.S. Government rights in this work are defined by DFARS 252.227-7013 or 
DFARS 252.227-7014 as detailed above. Use of this work other than as specifically 
authorized by the U.S. Government may violate any copyrights that exist in this work.

**To build:** singularity build alphafold.sif alphafold.def

**To run:**

Example protein: ZN536_HUMAN

singularity run --writable-tmpfs --contain --nv --nvccli -B alphafold_11042022.fs:/db:image-src=/,/data/Proteins/AlphaFold/output_dir:/output,/data/Proteins/AlphaFold/io:/data/Proteins/AlphaFold/io,/data/Proteins/AlphaFold/tmp_dir:/mnt/alphafold/tmp AlphaFold_11012022 --use_gpu_relax --fasta_paths=/data/Proteins/AlphaFold/io/ZN536_HUMAN --model_preset=monomer --db_preset=full_dbs --data_dir=/db/ --output_dir=/output --uniref90_database_path=/db/uniref90/uniref90.fasta --mgnify_database_path=/db/mgnify/mgy_clusters_2018_12.fa --template_mmcif_dir=/db/pdb_mmcif/mmcif_files/ --use_gpu_relax=1 --obsolete_pdbs_path=/db/pdb_mmcif/mmcif_files/obsolete.dat --max_template_date=2023-02-03 --bfd_database_path=/db/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt --uniclust30_database_path=/db/uniclust30/uniclust30_2018_08/uniclust30_2018_08 --pdb70_database_path=/db/pdb70/pdb70
