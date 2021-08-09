N1=6;N2=6;N3=100;
path='Transition//output/';
[Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=TriExportdata(path,N1);
save('MS_K4_rho.mat','Inc','NumberInf','ClearNum','InfNum','Virus','Cytokine','TCells');

