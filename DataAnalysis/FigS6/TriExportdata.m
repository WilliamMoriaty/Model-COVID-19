function [NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=TriExportdata(path,N1,N2,N3)
N=5000;
NumberInf=[];InfNum=[];ClearNum=[];Cytokine=[];TCells=[];
% RNA=[];IFNs=[];AVPs=[];
Virus=[];
for i=1:N1
path1=strcat(path,num2str(i),'/')
for j=1:N2
path2=strcat(path1,num2str(j),'/');
for n=1:N3
path3=strcat(path2,num2str(n),'/md.dat');
A=load(path3);
InfNum=[InfNum A(:,6)];
ClearNum=[ClearNum A(:,7)];
NumberInf=[NumberInf A(:,end)];
Virus=[Virus A(:,2)];
Cytokine=[Cytokine A(:,3)];
TCells=[TCells A(:,4)*10^5];
end
end
end
end