
import biotite.structure.io as bsio
import esm
import sys
import torch
import string
from InputFile import InputFile;
from FastaIterator import FastaIterator;
from FastaSequence import FastaSequence;

#
# This provides an iterator for a FASTA sequence library file to ESMFold.
#
# Author:    	Darrell O. Ricke, Ph.D.  (mailto: Darrell.Ricke)
# Copyright: 	Copyright (c) 2022 Darrell O. Ricke, Ph.D., MIT Lincoln Laboratory
#         
###############################################################################



###############################################################################
#
# This code tests the FastaEsmFold object.
#
if ( __name__ == "__main__" ) and (len(sys.argv) >= 2):
  model = esm.pretrained.esmfold_v1()
  model = model.eval().cuda()

  test = FastaIterator()
  test.setFileName ( sys.argv[1] )
  test.openFile ()
  while ( test.isEndOfFile () == 0 ):
    fasta = test.nextSequence ()
    if ( fasta.sequence != "" ):
      #sequence = "MKTVRQERLKSIVRILERSKEPVSGAQLAEELSVSRQVIVQDIAYLRSLGYNIVATPRGYVLAGG"
      sequence = fasta.getSequence()
      with torch.no_grad():
        output = model.infer_pdb( sequence )

      with open(fasta.getName() + ".pdb", "w") as f:
        f.write(output)
        print(fasta.getName() + ".pdb")

      struct = bsio.load_structure(fasta.getname() + ".pdb", extra_fields=["b_factor"])
      print("pLDDT: ", struct.b_factor.mean())

  test.closeFile ()



