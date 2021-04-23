path='K4_rho/';
N1=21;N2=21;
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=DoubleExportdata(path,N1,N2);
save('K4_rho.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells')
