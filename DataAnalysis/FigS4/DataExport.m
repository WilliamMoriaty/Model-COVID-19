N1=200;
path='PRCC/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('PRCC.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');
