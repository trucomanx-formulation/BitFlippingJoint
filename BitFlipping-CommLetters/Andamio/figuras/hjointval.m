function h=hjointval(M,p)
h=0;
for nb=0:M
h=h-nchoosek(M,nb)*probabilidadconjunta(M,nb,p)*log2(probabilidadconjunta(M,nb,p));
endfor

