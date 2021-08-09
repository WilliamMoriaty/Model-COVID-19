function [Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=DoubleExportdata(path,N1,N2)
Inc=[];N=5000;NumberInf=[];InfNum=[];ClearNum=[];Cytokine=[];TCells=[];
% RNA=[];IFNs=[];AVPs=[];
Virus=[];
for i=1:N1
path1=strcat(path,num2str(i),'/')
for j=1:N2
path2=strcat(path1,num2str(j),'/md.dat');
A=load(path2);
InfNum=[InfNum A(:,6)];
ClearNum=[ClearNum A(:,7)];
NumberInf=[NumberInf A(:,end)];
Virus=[Virus A(:,2)];
Cytokine=[Cytokine A(:,3)]
TCells=[TCells A(:,4)*10^5];
n1=max(find(A(:,end)<=0.05*N));
Inc=[Inc A(n1,1)/24];
end
end
end