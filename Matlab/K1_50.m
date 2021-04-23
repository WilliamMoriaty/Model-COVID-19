function K1_50()
path='K1_50/';
N1=200;
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells,RNA,IFNs,AVPs]=Exportdata(path,N1);
save('K1_50.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells','RNA','IFNs','AVPs');
end