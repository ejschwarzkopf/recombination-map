#/bin/bash
#Script cuts the .sites files into 2000 SNP windows with 500 SNP overlaps
#it should be run in the folder with the full .sites files

n=2000 #the preset ammount of SNPs in each window
k=500 #the preset size of the overlaps

while getopts “n:k:” OPTION
do
  case $OPTION in
    n)
      n=$OPTARG
      ;;
    k)
      k=$OPTARG
      ;;
  esac
done

for file in *ldhat.sites; do #runs over all the .sites files in the folder
  N=$(cut -f 2 $file | head -n 1) #finds the total number of SNPs
  j=$(wc -l $file | cut -f 1 -d " ") #find the number of individuals in the population
  j=$(($j-1)) #correct the amount
  tail -n $j $file > file1.txt #save the .sites file in a new one without the header
  f=file1.txt #save the new file's name to a variable
  h=$(head -n 1 $file) #save the .sites file header
  for i in `seq 0 $((($N-$n)/($n-$k)))`; do #run over the amount of windows that will be created (possibly minus one, see the "if" bellow)
    awk -v n=$n -v k=$(($n*$i-$k*$i+1)) 'NR % 2 {print} !(NR % 2) {print substr($0,k,n)}' $f > $file.$i.sites #for every other row, keep the window and get rid of the rest, save to a file
    g=$file.$i.sites #save the window file's name to a variable
    echo -e "$(cut -f 1 $file | head -n 1) 2000 1\n$(cat $g)" > $g #add the header and create the final file for the window
  done
  if [ $((($N-$n)%($n-$k))) -ne 0 ]; then #if there are leftover SNPs after the full windows are created, make another window
    awk -v n=$n -v k=$(($N-$n)) 'NR % 2 {print} !(NR % 2) {print substr($0,k,n)}' $f > $file.$(((($N-$n)/($n-$k))+1)).sites #make a window with the last 2000 SNPs
    g=$file.$(((($N-$n)/($n-$k))+1)).sites #set the window file's to a variable
    echo -e "$(cut -f 1 $file | head -n 1) 2000 1\n$(cat $g)" > $g #add the header and create the final file for the window
  fi
done

rm file1.txt
