

for((k=1;k<=200; k=k+1))
do
  sed "s/xxx/$k/g" md.in > md-$k-1.in
  sed "s/yyy/$RANDOM/g" md-$k-1.in > md-$k.in
  echo | awk "NR==$k"  lambda2.dat > temp
  vars=`cat temp`
  i=0; 
  declare -a var
  for x in $vars
  do
    var[i]=$x
    ((i++))
  done
  lambda2=${var[0]}
  echo k=$k, lambda2=$lambda2
  sed "s/lambda2=xxx/lambda2=$lambda2/g" par.dat > par_$k.dat 
  mkdir output/$k
  ../../MultisViralInfection/bct_VirusCell md-$k.in
  rm md-$k-1.in temp par_$k.dat
done