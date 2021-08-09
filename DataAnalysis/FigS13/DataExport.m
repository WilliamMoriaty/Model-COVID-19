N1=21;N2=21;
path='K4_rho/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=DoubleExportdata(path,N1,N2);
save('Modify.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

