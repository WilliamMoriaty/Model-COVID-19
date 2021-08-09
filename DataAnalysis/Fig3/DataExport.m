N1=200;
path='K1_47/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=Exportdata(path,N1);
save('K1_47.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');


