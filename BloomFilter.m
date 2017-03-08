###############################################################################
# FUNCTION BloomFilter (BloomFilter.m)
###############################################################################
# Authors:
# ----> Cristiano Vagos (NMec 65169) 
# ----> Ariel Bastos    (NMec 72204)
#
# Creates a BloomFilter object.
# For more information about Bloom Filters, check Wikipedia:
# https://en.wikipedia.org/wiki/Bloom_filter
#
# Inputs:
# ----> n: Size of Bloom Filter
# ----> k: Number of Hash Functions to be used
#
# Output:
# ----> obj: the Bloom Filter object
#        --> k:             as stated above
#        --> size:          as stated above (about argument n)
#        --> array:         array of bytes with size given in the argument k
#        --> elementsAdded: number of elements added to the array
#
# Usage:
# ----> filter = BloomFilter(100, 2);
#
############################################################################### 
function obj = BloomFilter(n, k)
  fprintf(1, '\nCreating BloomFilter...\n');
            
  if (nargin == 2)
    if (k <= 0 || n <= 0)
      error("The numbers must be over zero!");
      fprintf(1, '\nExiting...\n');
      exit
    endif
                
    obj.k = k;
    obj.size = n;
    obj.array = zeros(1,n,'uint8');
    obj.elementsAdded = 0;
                  
    # Shows basic information about the Bloom Filter created
    fprintf(1, '\nBloomFilter sucessfully created.\n\tSize -> %d\n\tNumber of Hash Functions ->%d\n', n, k);
  else
    # No values for n nor k, display error and exit
    error("Please assign values to BF object!");
    fprintf(1, '\n\tExample: BF = BloomFilter(100,2);\nExiting...\n');
    exit
  endif
endfunction
