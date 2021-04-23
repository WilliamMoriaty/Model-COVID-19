% Sense=PerturbMatrix(200);
fig1=figure(1);
clf();
load('PRCC/PRCC.mat')
 path='PRCC/';N=5000;
Sense=load(strcat(path,'Sense.dat'));
[PRCC_Virus,P_value_Virus,PRCC_Infected,P_value_Infected]=PRCC(Sense,Virus(end,1:200)',NumberInf(end,1:200)')
figure(1)
Sen_virus=find(P_value_Virus<0.01);
PRCC_virus_1=PRCC_Virus(find(P_value_Virus<0.01));
Sen_infect=find(P_value_Infected<0.01);
PRCC_infected_1=PRCC_Infected(find(P_value_Infected<0.01));
% bar(Sen_ifn,PRCC_ifn_1)
bar(PRCC_Infected);
ylim([-1,1])
ylabel('PRCC')
axe={'\tau_1','\tau_2','k_{in}','v_{ex}',' q_0','\lambda_1'...
     ,'\lambda_2','\delta_4','b_1','b_2','K_1'};
set(gca,'xtick',1:1:11,'ytick',-1:0.5:1,'xticklabels',axe,'Fontweight','bold')
% title('Sensitivity analysis of estimated parameters from IFN pathway','fontweight','bold')
box off
exportfig(fig1,'Fig_Par.eps','color','cmyk','fontmode','scaled','fontsize',1);

% figure(2)
% Sen_IFNs=find(P_value_IFNs<0.01);
% PRCC_IFNs_1=PRCC_IFNs(find(P_value_IFNs<0.01));
% bar(PRCC_IFNs)
% % bar(Sen_IFNs,PRCC_IFNs_1);
% ylabel('PRCC')
% axe={'\tau_1','\tau_2','k_{on}','k_{off}','k_{in}','R','V_{ex}','v_{cell}',' q_0','\lambda_1'...
%     ,'\lambda_2','\lambda_3','d_1','d_2','d_3','d_4'...
%     ,'b_1','b_2','K_1','K_2'}
% set(gca,'xtick',1:1:20,'xticklabels',axe,'Fontweight','bold')
% title('Sensitivity analysis of the pertubation of parameters in the simplified model','fontweight','bold')

% % axe={'k_{in}','V_{ex}',' q_0','\lambda_1'...
% %     ,'\lambda_2','\lambda_3','d_1','d_2','d_3','d_4'...
% %     ,'b_1','K_1'}
% 
% % set(gca,'xtick',1:1:12,'xticklabels',axe)
% title('p value <0.01 parameters for intracellular IFNs')
function Sense=PerturbMatrix(n)
tau1=randi([45,55],1,n);
tau2=randi([90,110],1,n);
kin=0.06*0.9+0.06*2*0.1*rand(1,n);
vex=1.25*10^-11*0.9+2*0.1*1.25*10^-11*rand(1,n);
q0=0.3*0.9+0.3*2*0.1*rand(1,n);
lambda1=0.16*0.9+0.16*2*0.1*rand(1,n);
lambda2=0.3*0.9+0.3*2*0.1*rand(1,n);
d4=0.25*0.9+0.25*2*0.1*rand(1,n);
b1=4*0.9+4*2*0.1*rand(1,n);
b2=1.0*0.9+1.0*2*0.1*rand(1,n);
K1=47*0.9+47*2*0.1*rand(1,n);
Sense=[tau1' tau2' kin' vex' q0' lambda1' lambda2' ...
     d4' b1' b2' K1'];
end

function [PRCC_Virus,P_value_Virus,PRCC_infected,P_value_infected]=PRCC(Sense,Virus,Infected)
PRCC_Virus=[];P_value_Virus=[];
PRCC_infected=[];P_value_infected=[];
for i=1:size(Sense,2)
Z=[];
if(i==1)
    Z=Sense(:,i+1:size(Sense,2));
elseif(i==size(Sense,2))
    Z=Sense(:,1:i-1);
else
    Z=[Sense(:,1:i-1) Sense(:,i+1:size(Sense,2))];
end
[rho_PRCC_virus,p_PRCC_virus]=partialcorr(Sense(:,i),Virus,Z,'type','spearman');
[rho_PRCC_Infected,p_PRCC_Infected]=partialcorr(Sense(:,i),Infected,Z,'type','spearman');

PRCC_Virus=[PRCC_Virus rho_PRCC_virus];P_value_Virus=[P_value_Virus p_PRCC_virus];
PRCC_infected=[PRCC_infected rho_PRCC_Infected];P_value_infected=[P_value_infected p_PRCC_Infected];
end
end