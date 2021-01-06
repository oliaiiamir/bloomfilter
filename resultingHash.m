%#####################################################
% BloomFilter (BloomFilter.m)
%
% Forked by: https://github.com/oliaiiamir
%
%  Computes the hash previously computed in the string2hash (string2hash.m) function
%  accordingly to the number of hash transforms stated in the BloomFilter.
%  Returns a new hash value, according with the size of the array.
% 
%  Inputs:
%  ----> hash: hash value calculated in string2hash function
%  ----> i: number of current hash transform
%  ----> arraySize: size of the Bloom Filter array
% 
%  Output:
%  ----> result: result of the operation
% 
%  Usage:
%  ----> resultingHash(hashvalue, i, arraySize); 
%#####################################################
function result = resultingHash(hash, i, arraySize)
  result = abs(mod((hash * i), arraySize));
  if(result == 0)
      result = arraySize;
  end
end
