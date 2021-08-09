N1=200;
path='K1_rho/rho_0.0005/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('K1_rho_0.0005.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=200;
path='K1_rho/rho_0.0025/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('K1_rho_0.0025.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=200;
path='K1_rho/rho_0.005/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('K1_rho_0.0005.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');
N1=200;
path='K1_T0/T0_100000/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('K1_rho_0.0005.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=200;
path='K1_T0/T0_200000/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('K1_T0_200000.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=200;
path='K1_T0/T0_300000/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('K1_T0_300000.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');
