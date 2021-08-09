N1=200;
path='Run_High/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Homogeneity_High.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=200;
path='Run_Low/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Homogeneity_Low.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');
