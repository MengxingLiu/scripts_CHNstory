#!/bin/bash

if [ "$#" -lt 1]; then
	echo "Please specify the roi"
	exit 1
fi

roi=$1

sumapath="/export/home/lmengxing/public/Mengxing/CHNstory/analysis/MVM/"
#start a suma and wait it for 3 seconds
specfile=$sumapath/suma_MNI152_2009/std.141.MNI152_2009_both.spec

vglrun suma -spec $specfile -niml &
sleep 3


echo "\n### load inflated surface"

# DriveSuma -com show_surf -i std.141.lh.inflated.gii \
#		-label inflated
DriveSuma -com viewer_cont -key:r2:d period 
# DriveSuma -com surf_cont -switch_surf std.inflated
echo "\n### Adapting view..."

# Remove crosshair and axes
DriveSuma -com viewer_cont -key F3 -key F4 -key F5

# Change viewer size to 1200*1200 pixels
DriveSuma -com viewer_cont -viewer_size 1200 1200

# zoom out and have the left lateral view 
DriveSuma -com viewer_cont -key:r2:d z -key 'Ctrl+left' -key a

# load dataset 
# rh is automatically loaded if you are using a both hemisphere spec in the beginning.
DriveSuma -com surf_cont -load_dset PPI.$roi.lh.niml.dset -surf_label lh.inflated
DriveSuma -com surf_cont -load_dset PPI.$roi.rh.niml.dset -surf_label rh.inflated
# generate an array to store the index of the subbricks we need from MVM data

image_dir=PPI_$roi
index=(`seq 4 2 44`)   # only have the beta value subbricks
subbrickLabel=("Listen_NS" "Listen_CS" "Listen_US" "Listen_SW" \
                                "Listen_CS-NS" "Listen_US-NS" "Listen_SW-NS" \
                                "Listen_US-CS" "Listen_SW-CS" "Listen_SW-US" \
                                 "Read_NS" "Read_CS" "Read_US" "Read_SW" \
                                "Read_CS-NS" "Read_US-NS" "Read_SW-NS" \
                                "Read_US-CS" "Read_SW-CS" "Read_SW-US" \
                                "Read-Listen")
len=${#index[*]} # get the length of the conditions 


for ((i=0; i<$len; i++))      # bash array index starts from zero, surprise!
do
	image_pre="${subbrickLabel[$i]}"
	Iindex="${index[$i]}" 			# set the index of intensity subbrick
	Tindex=$((Iindex + 1 ))			# set the index of t value subbrick
	
	# set the prefix of the images you save for each condition
	# export SUMA_AutoRecordPrefix="./${image_dir}/${image_pre}"
	# echo $SUMA_AutoRecordPrefix
	# for std.141.MNI152_2009_lh  the corrected p 0.05 for uncorrected
	mkdir -p ./${image_dir}/${image_pre}
	 # using T stats subbricks for the intensity selector, so the -I_range could be used
     # to clip the range by t values
     for hemi in lh rh
    do

        DriveSuma -com surf_cont -surf_label $hemi.inflated \
        -I_sb $Tindex -T_sb $Tindex -I_range -9 \
		-T_val 0.001p -Clst -1 280
        DriveSuma -com surf_cont -surf_label $hemi.inflated \
        -I_sb $Tindex -T_sb $Tindex -UseClst y \
		-switch_cmap "Spectrum:red_to_blue+gap"
    done
	for pose in 'Ctrl+left' 'Ctrl+right' 'Ctrl+down'
	do
	# get view and snap
		DriveSuma -com viewer_cont -key "$pose" -com viewer_cont -key 'Ctrl+r'
		sleep 1 # give it a break to change the view and save the fig 
	done
	mv ./SUMA_Recordings/* ./${image_dir}/${image_pre}/
	rm -rf ./SUMA_Recordings/
done
