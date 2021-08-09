N1=750;
path='moderate/eps1/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Moderate_eps1.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=750;
path='moderate/eps2/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Moderate_eps2.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=750;
path='moderate/eps3/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Moderate_eps3.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=750;
path='moderate/eps4/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Moderate_eps4.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=750;
path='severe/eps1/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Severe_eps1.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=750;
path='severe/eps2/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Severe_eps2.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=750;
path='severe/eps3/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Severe_eps3.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=750;
path='severe/eps4/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Severe_eps4.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');
