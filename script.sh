echo "/Bash script run successfully/"
name1=$1
name2=$2
echo "/R script run/"
Rscript "/home/pavel/Desktop/Work/Project/R/R_2_plots/R_2_plots.R" --no-save --no-restore --args ${name1:3:(-4)} ${name2:3:(-4)} `pwd`
echo "/Done/"
echo "/Bash script end successfully/"


