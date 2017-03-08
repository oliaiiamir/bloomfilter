###############################################################################
# FUNCTION removechars
###############################################################################
# Authors:
# --> Cristiano Vagos 65169
# --> Ariel Bastos 72204
#
# This function removes characters from a given string.
#
# Inputs:
# --> str: string to be (or not) changed
# --> chars: characters to be analysed if they are in the string
#
# Output:
# --> str: the string with those characters removed
#
###############################################################################
function str = removechars(str, chars)
  chars = unique(chars);        # make sure there are no duplicate characters
  for i = 1 : length(chars)
    str(str==chars(i)) = [];    # clear up string
  endfor 
endfunction 