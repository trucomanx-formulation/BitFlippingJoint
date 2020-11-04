function h=probabilidadconjunta(n,nb,p)
h=0.5*( p^nb*(1-p)^(n-nb) + (1-p)^(nb)*p^(n-nb) );
