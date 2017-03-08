%%
% MPEI - Guiao 6 (BloomFilters)
% Programa de Teste
%
% Autores:
% - Cristiano Vagos 65169
% - Ariel Bastos
%%

% limpar a casa
clear, clc

filtro=BloomFilter(8000,3);
N=1000;
for i=1:N
palavra='';
  for j=1:40
    x=floor(rand()*3+1);
    if(x==1)
      palavra = strcat(palavra,char('a' + (floor(rand()*26))));
    elseif(x==2)
      palavra = strcat(palavra,char('A'+(floor(rand()*26))));
    elseif(x==3)
      palavra=strcat(palavra,int2str((floor(rand()*9))));
    end
   end
   filtro = insert(filtro, palavra);
end

M=10000;
for i=1:M
palavra1='';
  for j=1:40
    x=floor(rand()*3);
    if(x==1)
      palavra1 =strcat(palavra1,char('a' + (floor(rand()*26))));
    elseif(x==2)
      palavra1 = strcat(palavra1,char('A'+(floor(rand()*26))));
    elseif(x==3)
      palavra1=strcat(palavra1,int2str((floor(rand()*9))))
    end
   end
   if(isMember(filtro, palavra1))
    fprintf(1,'\nA palavra "%s" podera pertencer ao filtro\n', palavra1);
   else
    fprintf(1,'\nA palavra "%s" nao pertence ao filtro\n', palavra1);
   endif
end