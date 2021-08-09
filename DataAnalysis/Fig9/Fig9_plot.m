fig1=figure(1);
clf();
set(gcf,'position',[50,50,1440,720])
path='Therapy/Double/';

axes('position',[0.0782,0.66,0.163,0.241])
load('moderate_eps1_2.mat');

eps1=load(strcat(path,'eps1.dat'));
eps2=load(strcat(path,'eps2.dat'));
colormap(jet)
E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps1=flipud(eps1);
imagesc(eps2,eps1,E,'Interpolation','bilinear');
hold on
contourf(eps2,eps1,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');
A1=max(max(E))
% xlim([0 0.4]);
xlabel(strcat(char(949),'_2'));
ylabel(strcat(char(949),'_1'));
set(gca,'ydir','normal','fontweight','bold')


box off

axes('position',[0.313,0.66,0.163,0.241])
load('moderate_eps1_3.mat');

eps1=load(strcat(path,'eps1.dat'));
eps3=load(strcat(path,'eps3.dat'));
E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps1=flipud(eps1);
imagesc(eps3,eps1,E,'Interpolation','bilinear');
hold on
contourf(eps3,eps1,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');
A2=max(max(E));
% xlim([0 0.4]);ylim([0 0.1]);
xlabel(strcat(char(949),'_3'));
ylabel(strcat(char(949),'_1'));
set(gca,'ydir','normal','fontweight','bold')

box off

axes('position',[0.556,0.66,0.163,0.241])
load('moderate_eps1_4.mat');
eps1=load(strcat(path,'eps1.dat'));
eps4=load(strcat(path,'eps4.dat'));
E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps1=flipud(eps1);
imagesc(eps4,eps1,E,'Interpolation','bilinear');
hold on
contourf(eps4,eps1,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A3=max(max(E))
% xlim([0 0.4]);ylim([0 0.1]);
xlabel(strcat(char(949),'_4'));
ylabel(strcat(char(949),'_1'));
set(gca,'ydir','normal','fontweight','bold')


box off

axes('position',[0.799,0.66,0.163,0.241])
load('moderate_eps2_3.mat');
eps2=load(strcat(path,'eps2.dat'));
eps3=load(strcat(path,'eps3.dat'));

E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps2=flipud(eps2);
imagesc(eps3,eps2,E,'Interpolation','bilinear');
hold on
contourf(eps3,eps2,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A4=max(max(E))
% xlim([0 0.4]);ylim([0 0.1]);
xlabel(strcat(char(949),'_3'));
ylabel(strcat(char(949),'_2'));
set(gca,'ydir','normal','fontweight','bold')

caxis([0 1])
box off


axes('position',[0.0782,0.36,0.163,0.241])
load('moderate_eps2_4.mat');

eps2=load(strcat(path,'eps2.dat'));
eps4=load(strcat(path,'eps4.dat'));
colormap(jet)
E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps2=flipud(eps2);
imagesc(eps4,eps2,E,'Interpolation','bilinear');
hold on
contourf(eps4,eps2,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A1=max(max(E));
% xlim([0 0.4]);
xlabel(strcat(char(949),'_4'));
ylabel(strcat(char(949),'_2'));
set(gca,'ydir','normal','fontweight','bold')

caxis([0 1])
box off

axes('position',[0.313,0.36,0.163,0.241])
load('moderate_eps3_4.mat');

eps4=load(strcat(path,'eps4.dat'));
eps3=load(strcat(path,'eps3.dat'));
E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps4=flipud(eps4);
imagesc(eps3,eps4,E,'Interpolation','bilinear');
hold on
contourf(eps3,eps4,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A2=max(max(E));
% xlim([0 0.4]);ylim([0 0.1]);
xlabel(strcat(char(949),'_3'));
ylabel(strcat(char(949),'_4'));
set(gca,'ydir','normal','fontweight','bold')

caxis([0 1])
box off

axes('position',[0.556,0.36,0.163,0.241])
load('severe_eps1_2.mat');
eps1=load(strcat(path,'eps1.dat'));
eps2=load(strcat(path,'eps2.dat'));
E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps1=flipud(eps1);
imagesc(eps2,eps1,E,'Interpolation','bilinear');
hold on
contourf(eps2,eps1,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A3=max(max(E));
% xlim([0 0.4]);ylim([0 0.1]);
xlabel(strcat(char(949),'_2'));
ylabel(strcat(char(949),'_1'));
set(gca,'ydir','normal','fontweight','bold')
caxis([0 1])
box off

axes('position',[0.799,0.36,0.163,0.241])
load('severe_eps1_3.mat');
eps1=load(strcat(path,'eps1.dat'));
eps3=load(strcat(path,'eps3.dat'));

E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps1=flipud(eps1);
imagesc(eps3,eps1,E,'Interpolation','bilinear');
hold on
contourf(eps3,eps1,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A4=max(max(E));
% xlim([0 0.4]);ylim([0 0.1]);
xlabel(strcat(char(949),'_3'));
ylabel(strcat(char(949),'_1'));
set(gca,'ydir','normal','fontweight','bold')
caxis([0 1])
box off

axes('position',[0.0782,0.05745,0.163,0.241])
load('severe_eps1_4.mat');

eps1=load(strcat(path,'eps1.dat'));
eps4=load(strcat(path,'eps4.dat'));
colormap(jet)
E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps1=flipud(eps1);
imagesc(eps4,eps1,E,'Interpolation','bilinear');
hold on
contourf(eps4,eps1,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A1=max(max(E));
% xlim([0 0.4]);
xlabel(strcat(char(949),'_4'));
ylabel(strcat(char(949),'_1'));
set(gca,'ydir','normal','fontweight','bold')

caxis([0 1])
box off

axes('position',[0.313,0.05745,0.163,0.241])
load('severe_eps2_3.mat');

eps2=load(strcat(path,'eps2.dat'));
eps3=load(strcat(path,'eps3.dat'));
E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps2=flipud(eps2);
imagesc(eps3,eps2,E,'Interpolation','bilinear');
hold on
contourf(eps3,eps2,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A2=max(max(E))
% xlim([0 0.4]);ylim([0 0.1]);
xlabel(strcat(char(949),'_3'));
ylabel(strcat(char(949),'_2'));
set(gca,'ydir','normal','fontweight','bold')

caxis([0 1])
box off

axes('position',[0.556,0.05745,0.163,0.241])
load('severe_eps2_4.mat');
eps2=load(strcat(path,'eps2.dat'));
eps4=load(strcat(path,'eps4.dat'));
E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps2=flipud(eps2);
imagesc(eps4,eps2,E,'Interpolation','bilinear');
hold on
contourf(eps4,eps2,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A3=max(max(E));
% xlim([0 0.4]);ylim([0 0.1]);
xlabel(strcat(char(949),'_4'));
ylabel(strcat(char(949),'_2'));
set(gca,'ydir','normal','fontweight','bold')
caxis([0 1])
box off

axes('position',[0.799,0.05745,0.163,0.241])
load('severe_eps3_4.mat');
eps3=load(strcat(path,'eps3.dat'));
eps4=load(strcat(path,'eps4.dat'));

E0=NumberInf(end,1);E=zeros(21);N1=21;N2=21;
for i=1:N1
for j=1:N2
E(N1-i+1,j)=(E0-NumberInf(end,(i-1)*21+j))/E0;
end
end
eps3=flipud(eps3);
imagesc(eps4,eps3,E,'Interpolation','bilinear');
hold on
contourf(eps4,eps3,E,1,'linestyle','--','linewidth',1.2,'fill','off','linecolor','k');

A4=max(max(E));
% xlim([0 0.4]);ylim([0 0.1]);
xlabel(strcat(char(949),'_4'));
ylabel(strcat(char(949),'_3'));
set(gca,'ydir','normal','fontweight','bold')

ch=colorbar('horizen');
ch.Label.FontSize=10;
ch.Label.FontWeight='bold';
ch.Label.String='Therapy Coefficient (E)';
set(ch,'linewidth',1.2,'fontweight','bold','position',[0.375294444444445,0.964166666666667,0.2855,0.022388888888889]...
     ,'axislocation','in')
caxis([0 1])
box off
%figure signal
annotation(fig1,'textbox',...
    [0.0214 0.8639 0.0179 0.0520],...
    'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.255 0.8639 0.0179 0.0520],...
    'String',{'b'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.50 0.8639 0.0179 0.0520],...
    'String',{'c'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.741 0.8639 0.0179 0.0520],...
    'String',{'d'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.0214 0.5598 0.0179 0.0520],...
    'String',{'e'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.255 0.5598 0.0179 0.0520],...
    'String',{'f'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.50 0.5598 0.0179 0.0520],...
    'String',{'g'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.741 0.5598 0.0179 0.0520],...
    'String',{'h'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.0214 0.262 0.0179 0.0520],...
    'String',{'i'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.255 0.262 0.0179 0.0520],...
    'String',{'j'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.50 0.262 0.0179 0.0520],...
    'String',{'k'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.741 0.262 0.0179 0.0520],...
    'String',{'l'},...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig1,'Fig9.eps','color','cmyk','fontmode','scaled','fontsize',1);
