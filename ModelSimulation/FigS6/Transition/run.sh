#!/bin/bash

#SBATCH -c 1

for((k=1;k<=6; k++))
do
  sed "s/xxx/$k/g" md.in > md-1.in
  echo | awk "NR==$k"  rho.dat > temp
  vars=`cat temp`
  i=0; 
  declare -a var
  for x in $vars
  do
    var[i]=$x
   ((i++))
  done
  rho=${var[0]}
  sed "s/rho=ggg/rho=$rho/g" md-1.in > md-2.in 
  mkdir output/$k
  for((l=1;l<=6; l++))
    do
    sed "s/ggg/$l/g" md-2.in > md-3.in
    echo | awk "NR==$l"  K4.dat > temp1
    vars=`cat temp1`
    i=0; 
    declare -a var1
    for x in $vars
    do
      var1[i]=$x
      ((i++))
    done
    K4=${var1[0]}
    echo k=$k,l=$l,rho=$rho, K4=$K4
    sed "s/K4=hhh/K4=$K4/g" md-3.in > md-4.in
    mkdir output/$k/$l
    for((n=1;n<=100; n++))
     do
     sed "s/nnn/$n/g" md-4.in > md-5.in
     sed "s/yyy/$RANDOM/g" md-5.in >  md-$k-$l-$n.in 
     mkdir output/$k/$l/$n 
     ../../MultisViralInfection/bct_VirusCell md-$k-$l-$n.in
     rm md-5.in md-$k-$l-$n.in
    done
    rm md-3.in md-4.in temp1 
  done
  rm md-1.in md-2.in temp par1.dat
done

