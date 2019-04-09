#!/bin/bash

# This script extract ROIs from aparc.a2009 generated from SUMA and Freesurfer
# and generate seed time course for PPI analysis

# left inferior occipital 11811863
# ctx-lh-parsopercularis (1018) (220 180 140) (9221340)
# ctx-lh-parsorbitalis (1019) (20 100 50) (3302420)
# ctx-lh-parstriangularis (1020) (220 60 20) (1326300)
# ctx-lh-G_frontal_middle (1109) (140 100 180) (11822220)
# ctx-lh-G_occipit-temp_lat-Or_fusiform (1117) (60 20 140) (9180220)
# ctx_lh_G_temporal_middle (11138) (180 60 60) (3947700)
# ctx_lh_Pole_temporal (11144) (220 180 20) (1357020)
# ctx_lh_G_pariet_inf-Angular (11125) (20 60 220) (14433300)

index=(11811863 9221340 3302420 \
		1326300 11822220 9180220 \
		3947700 1357020 14433300)
ROIlabel=("inf_Occipital" "parsOper" "parsOrbi" \
			"parsTrian" "mid_Frontal" "Fusiform" \
			"mid_Temp" "Pole_Temp" "AngularG")

#　set subject dir

if [ $#argv > 0 ]; then
	subj=$argv[1]
else
	subj=sub02
fi


home_dir=/export/home/lmengxing/public/Mengxing/CHNstory
suma_dir=$home_dir/story2016fMRI/$subj/freesurfer/SUMA
func_dir=$home_dir/data/${subj}.results
len=${#index[*]} #get the number of ROIs

for ((i=0; i<$len; i++))
do
	code=$index[i]
	ROI=$ROIlabel[i]
	3dcalc -a $suma_dir/std.141.lh.aparc.a2009s.annot.niml.dset\
			 -expr 'equals(a, $code)' \
			-prefix "$ROI".lh.niml.dset
	# generate seed time series, ppi."$ROI".1D
	3dmaskave -quiet -mask "$ROI".lh.niml.dset \
				ppi.pre.errts."$subj".lh.niml.dset \
				> ppi.seed."$ROI".1D
	rm "$ROI".lh.niml.dset

done


			
