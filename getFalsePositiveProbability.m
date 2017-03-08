###############################################################################
# FUNCTION getFalsePositiveProbability (getFalsePositiveProbability.m)
# --> to work with BloomFilter function (BloomFilter.m)
###############################################################################
# Authors:
# ----> Cristiano Vagos (NMec 65169) 
# ----> Ariel Bastos    (NMec 72204)
#
# Calculate the Probability of False Positives of a given Bloom Filter.
# Formula: (1 - e^(-k * n / m)) ^ k
#
# Inputs:
# ----> bf:  a Bloom Filter previously created
#
# Output:
# ----> value: value of the probability
#
# Usage:
# ----> probability = getFalsePositiveProbability(filter);
# 

function value = getFalsePositiveProbability(bf)
  value = ((1 - exp(-bf.k*bf.elementsAdded / bf.size)) ^ bf.k)
endfunction
