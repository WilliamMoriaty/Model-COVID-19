fig1=figure(1);
clf();
set(gcf,'position',[50,100,1050,540])

axes('position',[0.12,0.606,0.213,0.327]);
area([85.5,96.5],[1,1],'FaceColor',[0.8 0.8 0.8],'Edgecolor',[0.8 0.8 0.8])
hold on
load('MS_K4/K4.dat');
load('K4_High.mat');
N=5000;
for i=1:size(K4,1)
if(NumberInf(end,i)/N<0.4)
plot(K4(i),NumberInf(end,i)/N,'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(K4(i),NumberInf(end,i)/N,'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(K4,NumberInf(end,:)/N,'marker','.','markersize',12,'color','k','linestyle','none');
% hold on
load('K4_Low.mat')
for i=1:size(K4,1)
if(NumberInf(end,i)/N<0.4)
plot(K4(i),NumberInf(end,i)/N,'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(K4(i),NumberInf(end,i)/N,'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(K4,NumberInf(end,:)/N,'marker','.','markersize',12,'color','k','linestyle','none');
xlim([80 105])
ylim([0 0.8])
xlabel('K_4')
ylabel('R_{IC}')
% title('Severe(\rho=0.0025)')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

box off

axes('position',[0.415,0.606,0.213,0.327]);
area([85.5,96.5],[200,200],'FaceColor',[0.8 0.8 0.8],'Edgecolor',[0.8 0.8 0.8])
hold on
load('K4_High.mat');
N=5000;
for i=1:size(K4,1)
if(NumberInf(end,i)/N<0.4)
plot(K4(i),Cytokine(end,i),'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(K4(i),Cytokine(end,i),'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
hold on
load('K4_Low.mat');
for i=1:size(K4,1)
if(NumberInf(end,i)/N<0.4)
plot(K4(i),Cytokine(end,i),'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(K4(i),Cytokine(end,i),'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(K4,Cytokine(end,:),'marker','.','markersize',12,'color','k','linestyle','none');
% ylim([0 0.8])
xlim([80 105])
ylim([0 150])
xlabel('K_4')
ylabel('[Cytokine]')
% title('Severe(\rho=0.0025)')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

box off

axes('position',[0.71,0.606,0.213,0.327]);
area([85.5,96.5],[2.5,2.5],'FaceColor',[0.8 0.8 0.8],'Edgecolor',[0.8 0.8 0.8])
hold on
load('K4_High.mat');
N=5000;
for i=1:size(K4,1)
if(NumberInf(end,i)/N<0.4)
plot(K4(i),TCells(end,i)/1e6,'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(K4(i),TCells(end,i)/1e6,'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(K4,TCells(end,:)/1e6,'marker','.','markersize',12,'color','k','linestyle','none');
hold on
load('K4_Low.mat');
for i=1:size(K4,1)
if(NumberInf(end,i)/N<0.4)
plot(K4(i),TCells(end,i)/1e6,'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(K4(i),TCells(end,i)/1e6,'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(K4,TCells(end,:)/1e6,'marker','.','markersize',12,'color','k','linestyle','none');
ylim([0.8 1.6])
xlim([80 105])
xlabel('K_4')
ylabel('[T_{effector}]\times10^6')
% title('Severe(\rho=0.0025)')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

box off
axes('position',[0.12,0.161,0.213,0.327]);
area([1.92,2.4],[1,1],'FaceColor',[0.8 0.8 0.8],'Edgecolor',[0.8 0.8 0.8])
hold on
load('MS_rho/rho.dat');
load('rho_High.mat');
N=5000;
for i=1:size(rho,1)
if (NumberInf(end,i)/N<0.4)
plot(rho(i)*10^3,NumberInf(end,i)/N,'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(rho(i)*10^3,NumberInf(end,i)/N,'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(rho(i)*10^3,NumberInf(end,:)/N,'marker','.','markersize',12,'color','k','linestyle','none');
% hold on
load('rho_Low.mat')
for i=1:size(rho,1)
if (NumberInf(end,i)/N<0.4)
plot(rho(i)*10^3,NumberInf(end,i)/N,'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(rho(i)*10^3,NumberInf(end,i)/N,'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(rho(i)*10^3,NumberInf(end,:)/N,'marker','.','markersize',12,'color','k','linestyle','none');
xlim([1.5 4.5])
ylim([0 0.8])
xlabel('\rho\times10^{-3}')
ylabel('R_{IC}')
% title('Severe(\rho=0.0025)')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

box off

axes('position',[0.415,0.161,0.213,0.327]);
area([1.92,2.4],[200,200],'FaceColor',[0.8 0.8 0.8],'Edgecolor',[0.8 0.8 0.8])
hold on
load('rho_High.mat');
N=5000;
for i=1:size(rho,1)
if (NumberInf(end,i)/N<0.4)
plot(rho(i)*10^3,Cytokine(end,i),'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(rho(i)*10^3,Cytokine(end,i),'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(rho*10^3,Cytokine(end,:),'marker','.','markersize',12,'color','k','linestyle','none');
% hold on
load('rho_Low.mat');
for i=1:size(rho,1)
if (NumberInf(end,i)/N<0.4)
plot(rho(i)*10^3,Cytokine(end,i),'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(rho(i)*10^3,Cytokine(end,i),'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(rho*10^3,Cytokine(end,:),'marker','.','markersize',12,'color','k','linestyle','none');
% ylim([0 0.8])
xlim([1.5 4.5])
ylim([0 150])
xlabel('\rho\times10^{-3}')
ylabel('[Cytokine]')
% title('Severe(\rho=0.0025)')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

box off

axes('position',[0.71,0.161,0.213,0.327]);
area([1.92,2.4],[2.5,2.5],'FaceColor',[0.8 0.8 0.8],'Edgecolor',[0.8 0.8 0.8])
hold on
load('rho_High.mat');
N=5000;
for i=1:size(rho,1)
if (NumberInf(end,i)/N<0.4)
plot(rho(i)*10^3,TCells(end,i)/1e6,'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(rho(i)*10^3,TCells(end,i)/1e6,'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(rho*10^3,TCells(end,:)/1e6,'marker','.','markersize',12,'color','k','linestyle','none');
% hold on
load('rho_Low.mat');
for i=1:size(rho,1)
if (NumberInf(end,i)/N<0.4)
plot(rho(i)*10^3,TCells(end,i)/1e6,'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
else
plot(rho(i)*10^3,TCells(end,i)/1e6,'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
% plot(rho*10^3,TCells(end,:)/1e6,'marker','.','markersize',12,'color','k','linestyle','none');
% ylim([0.8 1.6])
xlim([1.5 4.5])
xlabel('\rho\times10^{-3}')
ylabel('[T_{effector}]\times10^6')
% title('Severe(\rho=0.0025)')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

box off


annotation(fig1,'textbox',...
    [0.0434 0.875 0.030 0.0770],...
    'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.338 0.875 0.030 0.0770],...
    'String',{'b'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.631 0.875 0.030 0.0770],...
    'String',{'c'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.0434 0.435 0.030 0.0770],...
    'String',{'d'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.338 0.435 0.030 0.0770],...
    'String',{'e'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.631 0.435 0.030 0.0770],...
    'String',{'f'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig1,'Fig6.eps','color','cmyk','fontmode','scaled','fontsize',1);
