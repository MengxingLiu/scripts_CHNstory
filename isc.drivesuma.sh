#!/bin/bash


#start a suma and wait it for 3 seconds
specfile=/export/home/lmengxing/public/Mengxing/CHNstory/analysis/MVM/suma_MNI152_2009/std.141.MNI152_2009_both.spec

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
mkdir ./rawrender/

# load dataset 
for it in inter intra
do
    for task in listen read
    do
        for scale in CS NS US SW
        do
            mkdir ./rawrender/$it.$task.$scale/
            for hemi in lh rh
            do
                DriveSuma -com surf_cont -load_dset tt."$it"."$task"."$scale"."$hemi".niml.dset -surf_label $hemi.inflated -UseClst y
                DriveSuma -com surf_cont -surf_label $hemi.inflated \
                -I_sb 0 -T_sb 1 -I_range -0.6 \
                -T_val 0.001p \
                -Clst -1 280 -UseClst y \
                -switch_cmap "Spectrum:red_to_blue+gap"
            done
                for pose in 'Ctrl+left' 'Ctrl+right' 'Ctrl+down'
                do
                # get view and snap
                    DriveSuma -com viewer_cont -key "$pose" -com viewer_cont -key 'Ctrl+r'
                    sleep 1 # give it a break to change the view and save the fig 
                done
                mv ./SUMA_Recordings/* ./rawrender/${it}.${task}.${scale}/
                rm -rf ./SUMA_Recordings/
              
        done
    done
done
