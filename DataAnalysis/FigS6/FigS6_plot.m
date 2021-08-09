load('MS_K4_rho.mat')
Escape=zeros(100,36);
N=5000;
cor=[0.64,0.08,0.18;
    0.85,0.33,0.10;
    0.49,0.18,0.56;
    0.00,0.45,0.74;
    0.47,0.67,0.19;
    0.30,0.75,0.93;
    ]
for i=1:36
for j=1:100
A=NumberInf(:,(i-1)*100+j);

if(A(end)>=0.4*N)
a1=min(find(A>=0.05*N));
a2=min(find(A>=0.4*N));
Escape(j,i)=(a2-a1)*0.01/24;
end

end
end
B1=[];C1=[];B=[];C=[];
for n1=1:6
for n=1:6
m=Escape(find(Escape(:,(n1-1)*6+n)>0),(n1-1)*6+n);
MEAN=mean(m);STD=std(m);
B1=[B1 MEAN];C1=[C1 STD];
end
B=[B;B1];C=[C;C1];
B1=[];C1=[];
end
K4=linspace(40,60,6);

for m=1:2:6
text(41,7.2-0.2*m,strcat("\rho=",num2str(1.5+0.3*(m-1)),'\times10^{-3}'),'color',cor(m,:),'Fontweight','bold','Fontsize',10);
hold on
plot(K4,B(m,:),'marker','s','markersize',6,'linewidth',1.2,'markerfacecolor',cor(m,:),'linewidth',1.2,'color',cor(m,:))
hold on
errorbar(K4,B(m,:),C(m,:),'marker','none','linestyle','none','linewidth',1.2,'color',cor(m,:))
hold on

end
xlim([39 61]);ylim([2 8])
xlabel('K_4','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('Transition Time (days)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'xtick',40:2:60,'ytick',2:2:8,'linewidth',1.2,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
exportfig(fig1,'FigS6.eps','color','cmyk','fontmode','scaled','fontsize',1);

% figure(2)
% for m=1:1:6
% % text(41,0.015-0.0008*(m-1),strcat("\rho=",num2str(1.5+0.3*(m-1)),'\times10^{-3}'),'color',cor(m,:),'Fontweight','bold','Fontsize',10);
% % hold on
% plot(K4,(C(m,:).^2./B(m,:)),'marker','s','markersize',6,'markerfacecolor',cor(m,:),'color',cor(m,:))
% hold on
% plot(K4,(C(m,:).^2./B(m,:)),'linewidth',1.2,'linestyle','-','color',cor(m,:))
% hold on
% 
% end
% xlim([39 61]);ylim([0 0.05])