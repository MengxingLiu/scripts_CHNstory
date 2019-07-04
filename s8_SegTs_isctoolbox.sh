#!/bin/bash
spath='/bcbl/home/public/Mengxing/CHNstory/'
indexpath=$spath/story2016fMRI/scripts/Wave_1Dfiles/
for sub in sub02 sub03 sub04 sub05 sub06 sub07 sub08 sub09 sub10 sub11 sub12 sub13 sub14 sub15 sub16 sub17 sub18 sub19 sub20 sub21 sub22 sub23 sub24 sub25 sub26 sub27 sub28 sub29 sub30 sub31 sub32 sub33
# for sub in $1
do
    
        echo "================================================================="
        echo "========================="$sub"===================================="
        echo "================================================================="
        3dTcat $spath/analysis/ISC/preprocess/$sub.results/pb04."$sub".r*.scale+tlrc.HEAD -prefix $spath/analysis/ISC/preprocess/$sub.results/pb04."$sub".scale.nii
        # cp $spath/data/$sub.results/pb05."$sub"."$hemi".scale.niml.dset $spath/analysis/ISC/tmpfile
        for type in NS CS US SW aNS
        do
            3dTcat $spath/analysis/ISC/preprocess/$sub.results/pb04."$sub".scale.nii"[1dcat $indexpath/index_$type.1D]" \
                            -prefix $spath/analysis/ISC/preprocess/$sub.results/pb04."$sub"."$type".scale.nii
        done

done    
