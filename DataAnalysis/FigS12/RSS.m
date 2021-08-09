load('KieneticData_TCell') %Dataset 7
N=5000;
path='output/';
md1=load(strcat(path,'1/md.dat'));
md2=load(strcat(path,'2/md.dat'));
md3=load(strcat(path,'3/md.dat'));
a1=md1(min(find(md1(:,8)>=250)),1)/24;
a2=md2(min(find(md1(:,8)>=250)),1)/24;
a3=md3(min(find(md1(:,8)>=250)),1)/24;

mod=DT_mod(:,1)+a1+1;T_sim=[];T_real=DT_mod(:,3)*10^3; Kappa=0;%characteristic function
for i=1:size(mod,1)
T_sim=[T_sim;md1(min(find(md1(:,1)>=mod(i)*24)),4)*10^5];
end
for i=1:size(mod,1)
Kappa=Kappa+(T_sim(i)>DT_mod(i,2)*10^3 & T_sim(i)<DT_mod(i,4)*10^3);
end
Kappa_mod=Kappa;
RSS_mod=norm((T_sim-T_real)./T_real);

mod=DT_se(:,1)+a2+1;T_sim=[];T_real=DT_se(:,3)*10^3;Kappa=0;%characteristic function
for i=1:size(mod,1)
T_sim=[T_sim;md2(min(find(md2(:,1)>=mod(i)*24)),4)*10^5];
end
for i=1:size(mod,1)
Kappa=Kappa+(T_sim(i)>DT_se(i,2)*10^3 & T_sim(i)<DT_se(i,4)*10^3);
end
Kappa_severe=Kappa;
RSS_severe=norm((T_sim-T_real)./T_real);

mod=DT_cr(:,1)+a3+1;T_sim=[];T_real=DT_cr(:,3)*10^3;Kappa=0;%characteristic function
for i=1:size(mod,1)
T_sim=[T_sim;md3(min(find(md3(:,1)>=mod(i)*24)),4)*10^5];
end
for i=1:size(mod,1)
Kappa=Kappa+(T_sim(i)>DT_cr(i,2)*10^3 & T_sim(i)<DT_cr(i,4)*10^3);
end
Kappa_cr=Kappa;
RSS_cr=norm((T_sim-T_real)./T_real);

