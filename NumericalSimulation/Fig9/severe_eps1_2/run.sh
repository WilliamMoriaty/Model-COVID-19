#!/bin/bash

n1=21     #eps1
n2=21     #eps2

N_initial=$[0*n1+0]   #Initial
N_final=$[21*n1]   #Final

k0=0
for((k=$N_initial;k<N_final;k++))
do
x1=$[k/n1+1]  #sign rho
y1=$[k%n1+1]  #sign K4
echo | awk "NR==$x1"  eps1.dat > temp
vars=`cat temp`
i=0; 
declare -a var
for x in $vars
do
  var[i]=$x
  ((i++))
done
echo | awk "NR==$y1"  eps2.dat > temp1
vars1=`cat temp1`
j=0; 
declare -a var1
for y in $vars1
do
   var1[j]=$y
   ((j++))
done
eps_2=${var1[0]}
eps_1=${var[0]}
if ((x1 != k0))
then
mkdir output/$x1
fi
mkdir output/$x1/$y1
sed "s/xxx/$x1/g" md.in > md-1.in
sed "s/eps_1=ggg/eps_1=$eps_1/g" md-1.in > md-2.in
sed "s/yyy/$RANDOM/g" md-2.in > md-3.in
sed "s/ggg/$y1/g" md-3.in > md-4.in
sed "s/eps_2=vvv/eps_2=$eps_2/g" md-4.in > md-$x1-$y1.in
echo x=$x1, y=$y1, eps_1=$eps_1, eps_2=$eps_2
../Therapy_Model/bct_VirusCell md-$x1-$y1.in
rm md-3.in temp1 md-4.in md-1.in md-2.in md-$x1-$y1.in temp

k0=$x1
done
