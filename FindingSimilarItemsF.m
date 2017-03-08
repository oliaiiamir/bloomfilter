###############################################################################
# FINDING SIMILAR ITEMS
###############################################################################
# Authors:
# --> Cristiano Vagos 65169
# --> Ariel Bastos 72204
#
###############################################################################
  
###############################################################################
# CREATE SHINGLES FOR EACH DOCUMENT
###############################################################################
#
# We tried to build a function doc2set (it's in the folder, with same code)
# but we don't like errors, so here it is...
#
  
  #Ask users for documents
  doc1=input('Insert name of Document ', 's');
  doc2=input('Insert name of Document ', 's');
 
  fprintf(1, '\nCreating shingles...\n');
  # we want shingles of k-size (we will call it shingleSize)
  shingleSize = 4;
  tic
    
  # open file
  doc = fopen(doc1);
  i = 1;
  # get each string from document
  while (! feof(doc) )
    txt{i} = strread(fgetl(doc), '%s');
    i++;
  endwhile
  # closing file
  fclose(doc);
    
  # we make sure that each cell is only text, leaving only letters
  for i = 1 : length(txt{1})
    wordsSet{i} = removechars(txt{1}{i}, '.,;:-_()');
  endfor
    
  # we also make sure that each cell is not empty
  wordsSet = wordsSet(~cellfun('isempty',wordsSet));
    
  # returning the shingle set
  shingleSetDoc1 = createShingle(wordsSet, shingleSize);
    
  # clearing some vars to be used next on (to avoid conflict)
  clear doc
  clear wordsSet
  clear txt
    
  # open file
  doc = fopen(doc2);
  i = 1;
  # get each string from document
  while (! feof(doc) )
    txt{i} = strread(fgetl(doc), '%s');
    i++;
  endwhile
  # closing file
  fclose(doc);
    
  # we make sure that each cell is only text, leaving only letters
  # and convert them all to lowercase, to analyse the text itself
  for i = 1 : length(txt{1})
    wordsSet{i} = removechars(txt{1}{i}, '.,;:-_()');
	  wordsSet{i} = lower(wordsSet{i});
  endfor
    
  # we also make sure that each cell is not empty
  wordsSet = wordsSet(~cellfun('isempty',wordsSet));
    
  # returning the shingle set
  shingleSetDoc2 = createShingle(wordsSet, shingleSize);
    
  # clearing some memory...
  clear doc
  clear wordsSet
  clear txt
  clear shingleSize
  clear doc1
  clear doc2
    
  toc
  # done
  fprintf(1, 'Done.\n');
    
  ###############################################################################
  # MIN HASHING - USING MANY HASH TECHNIQUE (with a single hash function)
  ###############################################################################
  
  fprintf(1, '\nGenerating Hash values for our shingles...\n');
  tic
  
  # create the arrays for the awesome hash values...
  minHash1 = uint32(zeros(1,200));
  minHash2 = uint32(zeros(1,200));
  
  # we store the original shingle hashed, to be used next
  hashShingleDoc1 = hashShingle(shingleSetDoc1);
  hashShingleDoc2 = hashShingle(shingleSetDoc2);
  
  # we store the first minimum value of hash value from our hash function
  minHash1(1) = min(hashShingleDoc1);
  minHash2(1) = min(hashShingleDoc2);
  
  # generate 199 random integer numbers...
  randNumbers = randi(2^32-1,1,199, 'uint32');
  
  # we XOR the minimum hash values found in the shingles with our random numbers
  #
  # i.e.: if we had a document with 10000 words long and other with 20000 words, 
  # we had to create shingles for each document. Suppose we have 9996 shingles in
  # document1, and 19996 shingles in document2.
  # So instead of comparing 9996 with 19996, we compare 200 shingles and we save
  # workload for our machine.
  #
  # Idea from: http://matthewcasperson.blogspot.com/2013/11/minhash-for-dummies.html
  #
  for i = 2 : length(randNumbers)
    # we first XOR the shingle hashed with our hash function with a random number
    # then, we store the minimum value of the XOR operation
    minHash1(i) = min(bitxor(hashShingleDoc1, randNumbers(i)));
    minHash2(i) = min(bitxor(hashShingleDoc2, randNumbers(i)));
  endfor
  
  toc
  fprintf(1, 'Done.\n');

  # clearing some more memory...
  clear randNumbers
  clear shingleSetDoc1
  clear shingleSetDoc2
  clear hashShingleDoc1
  clear hashShingleDoc2
    
  ###############################################################################
  # DISPLAY SIMILARITY
  ###############################################################################
    
  # We need to estimate the probability of having minHash1 == minHash2, dividing the
  # result (y) by the number of trials (k) and that result is equal to Jaccard Similarity.
  # So, our 'y' will be the number of successes, and 'k' will be 200, as stated above.
  #
  # According to Chernoff Bounds, this algorithm has O(1/sqrt(k)) expected error.
  # http://en.wikipedia.org/wiki/Chernoff_bound

  fprintf(1, '\nCalculating Jaccard Similarity...\n');
  tic
  
  # number of successes (y) and trials (k)
  y = 0;
  k = 200;
  
  # search for common hash values
  # if we found one, it means that the same shingle exists in the other document
  for i = 1 : length(minHash1)
    for j = 1 : length(minHash1)
      if(minHash1(i) == minHash2(j))
        y++;
      endif
    endfor
  endfor
  
  toc
  jaccardSimilarity = y/k;
  fprintf(1, 'Done.\n');
