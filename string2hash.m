###############################################################################
# FUNCTION string2hash (string2hash.m) 
###############################################################################
# Original function in http://www.mathworks.com/matlabcentral/fileexchange/27940-string2hash/content/string2hash.m
# From c-code on : http://www.cse.yorku.ca/~oz/hash.html
# Algorithm used is "djb2", first reported by Dan Bernstein many years ago, in comp.lang.c
# Function is written by D.Kroon - University of Twente (June 2010)
#
# This function generates a hash value from a text string
#
# Inputs:
# ----> str: The text string, or array with text strings
# ----> maxSize: maximum size of the hash to be created
#
# Output:
# ----> hash: The hash value, integer value between 0 and maxSize
#
# Usage:
# ----> hash=string2hash('hello world');
#    
###############################################################################
function hash = string2hash(str, maxSize)
  str = double(str);
  hash = 5381*ones(size(str,1),1);
  for i=1:size(str,2),
    hash = mod(hash * 33 + str(:,i), maxSize) + 1;
  endfor
endfunction
