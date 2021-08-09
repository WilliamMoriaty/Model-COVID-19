fig1=figure(1);
clf();
N=5000;
A=load('output/md.dat');
t=linspace(0,720,72001);
set(gcf,'position',[489,454,774,308])
subplot(1,2,1)
plot(t/24,A(:,2),'color','k','linewidth',1.2);
xlim([15,30])
ylim([0 12])
ylabel('X_{ex}','FontName','Helvetica','FontSize',10,'FontWeight','bold')
xlabel('Day after Treatment','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'xtick',0:5:30,'xticklabel',-15:5:15)
set(gca,'ytick',0:3:12,'FontName','Helvetica','FontSize',12,'FontWeight','bold','linewidth',1.2)
box off
subplot(1,2,2)
plot(t/24,A(:,end)/N,'color','k','linewidth',1.2);
xlim([15,30])
ylim([0 0.3])
ylabel('R_{IC}','FontName','Helvetica','FontSize',10,'FontWeight','bold')
xlabel('Day after Treatment','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'xtick',0:5:30,'xticklabel',-15:5:15)
set(gca,'ytick',0:0.05:0.3,'FontName','Helvetica','FontSize',12,'FontWeight','bold','linewidth',1.2)
box off

annotation(fig1,'textbox',...
    [0.0279 0.820 0.0310 0.148],...
    'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(fig1,'textbox',...
    [0.4635 0.820 0.0310 0.148],...
    'String',{'b'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig1,'FigS16.eps','color','cmyk','fontmode','scaled','fontsize',1);
