function h = grafico_teorico(p,x)

n = length(p);
h=zeros(n,1);

if (mod(x,2)==0)
     %%Par
     for II = 1:n

		h(II)=1.0-binocdf(x/2.0,x,p(II))+p(II)*binopdf(x/2,x,p(II));
     end
     text='par'
else
     %%Impar
     for II = 1:n

		h(II)=1.0-binocdf((x-1.0)/2.0,x,p(II));
     end
     text='impar'
end
