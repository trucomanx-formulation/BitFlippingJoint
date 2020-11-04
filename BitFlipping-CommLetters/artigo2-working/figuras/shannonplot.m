%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Rho=[0.005 0.05 0.1 0.5]
M=[1 2 3 5 10 20  30  40 100]

RhoMat=ones(length(Rho),length(M));
for I=1:length(Rho)
	RhoMat(I,:)=Rho(I);
endfor

MMat  =ones(length(Rho),length(M));
for I=1:length(M)
	MMat(:,I)=M(I);
endfor

H=hjoint(MMat,RhoMat);

Hm_m=H./MMat;

M005=[1:50];
Hm_m005=spline(M,Hm_m(1,:),M005);
M05=[1:50];
Hm_m05=spline(M,Hm_m(2,:),M05);
M1=[1:50];
Hm_m1=spline(M,Hm_m(3,:),M1);
M5=[1:50];
Hm_m5=spline(M,Hm_m(4,:),M5);

FONTSIZE=36;
MZ=22;
semilogx(	 M,Hm_m(1,:),'-<','markersize',MZ
		,M,Hm_m(2,:),'->','markersize',MZ
		,M,Hm_m(3,:),'-^','markersize',MZ
		,M,Hm_m(4,:),'-v','markersize',MZ
		%%,M005,Hm_m005,'-','markersize',MZ
		%%,M05,Hm_m05,'-','markersize',MZ
		%%,M1,Hm_m1,'-','markersize',MZ
		%%,M5,Hm_m5, '-','markersize',MZ
	),grid('minor')
axis([1 100 0.0 1.0])

set(gca,'fontsize',FONTSIZE,'GridLineStyle','--'); % sets font of numbers on axes

xlabel('M','fontsize',FONTSIZE);
ylabel('H(M,\rho)/M','fontsize',FONTSIZE);

legend('\rho=0.005','\rho=0.050','\rho=0.100','\rho=0.500',3);
legend('boxon');

print('figHmm_test.eps','-deps','-portrait','-F:32');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=2.0/3.0;
R=Hm_m;

EbNo=((qfuncinv(hbinv(1-r*R))).^2.0)./(2.0*r*R);
EbNodB=10*log10(EbNo);

FONTSIZE=36;
MZ=22;

semilogx(	 M,EbNodB(1,:),'-<','markersize',MZ
	,M,EbNodB(2,:),'->','markersize',MZ
	,M,EbNodB(3,:),'-^','markersize',MZ
	,M,EbNodB(4,:),'-v','markersize',MZ
	);grid('minor');


set(gca,'fontsize',FONTSIZE,'GridLineStyle','--'); % sets font of numbers on axes

xlabel('M','fontsize',FONTSIZE);
ylabel('(E_b/N_0)_{dB}','fontsize',FONTSIZE);

legend('\rho=0.005','\rho=0.050','\rho=0.100','\rho=0.500',3);
legend('boxon');

print('figr23_test.eps','-deps','-portrait','-F:32');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

r=1.0/2.0;
R=Hm_m;

EbNo=((qfuncinv(hbinv(1-r*R))).^2.0)./(2.0*r*R);
EbNodB=10*log10(EbNo);

FONTSIZE=36;
MZ=22;

semilogx(	 M,EbNodB(1,:),'-<','markersize',MZ
	,M,EbNodB(2,:),'->','markersize',MZ
	,M,EbNodB(3,:),'-^','markersize',MZ
	,M,EbNodB(4,:),'-v','markersize',MZ
	);grid('minor');


set(gca,'fontsize',FONTSIZE,'GridLineStyle','--'); % sets font of numbers on axes

xlabel('M','fontsize',FONTSIZE);
ylabel('(E_b/N_0)_{dB}','fontsize',FONTSIZE);

legend('\rho=0.005','\rho=0.050','\rho=0.100','\rho=0.500',3);
legend('boxon');

print('figr12_test.eps','-deps','-portrait','-F:32');

