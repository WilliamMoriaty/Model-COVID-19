fig1=figure(1);
clf();
load('K4_rho.mat')
N1=21;N2=21;xi=0.05;N=5000;NumInf=zeros(21,21);cytokine=zeros(21,21);
for i=1:N1
for j=1:N2
NumInf(i,j)=NumberInf(end,(i-1)*N1+j)/N;
cytokine(i,j)=Cytokine(end,(i-1)*N1+j);
end
end
rho=load('K4_rho/rho.dat');
for i=1:size(rho,1)
if(NumInf(i,1)<0.4)
plot(rho(i)*10^3,cytokine(i,1),'marker','s','markersize',8,'markerfacecolor','b','markeredgecolor','b');
else
plot(rho(i)*10^3,cytokine(i,1),'marker','.','markersize',18,'markerfacecolor','r','markeredgecolor','r');
end
hold on
end
x=linspace(0,3,101);
b=0.9576;a=116.3;n=2.2;c=16;
y=Dose(x,a,b,n)+c;
plot(x,y,'linewidth',1.2,'color','k');
hold on
plot([0 b],[a/2+c a/2+c],'linewidth',1.2,'color','k','linestyle',':')
hold on
plot([b b],[0 a/2+c],'linewidth',1.2,'color','k','linestyle',':')
xlim([0 3])
ylim([0 150])
xlabel('\rho(\times10^{-3})','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('[Cytokine]','FontName','Helvetica','FontSize',10,'FontWeight','bold')
% title('Severe(\rho=0.0025)')
set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
box off
annotation(fig1,'textbox',...
    [0.695285714285712 0.280952380952389 0.187571428571428 0.0933333333333322],...
    'String','r^2=0.9917',...
    'FontWeight','bold',...
    'FontSize',15,...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig1,'Fig_CytokineDose.eps','color','cmyk','fontmode','scaled','fontsize',1);

% set(gcf,'position',[100 200 1020 270]);
% subplot(1,3,1)
% rho=load('K4_rho/rho.dat');
% for i=1:size(rho,1)
% if(NumInf(i,1)<0.4)
% plot(rho(i)*10^3,cytokine(i,1),'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
% else
% plot(rho(i)*10^3,cytokine(i,1),'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
% end
% hold on
% end
% x=rho*10^3;
% b=1.094;a=116.1;n=2;c=23;
% y=Dose(x,a,b,n)+c;
% plot(x,y,'linewidth',1.2,'color','k');
% hold on
% plot([0 b],[a/2+c a/2+c],'linewidth',1.2,'color','k','linestyle',':')
% hold on
% plot([b b],[0 a/2+c],'linewidth',1.2,'color','k','linestyle',':')
% xlim([0 3])
% ylim([0 150])
% xlabel('\rho(\times10^{-3})')
% ylabel('[Cytokine]')
% % title('Severe(\rho=0.0025)')
% set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
% box off
% subplot(1,3,2)
% rho=load('K4_rho/rho.dat');
% for i=1:size(rho,1)
% if(NumInf(i,4)<0.4)
% plot(rho(i)*10^3,cytokine(i,4),'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
% else
% plot(rho(i)*10^3,cytokine(i,4),'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
% end
% hold on
% end
% x=rho*10^3;
% b=1.334;a=111;n=3;c=23;
% y=Dose(x,a,b,n)+c;
% plot(x,y,'linewidth',1.2,'color','k');
% hold on
% plot([0 b],[a/2+c a/2+c],'linewidth',1.2,'color','k','linestyle',':')
% hold on
% plot([b b],[0 a/2+c],'linewidth',1.2,'color','k','linestyle',':')
% xlim([0 3])
% ylim([0 150])
% xlabel('\rho(\times10^{-3})')
% % ylabel('[Cytokine]')
% % title('Severe(\rho=0.0025)')
% set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
% box off
% subplot(1,3,3)
% rho=load('K4_rho/rho.dat');
% for i=1:size(rho,1)
% if(NumInf(i,7)<0.4)
% plot(rho(i)*10^3,cytokine(i,7),'marker','s','markersize',6,'markerfacecolor','b','markeredgecolor','b');
% else
% plot(rho(i)*10^3,cytokine(i,7),'marker','.','markersize',12,'markerfacecolor','r','markeredgecolor','r');
% end
% hold on
% end
% x=rho*10^3;
% b=1.83;a=106.1;n=6;
% y=Dose(x,a,b,n)+23;
% plot(x,y,'linewidth',1.2,'color','k');
% hold on
% plot([0 b],[a/2+c a/2+c],'linewidth',1.2,'color','k','linestyle',':')
% hold on
% plot([b b],[0 a/2+c],'linewidth',1.2,'color','k','linestyle',':')
% exportfig(fig1,'Fig_CytokineDose.eps','color','cmyk','fontmode','scaled','fontsize',1);
% 
% xlim([0 3])
% ylim([0 150])
% xlabel('\rho(\times10^{-3})')
% % ylabel('[Cytokine]')
% % title('Severe(\rho=0.0025)')
% set(gca,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
% box off

function f=Dose(x,a,b,n)
f=a.*(x.^n)./(b.^n+x.^n);
end