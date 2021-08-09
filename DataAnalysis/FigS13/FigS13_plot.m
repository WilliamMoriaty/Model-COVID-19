fig1=figure(1);
clf();
set(gcf,'position',[100 200 1020 270]);
load('KieneticData_TCell.mat');%Dataset7
load('Modify.mat')
a=round((mean(Inc)+DT_mod(:,1)+1)*24/0.01);
T_sample=TCells(a,:)/10^6;
T_data_mod=DT_mod(:,3)/10^3;
T_data_se=DT_se(:,3)/10^3;
T_data_cr=DT_cr(:,3)/10^3;
Loss=[];t=linspace(0,30,72001);
for i=1:441
Ls_mod=norm((T_sample(:,i)-T_data_mod)./T_data_mod);
% Ls_se=norm(T_sample(:,i)-T_data_se);
% Ls_cr=norm(T_sample(:,i)-T_data_cr);
Loss=[Loss;Ls_mod];
end
[m,n]=min(Loss);

subplot(1,3,1)
errorbar(DT_mod(:,1)+mean(Inc)+1,DT_mod(:,3)/10^3,(DT_mod(:,3)-DT_mod(:,2))/10^3,(DT_mod(:,4)-DT_mod(:,3))/10^3,'b.','markersize',24,...
    'linestyle','none','linewidth',2)
hold on
plot(t,TCells(:,n)/10^6,'linewidth',1.2,'color','b')
ylim([0 2])
xlim([0 30])
xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('T_{effector} (\times10^6 cells/mL)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'linewidth',1.2)
box off
title('Moderate','FontName','Helvetica','FontSize',10,'FontWeight','bold')

n1=mod(n,21);Los_se=[];
for i=1:21
j=(i-1)*21+n1;
Ls_se=norm((T_sample(:,j)-T_data_se)./T_data_se);
% Ls_cr=norm(T_sample(:,i)-T_data_cr);
Los_se=[Los_se;Ls_se];
end
[m2,n2]=min(Los_se);
subplot(1,3,2)
errorbar(DT_se(:,1)+mean(Inc)+1,DT_se(:,3)/10^3,(DT_se(:,3)-DT_se(:,2))/10^3,(DT_se(:,4)-DT_se(:,3))/10^3,'k.','markersize',24,...
    'linestyle','none','linewidth',2)
hold on
plot(t,TCells(:,(n2-1)*21+n1)/10^6,'linewidth',1.2,'color','k')
ylim([0 2])
xlim([0 30])
xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
% ylabel('T_{effector} (\times10^6 cells/mL)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'linewidth',1.2)
box off
title('Severe','FontName','Helvetica','FontSize',10,'FontWeight','bold')

n1=mod(n,21);Los_cr=[];
for i=1:21
j=(i-1)*21+n1;
Ls_cr=norm(abs(T_sample(:,j)-T_data_cr)./T_data_cr);
% Ls_cr=norm(T_sample(:,i)-T_data_cr);
Los_cr=[Los_cr;Ls_cr];
end
[m3,n3]=min(Los_cr);
subplot(1,3,3)
errorbar(DT_cr(:,1)+mean(Inc)+1,DT_cr(:,3)/10^3,(DT_cr(:,3)-DT_cr(:,2))/10^3,(DT_cr(:,4)-DT_cr(:,3))/10^3,'r.','markersize',24,...
    'linestyle','none','linewidth',2)
hold on
plot(t,TCells(:,(n3-1)*21+n1)/10^6,'linewidth',1.2,'color','r')
ylim([0 2])
xlim([0 30])
xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
% ylabel('T_{effector} (\times10^6 cells/mL)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'linewidth',1.2)
box off
title('Critical','FontName','Helvetica','FontSize',10,'FontWeight','bold')
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
exportfig(fig1,'FigS13.eps','color','cmyk','fontmode','scaled','fontsize',1);
