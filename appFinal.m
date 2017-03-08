###############################################################################
# APLICATION USING BOTH MODULES - BLOOM FILTER AND FINDING SIMILAR ITEMS
###############################################################################
# Authors:
# --> Cristiano Vagos 65169
# --> Ariel Bastos 72204
#
###############################################################################

clear , clc 

# Debug Mode:
# if true, it keeps the variables for checking
# else, clear it all in the end
do
  debug=input('Debug Mode? (0 or 1): ');
until (debug == 0 || debug == 1)
printf('\n');

#Check if file documentos exists

if exist('documentos.txt','file')

# open file and load websites

  documentos = fopen('documentos.txt');

  i = 1;

# get each string from document

  docTxt{i} = strread(fgetl(documentos), '%s');

  i++;

# closing file

fclose(documentos);

#if documentos doesn't exist creates error and exit program
else

  error('Please create documentos.txt and insert all pages');
  
endif

#Ask Users for BloomFilter size
do
  bfLength=input('Insert BloomFilter size: ');
  
#BloomFilter size has to be bigger than 0

  if(bfLength<=0)
    fprintf(1,'\nInsert number bigger than 0\n');
  endif
  
until(bfLength>0)

#Ask Users how many HashFunctions

do
  k=input('Insert number of Hash Functions to be used: ');
  
#The number of hash functions has to be bigger than 0
  
  if(k<=0)
    fprintf(1,'\nInsert number bigger than 0\n');
  endif
  
until(k>0)

#Create BloomFilter

filtro = BloomFilter(bfLength,k);

#Check if file historicoWeb exists

if exist('historicoWeb.txt', 'file')

#Read file with already visited websites

  documentos = fopen('historicoWeb.txt');
  
#Read historicoWeb to second cell

  docTxt{i} = strread(fgetl(documentos), '%s');

  i++;
  
#Closing file

  fclose(documentos);

  k=1;

#insert all historicoWeb in BloomFilter

  while (k<=length(docTxt{2}))
    filtro = insert(filtro,docTxt{2}{k});
    k++;
  endwhile


endif

#User menu

do
  fprintf(1,'\n##########User Menu##########\n');
  fprintf(1,'\n#---- 1 - Check if you have seen a website already\n');
  fprintf(1,'\n#---- 2 - Search similar website\n');
  fprintf(1,'\n#---- 0 - Exit\n');
  opcao=input('Insert option 0 , 1 or 2:  ');
  
#Check if user already saw website 
  
  if(opcao == 1)
    do
      checkMem=input('Insert website: ', 's');
    
#check if file exists
    
      if(!exist(checkMem,'file'))
        fprintf('\nFile "%s" does not exist\n',checkMem);
      end 
      
    until(exist(checkMem,'file'))

#check if member and print 

    if(isMember(filtro,checkMem))
      fprintf(1,'\nYou could have visited "%s"\n', checkMem);
    else
      fprintf(1,'\nYou never visited "%s"\n', checkMem);
    endif
  endif
  
#look for similar website  

  if(opcao == 2)
    do
      fSim=input('Insert website to find similarities: ', 's');
      
#check if file exists

      if(!exist(fSim,'file'))
        fprintf('\nFile "%s" does not exist\n',fSim);
      endif   
      
    until(exist(fSim,'file'))

#check all sites for similars

    j=1;
    z=1;
    while(j<=length(docTxt{1}))

#check user choice with all other sites one by one

    fsi=FindingSimilarItems(fSim,docTxt{1}{j});

#Similarity bigger than .1 to be similar but not equal and not in historic

      if(fsi>=0.1)
        if(!isequal(fSim,docTxt{1}{j}))
          if(!isMember(filtro,docTxt{1}{j}))
            cel{z,1}=fSim;
            cel{z,2}=docTxt{1}{j};
            cel{z,3}=fsi;
            z++;
          endif
        endif
      endif
      j++;
    endwhile
    
#If there's no pages similars 
    
    if(z==1)
      fprintf(1,'\nThere is no similiar sites\n');
    else
    
#print similar items
       m=1;
       while(m<z)
        fprintf('\n"%s" is similar to "%s"\n',cel{m,1},cel{m,2});
        m++;
       endwhile
     endif
  endif

#opcao has to be between 0 and 2 if not error  
  
  if(opcao>2)
  
    fprintf(1,'\nChoose option between 0 and 2\n');
    
  endif
  
  if(opcao<0)
    
    fprintf(1,'\nChoose option between 0 and 2\n');
    
  endif
  
until(opcao==0)

fprintf(1,'\nGoodbye!\n');

# clear it all!!

if (debug == 0)
  clear
endif