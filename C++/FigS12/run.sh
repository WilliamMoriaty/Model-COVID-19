
for((k=1;k<=3; k++))
do
  sed "s/xxx/$k/g" md.in > md-$k-1.in
  sed "s/yyy/$RANDOM/g" md-$k-1.in > md-$k-2.in
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
  echo k=$k, rho=$rho
  sed "s/rho=zzz/rho=$rho/g" md-$k-2.in > md-$k.in 
  mkdir output/$k
  ../MultisViralInfection/bct_VirusCell md-$k.in
  rm md-$k-1.in  md-$k-2.in temp
done