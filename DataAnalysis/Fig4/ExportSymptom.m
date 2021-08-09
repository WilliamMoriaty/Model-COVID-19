function Symptom=ExportSymptom(path,N1,N2)
Symptom=[];
for i=1:N1
path1=strcat(path,num2str(i),'/');
for j=1:N2
path2=strcat(path1,num2str(j),'/');
sum=0;
for n=1:100
path3=strcat(path2,num2str(n),'/md.dat');
x=load(path3);
sum=sum+x;
end
Symptom=[Symptom sum];
end
end
end