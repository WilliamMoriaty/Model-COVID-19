function K1_47()
path='K1_47/';
N1=200;
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells,RNA,IFNs,AVPs]=Exportdata(path,N1);
save('K1_47.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells','RNA','IFNs','AVPs');
end