#!/bin/bash


n1=15     #eps4
n2=50     #random

N_initial=$[0*n2+0]   #Initial
N_final=$[15*n2]   #Final

k0=0
for((k=$N_initial;k<N_final;k++))
do
x1=$[k/n2+1]  #sign eps4
y1=$[k%n2+1]  #random 
echo | awk "NR==$x1"  eps4.dat > temp
vars=`cat temp`
i=0; 
declare -a var
for x in $vars
do
  var[i]=$x
  ((i++))
done
eps_4=${var[0]}
if ((x1 != k0))
then
mkdir output/$x1
fi
mkdir output/$x1/$y1
sed "s/xxx/$x1/g" md.in > md-1.in
sed "s/eps_4=zzz/eps_4=$eps_4/g" md-1.in > md-2.in
sed "s/yyy/$RANDOM/g" md-2.in > md-3.in
sed "s/ggg/$y1/g" md-3.in > md-$x1-$y1.in
echo x=$x1, y=$y1, eps_4=$eps_4
../Therapy_Model/bct_VirusCell md-$x1-$y1.in
rm  md-1.in  md-2.in temp md-3.in md-$x1-$y1.in md-3.in

k0=$x1
done
