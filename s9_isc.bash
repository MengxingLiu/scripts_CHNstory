#!/bin/csh

##  this script do ISC analysis for each level in each factor
##  every subj 
set spath = '/bcbl/home/public/Mengxing/CHNstory/analysis/ISC'
cd $spath/tmpfile
rm r_* z_*
## tp as each level in Factor:Scale
foreach hemi( lh rh)
    foreach type(NS CS US SW)
        set listen = (pb05.sub02."$hemi"."$type".scale.niml.dset pb05.sub03."$hemi"."$type".scale.niml.dset pb05.sub04."$hemi"."$type".scale.niml.dset \
                pb05.sub05."$hemi"."$type".scale.niml.dset pb05.sub06."$hemi"."$type".scale.niml.dset pb05.sub07."$hemi"."$type".scale.niml.dset \
                pb05.sub08."$hemi"."$type".scale.niml.dset pb05.sub09."$hemi"."$type".scale.niml.dset pb05.sub12."$hemi"."$type".scale.niml.dset \
                pb05.sub13."$hemi"."$type".scale.niml.dset pb05.sub15."$hemi"."$type".scale.niml.dset pb05.sub16."$hemi"."$type".scale.niml.dset \
                pb05.sub31."$hemi"."$type".scale.niml.dset pb05.sub32."$hemi"."$type".scale.niml.dset)
        set read = (pb05.sub10."$hemi"."$type".scale.niml.dset pb05.sub11."$hemi"."$type".scale.niml.dset pb05.sub14."$hemi"."$type".scale.niml.dset \
                pb05.sub17."$hemi"."$type".scale.niml.dset pb05.sub19."$hemi"."$type".scale.niml.dset pb05.sub20."$hemi"."$type".scale.niml.dset \
                pb05.sub21."$hemi"."$type".scale.niml.dset pb05.sub22."$hemi"."$type".scale.niml.dset pb05.sub23."$hemi"."$type".scale.niml.dset \
                pb05.sub24."$hemi"."$type".scale.niml.dset pb05.sub25."$hemi"."$type".scale.niml.dset pb05.sub26."$hemi"."$type".scale.niml.dset \
                pb05.sub27."$hemi"."$type".scale.niml.dset pb05.sub28."$hemi"."$type".scale.niml.dset pb05.sub29."$hemi"."$type".scale.niml.dset \
                pb05.sub33."$hemi"."$type".scale.niml.dset)
        # list of subjects doing listening task
        set sub4lis = (sub02 sub03 sub04 sub05 sub06 sub07 sub08 sub09 \
                sub12 sub13 sub15 sub16 sub31 sub32)
        # list of subjects doing reading task
        set sub4read = (sub10 sub11 sub14 sub17 sub19 sub20 sub21 sub22 \
                sub23 sub24 sub25 sub26 sub27 sub28 sub29 sub33)
        3dMean -prefix mean.read.group."$hemi"."$type".niml.dset `echo "$read"`
        3dMean -prefix mean.listen.group."$hemi"."$type".niml.dset `echo "$listen"`
    # there are 14 subs in listen task and 16 subs in read task
        set i = 1
            while ($i <= 14 )
                set sub=(`echo ${sub4lis} | awk '{print $'$i'}'`)
                # get the datasets list of rest in the group except $sub
                set rest_group=(`echo $listen | awk '{$'$i'="";print}'`)
                
                3dMean -prefix mean.group.niml.dset $rest_group
                3dTcorrelate -pearson -polort -1 \
                    -prefix r.intra.listen."$type"."$sub"."$hemi".niml.dset \
                    pb05."$sub"."$hemi"."$type".scale.niml.dset mean.group.niml.dset
                3dTcorrelate -pearson -polort -1 \
                    -prefix r.inter.listen."$type"."$sub"."$hemi".niml.dset \
                    pb05."$sub"."$hemi"."$type".scale.niml.dset mean.read.group."$hemi"."$type".niml.dset
                3dcalc -a r.intra.listen."$type"."$sub"."$hemi".niml.dset \
                    -expr '0.5*(log((1+a)/(1-a)))' \
                    -prefix z.intra.listen."$type"."$sub"."$hemi".niml.dset
                3dcalc -a r.inter.listen."$type"."$sub"."$hemi".niml.dset \
                    -expr '0.5*(log((1+a)/(1-a)))' \
                    -prefix z.inter.listen."$type"."$sub"."$hemi".niml.dset
                rm mean.group.niml.dset
                @ i ++
            end
        set i = 1
            while ($i <= 16 )
                set sub=(`echo ${sub4read} | awk '{print $'$i'}'`)
                # get the datasets list of rest in the group except $sub
                set rest_group=(`echo $read | awk '{$'$i'="";print}'`)
                # correlation of intra group and inter group
                3dMean -prefix mean.group.niml.dset $rest_group
                3dTcorrelate -pearson -polort -1 \
                    -prefix r.intra.read."$type"."$sub"."$hemi".niml.dset \
                    pb05."$sub"."$hemi"."$type".scale.niml.dset mean.group.niml.dset
                3dTcorrelate -pearson -polort -1 \
                    -prefix r.inter.read."$type"."$sub"."$hemi".niml.dset \
                    pb05."$sub"."$hemi"."$type".scale.niml.dset mean.listen.group."$hemi"."$type".niml.dset
                # apply Fisher-transform to correlation coefficient
                3dcalc -a r.intra.read."$type"."$sub"."$hemi".niml.dset \
                    -expr '0.5*(log((1+a)/(1-a)))' \
                    -prefix z.intra.read."$type"."$sub"."$hemi".niml.dset
                3dcalc -a r.inter.read."$type"."$sub"."$hemi".niml.dset \
                    -expr '0.5*(log((1+a)/(1-a)))' \
                    -prefix z.inter.read."$type"."$sub"."$hemi".niml.dset
                rm mean.group.niml.dset
                @ i ++
            end
    end
end

# average within group listen and read
# conduct t-test against zero
foreach type(CS US SW NS)
    foreach task(listen read)
        foreach hemi(lh rh)
            3dMean -prefix isc.Rmean.intra."$task"."$type"."$hemi".niml.dset r.intra."$task"."$type".*."$hemi".niml.dset
            3dMean -prefix isc.Rmean.inter."$task"."$type"."$hemi".niml.dset r.inter."$task"."$type".*."$hemi".niml.dset
            3dttest++  -setA z.intra."$task"."$type".*."$hemi".niml.dset -prefix tt.intra."$task"."$type"."$hemi".niml.dset
            3dttest++  -setA z.inter."$task"."$type".*."$hemi".niml.dset -prefix tt.inter."$task"."$type"."$hemi".niml.dset
        end
    end
end        

