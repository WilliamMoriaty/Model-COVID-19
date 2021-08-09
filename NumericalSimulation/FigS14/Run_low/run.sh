#!/bin/bash
#SBATCH -c 1

for((k=1;k<=200; k++))
do
  sed "s/xxx/$k/g" md.in > md-$k-1.in
  sed "s/yyy/$RANDOM/g" md-$k-1.in > md-$k.in
  mkdir output/$k
  echo k=$k
  ../Code/bct_VirusCell md-$k.in  
  rm md-$k-1.in
done