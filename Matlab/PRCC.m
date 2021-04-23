path='PRCC/';
N1=200;
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('PRCC.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells')
