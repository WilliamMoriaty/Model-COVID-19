fig2=figure(2);
clf();
N=5000;
set(gcf,'position',[100,184.2,1320,300])
load('MS_NTC.mat')
subplot(1,3,1)
Old=[];Young=[];
for i=3:3:30
Old=[Old NumberInf(1+24*1*i/0.01,1:100)'/N];
Young=[Young NumberInf(1+24*1*i/0.01,101:end)'/N];
end
t=3:3:30;Mean_Old=[];Mean_Young=[];STD_Old=[];STD_Young=[];
for i=1:10
Mean_Old=[Mean_Old mean(Old(1:end,i))];
Mean_Young=[Mean_Young mean(Young(1:end,i))];
STD_Old=[STD_Old std(Old(1:end,i))];
STD_Young=[STD_Young std(Young(1:end,i))];
end
plot(t,Mean_Old,'marker','s','markersize',6,'linewidth',1.2,'markerfacecolor','r','linewidth',1.2,'color','r')
hold on
errorbar(t,Mean_Old,STD_Old,'marker','none','linestyle','none','linewidth',1.2,'color','r')
hold on
plot(t,Mean_Young,'marker','o','markersize',6,'linewidth',1.2,'markerfacecolor','b','linewidth',1.2,'color','b')
hold on
errorbar(t,Mean_Young,STD_Young,'marker','none','linestyle','none','linewidth',1.2,'color','b')

ylim([-0.1 0.8])
xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('R_{IC}','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'xtick',3:3:30,'ytick',0:0.2:0.8,'linewidth',1.2,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
annotation(fig2,'textbox',...
    [0.225291265127005,0.205333333333334,0.121766486740366,0.110531213648702],...
    'Color',[1 0 0],...
    'String','[T_0]=1\times10^5cells/ml',...
    'FontName','Helvetica',...
    'FontSize',10,...
    'FontWeight','bold',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig2,'textbox',...
    [0.225202782778635,0.146666666666668,0.121854969088736,0.098552824092031],...
    'Color',[0 0 1],...
    'String','[T_0]=2\times10^5cells/ml',...
    'FontWeight','bold',...
    'FontName','Helvetica',...
    'FontSize',10,...
    'FitBoxToText','off',...
    'EdgeColor','none');
box off
subplot(1,3,2)
Old=[];Young=[];
for i=3:3:30
Old=[Old Cytokine(1+24*1*i/0.01,1:100)'];
Young=[Young Cytokine(1+24*1*i/0.01,101:end)'];
end
t=3:3:30;Mean_Old=[];Mean_Young=[];STD_Old=[];STD_Young=[];
for i=1:10
Mean_Old=[Mean_Old mean(Old(1:end,i))];
Mean_Young=[Mean_Young mean(Young(1:end,i))];
STD_Old=[STD_Old std(Old(1:end,i))];
STD_Young=[STD_Young std(Young(1:end,i))];
end
plot(t,Mean_Old,'marker','s','markersize',6,'linewidth',1.2,'markerfacecolor','r','linewidth',1.2,'color','r')
hold on
errorbar(t,Mean_Old,STD_Old,'marker','none','linestyle','none','linewidth',1.2,'color','r')
hold on
plot(t,Mean_Young,'marker','o','markersize',6,'linewidth',1.2,'markerfacecolor','b','linewidth',1.2,'color','b')
hold on
errorbar(t,Mean_Young,STD_Young,'marker','none','linestyle','none','linewidth',1.2,'color','b')

ylim([-5 150])
xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('[Cytokines] (nM)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'xtick',3:3:30,'ytick',0:30:150,'linewidth',1.2,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
box off

subplot(1,3,3)
Old=[];Young=[];
for i=3:3:30
Old=[Old TCells(1+24*1*i/0.01,1:100)'/10^6];
Young=[Young TCells(1+24*1*i/0.01,101:end)'/10^6];
end
t=3:3:30;Mean_Old=[];Mean_Young=[];STD_Old=[];STD_Young=[];
for i=1:10
Mean_Old=[Mean_Old mean(Old(1:end,i))];
Mean_Young=[Mean_Young mean(Young(1:end,i))];
STD_Old=[STD_Old std(Old(1:end,i))];
STD_Young=[STD_Young std(Young(1:end,i))];
end
plot(t,Mean_Old,'marker','s','markersize',6,'linewidth',1.2,'markerfacecolor','r','linewidth',1.2,'color','r')
hold on
errorbar(t,Mean_Old,STD_Old,'marker','none','linestyle','none','linewidth',1.2,'color','r')
hold on
plot(t,Mean_Young,'marker','o','markersize',6,'linewidth',1.2,'markerfacecolor','b','linewidth',1.2,'color','b')
hold on
errorbar(t,Mean_Young,STD_Young,'marker','none','linestyle','none','linewidth',1.2,'color','b')

ylim([-0.2 2])
xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('[T_{effector}] (\times 10^6 cells/ml)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'xtick',3:3:30,'ytick',0:0.5:2,'linewidth',1.2,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
box off

%picture sign
annotation(fig2,'textbox',...
    [0.067 0.850 0.0303 0.155],'String','a',...
    'FontWeight','bold',...
    'FontSize',15,...
    'FontName','Helvetica',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig2,'textbox',...
    [0.347 0.850 0.0303 0.155],...
    'String',{'b'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FontName','Helvetica',...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig2,'textbox',...
    [0.626 0.850 0.0303 0.155],...
    'String',{'c'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FontName','Helvetica',...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig2,'Fig7.eps','color','cmyk','fontmode','scaled','fontsize',1);
