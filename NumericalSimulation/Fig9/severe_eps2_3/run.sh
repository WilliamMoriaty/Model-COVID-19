#!/bin/bash


for((k=1;k<=21; k++))
do
  sed "s/xxx/$k/g" md.in > md-1.in
  echo | awk "NR==$k"  eps2.dat > temp
  vars=`cat temp`
  i=0; 
  declare -a var
  for x in $vars
  do
    var[i]=$x
   ((i++))
  done
  eps_2=${var[0]}
  sed "s/eps_2=ggg/eps_2=$eps_2/g" md-1.in > md-2.in 
  mkdir output/$k
  for((l=1;l<=21; l++))
    do
    sed "s/yyy/$RANDOM/g" md-2.in > md-3.in
    sed "s/ggg/$l/g" md-3.in > md-4.in
    echo | awk "NR==$l"  eps3.dat > temp1
    vars=`cat temp1`
    i=0; 
    declare -a var1
    for x in $vars
    do
      var1[i]=$x
      ((i++))
    done
    eps_3=${var1[0]}
    echo k=$k,l=$l,eps_2=$eps_2, eps_3=$eps_3
    sed "s/eps_3=vvv/eps_3=$eps_3/g" md-4.in > md-$k-$l.in 
    mkdir output/$k/$l 
    ../Therapy/Therapy_Model/bct_VirusCell md-$k-$l.in
    rm md-3.in temp1 md-$k-$l.in md-4.in
  done
  rm md-1.in  md-2.in temp
done