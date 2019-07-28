#!/bin/sh

# This script extract ROIs in MNI space
# and generate seed time course for PPI analysis

# vOT -46 -54 -14
# par triangularis -42 32 6
# pars orbitalis -42 14 0
# anterior STG -62 -16 2 
# IPL -26 -62 44
# pars opercularis -40 2 26


index=(11811863 6558940 3947660 \
		9231540 11822220 9180220 \
		3947700 1357020 14433300)
ROIlabel=("inf_Occipital" "parsOper" "parsOrbi" \
			"parsTrian" "mid_Frontal" "Fusiform" \
			"mid_Temp" "Pole_Temp" "AngularG")

#set subject dir
if [ "$#" -gt 0 ]; then
	subj=$1
else
	subj=sub02
fi
echo $subj
# set 
home_dir=/export/home/lmengxing/public/Mengxing/CHNstory
suma_dir=$home_dir/story2016fMRI/$subj/freesurfer/SUMA
sub_dir=$home_dir/data/${subj}.results
len=${#index[*]} #get the number of ROIs

if [ ! -d $sub_dir ]; then
    echo "$subj.results"  no exsit
    exit
fi

for ((i=0; i<$len; i++))
do
	code=${index[$i]}
	ROI=${ROIlabel[$i]}
	cd $sub_dir
	3dcalc -a $suma_dir/std.141.lh.aparc.a2009s.annot.niml.dset\
			 -expr "equals(a, $code)" \
			-prefix "$ROI".lh.niml.dset
	# generate seed time series, ppi."$ROI".1D
	3dmaskave -quiet -mask "$ROI".lh.niml.dset \
				ppi.pre.errts."$subj".lh.niml.dset \
				> ppi.seed."$ROI".1D
	rm "$ROI".lh.niml.dset

done
