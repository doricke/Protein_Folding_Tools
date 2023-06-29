# ESMFold
ESMFold Singularity container

**Authors:** Darrell O. Ricke, Ph.D. (Darrell.Ricke@ll.mit.edu)
        Adam Michaleas (Adam.Micheas@ll.mit.edu)

Evolutionary Scale Modeling (ESM) - https://github.com/facebookresearch/esm

**To build:** singularity build esmfold.sif esmfold.def

**To run:** singularity run -B io/:/io/ esmfold.sif <name.fasta>
