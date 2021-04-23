

for((k=1;k<=400; k=k+1))
do
  sed "s/xxx/$k/g" md.in > md-$k-1.in
  sed "s/yyy/$RANDOM/g" md-$k-1.in > md-$k-2.in
  echo | awk "NR==$k"  Individual.dat > temp
  vars=`cat temp`
  i=0; 
  declare -a var
  for x in $vars
  do
    var[i]=$x
   ((i++))
  done
  K1=${var[0]}
  rho=${var[2]}
  lambda2=${var[1]}
  K4=${var[3]}
  sed "s/K4=vvv/K4=$K4/g" md-$k-2.in > md-$k-3.in 
  sed "s/rho=zzz/rho=$rho/g" md-$k-3.in > md-$k.in 
  sed "s/K1=xxx/K1=$K1/g" par.dat > par1.dat
  sed "s/lambda2=yyy/lambda2=$lambda2/g" par1.dat > par_$k.dat
  echo k=$k, K1=$K1,rho=$rho,lambda2=$lambda2,K4=$K4
  mkdir output/$k 
  ../../MultisViralInfection/bct_VirusCell md-$k.in
  rm md-$k-1.in md-$k.in md-$k-2.in md-$k-3.in temp par1.dat par_$k.dat
done