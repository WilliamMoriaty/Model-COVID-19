Cor=[0 0 0;
    0 1 0;
    0 0 1;
    1 1 0;
    1 0 1;
    1 0 0;
    0.5 0.5 0.5;
    0.5 0.8 0.3;
    0.5 0 1;]
fig1=figure(1);
clf();
set(gcf,'position',[50,50,1440,720])
axes('position',[0.18,0.60,0.23,0.35])
Moderate=[];
load('Therapy_moderate.mat')
E0=NumberInf(end,end);% control case
E=(E0-NumberInf(end,1))./E0;% eps1=0.3
Moderate=[Moderate E];
E=(E0-NumberInf(end,2))./E0;% eps2=0.1
Moderate=[Moderate E];
E=(E0-NumberInf(end,3))./E0;% eps3=1.0
Moderate=[Moderate E];
E=(E0-NumberInf(end,4))./E0;% eps4=2.0
Moderate=[Moderate E];
E=(E0-NumberInf(end,5))./E0;% eps1=0.3 eps3=1.0
Moderate=[Moderate E];
E=(E0-NumberInf(end,6))./E0;% esp_2=0.1,eps_3=1.0
Moderate=[Moderate E];
E=(E0-NumberInf(end,7))./E0;% esp_1=0.3,eps_4=2.0
Moderate=[Moderate E];
E=(E0-NumberInf(end,8))./E0;% esp_2=0.1,eps_4=2.0
Moderate=[Moderate E];
b=bar(1,Moderate,'Facecolor','flat');
for k = 1:size(Moderate,2)
    b(k).CData = Cor(k,:);
end
ylabel('Therapy coefficient (E)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
xlim([0.4,1.5])
set(gca,'xtick',{},'ytick',0:0.2:1,'linewidth',1.2,'FontName','Helvetica','FontSize',10,'FontWeight','bold')
% leg=legend('\epsilon_1(0.15)','\epsilon_2(0.05)'...
%     ,'\epsilon_3(0.2)','\epsilon_4(0.5)','\epsilon_1(0.15)+\epsilon_3(0.2)','\epsilon_2(0.05)+\epsilon_3(0.2)'...
%     ,'location',[0.140373314647614,0.504379816333534,0.129199607263912,0.410312509298324],'fontweight','bold');
% leg.ItemTokenSize = [6,5];
% legend('box','off')
title('Moderate (\rho=0.0005)','fontweight','bold')
box off

axes('position',[0.51,0.60,0.23,0.35])
Severe=[];
load('Therapy_severe.mat')
E0=NumberInf(end,end);% control case

E=(E0-NumberInf(end,1))./E0;% eps1=0.3
Severe=[Severe E];
E=(E0-NumberInf(end,2))./E0;% eps2=0.1
Severe=[Severe E];
E=(E0-NumberInf(end,3))./E0;% eps3=1.0
Severe=[Severe E];
E=(E0-NumberInf(end,4))./E0;% eps4=2.0
Severe=[Severe E];
E=(E0-NumberInf(end,5))./E0;% eps1=0.3 eps3=1.0
Severe=[Severe E];
E=(E0-NumberInf(end,6))./E0;% esp2=0.1,eps3=1.0
Severe=[Severe E];
E=(E0-NumberInf(end,7))./E0;% esp1=0.3,eps4=2.0
Severe=[Severe E];
E=(E0-NumberInf(end,8))./E0;% esp2=0.1,eps4=2.0
Severe=[Severe E];
b=bar(1,Severe,'Facecolor','flat');
for k = 1:size(Severe,2)
    b(k).CData = Cor(k,:);
end
xlim([0.4,1.5])
set(gca,'xtick',{},'ytick',0:0.2:1,'FontName','Helvetica','FontSize',10,'FontWeight','bold','linewidth',1.2)
% leg=legend('\epsilon_1(0.3)','\epsilon_2(0.1)'...
%     ,'\epsilon_3(1.0)','\epsilon_4(2.0)','\epsilon_1(0.3)+\epsilon_3(1.0)','\epsilon_2(0.1)+\epsilon_3(1.0)'...
%     ,'\epsilon_1(0.3)+\epsilon_4(2.0)','\epsilon_2(0.1)+\epsilon_4(2.0)');
% leg.ItemTokenSize = [10,5];
% legend('location',[0.146292897871132,0.355781243801117,0.127882084018785,0.543437512397766],'fontweight','bold','box','off')
title('Severe (\rho=0.0025)','fontweight','bold')
box off

%table

table=imread('table.png');
axes('position',[0.145,0.205,0.25,0.601])
imshow(table,'Interpolation','bilinear')
axes('position',[0.476,0.205,0.25,0.601])
imshow(table,'Interpolation','bilinear')

%  table_mild=imread('mild.png');
%  axes('position',[0.135,0.02,0.3,0.4])
%  imshow(table_mild,'Interpolation','bilinear')
% % 
% table_severe=imread('severe.png');
% axes('position',[0.48,0.02,0.3,0.4])
% imshow(table_severe,'Interpolation','bilinear')

% picture sign
annotation(fig1,'textbox',...
    [0.12 0.91 0.027 0.058],...
    'String',{'a'},...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.46 0.91 0.027 0.058],...
    'String',{'b'},...
    'HorizontalAlignment','center',...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
% annotation(fig1,'textbox',...
%     [0.12 0.36 0.027 0.058],...
%     'String',{'c'},...
%     'HorizontalAlignment','center',...
%     'FontWeight','bold',...
%     'FontSize',18,...
%     'FitBoxToText','off',...
%     'EdgeColor','none');
% annotation(fig1,'textbox',...
%     [0.46 0.36 0.027 0.058],...
%     'String',{'d'},...
%     'HorizontalAlignment','center',...
%     'FontWeight','bold',...
%     'FontSize',18,...
%     'FitBoxToText','off',...
%     'EdgeColor','none');
exportfig(fig1,'Fig8.eps','color','cmyk','fontmode','scaled','fontsize',1);
