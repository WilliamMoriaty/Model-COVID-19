N1=400;
path='Individual/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Individual.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=21;N2=21;
path='K4_rho/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=DoubleExportdata(path,N1,N2);
save('K4_rho.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

