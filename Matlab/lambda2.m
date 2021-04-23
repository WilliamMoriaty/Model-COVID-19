path='lambda2/';
N1=200;
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells,RNA,IFNs,AVPs]=Exportdata(path,N1);
save('lambda2_0.35_47.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells','RNA','IFNs','AVPs');
