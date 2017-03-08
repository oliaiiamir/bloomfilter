###############################################################################
# FUNCTION hashShingle
###############################################################################
# Authors:
# --> Cristiano Vagos 65169
# --> Ariel Bastos 72204
#
# This function hashes the whole set of shingles. Returns a set, hashed.
#
# Input:
# --> shingleSet: set of shingles to be hashed
#
# Calls:
# --> string2hash: to hash each shingle
#
# Output:
# --> shingleHashed: the set of shingles, hashed
#
###############################################################################
function shingleHashed = hashShingle(shingleSet)
  for i = 1 : length(shingleSet)
    shingleHashed(i) = uint32(string2hash(shingleSet{i}, 2^32-1));
  endfor
endfunction