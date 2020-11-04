x=load('204.55.187.bf');
X=x(:,1);		%%  Probabilidade de erro do bit (Canal)
BER1    =x(:,2);	%%  BER
BER1phbf=x(:,3);	%%  BER-phbf
BER1dsphbf=x(:,4);	%%  BER-dsphbf
BER2    =x(:,5);	%%  BER
BER2phbf=x(:,6);	%%  BER-phbf
BER2dsphbf=x(:,7);	%%  BER-dsphbf
BER3    =x(:,8);	%%  BER
BER3phbf=x(:,9);	%%  BER-phbf
BER3dsphbf=x(:,10);	%%  BER-dsphbf
BER4    =x(:,11);	%%  BER
BER4phbf=x(:,12);	%%  BER-phbf
BER4dsphbf=x(:,13);	%%  BER-dsphbf
BER5    =x(:,14);	%%  BER
BER5phbf=x(:,15);	%%  BER-phbf
BER5dsphbf=x(:,16);	%%  BER-dsphbf
BER6    =x(:,17);	%%  BER
BER6phbf=x(:,18);	%%  BER-phbf
BER6dsphbf=x(:,19);	%%  BER-dsphbf
BER7    =x(:,20);	%%  BER
BER7phbf=x(:,21);	%%  BER-phbf
BER7dsphbf=x(:,22);	%%  BER-dsphbf
BER8    =x(:,23);	%%  BER
BER8phbf=x(:,24);	%%  BER-phbf
BER8dsphbf=x(:,25);	%%  BER-dsphbf
BER9    =x(:,26);	%%  BER
BER9phbf=x(:,27);	%%  BER-phbf
BER9dsphbf=x(:,28);	%%  BER-dsphbf
BER10    =x(:,29);	%%  BER
BER10phbf=x(:,30);	%%  BER-phbf
BER10dsphbf=x(:,31);	%%  BER-dsphbf
M=10;
BERdsphbfmean=(
		+BER1dsphbf
		+BER2dsphbf
		+BER3dsphbf
		+BER4dsphbf
		+BER5dsphbf
		+BER6dsphbf
		+BER7dsphbf
		+BER8dsphbf
		+BER9dsphbf
		+BER10dsphbf
		)/M;


global Rc;
Rc=204/306;
[P, info] = fsolve ('LimiteDeShannon', 0.0001)

XEbNo     =10*log10((qfuncinv(X).^2)/(2.0*Rc));
XEbNoUncod=10*log10((qfuncinv(X).^2)/(2.0   ));
PEbNo     =10*log10((qfuncinv(P).^2)/(2.0*Rc));

AL=1.5;
set(gcf,'DefaultLineLineWidth',AL);
MZ=10;
FONTSIZE=22;

Ashannon=[PEbNo   PEbNo   PEbNo   PEbNo   PEbNo   PEbNo   PEbNo   PEbNo   PEbNo   PEbNo   PEbNo   PEbNo   PEbNo];
Bshannon=[1.00e-4 2.15e-4 4.64e-4 1.00e-3 2.15e-3 4.64e-3 1.00e-2 2.15e-2 4.64e-2 1.00e-1 2.15e-1 4.64e-1 1    ];

semilogy(
		 XEbNoUncod,BER1                ,'--.' ,'markersize',MZ
		,XEbNo     ,BERdsphbfmean       ,'-s','markersize',MZ
		,XEbNo     ,BER1phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER1dsphbf          ,'-' ,'markersize',MZ
		,XEbNo     ,BER2phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER2dsphbf          ,'-' ,'markersize',MZ
		,XEbNo     ,BER3phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER3dsphbf          ,'-' ,'markersize',MZ
		,XEbNo     ,BER4phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER4dsphbf          ,'-' ,'markersize',MZ
		,XEbNo     ,BER5phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER5dsphbf          ,'-' ,'markersize',MZ
		,XEbNo     ,BER6phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER6dsphbf          ,'-' ,'markersize',MZ
		,XEbNo     ,BER7phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER7dsphbf          ,'-' ,'markersize',MZ
		,XEbNo     ,BER8phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER8dsphbf          ,'-' ,'markersize',MZ
		,XEbNo     ,BER9phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER9dsphbf          ,'-' ,'markersize',MZ
		,XEbNo     ,BER10phbf            ,'-*','markersize',MZ
		,XEbNo     ,BER10dsphbf          ,'-' ,'markersize',MZ
),grid on
hold on;semilogy( XEbNo     ,BERdsphbfmean       ,'g-s','markersize',MZ); hold off;
axis([0 6 1.000000e-05 1])

set(gca,'fontsize',FONTSIZE,'GridLineStyle','--'); % sets font of numbers on axes

xlabel('Eb/No (dB)','fontsize',FONTSIZE);
ylabel('BER','fontsize',FONTSIZE);
legend('Uncoded','Average',
'Independent',
'Joint ',%%canal1
2);legend('boxon');

print('fig2.eps','-depsc','-portrait','-F:22');

