N1=9;
path='moderate/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Therapy_moderate.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

N1=9;
path='severe/output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1);
save('Therapy_severe.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

