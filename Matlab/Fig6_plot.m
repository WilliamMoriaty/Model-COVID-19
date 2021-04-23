fig1=figure(1)
clf();
set(gcf,'position',[30,50,1480,540])
In=load('Individual/Individual.dat');
Ind=load('Individual.mat');
N=5000;
axes('position',[0.094,0.120,0.279,0.712])
a=jet;
cor=a(:,:);
NumInf=Ind.NumberInf(end,:)/N;
x=0.0:0.01:0.8;
[u,x]=hist(NumInf,x);
b=bar(x,100.*u'./size(NumInf,2),'Facecolor','flat');
for i=1:81
b.CData(i,:)=Select_color(x(i),cor,0,0.8);
end
% hold on
% plot([0.2 0.2],[0 10],'linestyle','--','color','k','linewidth',1.2)
% hold on
% plot([0.65 0.65],[0 10],'linestyle','--','color','k','linewidth',1.2)

ylim([0,10])
xlabel('R_{IC}','FontName','Helvetica','FontSize',10,'FontWeight','bold')

ylabel('Individual (%)','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'FontName','Helvetica','FontSize',12,'FontWeight','bold','linewidth',1.2,'ytick',0:2:10)
box off


A=[In Ind.NumberInf(end,:)'/N];

colormap('jet')
axes('position',[0.435,0.122,0.126,0.301])
%axes('position',[0.13,0.11,0.486111475626638,0.753338864644377]);
Cor=[];
for i=1:400
Color=Select_color(A(i,end),cor,0,0.8);
plot(A(i,3)*10^3,A(i,4),'Marker','.','Markersize',12,'color',Color);
Cor=[Cor;Color];
hold on
caxis([0 0.8])
end
xlabel('\rho (\times10^{-3})','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('K_4','FontName','Helvetica','FontSize',10,'FontWeight','bold')
set(gca,'FontName','Helvetica','FontSize',12,'FontWeight','bold','linewidth',1.2)
box off
axes('position',[0.435,0.525,0.126,0.301])
Cor=[];
for i=1:400
Color=Select_color(A(i,end),cor,0,0.8);
plot(A(i,1),A(i,2),'Marker','.','Markersize',12,'color',Color);
Cor=[Cor;Color];
hold on
caxis([0 0.8])
end
xlim([42,50])
set(gca,'xtick',42:2:50)
xlabel('K_1','FontName','Helvetica','FontSize',12,'FontWeight','bold')
ylabel('\lambda_2','FontName','Helvetica','FontSize',12,'FontWeight','bold')
set(gca,'FontName','Helvetica','FontSize',12,'FontWeight','bold','linewidth',1.2)
box off

axes('position',[0.629,0.120,0.279,0.712])
load('K4_rho.mat')
N1=21;N2=21;xi=0.05;N=5000;NumInf=zeros(21,21);
for i=1:N1
for j=1:N2
NumInf(i,j)=NumberInf(end,(i-1)*N1+j)/N;
end
end
K4=load('K4_rho/K4.dat');
rho=load('K4_rho/rho.dat');
colormap(jet)

imagesc(rho*10^3,K4,NumInf','Interpolation','bilinear');
hold on
contourf(rho*10^3,K4,NumInf',1,'linestyle','--','linewidth',3.0,'fill','off','linecolor','k');

xlabel('\rho (\times10^{-3})','FontName','Helvetica','FontSize',10,'FontWeight','bold')
ylabel('K_4','FontName','Helvetica','FontSize',12,'FontWeight','bold')
caxis([0 0.8])
ylim([40 150])
set(gca,'FontName','Helvetica','FontSize',12,'FontWeight','bold','YDir','normal')
box off

ch=colorbar;
ch.Label.String='R_{IC} at day 30 ';
ch.Label.FontSize=12;
set(ch,'linewidth',0.5,'fontweight','bold','position',[0.928 0.256 0.018 0.425]...
    ,'axislocation','out','fontsize',12)


%picture sign
annotation(fig1,'textbox',...
    [0.043 0.783 0.0212 0.098],...
    'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.374 0.783 0.0212 0.098],...
    'String',{'b'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
annotation(fig1,'textbox',...
    [0.566 0.783 0.0212 0.098],...
    'String',{'c'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'FitBoxToText','off',...
    'EdgeColor','none');
exportfig(fig1,'Fig6.eps','color','cmyk','fontmode','scaled','fontsize',1);

function Color=Select_color(CoSI,cor,low,up) %R_Infected
x=linspace(low,up,256);
for j=1:255
if(CoSI>=x(j) && CoSI<=x(j+1))
Color=cor(j,:);
break;
end
end
end


