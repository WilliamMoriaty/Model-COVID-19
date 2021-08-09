N1=200;
path='K1_45/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('K1_45.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

path='lambda2_0.35/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('lambda2_0.35_47.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');
