N1=2;N2=100;
path='MS_NTC/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=DoubleExportdata(path,N1,N2);
save('MS_NTC.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

