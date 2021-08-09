N1=26;
path='MS_K4/High/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('K4_High.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=26;
path='MS_K4/Low/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('K4_Low.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=26;
path='MS_rho/High/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('rho_High.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=26;
path='MS_rho/Low/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('rho_Low.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');
