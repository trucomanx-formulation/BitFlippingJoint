%%%%%
%%%%%    C/r >= R >= H(M,rho)/M
%%%%%

r=1/2;
M=3;

EbN0db=[0:1/3:10];

EbN0=(10.0).^(EbN0db/10.0);

Pc=qfunc(sqrt(2*r*EbN0));

C=1-hb(Pc);
HM=ones(size(EbN0db))/M;	%rho=1.0

%plot(EbN0db,C,'-o'), grid;

plot(EbN0db,C/r,'-o',EbN0db,HM,'-s'), grid;
