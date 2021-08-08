

for((k=1;k<=9; k++))
do
  sed "s/xxx/$k/g" md.in > md-$k-1.in
  sed "s/yyy/$RANDOM/g" md-$k-1.in > md-$k-2.in
  echo | awk "NR==$k"  Treatment.dat > temp
  vars=`cat temp`
  i=0; 
  declare -a var
  for x in $vars
  do
    var[i]=$x
   ((i++))
  done
  eps_1=${var[0]}
  eps_2=${var[1]}
  eps_3=${var[2]}
  eps_4=${var[3]}
  echo k=$k, eps_1=$eps_1 eps_2=$eps_2,eps_3=$eps_3,eps_4=$eps_4 
  sed "s/eps_1=ggg/eps_1=$eps_1/g" md-$k-2.in > md-$k-3.in 
  sed "s/eps_2=hhh/eps_2=$eps_2/g" md-$k-3.in > md-$k-4.in 
  sed "s/eps_3=vvv/eps_3=$eps_3/g" md-$k-4.in > md-$k-5.in
  sed "s/eps_4=uuu/eps_4=$eps_4/g" md-$k-5.in > md-$k.in
 
  mkdir output/$k
  ../Therapy_Model/bct_VirusCell md-$k.in
  rm md-$k-1.in md-$k-2.in md-$k-3.in md-$k-4.in md-$k-5.in temp 
done
