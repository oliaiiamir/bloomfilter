###############################################################################
# FUNCTION doc2set
###############################################################################
# Authors:
# --> Cristiano Vagos 65169
# --> Ariel Bastos 72204
#
# This function creates a set of shingles (supported by createShingle function)
# by a given document by argument.
#
# We tried to get this function to work to avoid having a huge number of code
# lines but this function insisted and we use it within the main function itself
#
# Inputs:
# --> document: document to be analysed
# --> shingleSize: size of the shingles (k)
#
# Calls:
# --> removechars: to clean-up some dirtiness of each words (points, commas, etc)
# --> createShingle: to create the shingle itself
#
# Output:
# --> theSet: the set of shingles
#
###############################################################################
function theSet = doc2set(document, shingleSize)
  # open file
  doc = fopen(document);
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
  
  theSet = unique(createShingle(wordsSet, shingleSize));
endfunction