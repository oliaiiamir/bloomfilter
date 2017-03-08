###############################################################################
# FUNCTION createShingle
###############################################################################
# Authors:
# --> Cristiano Vagos 65169
# --> Ariel Bastos 72204
#
# This function creates a set of shingles, with a given string set and size
# for each shingle. Includes a example in Portuguese of it.
#
# Inputs:
# --> stringSet: set of strings of the document
# --> shingleSize: size of the shingles (k)
#
# Output:
# --> shingle: the set of shingles
#
###############################################################################
function shingle = createShingle(stringSet, shingleSize)
  # frase de exemplo: "o rato roeu a rolha da garrafa do rei da russia"
  # se shingleSize = 3:
  #
  # set de shingles:
  # "o rato roeu"
  # "a rolha da"
  # "garrafa do rei"
  # "rato roeu a"
  # "rolha da garrafa"
  # "do rei da"
  # "roeu a rolha"
  # "da garrafa do"
  # "rei da Russia"

  idx = 1;   # string set index
  j = 1;     # shingle set index
  while (idx <= length(stringSet))  # stop in the last string
    i = idx;  # string set index
    while(i <= length(stringSet)-(shingleSize-1))    # change shingle set index
      shingle{j} = stringSet{i};  # first word
      for k = 1 : shingleSize-1   # changing line
        shingle{j} = cstrcat(shingle{j}, ' ', stringSet{i+k});  # we concatenate the strings
      endfor
      i += shingleSize;
      j++;              # next!
    endwhile
    idx++;              # next string set index
  endwhile
  shingle = unique(shingle);  # clear up duplicate shingles
endfunction