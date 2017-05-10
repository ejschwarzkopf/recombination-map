#/bin/bash
#Script cuts the .locs files produced by the vcftoldhat.sh script into windows of 2000 SNPs with a 500 SNP overlap
#it should be run in the folder where the full .locs files are saved

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

for file in *ldhat.locs; do #runs over all the .locs files
  N=$(cut -f 1 $file | head -n 1) #finds the total ammount of SNPs in the file
  tail -n $N $file > file1.txt #creates a file that is the .locs file without the header
  f=file1.txt #sets the new file's name to a variable
  for i in `seq 0 $((($N-$n)/($n-$k)))`; do #runs as many times as there are going to be windows in file (possibly minus one, see "if" lower in the code)
    head -n $(($n*$i-$k*$i+$n)) $f | tail -n $n > $file.$i.locs #takes the i-eth segment of 2000 SNPs (respecting the 500 SNP windows) and saves them to a file
    g=$file.$i.locs #sets the file's name to a variable
    min=$(head -n 1 $g) #finds the location of the first SNP
    max=$(tail -n 1 $g) #finds the location of the last SNP
    p=$(echo "$max-$min" | bc -l) #finds the range of locations of the SNPs in the window
    echo -e "$n $((${p%.*}+2)) "L"\n$(cat $g)" > $g #saves the file with its header (the second part has a 2 added to ensure that LDhat considers the full range covered, apparently there are issues with the decimals)
  done
  if [ $((($N-$n)%($n-$k))) -ne 0 ]; then #if the remainder of the division that generates the amount of windows is zero (if there are leftover SNPs after making all the previous windows)
    tail -n $n $f > $file.$((($N-$n)/($n-$k)+1)).locs #get the locations of the last 2000 SNPs and save them to a file
    g=$file.$((($N-$n)/($n-$k)+1)).locs #sets the file's name to a variable
    min=$(head -n 1 $g) #finds the location of the first SNP
    max=$(tail -n 1 $g) #finds the location of the last SNP
    p=$(echo "$max-$min" | bc -l) #finds the range of locations of the SNPs in the window
    echo -e "$n $((${p%.*}+2)) "L"\n$(cat $g)" > $g #saves the file with its header 
  fi
  echo -e "$file\n" #lets us know where we are in the file creation
done
rm file1.txt #deletes the leftover locations file (the one without the header)
