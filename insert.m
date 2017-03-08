###############################################################################
# Function insert (insert.m)
# --> to work with BloomFilter function (BloomFilter.m)
# --> requires string2hash and resultingHash functions (string2hash.m and resultingHash.m)
###############################################################################
# Authors:
# ----> Cristiano Vagos (NMec 65169) 
# ----> Ariel Bastos    (NMec 72204)
#
# Inserts a string in a given Bloom Filter.
# It calls the hash function to compute a hash value,
# and inserts the hash value within the Bloom Filter array
# according with the number of hash functions given by the user.
# Returns a Bloom Filter object.
#
# Inputs:
# ----> bf:  a Bloom Filter previously created
# ----> elem: string to be inserted in the Bloom Filter
#
# Output:
# ----> obj: Bloom Filter object updated with new element in the array
#
# Usage:
# ----> new_filter = insert(old_filter, string);
# 
###############################################################################
function obj = insert(bf, elem)
  hash = string2hash(elem, bf.size);
  for i = 1 : bf.k
    idx = resultingHash(hash, i, bf.size);
    bf.array(idx) = true;
  endfor
  bf.elementsAdded += 1;
  fprintf(1, '\n"%s" successfully inserted into BloomFilter.\n\tNum of Elements -> %d\n', elem, bf.elementsAdded);
  obj = bf;
endfunction
