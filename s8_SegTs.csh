#!/bin/bash
spath='/bcbl/home/public/Mengxing/CHNstory/'
indexpath=$spath/story2016fMRI/scripts/Wave_1Dfiles/
for sub in sub02 sub03 sub04 sub05 sub06 sub07 sub08 sub09 sub10 sub11 sub12 sub13 sub14 sub15 sub16 sub17 sub18 sub19 sub20 sub21 sub22 sub23 sub24 sub25 sub26 sub27 sub28 sub29 sub30 sub31 sub32 sub33
# for sub in $1
do
    for hemi in lh rh
    do
        echo "================================================================="
        echo "========================="$sub"===================================="
        echo "================================================================="
        3dTcat $spath/data/$sub.results/pb05."$sub"."$hemi".r*.scale.niml.dset -prefix $spath/data/$sub.results/pb05."$sub"."$hemi".scale.niml.dset
        cp $spath/data/$sub.results/pb05."$sub"."$hemi".scale.niml.dset $spath/analysis/ISC/tmpfile
        for type in NS CS US SW
        do
            3dTcat $spath/analysis/ISC/tmpfile/pb05."$sub"."$hemi".scale.niml.dset"[1dcat $indexpath/index_$type.1D]" \
                            -prefix $spath/analysis/ISC/tmpfile/pb05."$sub"."$hemi"."$type".scale.niml.dset
        done
    done
done    
