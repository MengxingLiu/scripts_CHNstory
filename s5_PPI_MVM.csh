#!/bin/csh

set spath="/export/home/lmengxing/public/Mengxing/CHNstory/data"
# rm -rf $spath/group/surface_files
cd /export/home/lmengxing/public/Mengxing/CHNstory/analysis/PPI
################ group level statistic #################
    foreach hemi(lh rh)

	3dMVM -prefix PPI.MVM."$hemi".niml.dset -jobs 12 \
			-bsVars 'Modality' \
			-wsVars 'Scale' \
			-SS_type 2 \
			-num_glt 25 \
			-gltLabel 1 Listen_NS -gltCode 1 'Modality : 1*Listen Scale : 1*NS' \
			-gltLabel 2 Listen_CS -gltCode 2 'Modality : 1*Listen Scale : 1*CS' \
			-gltLabel 3 Listen_US -gltCode 3 'Modality : 1*Listen Scale : 1*US' \
			-gltLabel 4 Listen_SW -gltCode 4 'Modality : 1*Listen Scale : 1*SW' \
			-gltLabel 5 Listen_CS-NS -gltCode 5 'Modality : 1*Listen Scale : 1*CS -1*NS' \
			-gltLabel 6 Listen_US-NS -gltCode 6 'Modality : 1*Listen Scale : 1*US -1*NS' \
			-gltLabel 7 Listen_SW-NS -gltCode 7 'Modality : 1*Listen Scale : 1*SW -1*NS' \
            		-gltLabel 8 Listen_US-CS -gltCode 8 'Modality : 1*Listen Scale : 1*US -1*CS' \
            		-gltLabel 9 Listen_SW-CS -gltCode 9 'Modality : 1*Listen Scale : 1*SW -1*CS' \
            		-gltLabel 10 Listen_SW-US -gltCode 10 'Modality : 1*Listen Scale : 1*SW -1*US' \
			-gltLabel 11 Read_NS -gltCode 11 'Modality : 1*Read Scale : 1*NS' \
			-gltLabel 12 Read_CS -gltCode 12 'Modality : 1*Read Scale : 1*CS' \
			-gltLabel 13 Read_US -gltCode 13 'Modality : 1*Read Scale : 1*US' \
			-gltLabel 14 Read_SW -gltCode 14 'Modality : 1*Read Scale : 1*SW' \
			-gltLabel 15 Read_CS-NS -gltCode 15 'Modality : 1*Read Scale : 1*CS -1*NS' \
			-gltLabel 16 Read_US-NS -gltCode 16 'Modality : 1*Read Scale : 1*US -1*NS' \
			-gltLabel 17 Read_SW-NS -gltCode 17 'Modality : 1*Read Scale : 1*SW -1*NS' \
            		-gltLabel 18 Read_US-CS -gltCode 18 'Modality : 1*Read Scale : 1*US -1*CS' \
            		-gltLabel 19 Read_SW-CS -gltCode 19 'Modality : 1*Read Scale : 1*SW -1*CS' \
            		-gltLabel 20 Read_SW-US -gltCode 20 'Modality : 1*Read Scale : 1*SW -1*US' \
            		-gltLabel 21 Read_Listen -gltCode 21 'Modality : 1*Read -1*Listen' \
            		-gltLabel 22 NS_ Read-Listen -gltCode 22 'Scale : 1*NS Modality : 1*Read -1*Listen' \
            		-gltLabel 23 CS_ Read-Listen -gltCode 23 'Scale : 1*CS Modality : 1*Read -1*Listen' \
            		-gltLabel 24 US_ Read-Listen -gltCode 24 'Scale : 1*US Modality : 1*Read -1*Listen' \
            		-gltLabel 25 SW_ Read-Listen -gltCode 25 'Scale : 1*SW Modality : 1*Read -1*Listen' \
			-dataTable \
			Subj	Modality	Scale	InputFile \
			s2	Listen	NS	"$spath"/sub02.results/ppi.full.stats.sub02."$hemi".niml.dset'[16]' \
			s2	Listen	CS	"$spath"/sub02.results/ppi.full.stats.sub02."$hemi".niml.dset'[13]' \
			s2	Listen	US	"$spath"/sub02.results/ppi.full.stats.sub02."$hemi".niml.dset'[22]' \
			s2	Listen	SW	"$spath"/sub02.results/ppi.full.stats.sub02."$hemi".niml.dset'[19]' \
			s3	Listen	NS	"$spath"/sub03.results/ppi.full.stats.sub03."$hemi".niml.dset'[16]' \
			s3	Listen	CS	"$spath"/sub03.results/ppi.full.stats.sub03."$hemi".niml.dset'[13]' \
			s3	Listen	US	"$spath"/sub03.results/ppi.full.stats.sub03."$hemi".niml.dset'[22]' \
			s3	Listen	SW	"$spath"/sub03.results/ppi.full.stats.sub03."$hemi".niml.dset'[19]' \
			s4	Listen	NS	"$spath"/sub04.results/ppi.full.stats.sub04."$hemi".niml.dset'[16]' \
			s4	Listen	CS	"$spath"/sub04.results/ppi.full.stats.sub04."$hemi".niml.dset'[13]' \
			s4	Listen	US	"$spath"/sub04.results/ppi.full.stats.sub04."$hemi".niml.dset'[22]' \
			s4	Listen	SW	"$spath"/sub04.results/ppi.full.stats.sub04."$hemi".niml.dset'[19]' \
			s5	Listen	NS	"$spath"/sub05.results/ppi.full.stats.sub05."$hemi".niml.dset'[16]' \
			s5	Listen	CS	"$spath"/sub05.results/ppi.full.stats.sub05."$hemi".niml.dset'[13]' \
			s5	Listen	US	"$spath"/sub05.results/ppi.full.stats.sub05."$hemi".niml.dset'[22]' \
			s5	Listen	SW	"$spath"/sub05.results/ppi.full.stats.sub05."$hemi".niml.dset'[19]' \
			s6	Listen	NS	"$spath"/sub06.results/ppi.full.stats.sub06."$hemi".niml.dset'[16]' \
			s6	Listen	CS	"$spath"/sub06.results/ppi.full.stats.sub06."$hemi".niml.dset'[13]' \
			s6	Listen	US	"$spath"/sub06.results/ppi.full.stats.sub06."$hemi".niml.dset'[22]' \
			s6	Listen	SW	"$spath"/sub06.results/ppi.full.stats.sub06."$hemi".niml.dset'[19]' \
			s7	Listen	NS	"$spath"/sub07.results/ppi.full.stats.sub07."$hemi".niml.dset'[16]' \
			s7	Listen	CS	"$spath"/sub07.results/ppi.full.stats.sub07."$hemi".niml.dset'[13]' \
			s7	Listen	US	"$spath"/sub07.results/ppi.full.stats.sub07."$hemi".niml.dset'[22]' \
			s7	Listen	SW	"$spath"/sub07.results/ppi.full.stats.sub07."$hemi".niml.dset'[19]' \
			s8	Listen	NS	"$spath"/sub08.results/ppi.full.stats.sub08."$hemi".niml.dset'[16]' \
			s8	Listen	CS	"$spath"/sub08.results/ppi.full.stats.sub08."$hemi".niml.dset'[13]' \
			s8	Listen	US	"$spath"/sub08.results/ppi.full.stats.sub08."$hemi".niml.dset'[22]' \
			s8	Listen	SW	"$spath"/sub08.results/ppi.full.stats.sub08."$hemi".niml.dset'[19]' \
			s9	Listen	NS	"$spath"/sub09.results/ppi.full.stats.sub09."$hemi".niml.dset'[16]' \
			s9	Listen	CS	"$spath"/sub09.results/ppi.full.stats.sub09."$hemi".niml.dset'[13]' \
			s9	Listen	US	"$spath"/sub09.results/ppi.full.stats.sub09."$hemi".niml.dset'[22]' \
			s9	Listen	SW	"$spath"/sub09.results/ppi.full.stats.sub09."$hemi".niml.dset'[19]' \
			s12	Listen	NS	"$spath"/sub12.results/ppi.full.stats.sub12."$hemi".niml.dset'[16]' \
			s12	Listen	CS	"$spath"/sub12.results/ppi.full.stats.sub12."$hemi".niml.dset'[13]' \
			s12	Listen	US	"$spath"/sub12.results/ppi.full.stats.sub12."$hemi".niml.dset'[22]' \
			s12	Listen	SW	"$spath"/sub12.results/ppi.full.stats.sub12."$hemi".niml.dset'[19]' \
			s13	Listen	NS	"$spath"/sub13.results/ppi.full.stats.sub13."$hemi".niml.dset'[16]' \
			s13	Listen	CS	"$spath"/sub13.results/ppi.full.stats.sub13."$hemi".niml.dset'[13]' \
			s13	Listen	US	"$spath"/sub13.results/ppi.full.stats.sub13."$hemi".niml.dset'[22]' \
			s13	Listen	SW	"$spath"/sub13.results/ppi.full.stats.sub13."$hemi".niml.dset'[19]' \
			s15	Listen	NS	"$spath"/sub15.results/ppi.full.stats.sub15."$hemi".niml.dset'[16]' \
			s15	Listen	CS	"$spath"/sub15.results/ppi.full.stats.sub15."$hemi".niml.dset'[13]' \
			s15	Listen	US	"$spath"/sub15.results/ppi.full.stats.sub15."$hemi".niml.dset'[22]' \
			s15	Listen	SW	"$spath"/sub15.results/ppi.full.stats.sub15."$hemi".niml.dset'[19]' \
			s16	Listen	NS	"$spath"/sub16.results/ppi.full.stats.sub16."$hemi".niml.dset'[16]' \
			s16	Listen	CS	"$spath"/sub16.results/ppi.full.stats.sub16."$hemi".niml.dset'[13]' \
			s16	Listen	US	"$spath"/sub16.results/ppi.full.stats.sub16."$hemi".niml.dset'[22]' \
			s16	Listen	SW	"$spath"/sub16.results/ppi.full.stats.sub16."$hemi".niml.dset'[19]' \
			s31	Listen	NS	"$spath"/sub31.results/ppi.full.stats.sub31."$hemi".niml.dset'[16]' \
			s31	Listen	CS	"$spath"/sub31.results/ppi.full.stats.sub31."$hemi".niml.dset'[13]' \
			s31	Listen	US	"$spath"/sub31.results/ppi.full.stats.sub31."$hemi".niml.dset'[22]' \
			s31	Listen	SW	"$spath"/sub31.results/ppi.full.stats.sub31."$hemi".niml.dset'[19]' \
			s32	Listen	NS	"$spath"/sub32.results/ppi.full.stats.sub32."$hemi".niml.dset'[16]' \
			s32	Listen	CS	"$spath"/sub32.results/ppi.full.stats.sub32."$hemi".niml.dset'[13]' \
			s32	Listen	US	"$spath"/sub32.results/ppi.full.stats.sub32."$hemi".niml.dset'[22]' \
			s32	Listen	SW	"$spath"/sub32.results/ppi.full.stats.sub32."$hemi".niml.dset'[19]' \
			s10	Read	NS	"$spath"/sub10.results/ppi.full.stats.sub10."$hemi".niml.dset'[16]' \
			s10	Read	CS	"$spath"/sub10.results/ppi.full.stats.sub10."$hemi".niml.dset'[13]' \
			s10	Read	US	"$spath"/sub10.results/ppi.full.stats.sub10."$hemi".niml.dset'[22]' \
			s10	Read	SW	"$spath"/sub10.results/ppi.full.stats.sub10."$hemi".niml.dset'[19]' \
			s11	Read	NS	"$spath"/sub11.results/ppi.full.stats.sub11."$hemi".niml.dset'[16]' \
			s11	Read	CS	"$spath"/sub11.results/ppi.full.stats.sub11."$hemi".niml.dset'[13]' \
			s11	Read	US	"$spath"/sub11.results/ppi.full.stats.sub11."$hemi".niml.dset'[22]' \
			s11	Read	SW	"$spath"/sub11.results/ppi.full.stats.sub11."$hemi".niml.dset'[19]' \
			s14	Read	NS	"$spath"/sub14.results/ppi.full.stats.sub14."$hemi".niml.dset'[16]' \
			s14	Read	CS	"$spath"/sub14.results/ppi.full.stats.sub14."$hemi".niml.dset'[13]' \
			s14	Read	US	"$spath"/sub14.results/ppi.full.stats.sub14."$hemi".niml.dset'[22]' \
			s14	Read	SW	"$spath"/sub14.results/ppi.full.stats.sub14."$hemi".niml.dset'[19]' \
			s17	Read	NS	"$spath"/sub17.results/ppi.full.stats.sub17."$hemi".niml.dset'[16]' \
			s17	Read	CS	"$spath"/sub17.results/ppi.full.stats.sub17."$hemi".niml.dset'[13]' \
			s17	Read	US	"$spath"/sub17.results/ppi.full.stats.sub17."$hemi".niml.dset'[22]' \
			s17	Read	SW	"$spath"/sub17.results/ppi.full.stats.sub17."$hemi".niml.dset'[19]' \
			s19	Read	NS	"$spath"/sub19.results/ppi.full.stats.sub19."$hemi".niml.dset'[16]' \
			s19	Read	CS	"$spath"/sub19.results/ppi.full.stats.sub19."$hemi".niml.dset'[13]' \
			s19	Read	US	"$spath"/sub19.results/ppi.full.stats.sub19."$hemi".niml.dset'[22]' \
			s19	Read	SW	"$spath"/sub19.results/ppi.full.stats.sub19."$hemi".niml.dset'[19]' \
			s20	Read	NS	"$spath"/sub20.results/ppi.full.stats.sub20."$hemi".niml.dset'[16]' \
			s20	Read	CS	"$spath"/sub20.results/ppi.full.stats.sub20."$hemi".niml.dset'[13]' \
			s20	Read	US	"$spath"/sub20.results/ppi.full.stats.sub20."$hemi".niml.dset'[22]' \
			s20	Read	SW	"$spath"/sub20.results/ppi.full.stats.sub20."$hemi".niml.dset'[19]' \
			s21	Read	NS	"$spath"/sub21.results/ppi.full.stats.sub21."$hemi".niml.dset'[16]' \
			s21	Read	CS	"$spath"/sub21.results/ppi.full.stats.sub21."$hemi".niml.dset'[13]' \
			s21	Read	US	"$spath"/sub21.results/ppi.full.stats.sub21."$hemi".niml.dset'[22]' \
			s21	Read	SW	"$spath"/sub21.results/ppi.full.stats.sub21."$hemi".niml.dset'[19]' \
			s22	Read	NS	"$spath"/sub22.results/ppi.full.stats.sub22."$hemi".niml.dset'[16]' \
			s22	Read	CS	"$spath"/sub22.results/ppi.full.stats.sub22."$hemi".niml.dset'[13]' \
			s22	Read	US	"$spath"/sub22.results/ppi.full.stats.sub22."$hemi".niml.dset'[22]' \
			s22	Read	SW	"$spath"/sub22.results/ppi.full.stats.sub22."$hemi".niml.dset'[19]' \
			s23	Read	NS	"$spath"/sub23.results/ppi.full.stats.sub23."$hemi".niml.dset'[16]' \
			s23	Read	CS	"$spath"/sub23.results/ppi.full.stats.sub23."$hemi".niml.dset'[13]' \
			s23	Read	US	"$spath"/sub23.results/ppi.full.stats.sub23."$hemi".niml.dset'[22]' \
			s23	Read	SW	"$spath"/sub23.results/ppi.full.stats.sub23."$hemi".niml.dset'[19]' \
			s24	Read	NS	"$spath"/sub24.results/ppi.full.stats.sub24."$hemi".niml.dset'[16]' \
			s24	Read	CS	"$spath"/sub24.results/ppi.full.stats.sub24."$hemi".niml.dset'[13]' \
			s24	Read	US	"$spath"/sub24.results/ppi.full.stats.sub24."$hemi".niml.dset'[22]' \
			s24	Read	SW	"$spath"/sub24.results/ppi.full.stats.sub24."$hemi".niml.dset'[19]' \
			s25	Read	NS	"$spath"/sub25.results/ppi.full.stats.sub25."$hemi".niml.dset'[16]' \
			s25	Read	CS	"$spath"/sub25.results/ppi.full.stats.sub25."$hemi".niml.dset'[13]' \
			s25	Read	US	"$spath"/sub25.results/ppi.full.stats.sub25."$hemi".niml.dset'[22]' \
			s25	Read	SW	"$spath"/sub25.results/ppi.full.stats.sub25."$hemi".niml.dset'[19]' \
			s26	Read	NS	"$spath"/sub26.results/ppi.full.stats.sub26."$hemi".niml.dset'[16]' \
			s26	Read	CS	"$spath"/sub26.results/ppi.full.stats.sub26."$hemi".niml.dset'[13]' \
			s26	Read	US	"$spath"/sub26.results/ppi.full.stats.sub26."$hemi".niml.dset'[22]' \
			s26	Read	SW	"$spath"/sub26.results/ppi.full.stats.sub26."$hemi".niml.dset'[19]' \
			s27	Read	NS	"$spath"/sub27.results/ppi.full.stats.sub27."$hemi".niml.dset'[16]' \
			s27	Read	CS	"$spath"/sub27.results/ppi.full.stats.sub27."$hemi".niml.dset'[13]' \
			s27	Read	US	"$spath"/sub27.results/ppi.full.stats.sub27."$hemi".niml.dset'[22]' \
			s27	Read	SW	"$spath"/sub27.results/ppi.full.stats.sub27."$hemi".niml.dset'[19]' \
			s28	Read	NS	"$spath"/sub28.results/ppi.full.stats.sub28."$hemi".niml.dset'[16]' \
			s28	Read	CS	"$spath"/sub28.results/ppi.full.stats.sub28."$hemi".niml.dset'[13]' \
			s28	Read	US	"$spath"/sub28.results/ppi.full.stats.sub28."$hemi".niml.dset'[22]' \
			s28	Read	SW	"$spath"/sub28.results/ppi.full.stats.sub28."$hemi".niml.dset'[19]' \
			s29	Read	NS	"$spath"/sub29.results/ppi.full.stats.sub29."$hemi".niml.dset'[16]' \
			s29	Read	CS	"$spath"/sub29.results/ppi.full.stats.sub29."$hemi".niml.dset'[13]' \
			s29	Read	US	"$spath"/sub29.results/ppi.full.stats.sub29."$hemi".niml.dset'[22]' \
			s29	Read	SW	"$spath"/sub29.results/ppi.full.stats.sub29."$hemi".niml.dset'[19]' \
			s33	Read	NS	"$spath"/sub33.results/ppi.full.stats.sub33."$hemi".niml.dset'[16]' \
			s33	Read	CS	"$spath"/sub33.results/ppi.full.stats.sub33."$hemi".niml.dset'[13]' \
			s33	Read	US	"$spath"/sub33.results/ppi.full.stats.sub33."$hemi".niml.dset'[22]' \
			s33	Read	SW	"$spath"/sub33.results/ppi.full.stats.sub33."$hemi".niml.dset'[19]'  
           
end


