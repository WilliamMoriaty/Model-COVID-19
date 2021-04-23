function K1_45()
path='K1_45/';
N1=200;
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells,RNA,IFNs,AVPs]=Exportdata(path,N1);
save('K1_45.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells','RNA','IFNs','AVPs');
end