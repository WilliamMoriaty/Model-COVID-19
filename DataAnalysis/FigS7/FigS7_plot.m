
fig1=figure(1);
clf();
set(gcf,'position',[50,50,1440,720])
axes('position',[0.15,0.42,0.3,0.51])
Moderate=[];
load('Therapy_moderate.mat')
% E0=NumberInf(end,end);% control case
E_C=log10(Cytokine(end,1));% eps1=0.3
E_T=log10(TCells(end,1));
E=[E_C;E_T];
Moderate=[Moderate E];
E_C=log10(Cytokine(end,2));% eps2=0.1
E_T=log10(TCells(end,2));
E=[E_C;E_T];
Moderate=[Moderate E];
E_C=log10(Cytokine(end,3));% eps3=1.0
E_T=log10(TCells(end,3));
E=[E_C;E_T];
Moderate=[Moderate E];
E_C=log10(Cytokine(end,4));% eps4=2.0
E_T=log10(TCells(end,4));
E=[E_C;E_T];
Moderate=[Moderate E];
E_C=log10(Cytokine(end,5));% eps1=0.3 eps3=1.0
E_T=log10(TCells(end,5));
E=[E_C;E_T];
Moderate=[Moderate E];
E_C=log10(Cytokine(end,6));% esp_2=0.1,eps_3=1.0
E_T=log10(TCells(end,6));
E=[E_C;E_T];
Moderate=[Moderate E];
E_C=log10(Cytokine(end,7));% esp_1=0.3,eps_4=2.0
E_T=log10(TCells(end,7));
E=[E_C;E_T];
Moderate=[Moderate E];
E_C=log10(Cytokine(end,8));% esp_2=0.1,eps_4=2.0
E_T=log10(TCells(end,8));
E=[E_C;E_T];
Moderate=[Moderate E];
E_C=log10(Cytokine(end,9));% NOtreatment
E_T=log10(TCells(end,9));
E=[E_C;E_T];
Moderate=[Moderate E];


yyaxis left
x1=0.7:1:8*1+0.7;
bar(x1,Moderate(1,:),'FaceColor',[0.00,0.45,0.74],'barwidth',0.3);
ylim([0 3]);
ylabel('log_{10}[Cytokine]','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'ytick',0:0.5:3)
axis([-0.25 9.95 0 3])
yyaxis right
x2=1.0:1:8+1.0;
bar(x2,Moderate(2,:)','FaceColor',[0.85,0.33,0.10],'barwidth',0.3);
ylabel('log_{10}[T_{effector}]','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'ytick',0:2:8)
axis([-0.25 9.95 0 8])

set(gca,'xticklabel',{},'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
title('Moderate (\rho=0.0005)','fontweight','bold')
box off

axes('position',[0.54,0.42,0.3,0.51])
Severe=[];
load('Therapy_severe.mat')

E_C=log10(Cytokine(end,1));% eps1=0.3
E_T=log10(TCells(end,1));
E=[E_C;E_T];
Severe=[Severe E];
E_C=log10(Cytokine(end,2));% eps2=0.1
E_T=log10(TCells(end,2));
E=[E_C;E_T];
Severe=[Severe E];
E_C=log10(Cytokine(end,3));% eps3=1.0
E_T=log10(TCells(end,3));
E=[E_C;E_T];
Severe=[Severe E];
E_C=log10(Cytokine(end,4));% eps4=2.0
E_T=log10(TCells(end,4));
E=[E_C;E_T];
Severe=[Severe E];
E_C=log10(Cytokine(end,5));% eps1=0.3 eps3=1.0
E_T=log10(TCells(end,5));
E=[E_C;E_T];
Severe=[Severe E];
E_C=log10(Cytokine(end,6));% esp_2=0.1,eps_3=1.0
E_T=log10(TCells(end,6));
E=[E_C;E_T];
Severe=[Severe E];
E_C=log10(Cytokine(end,7));% esp_1=0.3,eps_4=2.0
E_T=log10(TCells(end,7));
E=[E_C;E_T];
Severe=[Severe E];
E_C=log10(Cytokine(end,8));% esp_2=0.1,eps_4=2.0
E_T=log10(TCells(end,8));
E=[E_C;E_T];
Severe=[Severe E];
E_C=log10(Cytokine(end,9));% esp_2=0.1,eps_4=2.0
E_T=log10(TCells(end,9));
E=[E_C;E_T];
Severe=[Severe E];

yyaxis left
x1=0.7:1:8*1+0.7;
bar(x1,Severe(1,:),'FaceColor',[0.00,0.45,0.74],'barwidth',0.3);
ylim([0 3]);
ylabel('log_{10}[Cytokine]','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'ytick',0:0.5:3)
axis([-0.25 9.95 0 3])

yyaxis right
x2=1.0:1:8+1.0;
bar(x2,Severe(2,:)','FaceColor',[0.85,0.33,0.10],'barwidth',0.3);
ylabel('log_{10}[T_{effector}]','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'ytick',0:2:8)
axis([-0.25 9.95 0 8])

set(gca,'xticklabel',{},'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
title('Severe (\rho=0.0025)','fontweight','bold')
box off

table=imread('table1.png');
axes('position',[0.095,0.015,0.34,0.6])
imshow(table,'Interpolation','bilinear')
axes('position',[0.485,0.015,0.34,0.6])
imshow(table,'Interpolation','bilinear')

annotation(fig1,'textbox',...
    [0.08586 0.89194 0.02011 0.060],...
    'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.4806 0.89194 0.02011 0.060],...
    'String',{'b'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig1,'FigS7.eps','color','cmyk','fontmode','scaled','fontsize',1);
