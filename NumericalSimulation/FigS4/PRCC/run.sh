

for((k=1;k<=200; k++))
do
  sed "s/xxx/$k/g" md.in > md-$k-1.in
  echo | awk "NR==$k"  Sense.dat > temp
  vars=`cat temp`
  i=0; 
  declare -a var
  for x in $vars
  do
    var[i]=$x
   ((i++))
  done
  Tau1=${var[0]}
  Tau2=${var[1]}
  k_in=${var[2]}
  v_ex=${var[3]}
  q0=${var[4]}
  lambda1=${var[5]}
  lambda2=${var[6]}
  d4=${var[7]}
  b1=${var[8]}
  b2=${var[9]}
  K1=${var[10]}
  
  echo k=$k
  echo Tau1=$Tau1,Tau2=$Tau2,k_in=$k_in
  echo v_ex=$v_ex,q0=$q0,lambda1=$lambda1,lambda2=$lambda2
  echo d4=$d4,b1=$b1,b2=$b2,K1=$K1
  sed "s/Tau1=zzz/Tau1=$Tau1/g" par.dat > par1.dat
  sed "s/Tau2=zzz/Tau2=$Tau2/g" par1.dat > par2.dat
  sed "s/k_in=zzz/k_in=$k_in/g" par2.dat > par3.dat
  sed "s/q0=zzz/q0=$q0/g" par3.dat > par4.dat
  sed "s/lambda1=zzz/lambda1=$lambda1/g" par4.dat > par5.dat
  sed "s/lambda2=zzz/lambda2=$lambda2/g" par5.dat > par6.dat
  sed "s/b1=zzz/b1=$b1/g" par6.dat > par7.dat
  sed "s/b2=zzz/b2=$b2/g" par7.dat > par8.dat
  sed "s/K1=zzz/K1=$K1/g" par8.dat > par_$k.dat

  sed "s/v_ex=zzz/v_ex=$v_ex/g" md-$k-1.in > md-$k-2.in
  sed "s/d4=zzz/d4=$d4/g" md-$k-2.in > md-$k-3.in
  sed "s/yyy/$RANDOM/g" md-$k-3.in > md-$k.in
  mkdir output/$k
  ../Sense_Model/bct_VirusCell md-$k.in
  rm md-$k-1.in md-$k-2.in md-$k-3.in md-$k.in
  rm par1.dat par2.dat par3.dat par4.dat
  rm par5.dat par6.dat par7.dat par8.dat par_$k.dat
  rm temp 
done



