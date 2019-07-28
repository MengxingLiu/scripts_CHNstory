#!/bin/sh

spath="/export/home/lmengxing/public/Mengxing/CHNstory/data/vol/"
for i in {01..33}
do
	sub=sub$i
	subdir=$spath/$sub.results
if [ -d $subdir ]; then 
	cd $subdir
	3dTcat -prefix pb05.$sub.r01.scale all_runs.$sub+tlrc.[0..178]
	3dTcat -prefix pb05.$sub.r02.scale all_runs.$sub+tlrc.[179..347]
	3dTcat -prefix pb05.$sub.r03.scale all_runs.$sub+tlrc.[348..519]
	3dTcat -prefix pb05.$sub.r04.scale all_runs.$sub+tlrc.[520..706]
	3dTcat -prefix pb05.$sub.r05.scale all_runs.$sub+tlrc.[707..887]
fi
done
