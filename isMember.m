%#####################################################
% BloomFilter (BloomFilter.m)
%
% Forked by: https://github.com/oliaiiamir
%
%  Verifies if the given string is (probably) in the array
%  It calls the hash function to compute a hash value,
%  and checks if the hash value is within the Bloom Filter array
%  according with the number of hash functions given by the user.
%  Returns true (1) or false (0), according with the result.
%  If it's true, then probably the word is within the array.
%  Else, the word is definately not in the array.
%
%  Inputs:
%  ----> bf:  a Bloom Filter previously created
%  ----> elem: string to be verified in the Bloom Filter
% 
%  Output:
%  ----> bool: result of the operation
% 
%  Usage:
%  ----> isMember(filter, string); 
%#####################################################
function bool = isMember(bf, elem)
  hash = string2hash(elem, bf.size);
  bool = false;
  p=53;
  p_i=p;
  for i = 1 : bf.k
    idx = resultingHash(hash, p_i, bf.size);
    p_i = mod((p_i * p),bf.size);
    if(bf.array(i,idx))
      bool = true;
      return;
    end
  end
end
