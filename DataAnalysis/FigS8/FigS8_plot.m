fig1=figure(1);
clf();
set(gcf,'position',[50,100,1200,540])

subplot(2,4,1)
path='moderate/moderate_eps_1/eps1.dat';
eps_1=load(path);
Initial=load('moderate/Initial_moderate.dat');
E0=Initial(end,end);
load('Moderate_eps1.mat')
E=[];
for i=1:15
E=[E (E0-NumberInf(end,(i-1)*50+1:50*i)')./E0];
end
Mean_E=[];STD_E=[];
for i=1:15
Mean_E=[Mean_E mean(E(:,i))];
STD_E=[STD_E std(E(:,i))];
end
errorbar(eps_1,Mean_E,STD_E,'linestyle','none','marker','s','markersize',6,'markerfacecolor','b','color','b');
hold on
a=0.9567;b=0.1904;n=3;x=0:0.01:1;
y=Dose(x,a,b,n);
plot(x,y,'linewidth',1.2,'color','b');
hold on
plot([0 b],[a/2 a/2],'linewidth',1.2,'color','k','linestyle',':')
hold on
plot([b b],[0 a/2],'linewidth',1.2,'color','k','linestyle',':')
xlim([0 0.8])
ylim([0 1])
xlabel(strcat(char(949),'_1'))
ylabel('Therapy coefficient (E)')
set(gca,'fontweight','bold')
box off
subplot(2,4,2)
path='moderate/moderate_eps_2/eps2.dat';
eps_2=load(path);
Initial=load('moderate/Initial_moderate.dat');
E0=Initial(end,end);
load('Moderate_eps2.mat')
E=[];
for i=1:15
E=[E (E0-NumberInf(end,(i-1)*50+1:50*i)')./E0];
end
Mean_E=[];STD_E=[];
for i=1:15
Mean_E=[Mean_E mean(E(:,i))];
STD_E=[STD_E std(E(:,i))];
end

errorbar(eps_2,Mean_E,STD_E,'linestyle','none','marker','s','markersize',6,'markerfacecolor','b','color','b');
hold on
a=0.9366;b=0.02895;n=3;x=0:0.005:0.2;
y=Dose(x,a,b,n);
plot(x,y,'linewidth',1.2,'color','b');
hold on
plot([0 b],[a/2 a/2],'linewidth',1.2,'color','k','linestyle',':')
hold on
plot([b b],[0 a/2],'linewidth',1.2,'color','k','linestyle',':')
xlabel(strcat(char(949),'_2'))
ylim([0 1])
% ylabel('Therapy coefficient (E)')
set(gca,'fontweight','bold')
box off
subplot(2,4,3)
path='moderate/moderate_eps_3/eps3.dat';
eps_3=load(path);
Initial=load('moderate/Initial_moderate.dat');
E0=Initial(end,end);
load('Moderate_eps3.mat')
E=[];
for i=1:15
E=[E (E0-NumberInf(end,(i-1)*50+1:50*i)')./E0];
end
Mean_E=[];STD_E=[];
for i=1:15
Mean_E=[Mean_E mean(E(:,i))];
STD_E=[STD_E std(E(:,i))];
end
errorbar(eps_3,Mean_E,STD_E,'linestyle','none','marker','s','markersize',6,'markerfacecolor','b','color','b');
hold on
a=0.9391;b=0.1852;n=3.5;x=0:0.005:2;
y=Dose(x,a,b,n);
plot(x,y,'linewidth',1.2,'color','b');
hold on
plot([0 b],[a/2 a/2],'linewidth',1.2,'color','k','linestyle',':')
hold on
plot([b b],[0 a/2],'linewidth',1.2,'color','k','linestyle',':')
xlabel(strcat(char(949),'_3'))
ylim([0 1])
% ylabel('Therapy coefficient (E)')
set(gca,'fontweight','bold')
box off
subplot(2,4,4)
path='moderate/moderate_eps_4/eps4.dat';
eps_4=load(path);
Initial=load('moderate/Initial_moderate.dat');
E0=Initial(end,end);
load('Moderate_eps4.mat')
E=[];
for i=1:15
E=[E (E0-NumberInf(end,(i-1)*50+1:50*i)')./E0];
end
Mean_E=[];STD_E=[];
for i=1:15
Mean_E=[Mean_E mean(E(:,i))];
STD_E=[STD_E std(E(:,i))];
end
errorbar(eps_4,Mean_E,STD_E,'linestyle','none','marker','s','markersize',6,'markerfacecolor','b','color','b');
hold on
a=0.2785;b=0.2402;n=3.5;x=0:0.005:1.5;
y=Dose(x,a,b,n);
plot(x,y,'linewidth',1.2,'color','b');
xlim([0 1.5])
ylim([0 1])
hold on
plot([0 b],[a/2 a/2],'linewidth',1.2,'color','k','linestyle',':')
hold on
plot([b b],[0 a/2],'linewidth',1.2,'color','k','linestyle',':')
xlabel(strcat(char(949),'_4'))
% ylabel('Therapy coefficient (E)')
set(gca,'fontweight','bold')
box off

subplot(2,4,5)
path='severe/severe_eps_1/eps1.dat';
eps_1=load(path);
Initial=load('severe/Initial_severe.dat');
E0=Initial(end,end);
load('Severe_eps1.mat')
E=[];
for i=1:15
E=[E (E0-NumberInf(end,(i-1)*50+1:50*i)')./E0];
end
Mean_E=[];STD_E=[];
for i=1:15
Mean_E=[Mean_E mean(E(:,i))];
STD_E=[STD_E std(E(:,i))];
end
errorbar(eps_1,Mean_E,STD_E,'linestyle','none','marker','s','markersize',6,'markerfacecolor','r','color','r');
hold on
a=0.9988;b=0.8424;n=4.5;x=0:0.005:2;
y=Dose(x,a,b,n);
plot(x,y,'linewidth',1.2,'color','r');
hold on
plot([0 b],[a/2 a/2],'linewidth',1.2,'color','k','linestyle',':')
hold on
plot([b b],[0 a/2],'linewidth',1.2,'color','k','linestyle',':')
% xlim([0 0.6])
ylim([0 1])
xlabel(strcat(char(949),'_1'))
ylabel('Therapy coefficient (E)')
set(gca,'fontweight','bold')
box off
subplot(2,4,6)
path='severe/severe_eps_2/eps2.dat';
eps_2=load(path);
Initial=load('severe/Initial_severe.dat');
E0=Initial(end,end);
load('Severe_eps2.mat')
E=[];
for i=1:15
E=[E (E0-NumberInf(end,(i-1)*50+1:50*i)')./E0];
end
Mean_E=[];STD_E=[];
for i=1:15
Mean_E=[Mean_E mean(E(:,i))];
STD_E=[STD_E std(E(:,i))];
end

errorbar(eps_2,Mean_E,STD_E,'linestyle','none','marker','s','markersize',6,'markerfacecolor','r','color','r');
hold on
a=0.9813;b=0.1126;n=11;x=0:0.005:0.2;
y=Dose(x,a,b,n);
plot(x,y,'linewidth',1.2,'color','r');
hold on
plot([0 b],[a/2 a/2],'linewidth',1.2,'color','k','linestyle',':')
hold on
plot([b b],[0 a/2],'linewidth',1.2,'color','k','linestyle',':')
ylim([0 1])
xlabel(strcat(char(949),'_2'))
% ylabel('Therapy coefficient (E)')
set(gca,'fontweight','bold')
box off
subplot(2,4,7)
path='severe/severe_eps_3/eps3.dat';
eps_3=load(path);
Initial=load('severe/Initial_severe.dat');
E0=Initial(end,end);
load('Severe_eps3.mat')
E=[];
for i=1:15
E=[E (E0-NumberInf(end,(i-1)*50+1:50*i)')./E0];
end
Mean_E=[];STD_E=[];
for i=1:15
Mean_E=[Mean_E mean(E(:,i))];
STD_E=[STD_E std(E(:,i))];
end
errorbar(eps_3,Mean_E,STD_E,'linestyle','none','marker','s','markersize',6,'markerfacecolor','r','color','r');
hold on
a=0.9868;b=1.24;n=12;x=0:0.005:2;
y=Dose(x,a,b,n);
plot(x,y,'linewidth',1.2,'color','r');
hold on
plot([0 b],[a/2 a/2],'linewidth',1.2,'color','k','linestyle',':')
hold on
plot([b b],[0 a/2],'linewidth',1.2,'color','k','linestyle',':')
ylim([0 1])
xlabel(strcat(char(949),'_3'))
% ylabel('Therapy coefficient (E)')
set(gca,'fontweight','bold')
box off
subplot(2,4,8)
path='severe/severe_eps_4/eps4.dat';
eps_4=load(path);
Initial=load('severe/Initial_severe.dat');
E0=Initial(end,end);
load('Severe_eps4.mat')
E=[];
for i=1:15
E=[E (E0-NumberInf(end,(i-1)*50+1:50*i)')./E0];
end
Mean_E=[];STD_E=[];
for i=1:15
Mean_E=[Mean_E mean(E(:,i))];
STD_E=[STD_E std(E(:,i))];
end
errorbar(eps_4,Mean_E,STD_E,'linestyle','none','marker','s','markersize',6,'markerfacecolor','r','color','r');
hold on
a=0.8141;b=1.748;n=6;x=0:0.005:3;
y=Dose(x,a,b,n);
plot(x,y,'linewidth',1.2,'color','r');
hold on
plot([0 b],[a/2 a/2],'linewidth',1.2,'color','k','linestyle',':')
hold on
plot([b b],[0 a/2],'linewidth',1.2,'color','k','linestyle',':')
ylim([0 1])
xlabel(strcat(char(949),'_4'))
% ylabel('Therapy coefficient (E)')
set(gca,'fontweight','bold')
box off
annotation(fig1,'textbox',...
    [0.0675 0.876 0.023 0.0740],'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.2898 0.876 0.023 0.0740],...
    'String',{'b'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.4945 0.876 0.023 0.0740],...
    'String',{'c'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.7038 0.876 0.023 0.0740],...
    'String',{'d'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.0675 0.3996 0.023 0.0740],...
    'String',{'e'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.2898 0.3996 0.023 0.0740],...
    'String',{'f'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.4945 0.3996 0.023 0.0740],...
    'String',{'g'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.7038 0.3996 0.023 0.0740],...
    'String',{'h'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');

exportfig(fig1,'FigS8.eps','color','cmyk','fontmode','scaled','fontsize',1);

function f=Dose(x,a,b,n)
f=a.*(x.^n)./(b.^n+x.^n);
end