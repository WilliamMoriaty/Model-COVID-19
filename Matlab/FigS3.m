fig1=figure(1);
clf();
set(gcf,'position',[100 200 810 360])
subplot(1,2,1)
load('Therapy_moderate.mat')
cor=[0 1 0;
    0 0 1;
    1 0 0;];
t=0:0.01:720;N=5000;
plot(t/24,NumberInf(:,2)/N,'color',cor(1,:),'linewidth',1.2);
hold on
plot(t/24,NumberInf(:,3)/N,'color',cor(2,:),'linewidth',1.2);
hold on
plot(t/24,NumberInf(:,6)/N,'color',cor(3,:),'linewidth',1.2);
hold on
plot([0,30],[0.05,0.05],'linewidth',1.2,'linestyle','--','color','k')

xlabel('Day after Treatment','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('R_{IC}','FontName','Helvetica','FontSize',10,'FontWeight','bold')
title('Moderate (\rho=0.0005)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
xlim([14 30])
ylim([0 0.3])
set(gca,'xtick',0:5:30,'xticklabel',-15:5:15)
set(gca,'linewidth',1.2,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
box off

subplot(1,2,2)
load('Therapy_severe.mat')
cor=[0 1 0;
    0 0 1;
    1 0 0;];
t=0:0.01:720;N=5000;
plot(t/24,NumberInf(:,2)/N,'color',cor(1,:),'linewidth',1.2);
hold on
plot(t/24,NumberInf(:,3)/N,'color',cor(2,:),'linewidth',1.2);
hold on
plot(t/24,NumberInf(:,6)/N,'color',cor(3,:),'linewidth',1.2);
hold on
plot([0,30],[0.05,0.05],'linewidth',1.2,'linestyle','--','color','k')

xlabel('Day after Treatment','FontName','Helvetica','FontSize',10,'FontWeight','bold')
% ylabel('R_{IC}')
title('Severe (\rho=0.0025)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
xlim([14 30])
ylim([0 1])
set(gca,'xtick',0:5:30,'xticklabel',-15:5:15)
set(gca,'linewidth',1.2,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
box off

annotation(fig1,'textbox',...
    [0.0118695652173913 0.882222222222222 0.040501976284585 0.0977777777777779],...
    'String',{'a'},...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(fig1,'textbox',...
    [0.477778656126483 0.882222222222222 0.040501976284585 0.0977777777777779],...
    'String',{'b'},...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig1,'Fig_TD.eps','color','cmyk','fontmode','scaled','fontsize',1);
