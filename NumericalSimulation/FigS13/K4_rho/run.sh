#!/bin/bash


n1=21     #rho
n2=21     #K4
N_final=$[0*n1]   #Final
N_initial=$[21*n1]   #Initial
k0=0
for((k=$N_initial;k<N_final;k++))
do
x1=$[k/n1+1]  #sign rho
y1=$[k%n1+1]  #sign K4
echo | awk "NR==$x1"  rho.dat > temp
vars=`cat temp`
i=0; 
declare -a var
for x in $vars
do
  var[i]=$x
  ((i++))
done
echo | awk "NR==$y1"  K4.dat > temp1
vars1=`cat temp1`
j=0; 
declare -a var1
for y in $vars1
do
   var1[j]=$y
   ((j++))
done
K4=${var1[0]}
rho=${var[0]}
if ((x1 != k0))
then
mkdir output/$x1
fi
mkdir output/$x1/$y1
sed "s/xxx/$x1/g" md.in > md-1.in
sed "s/rho=zzz/rho=$rho/g" md-1.in > md-2.in
sed "s/yyy/$RANDOM/g" md-2.in > md-3.in
sed "s/ggg/$y1/g" md-3.in > md-4.in
sed "s/K4=hhh/K4=$K4/g" md-4.in > md-$x1-$y1.in
echo x=$x1, y=$y1, rho=$rho, K4=$K4
../Model/bct_VirusCell md-$x1-$y1.in
rm md-3.in temp1 md-4.in md-1.in  md-2.in temp

k0=$x1
done