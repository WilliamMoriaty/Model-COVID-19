

for((k=1;k<=21; k++))
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
  sed "s/rho=zzz/rho=$rho/g" md-1.in > md-2.in 
  mkdir output/$k
  for((l=1;l<=21; l++))
    do
    sed "s/yyy/$RANDOM/g" md-2.in > md-3.in
    sed "s/ggg/$l/g" md-3.in > md-4.in
    echo | awk "NR==$l"  K4.dat > temp1
    vars1=`cat temp1`
    j=0; 
    declare -a var1
    for y in $vars1
    do
      var1[j]=$y
      ((j++))
    done
    K4=${var1[0]}
    echo k=$k,l=$l,rho=$rho, K4=$K4
    sed "s/K4=hhh/K4=$K4/g" md-4.in > md-$k-$l.in 
    mkdir output/$k/$l 
    ../../MultisViralInfection/bct_VirusCell md-$k-$l.in
    rm md-3.in temp1 md-$k-$l.in md-4.in
  done
  rm md-1.in  md-2.in temp
done