function P = hbinvval (R)

	a=0.0;
	b=1.0;

	for I=1:100000
		c=(a+b)/2.0;		

		if hb(c)>R
			b=c;
			P=(a+b)/2.0;
		endif

		if hb(c)==R
			P=c;
			break;
		endif

		if hb(c)<R
			a=c;
			P=(a+b)/2.0;
		endif
	endfor

end
