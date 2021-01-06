%#####################################################
% BloomFilter (BloomFilter.m)
%
% Forked by: https://github.com/oliaiiamir
%
%  Inserts a string in a given Bloom Filter.
%  It calls the hash function to compute a hash value,
%  and inserts the hash value within the Bloom Filter array
%  according with the number of hash functions given by the user.
%  Returns a Bloom Filter object.
% 
%  Inputs:
%  ----> bf:  a Bloom Filter previously created
%  ----> elem: string to be inserted in the Bloom Filter
% 
%  Output:
%  ----> obj: Bloom Filter object updated with new element in the array
% 
%  Usage:
%  ----> new_filter = insert(old_filter, string);
%  
%#####################################################
function obj = insert(bf, elem)
  hash = string2hash(elem, bf.size);
  p=53;
  p_i=p;
  for i = 1 : bf.k
      idx = resultingHash(hash, p_i, bf.size);
      bf.array(i,idx) = 1;
      p_i = mod((p_i * p),bf.size);
  end
  bf.elementsAdded = bf.elementsAdded + 1;
  fprintf(1, '\n"%s" successfully inserted into BloomFilter.\n\tNum of Elements -> %d\n', elem, bf.elementsAdded);
  obj = bf;
end
