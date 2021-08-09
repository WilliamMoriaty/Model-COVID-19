fig1=figure(1)
clf();
set(gcf,'position',[115,269,1366,420])
n=200;N=5000;n1=1;
cor=[0.5 0.5 0.5];
load('Homogeneity_Low.mat')

Y2=Virus;Y3=Cytokine;Y4=TCells;Y8=NumberInf;
t=0:0.01:720;

axes('position',[0.060,0.191,0.179,0.524]);
for i=1:n1:n
plot(t/24,Y8(:,i)/N,'linewidth',1.0,'color',cor(1,:));
hold on
end
% plot([0 30],[0.05 0.05],'k--','linewidth',1.5)
ylim([0 0.03])
xlabel('day post infection (days)')
ylabel('Ratio of infected cells (R_{IC})')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
box off

axes('position',[0.238,0.191,0.07,0.5258]);
hold on
x=0:0.001:0.03;
[mu,x]=hist(Y8(end,1:n)/N,x);
h=bar(x,mu/n,'Facecolor',[0.15,0.15,0.15]);
xlim([0 0.03])
ylabel('R_{IC} at day 30')
view(gca,90,90)
hold(gca,'off')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',0.5)
set(gca,'XDir','reverse','YAxisLocation','right','xtick',{});


% set(gcf,'position',[30,50,1480,720])
n=200;N=5000;n1=1;
cor=[0.5 0.5 0.5];
load('Homogeneity_High.mat')


Y2=Virus;Y3=Cytokine;Y4=TCells;Y8=NumberInf;
t=0:0.01:720;

axes('position',[0.395,0.191,0.179,0.524]);
for i=1:n1:n
plot(t/24,Y8(:,i)/N,'linewidth',1.0,'color',cor(1,:));
hold on
end
% plot([0 30],[0.05 0.05],'k--','linewidth',1.5)
ylim([0 0.6])
xlabel('day post infection (days)')
ylabel('Ratio of infected cells (R_{IC})')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
box off

axes('position',[0.575,0.191,0.07,0.5258]);
hold on
x=0:0.01:0.6;
[mu,x]=hist(Y8(end,1:n)/N,x);
h=bar(x,mu/n,'Facecolor',[0.15,0.15,0.15]);
xlim([0 0.6])
ylabel('R_{IC} at day 30')
view(gca,90,90)
hold(gca,'off')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',0.5)
set(gca,'XDir','reverse','YAxisLocation','right','xtick',{});

n=200;N=5000;n1=1;
cor=[0.5 0.5 0.5];
load('K1_47.mat')


Y2=Virus;Y3=Cytokine;Y4=TCells;Y8=NumberInf;
t=0:0.01:720;

axes('position',[0.731,0.191,0.179,0.524]);
for i=1:n1:n
plot(t/24,Y8(:,i)/N,'linewidth',1.0,'color',cor(1,:));
hold on
end
% plot([0 30],[0.05 0.05],'k--','linewidth',1.5)
ylim([0 0.6])
xlabel('day post infection (days)')
ylabel('Ratio of infected cells (R_{IC})')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
box off

axes('position',[0.9117,0.191,0.07,0.5258]);
hold on
x=0:0.01:0.6;
[mu,x]=hist(Y8(end,1:n)/N,x);
h=bar(x,mu/n,'Facecolor',[0.15,0.15,0.15]);
xlim([0 0.6])
ylabel('R_{IC} at day 30')
view(gca,90,90)
hold(gca,'off')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',0.5)
set(gca,'XDir','reverse','YAxisLocation','right','xtick',{});

annotation(fig1,'textbox',...
    [0.1108 0.8838 0.1278 0.1181],...
    'String',{'Homogeneity','(Low)'},...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(fig1,'textbox',...
    [0.4490 0.8838 0.1278 0.1181],...
    'String',{'Homogeneity','(High)'},...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');

annotation(fig1,'textbox',...
    [0.7796 0.8838 0.1278 0.1181],...
    'String',{'Heterogeneity'},...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig1,'FigS14.eps','color','cmyk','fontmode','scaled','fontsize',1);
