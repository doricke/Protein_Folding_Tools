# OmegaFold
OmegaFold Singularity container

**Author:** Darrell O. Ricke, Ph.D. (Darrell.Ricke@ll.mit.edu)

**To build:** 
          singularity build omega.sif omega.def
          singularity build --sandbox omega omega.def   # Alternative to build sandbox Singularity container

**To run:**
          singularity run -B <io directory>/:/io/ omega.sif /io/<FASTA input> /<io directory>

          singularity run -B io/:/io/ omega.sif /io/hbb_human.fa /io/hbb

Note: OmegaFold will write a .pdb file to the mapped io directory.
