fig1=figure(1)
clf();
set(gcf,'position',[30,50,1480,720])
% set(gcf,'position',[100,200,810,300])
axes('position',[0.118,0.573,0.288,0.416]);
n=200;
load('K1_47.mat')
x=0:1:30;
Inc_50=Inc(1,find(Inc<30));
[u,x]=hist(Inc_50,x);
% [u1,x]=hist(Incubation,x);
plot(x,100*(cumsum(u)/n),'marker','.','markersize',20,'markerfacecolor','b','color','b','linestyle','-');
hold on
load('lambda2_0.35_47.mat')
Inc_lam=Inc(1,find(Inc<30));
[u2,x]=hist(Inc_lam,x);
plot(x,100*(cumsum(u2)/n),'marker','s','markersize',6,'markerfacecolor','g','color','g','linestyle','-');
hold on
load('K1_45.mat')
Inc_45=Inc(1,find(Inc<30));
[u2,x]=hist(Inc_45,x);
plot(x,100*(cumsum(u2)/n),'marker','d','markersize',6,'markerfacecolor','r','color','r','linestyle','-');
% hold on
% plot(x,100*(cumsum(u1)/size(Incubation,1)),'bo')
% legend('K_1=50','K_1=45','Real-data','location','best')
leg=legend('K_1=47,\lambda_2=0.3','K_1=47,\lambda_2=0.35','K_1=45,\lambda_2=0.3','location','best','autoupdate','off');
leg.ItemTokenSize = [15,5];
legend('box','off')
xlabel('day after infection','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('Symptom Individual (%)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'ytick',20:20:100,'linewidth',1.2)
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold')

box off

axes('position',[0.435,0.868,0.068,0.121]);
load('K1_47.mat')
x=0:0.5:30;
Inc_50=Inc(1,find(Inc<30));
[u,x]=hist(Inc_50,x);
bar(x,100*u/size(Inc_50,2),'facecolor',[0,0,1],'edgecolor',[0,0,1])
% xlabel('T_{IP}')
ylabel('Individual (%)','FontName','Helvetica','FontSize',9,'FontWeight','bold')
box off
ylim([0 12])
set(gca,'xticklabel',{},'ytick',0:4:12)
set(gca,'FontName','Helvetica','FontSize',9,'FontWeight','bold','linewidth',1.2)


axes('position',[0.435,0.7208,0.068,0.121]);
load('K1_45.mat')
x=0:0.5:30;
Inc_45=Inc(1,find(Inc<30));
[u,x]=hist(Inc_45,x);
bar(x,100*u/size(Inc_45,2),'facecolor',[1,0,0],'edgecolor',[1,0,0])
ylim([0 8])
% xlabel('T_{IP}')
ylabel('Individual (%)','FontName','Helvetica','FontSize',9,'FontWeight','bold')
box off
set(gca,'xticklabel',{})
set(gca,'FontName','Helvetica','FontSize',9,'FontWeight','bold','linewidth',1.2)

axes('position',[0.435,0.572,0.068,0.121]);
load('lambda2_0.35_47.mat')
x=0:0.5:30;
Inc_lambda2=Inc(1,find(Inc<30));
[u,x]=hist(Inc_lambda2,x);
bar(x,100*u/size(Inc_lambda2,2),'facecolor',[0,1,0],'edgecolor',[0,1,0])
ylim([0 8])
xlabel('T_{IP}')
ylabel('Individual (%)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
box off
set(gca,'xtick',0:5:30)
set(gca,'FontName','Helvetica','FontSize',9,'FontWeight','bold','linewidth',1.2)

axes('position',[0.572,0.573,0.288,0.416]);
path='K1_lambda2/';N1=21;N2=21;N=5000;S=zeros(14,21);
Symptom=ExportSymptom(path,N1,N2);
K1=load('K1_lambda2/K1.dat');
lambda2=load('K1_lambda2/lambda2.dat');
for i=1:N1
for j=1:N2
S(i,j)=Symptom((i-1)*21+j);
end
end

colormap(jet)
imagesc(K1,fliplr(lambda2(1:N1)),S,'Interpolation','bilinear');
ch=colorbar;
ch.Label.FontSize=10;
ch.Label.FontWeight='bold';
ch.Label.FontName='Helvetica';
ch.Label.String='Symptom Individual(%)';
set(ch,'linewidth',0.5,'fontweight','bold'...
     ,'position',[0.873 0.630 0.014 0.316])
caxis([0 100])
box off
hold on

xlabel('K_1','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('\lambda_2','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'YDir','normal')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

load('K1_45.mat')
NumberInf_45=NumberInf/5000;
load('lambda2_0.35_47.mat')
NumberInf_lambda2=NumberInf/5000;
load('K1_47.mat')
NumberInf_50=NumberInf/5000;
x=0:0.01:1;t=0:0.01:720;
cor=[0 0 1;0 1 0;1 0 0];
axes('position',[0.118,0.290,0.187,0.175]);
i=1;
k=find(t==120*i);
[u_45,x]=hist(NumberInf_45(k,:),x);
[u_lambda2,x]=hist(NumberInf_lambda2(k,:),x);
[u_50,x]=hist(NumberInf_50(k,:),x);
plot(x,100*u_50/size(NumberInf_50,2),'linewidth',1.2,'color',cor(1,:));
hold on
plot(x,100*u_lambda2/size(NumberInf_lambda2,2),'linewidth',1.2,'color',cor(2,:));
hold on
plot(x,100*u_45/size(NumberInf_45,2),'linewidth',1.2,'color',cor(3,:));
title(strcat(num2str(5*i),'th day after infection'),'FontName','Helvetica','FontSize',10,'FontWeight','bold')
xlim([0 0.4]);ylim([0 80]);
set(gca,'ytick',0:20:80,'xticklabel',{})
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

ylabel('Individual (%)')
hold on
plot([0.05 0.05],[0 100],'k--','linewidth',1.2)
leg=legend({'K_1=47,\lambda_2=0.3','K_1=47,\lambda_2=0.35','K_1=45,\lambda_2=0.3'},'location','best','autoupdate','off');
leg.ItemTokenSize = [10,5];
legend('boxoff')
box off

axes('position',[0.398,0.290,0.187,0.175]);
i=2;
k=find(t==120*i);
[u_45,x]=hist(NumberInf_45(k,:),x);
[u_lambda2,x]=hist(NumberInf_lambda2(k,:),x);
[u_50,x]=hist(NumberInf_50(k,:),x);
plot(x,100*u_50/size(NumberInf_50,2),'linewidth',1.2,'color',cor(1,:));
hold on
plot(x,100*u_lambda2/size(NumberInf_lambda2,2),'linewidth',1.2,'color',cor(2,:));
hold on
plot(x,100*u_45/size(NumberInf_45,2),'linewidth',1.2,'color',cor(3,:));
title(strcat(num2str(5*i),'th day after infection'),'FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'ytick',0:20:80,'xticklabel',{})
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

xlim([0 0.4]);ylim([0 80]);
hold on
plot([0.05 0.05],[0 100],'k--','linewidth',1.2)
box off

axes('position',[0.675,0.290,0.187,0.175]);
i=3;
k=find(t==120*i);
[u_45,x]=hist(NumberInf_45(k,:),x);
[u_lambda2,x]=hist(NumberInf_lambda2(k,:),x);
[u_50,x]=hist(NumberInf_50(k,:),x);
plot(x,100*u_50/size(NumberInf_50,2),'linewidth',1.2,'color',cor(1,:));
hold on
plot(x,100*u_lambda2/size(NumberInf_lambda2,2),'linewidth',1.2,'color',cor(2,:));
hold on
plot(x,100*u_45/size(NumberInf_45,2),'linewidth',1.2,'color',cor(3,:));
title(strcat(num2str(5*i),'th day after infection'),'FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'ytick',0:20:80,'xticklabel',{})
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

xlim([0 0.4]);ylim([0 80]);
hold on
plot([0.05 0.05],[0 100],'k--','linewidth',1.2)
box off

axes('position',[0.677,0.067,0.187,0.175]);
i=4;
k=find(t==120*i);
[u_45,x]=hist(NumberInf_45(k,:),x);
[u_lambda2,x]=hist(NumberInf_lambda2(k,:),x);
[u_50,x]=hist(NumberInf_50(k,:),x);
plot(x,100*u_50/size(NumberInf_50,2),'linewidth',1.2,'color',cor(1,:));
hold on
plot(x,100*u_lambda2/size(NumberInf_lambda2,2),'linewidth',1.2,'color',cor(2,:));
hold on
plot(x,100*u_45/size(NumberInf_45,2),'linewidth',1.2,'color',cor(3,:));
title(strcat(num2str(5*i),'th day after infection'),'FontName','Helvetica','FontSize',10,'FontWeight','bold')
xlabel('R_{IC}','FontName','Helvetica','FontSize',10,'FontWeight','bold')
% ylabel('Symptom Individual (%)')
xlim([0 0.4]);ylim([0 80]);
set(gca,'ytick',0:20:80)
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)

hold on
plot([0.05 0.05],[0 100],'k--','linewidth',1.2)
box off

axes('position',[0.398,0.067,0.187,0.175]);
i=5;
k=find(t==120*i);
[u_45,x]=hist(NumberInf_45(k,:),x);
[u_lambda2,x]=hist(NumberInf_lambda2(k,:),x);
[u_50,x]=hist(NumberInf_50(k,:),x);
plot(x,100*u_50/size(NumberInf_50,2),'linewidth',1.2,'color',cor(1,:));
hold on
plot(x,100*u_lambda2/size(NumberInf_lambda2,2),'linewidth',1.2,'color',cor(2,:));
hold on
plot(x,100*u_45/size(NumberInf_45,2),'linewidth',1.2,'color',cor(3,:));
title(strcat(num2str(5*i),'th day after infection'),'FontName','Helvetica','FontSize',10,'FontWeight','bold')
xlabel('R_{IC}','FontName','Helvetica','FontSize',10,'FontWeight','bold')

set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
xlim([0 0.4]);ylim([0 80]);
set(gca,'ytick',0:20:80)
hold on
plot([0.05 0.05],[0 100],'k--','linewidth',1.2)
box off

axes('position',[0.118,0.067,0.187,0.175]);
i=6;
k=find(t==120*i);
[u_45,x]=hist(NumberInf_45(k,:),x);
[u_lambda2,x]=hist(NumberInf_lambda2(k,:),x);
[u_50,x]=hist(NumberInf_50(k,:),x);
plot(x,100*u_50/size(NumberInf_50,2),'linewidth',1.2,'color',cor(1,:));
hold on
plot(x,100*u_lambda2/size(NumberInf_lambda2,2),'linewidth',1.2,'color',cor(2,:));
hold on
plot(x,100*u_45/size(NumberInf_45,2),'linewidth',1.2,'color',cor(3,:));
title(strcat(num2str(5*i),'th day after infection'),'fontweight','bold','fontsize',10)
xlabel('R_{IC}','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('Individual(%)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
xlim([0 0.4]);ylim([0 80]);
set(gca,'ytick',0:20:80)
hold on
plot([0.05 0.05],[0 100],'k--','linewidth',1.2)
box off
%Arrow
annotation(fig1,'arrow',[0.314 0.380],...
    [0.390 0.390],'LineWidth',2);
annotation(fig1,'arrow',[0.592 0.657],...
    [0.390 0.390],'LineWidth',2);
annotation(fig1,'arrow',[0.372 0.317],...
    [0.145 0.145],'LineWidth',2);
annotation(fig1,'arrow',[0.647 0.595],...
    [0.145 0.145],'LineWidth',2);
annotation(fig1,'arrow',[0.906 0.871],...
    [0.145 0.145],'LineWidth',2);
annotation(fig1,'line',[0.906 0.871],...
    [0.390 0.390],'LineWidth',2);
annotation(fig1,'line',[0.906 0.906],...
    [0.144 0.391],'LineWidth',2);
%picture sign
annotation(fig1,'textbox',...
    [0.058 0.949 0.020 0.068],...
    'String','a',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.508 0.949 0.020 0.068],...
    'String','b',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.058,0.456,0.02,0.068],...
    'String','c',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.462 0.921 0.0318 0.0544],...
    'String',{'K_1=47','\lambda_2=0.3'},...
    'FontWeight','bold',...
    'FontSize',9,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.462 0.774 0.0318 0.0544],...
    'String',{'K_1=45','\lambda_2=0.3'},...
    'FontWeight','bold',...
    'FontSize',9,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.462 0.628 0.0318 0.0544],...
    'String',{'K_1=47','\lambda_2=0.35'},...
    'FontWeight','bold',...
    'FontSize',9,...
    'FitBoxToText','off',...
    'EdgeColor','none');

exportfig(fig1,'Fig5.eps','color','cmyk','fontmode','scaled','fontsize',1);
