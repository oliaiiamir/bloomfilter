%#####################################################
%  clearBloomFilter (clearBloomFilter.m)
%  --> to work with BloomFilter function (BloomFilter.m)
%
%
% Forked by: https://github.com/oliaiiamir
%
%  Clears the array of the given BloomFilter, creating a brand new one, empty.
% 
%  Inputs:
%  ----> bf:  a Bloom Filter previously created
% 
%  Output:
%  ----> obj: the Bloom Filter object
% 
%  Usage:
%  ----> new_filter = clear(old_filter);
%#####################################################
function obj = clearBloomFilter(bf)
  obj = BloomFilter(bf.size, bf.k);
end
