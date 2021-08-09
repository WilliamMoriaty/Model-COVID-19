
cdate=rho*10^3;
pop=cytokine(:,1);

% x=rho;
% y=curve2.a*x.^curve2.n./(x.^curve2.n+curve2.b^curve2.n);
% plot(x,y,'m')
fo = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0],...
               'Upper',[Inf,max(cdate)],...
               'StartPoint',[cdate(1) pop(1)]);
ft = fittype('a*(x^n)/(x^n+b^n)+16','problem','n','options',fo);
[curve2,gof2] = fit(cdate,pop,ft,'problem',2.2);
% x=rho*10^3;
% y=curve2.a*x.^curve2.n./(x.^curve2.n+curve2.b^curve2.n)+16;
% plot(x,y,'m')
% % ylim([0 1])
% hold on
% plot(cdate,pop,'o')