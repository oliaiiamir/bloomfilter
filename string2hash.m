%#####################################################
% BloomFilter (BloomFilter.m)
%
% Forked by: https://github.com/oliaiiamir
%
%  This function generates a hash value from a text string
% 
%  Inputs:
%  ----> str: The text string, or array with text strings
%  ----> maxSize: maximum size of the hash to be created
% 
%  Output:
%  ----> hash: The hash value, integer value between 0 and maxSize
% 
%  Usage:
%  ----> hash=string2hash('hello world');
%#####################################################
function hash = string2hash(str, maxSize)
  str = double(str);
  hash = 5381*ones(size(str,1),1);
  for i=1:size(str,2)
    hash = mod(hash * 33 + str(:,i), maxSize) + 1;
  end
end
