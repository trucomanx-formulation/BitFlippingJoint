function y = LimiteDeShannon (P)
	global Rc;

	y=Rc-(1-P*log2(1/P)-(1-P)*log2(1/(1-P)));
end
