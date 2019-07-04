#!/usr/bin/tcsh

# created by uber_subject.py: version 0.36 (April 5, 2013)
# creation date: Fri Feb 22 16:12:26 2019

# set subject and group identifiers
set subj      = sub02
set group_id  = Reading


# set data directories
set main_dir = /bcbl/home/public/Mengxing/CHNstory/
set top_dir   = $main_dir/story2016fMRI
set anat_dir  = $top_dir/$subj/orig_files
set epi_dir   = $top_dir/$subj/orig_files
set stim_dir  = $top_dir/scripts/Wave_1Dfiles
set surf_dir = $top_dir/$subj/freesurfer


# run afni_proc.py to create a single subject processing script
afni_proc.py -subj_id $subj                                      \
        -script proc.$subj -scr_overwrite                        \
	-out_dir $main_dir/analysis/ISC/preprocess/$subj.results \
        -blocks tshift align tlrc volreg blur scale regress \
        -tlrc_base /bcbl/home/public/Mengxing/CHNstory/scripts_CHNstory/MNI152_T1_2mm.nii                   \
        -tlrc_NL_warp                                                    \
        -volreg_align_e2a                                                \
        -volreg_tlrc_warp                                                \
        -volreg_warp_dxyz 2                                             \
        -copy_anat $anat_dir/Anatomical+orig                     \
        -tcat_remove_first_trs 6                                 \
        -dsets                                                   \
            $epi_dir/run01+orig.HEAD                             \
            $epi_dir/run02+orig.HEAD                             \
            $epi_dir/run03+orig.HEAD                             \
            $epi_dir/run04+orig.HEAD                             \
            $epi_dir/run05+orig.HEAD                             \
        -align_opts_aea -cost lpc+ZZ                              \
        -volreg_align_to third                                   \
        -blur_size 6.0                                           \
        -regress_stim_times                                      \
            $stim_dir/stim_times_CS.01.1D                                \
            $stim_dir/stim_times_NS.01.1D                                \
            $stim_dir/stim_times_SW.01.1D                                \
            $stim_dir/stim_times_US.01.1D                                \
        -regress_stim_labels                                     \
            CS NS SW US                                          \
        -regress_basis 'dmBLOCK'                                    \
        -regress_stim_types AM1                                  \
        -regress_censor_motion 0.3                               \
        -regress_opts_3dD                                        \
            -gltsym 'SYM: NS -CS' -glt_label 1 NS-CS             \
            -gltsym 'SYM: CS -US' -glt_label 2 CS-US             \
            -gltsym 'SYM: US -SW' -glt_label 3 US-SW             \
            -jobs 6                                              \
        -regress_make_ideal_sum sum_ideal.1D
 

