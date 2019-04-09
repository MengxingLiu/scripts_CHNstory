#!/bin/bash


#start a suma and wait it for 3 seconds
suma -spec std.141.MNI152_2009_lh.spec -niml &
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

DriveSuma -com surf_cont -load_dset PPI.MVM.lh.niml.dset -surf_label inflated

# generate an array to store the index of the subbricks we need from MVM data

image_dir='PPI_img'
index=(`seq 4 2 12`)   # only have the beta value subbricks
subbrickLabel=("Listen_NS" "Listen_CS" "Listen_US" "Listen_SW" "Listen_CS-NS")
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
	 
	DriveSuma -com surf_cont -surf_label inflated \
		-I_sb $Iindex -T_sb $Tindex -I_range -0.9 \
		-T_val 0.001p
		-Clst -1 280 -UseClst y \
		-switch_cmap "Spectrum:red_to_blue+gap"
	for pose in 'Ctrl+left' 'Ctrl+right' 'Ctrl+down'
	do
	# get view and snap
		DriveSuma -com viewer_cont -key "$pose" -com viewer_cont -key 'Ctrl+r'
		sleep 1 # give it a break to change the view and save the fig 
	done
	mv ./SUMA_Recordings/* ./${image_dir}/${image_pre}/
	rm -rf ./SUMA_Recordings/
done
