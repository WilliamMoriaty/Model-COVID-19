#!/bin/bash
#SBATCH -p hpxg
for((k=1;k<=26; k++))
do
  sed "s/xxx/$k/g" md.in > md-$k-1.in
  sed "s/yyy/$RANDOM/g" md-$k-1.in > md-$k-2.in
  echo | awk "NR==$k"  K4.dat > temp
  vars=`cat temp`
  i=0; 
  declare -a var
  for x in $vars
  do
    var[i]=$x
   ((i++))
  done
  K4=${var[0]}
  echo k=$k, K4=$K4
  sed "s/K4=zzz/K4=$K4/g" md-$k-2.in > md-$k.in 
  mkdir output/$k
  ../../Inverse_Model/bct_VirusCell md-$k.in
  rm md-$k-1.in  md-$k-2.in temp
done