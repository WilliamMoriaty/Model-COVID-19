function [Inc,NumberInf,ClearNum,InfNum,Virus,Cytokine,TCells]=SingleExportdata(path,N1)
Inc=[];N=5000;NumberInf=[];InfNum=[];ClearNum=[];Cytokine=[];TCells=[];
% RNA=[];IFNs=[];AVPs=[];
Virus=[];

for j=1:N1
path1=strcat(path,num2str(j),'/md.dat');
A=load(path1);
InfNum=[InfNum A(:,6)];
ClearNum=[ClearNum A(:,7)];
NumberInf=[NumberInf A(:,end)];
Virus=[Virus A(:,2)];
Cytokine=[Cytokine A(:,3)];
TCells=[TCells A(:,4)*10^5];
n1=max(find(A(:,end)<=0.05*N));
Inc=[Inc A(n1,1)/24];
% RNA_1=[];IFNs_1=[];AVPs_1=[];
% for n=0:100:72000
% path3=strcat(path,num2str(j),'/md-',num2str(n),'.dat');
% B=load(path3);
% % a=find(B(:,2));
% RNA_1=[RNA_1;mean(B(:,6))];
% IFNs_1=[IFNs_1;mean(B(:,7))];
% AVPs_1=[AVPs_1;mean(B(:,8))];
% end
% RNA=[RNA RNA_1];
% IFNs=[IFNs IFNs_1];
% AVPs=[AVPs AVPs_1];
% end
end