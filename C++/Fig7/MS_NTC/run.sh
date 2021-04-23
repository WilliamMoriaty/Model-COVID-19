
for((k=1;k<=2; k++))
do
  sed "s/xxx/$k/g" md.in > md-$k-1.in
  echo | awk "NR==$k"  NTC.dat > temp
  vars=`cat temp`
  i=0; 
  declare -a var
  for x in $vars
  do
    var[i]=$x
   ((i++))
  done
  T0=${var[0]}
  echo k=$k, T0=$T0
  sed "s/T0=zzz/T0=$T0/g" md-$k-1.in > md-$k-2.in 
  mkdir output/$k
  for((n=1;n<=100; n++))
  do
    sed "s/yyy/$RANDOM/g" md-$k-2.in > md-$k-3.in
    sed "s/nnn/$n/g" md-$k-3.in > md-$k.in
    mkdir output/$k/$n
    ../../MultisViralInfection/bct_VirusCell md-$k.in
    rm md-$k-3.in
  done
  rm md-$k-1.in  md-$k-2.in temp
done