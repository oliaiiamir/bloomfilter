I use Matlab2020b and code didn't work for me properly so i made a few changes just for some of the functions

I also added little bit of lhbf BloomFilter from python into this code 



 n: Size of Bloom Filter
 
 k: Number of Hash Functions to be used

filter = BloomFilter(n, k); % make the BloomFilter

new_filter = clear(filter); %make a new BF out of previous one..

probability = getFalsePositiveProbability(filter); %give you the FPP of BF

new_filter = insert(old_filter, string); %insert into BF "string" 

isMember(filter, string); %check for "string" in BF and return true or false *true might be a False Positive




