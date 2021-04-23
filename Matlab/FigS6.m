load('KieneticData_TCell')
N=5000;
path='MS_rho/output/';
md1=load(strcat(path,'1/md.dat'));
md2=load(strcat(path,'2/md.dat'));
md3=load(strcat(path,'3/md.dat'));
a1=md1(min(find(md1(:,8)>=250)),1)/24;
a2=md2(min(find(md1(:,8)>=250)),1)/24;
a3=md3(min(find(md1(:,8)>=250)),1)/24;
fig1=figure(1)
set(gcf,'position',[100 200 1020 270])
subplot(1,3,3)
errorbar(DT_cr(:,1)+a3+1,DT_cr(:,3)*10^3/10^6,(DT_cr(:,3)-DT_cr(:,2))*10^3/10^6,(DT_cr(:,4)-DT_cr(:,3))*10^3/10^6,'r.','markersize',24,...
    'linestyle','none','linewidth',2)
hold on
plot(md3(:,1)/24,md3(:,4)*10^5/10^6,'linewidth',1.2,'color','r')
ylim([0 2])
xlim([0 30])
xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
% ylabel('Effector T cell counts (cells/mL)')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
box off
title('Critical (\rho=0.005)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
subplot(1,3,2)
errorbar(DT_se(:,1)+a2+1,DT_se(:,3)*10^3/10^6,(DT_se(:,3)-DT_se(:,2))*10^3/10^6,(DT_se(:,4)-DT_se(:,3))*10^3/10^6,'k.','markersize',24,...
    'linestyle','none','linewidth',2)
hold on
plot(md2(:,1)/24,md2(:,4)*10^5/10^6,'linewidth',1.2,'color','k')
ylim([0 2])
xlim([0 30])
 xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
% ylabel('Effector T cell counts (cells/mL)')
set(gca,'linewidth',1.2)
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
box off
title('Severe (\rho=0.0025)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
subplot(1,3,1)
errorbar(DT_mod(:,1)+a1+1,DT_mod(:,3)*10^3/10^6,(DT_mod(:,3)-DT_mod(:,2))*10^3/10^6,(DT_mod(:,4)-DT_mod(:,3))*10^3/10^6,'b.','markersize',24,...
    'linestyle','none','linewidth',2)
hold on

plot(md1(:,1)/24,md1(:,4)*10^5/10^6,'linewidth',1.2,'color','b')
ylim([0 2])
xlim([0 30])
xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('T_{effector} (\times10^6 cells/mL)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'linewidth',1.2)
box off
title('Moderate (\rho=0.0005)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
annotation(fig1,'textbox',...
    [0.041 0.854599406528191 0.0295882352941176 0.142433234421368],'String','a',...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.349 0.854599406528191 0.0295882352941176 0.142433234421368],'String','b',...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.630 0.854599406528191 0.0295882352941176 0.142433234421368],'String','c',...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig1,'Fig_ETD.eps','color','cmyk','fontmode','scaled','fontsize',1);
