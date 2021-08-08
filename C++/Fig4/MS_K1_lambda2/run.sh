

for((k=1;k<=21; k++))
do
  sed "s/xxx/$k/g" md.in > md-1.in
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
  sed "s/lambda2=ggg/lambda2=$lambda2/g" par.dat > par1.dat 
  mkdir output/$k
  for((l=1;l<=21; l++))
    do
    sed "s/ggg/$l/g" md-1.in > md-2.in
    echo | awk "NR==$l"  K1.dat > temp1
    vars=`cat temp1`
    i=0; 
    declare -a var1
    for x in $vars
    do
      var1[i]=$x
      ((i++))
    done
    K1=${var1[0]}
    echo k=$k,l=$l,lambda2=$lambda2, K1=$K1
    sed "s/K1=hhh/K1=$K1/g" par1.dat > par_$l.dat
    mkdir output/$k/$l
    for((n=1;n<=100; n++))
     do
     sed "s/nnn/$n/g" md-2.in > md-3.in
     sed "s/yyy/$RANDOM/g" md-3.in >  md-$k-$l-$n.in 
     mkdir output/$k/$l/$n 
     ../Symptom/bct_VirusCell md-$k-$l-$n.in
     rm md-3.in md-$k-$l-$n.in
    done
    rm md-2.in temp1 par_$l.dat
  done
  rm md-1.in temp par1.dat
done

