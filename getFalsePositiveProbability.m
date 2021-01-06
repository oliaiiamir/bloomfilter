%#####################################################
%  BloomFilter (BloomFilter.m)
%
%  Forked by: https://github.com/oliaiiamir
%
%  Calculate the Probability of False Positives of a given Bloom Filter.
%  Formula: (1 - e^(-k * n / m)) ^ k
% 
%  Inputs:
%  ----> bf:  a Bloom Filter previously created
% 
%  Output:
%  ----> value: value of the probability
% 
%  Usage:
%  ----> probability = getFalsePositiveProbability(filter);
%#####################################################

function value = getFalsePositiveProbability(bf)
  value = ((1 - exp(-bf.k*bf.elementsAdded / bf.size)) ^ bf.k);
end
