#!/bin/tcsh

#echo "loop n times (input int) "
if ( $# != 2 ) then
 echo "Usage: tmtest loopcount filename(without  extension)"
 exit
endif

set loop = $1
#echo "Type input file name (without ext)"
set infile = $2
\rm -f $infile.out
\rm -f $infile.log
#added to remove log file in the src dir
\rm -f ./$infile.log  
set count = 0
while ( $count < $loop)
	echo "EXECUTION: " $count
	echo "Execution: " >> $infile.out
    echo  $count >> $infile.out
#echo ""
#	./zgt_test $infile.txt | cat - $infile.out > /tmp/out && mv /tmp/out $infile.out
	./zgt_test $infile.txt > $infile.out
	@ count ++
end
./ipcs_cleanup.sh
