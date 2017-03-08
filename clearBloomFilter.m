###############################################################################
# FUNCTION clearBloomFilter (clearBloomFilter.m)
# --> to work with BloomFilter function (BloomFilter.m)
###############################################################################
#
# Authors:
# ----> Cristiano Vagos (NMec 65169) 
# ----> Ariel Bastos    (NMec 72204)
#
# Clears the array of the given BloomFilter, creating a brand new one, empty.
#
# Inputs:
# ----> bf:  a Bloom Filter previously created
#
# Output:
# ----> obj: the Bloom Filter object
#
# Usage:
# ----> new_filter = clear(old_filter);
# 
###############################################################################
function obj = clearBloomFilter(bf)
  obj = BloomFilter(bf.size, bf.k);
endfunction
