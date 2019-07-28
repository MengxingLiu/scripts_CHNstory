#!/bin/csh

set spath="/export/home/lmengxing/public/Mengxing/CHNstory/data/vol/"
# rm -rf $spath/group/surface_files
cd /export/home/lmengxing/public/Mengxing/CHNstory/analysis/vol/MVM
################ group level statistic #################

	3dMVM -prefix group_MVM.nii.gz -jobs 12 \
			-bsVars 'Modality' \
			-wsVars 'Scale' \
			-SS_type 2 \
			-num_glt 36\
			-gltLabel 1 Listen_nNS -gltCode 1 'Modality : 1*Listen Scale : 1*nNS' \
			-gltLabel 2 Listen_CS -gltCode 2 'Modality : 1*Listen Scale : 1*CS' \
			-gltLabel 3 Listen_US -gltCode 3 'Modality : 1*Listen Scale : 1*US' \
			-gltLabel 4 Listen_SW -gltCode 4 'Modality : 1*Listen Scale : 1*SW' \
            -gltLabel 5 Listen_aNS -gltCode 5 'Modality : 1*Listen Scale : 1*aNS' \
			-gltLabel 6 Listen_CS-nNS -gltCode 6 'Modality : 1*Listen Scale : 1*CS -1*nNS' \
			-gltLabel 7 Listen_US-nNS -gltCode 7 'Modality : 1*Listen Scale : 1*US -1*nNS' \
			-gltLabel 8 Listen_SW-nNS -gltCode 8 'Modality : 1*Listen Scale : 1*SW -1*nNS' \
            -gltLabel 9 Listen_aNS-nNS -gltCode 9 'Modality : 1*Listen Scale : 1*aNS -1*nNS' \
            -gltLabel 10 Listen_CS-aNS -gltCode 10 'Modality : 1*Listen Scale : 1*CS -1*aNS' \
			-gltLabel 11 Listen_US-aNS -gltCode 11 'Modality : 1*Listen Scale : 1*US -1*aNS' \
			-gltLabel 12 Listen_SW-aNS -gltCode 12 'Modality : 1*Listen Scale : 1*SW -1*aNS' \
            -gltLabel 13 Listen_US-CS -gltCode 13 'Modality : 1*Listen Scale : 1*US -1*CS' \
            -gltLabel 14 Listen_SW-CS -gltCode 14 'Modality : 1*Listen Scale : 1*SW -1*CS' \
            -gltLabel 15 Listen_SW-US -gltCode 15 'Modality : 1*Listen Scale : 1*SW -1*US' \
			-gltLabel 16 Read_nNS -gltCode 16 'Modality : 1*Read Scale : 1*nNS' \
			-gltLabel 17 Read_CS -gltCode 17 'Modality : 1*Read Scale : 1*CS' \
			-gltLabel 18 Read_US -gltCode 18 'Modality : 1*Read Scale : 1*US' \
			-gltLabel 19 Read_SW -gltCode 19 'Modality : 1*Read Scale : 1*SW' \
             -gltLabel 20 Read_aNS -gltCode 20 'Modality : 1*Read Scale : 1*aNS' \
			-gltLabel 21 Read_CS-nNS -gltCode 21 'Modality : 1*Read Scale : 1*CS -1*nNS' \
			-gltLabel 22 Read_US-nNS -gltCode 22 'Modality : 1*Read Scale : 1*US -1*nNS' \
			-gltLabel 23 Read_SW-nNS -gltCode 23 'Modality : 1*Read Scale : 1*SW -1*nNS' \
            -gltLabel 24 Read_aNS-nNS -gltCode 24 'Modality : 1*Read Scale : 1*aNS -1*nNS' \
            -gltLabel 25 Read_CS-aNS -gltCode 25 'Modality : 1*Read Scale : 1*CS -1*aNS' \
			-gltLabel 26 Read_US-aNS -gltCode 26 'Modality : 1*Read Scale : 1*US -1*aNS' \
			-gltLabel 27 Read_SW-aNS -gltCode 27 'Modality : 1*Read Scale : 1*SW -1*aNS' \
            -gltLabel 28 Read_US-CS -gltCode 28 'Modality : 1*Read Scale : 1*US -1*CS' \
            -gltLabel 29 Read_SW-CS -gltCode 29 'Modality : 1*Read Scale : 1*SW -1*CS' \
            -gltLabel 30 Read_SW-US -gltCode 30 'Modality : 1*Read Scale : 1*SW -1*US' \
            -gltLabel 31 Read_Listen -gltCode 31 'Modality : 1*Read -1*Listen' \
            -gltLabel 32 nNS_ Read-Listen -gltCode 32 'Scale : 1*nNS Modality : 1*Read -1*Listen' \
            -gltLabel 33 CS_ Read-Listen -gltCode 33 'Scale : 1*CS Modality : 1*Read -1*Listen' \
            -gltLabel 34 US_ Read-Listen -gltCode 34 'Scale : 1*US Modality : 1*Read -1*Listen' \
            -gltLabel 35 SW_ Read-Listen -gltCode 35 'Scale : 1*SW Modality : 1*Read -1*Listen' \
            -gltLabel 36 aNS_ Read-Listen -gltCode 36 'Scale : 1*aNS Modality : 1*Read -1*Listen' \
			-dataTable \
			Subj	Modality	Scale	InputFile \
			s2	Listen	nNS	"$spath"/sub02.results/stats.sub02+tlrc.'[4]' \
			s2	Listen	CS	"$spath"/sub02.results/stats.sub02+tlrc.'[1]' \
			s2	Listen	US	"$spath"/sub02.results/stats.sub02+tlrc.'[10]' \
			s2	Listen	SW	"$spath"/sub02.results/stats.sub02+tlrc.'[7]' \
            s2	Listen	aNS	"$spath"/sub02.results/stats.sub02+tlrc.'[13]' \
			s3	Listen	nNS	"$spath"/sub03.results/stats.sub03+tlrc.'[4]' \
			s3	Listen	CS	"$spath"/sub03.results/stats.sub03+tlrc.'[1]' \
			s3	Listen	US	"$spath"/sub03.results/stats.sub03+tlrc.'[10]' \
			s3	Listen	SW	"$spath"/sub03.results/stats.sub03+tlrc.'[7]' \
            s3	Listen	aNS	"$spath"/sub03.results/stats.sub03+tlrc.'[13]' \
			s4	Listen	nNS	"$spath"/sub04.results/stats.sub04+tlrc.'[4]' \
			s4	Listen	CS	"$spath"/sub04.results/stats.sub04+tlrc.'[1]' \
			s4	Listen	US	"$spath"/sub04.results/stats.sub04+tlrc.'[10]' \
			s4	Listen	SW	"$spath"/sub04.results/stats.sub04+tlrc.'[7]' \
            s4	Listen	aNS	"$spath"/sub04.results/stats.sub04+tlrc.'[13]' \
			s5	Listen	nNS	"$spath"/sub05.results/stats.sub05+tlrc.'[4]' \
			s5	Listen	CS	"$spath"/sub05.results/stats.sub05+tlrc.'[1]' \
			s5	Listen	US	"$spath"/sub05.results/stats.sub05+tlrc.'[10]' \
			s5	Listen	SW	"$spath"/sub05.results/stats.sub05+tlrc.'[7]' \
            s5	Listen	aNS	"$spath"/sub05.results/stats.sub05+tlrc.'[13]' \
			s6	Listen	nNS	"$spath"/sub06.results/stats.sub06+tlrc.'[4]' \
			s6	Listen	CS	"$spath"/sub06.results/stats.sub06+tlrc.'[1]' \
			s6	Listen	US	"$spath"/sub06.results/stats.sub06+tlrc.'[10]' \
			s6	Listen	SW	"$spath"/sub06.results/stats.sub06+tlrc.'[7]' \
            s6	Listen	aNS	"$spath"/sub06.results/stats.sub06+tlrc.'[13]' \
			s7	Listen	nNS	"$spath"/sub07.results/stats.sub07+tlrc.'[4]' \
			s7	Listen	CS	"$spath"/sub07.results/stats.sub07+tlrc.'[1]' \
			s7	Listen	US	"$spath"/sub07.results/stats.sub07+tlrc.'[10]' \
			s7	Listen	SW	"$spath"/sub07.results/stats.sub07+tlrc.'[7]' \
            s7	Listen	aNS	"$spath"/sub07.results/stats.sub07+tlrc.'[13]' \
			s8	Listen	nNS	"$spath"/sub08.results/stats.sub08+tlrc.'[4]' \
			s8	Listen	CS	"$spath"/sub08.results/stats.sub08+tlrc.'[1]' \
			s8	Listen	US	"$spath"/sub08.results/stats.sub08+tlrc.'[10]' \
			s8	Listen	SW	"$spath"/sub08.results/stats.sub08+tlrc.'[7]' \
            s8	Listen	aNS	"$spath"/sub08.results/stats.sub08+tlrc.'[13]' \
			s9	Listen	nNS	"$spath"/sub09.results/stats.sub09+tlrc.'[4]' \
			s9	Listen	CS	"$spath"/sub09.results/stats.sub09+tlrc.'[1]' \
			s9	Listen	US	"$spath"/sub09.results/stats.sub09+tlrc.'[10]' \
			s9	Listen	SW	"$spath"/sub09.results/stats.sub09+tlrc.'[7]' \
            s9	Listen	aNS	"$spath"/sub09.results/stats.sub09+tlrc.'[13]' \
			s12	Listen	nNS	"$spath"/sub12.results/stats.sub12+tlrc.'[4]' \
			s12	Listen	CS	"$spath"/sub12.results/stats.sub12+tlrc.'[1]' \
			s12	Listen	US	"$spath"/sub12.results/stats.sub12+tlrc.'[10]' \
			s12	Listen	SW	"$spath"/sub12.results/stats.sub12+tlrc.'[7]' \
            s12	Listen	aNS	"$spath"/sub12.results/stats.sub12+tlrc.'[13]' \
			s13	Listen	nNS	"$spath"/sub13.results/stats.sub13+tlrc.'[4]' \
			s13	Listen	CS	"$spath"/sub13.results/stats.sub13+tlrc.'[1]' \
			s13	Listen	US	"$spath"/sub13.results/stats.sub13+tlrc.'[10]' \
			s13	Listen	SW	"$spath"/sub13.results/stats.sub13+tlrc.'[7]' \
            s13	Listen	aNS	"$spath"/sub13.results/stats.sub13+tlrc.'[13]' \
			s15	Listen	nNS	"$spath"/sub15.results/stats.sub15+tlrc.'[4]' \
			s15	Listen	CS	"$spath"/sub15.results/stats.sub15+tlrc.'[1]' \
			s15	Listen	US	"$spath"/sub15.results/stats.sub15+tlrc.'[10]' \
			s15	Listen	SW	"$spath"/sub15.results/stats.sub15+tlrc.'[7]' \
            s15	Listen	aNS	"$spath"/sub15.results/stats.sub15+tlrc.'[13]' \
			s16	Listen	nNS	"$spath"/sub16.results/stats.sub16+tlrc.'[4]' \
			s16	Listen	CS	"$spath"/sub16.results/stats.sub16+tlrc.'[1]' \
			s16	Listen	US	"$spath"/sub16.results/stats.sub16+tlrc.'[10]' \
			s16	Listen	SW	"$spath"/sub16.results/stats.sub16+tlrc.'[7]' \
            s16	Listen	aNS	"$spath"/sub16.results/stats.sub16+tlrc.'[13]' \
			s31	Listen	nNS	"$spath"/sub31.results/stats.sub31+tlrc.'[4]' \
			s31	Listen	CS	"$spath"/sub31.results/stats.sub31+tlrc.'[1]' \
			s31	Listen	US	"$spath"/sub31.results/stats.sub31+tlrc.'[10]' \
			s31	Listen	SW	"$spath"/sub31.results/stats.sub31+tlrc.'[7]' \
            s31	Listen	aNS	"$spath"/sub31.results/stats.sub31+tlrc.'[13]' \
			s32	Listen	nNS	"$spath"/sub32.results/stats.sub32+tlrc.'[4]' \
			s32	Listen	CS	"$spath"/sub32.results/stats.sub32+tlrc.'[1]' \
			s32	Listen	US	"$spath"/sub32.results/stats.sub32+tlrc.'[10]' \
			s32	Listen	SW	"$spath"/sub32.results/stats.sub32+tlrc.'[7]' \
            s32	Listen	aNS	"$spath"/sub32.results/stats.sub32+tlrc.'[13]' \
			s10	Read	nNS	"$spath"/sub10.results/stats.sub10+tlrc.'[4]' \
			s10	Read	CS	"$spath"/sub10.results/stats.sub10+tlrc.'[1]' \
			s10	Read	US	"$spath"/sub10.results/stats.sub10+tlrc.'[10]' \
			s10	Read	SW	"$spath"/sub10.results/stats.sub10+tlrc.'[7]' \
            s10	Read	aNS	"$spath"/sub10.results/stats.sub10+tlrc.'[13]' \
			s11	Read	nNS	"$spath"/sub11.results/stats.sub11+tlrc.'[4]' \
			s11	Read	CS	"$spath"/sub11.results/stats.sub11+tlrc.'[1]' \
			s11	Read	US	"$spath"/sub11.results/stats.sub11+tlrc.'[10]' \
			s11	Read	SW	"$spath"/sub11.results/stats.sub11+tlrc.'[7]' \
            s11	Read	aNS	"$spath"/sub11.results/stats.sub11+tlrc.'[13]' \
			s14	Read	nNS	"$spath"/sub14.results/stats.sub14+tlrc.'[4]' \
			s14	Read	CS	"$spath"/sub14.results/stats.sub14+tlrc.'[1]' \
			s14	Read	US	"$spath"/sub14.results/stats.sub14+tlrc.'[10]' \
			s14	Read	SW	"$spath"/sub14.results/stats.sub14+tlrc.'[7]' \
            s14	Read	aNS	"$spath"/sub14.results/stats.sub14+tlrc.'[13]' \
			s17	Read	nNS	"$spath"/sub17.results/stats.sub17+tlrc.'[4]' \
			s17	Read	CS	"$spath"/sub17.results/stats.sub17+tlrc.'[1]' \
			s17	Read	US	"$spath"/sub17.results/stats.sub17+tlrc.'[10]' \
			s17	Read	SW	"$spath"/sub17.results/stats.sub17+tlrc.'[7]' \
            s17	Read	aNS	"$spath"/sub17.results/stats.sub17+tlrc.'[13]' \
			s19	Read	nNS	"$spath"/sub19.results/stats.sub19+tlrc.'[4]' \
			s19	Read	CS	"$spath"/sub19.results/stats.sub19+tlrc.'[1]' \
			s19	Read	US	"$spath"/sub19.results/stats.sub19+tlrc.'[10]' \
			s19	Read	SW	"$spath"/sub19.results/stats.sub19+tlrc.'[7]' \
            s19	Read	aNS	"$spath"/sub19.results/stats.sub19+tlrc.'[13]' \
			s20	Read	nNS	"$spath"/sub20.results/stats.sub20+tlrc.'[4]' \
			s20	Read	CS	"$spath"/sub20.results/stats.sub20+tlrc.'[1]' \
			s20	Read	US	"$spath"/sub20.results/stats.sub20+tlrc.'[10]' \
			s20	Read	SW	"$spath"/sub20.results/stats.sub20+tlrc.'[7]' \
            s20	Read	aNS	"$spath"/sub20.results/stats.sub20+tlrc.'[13]' \
			s21	Read	nNS	"$spath"/sub21.results/stats.sub21+tlrc.'[4]' \
			s21	Read	CS	"$spath"/sub21.results/stats.sub21+tlrc.'[1]' \
			s21	Read	US	"$spath"/sub21.results/stats.sub21+tlrc.'[10]' \
			s21	Read	SW	"$spath"/sub21.results/stats.sub21+tlrc.'[7]' \
            s21	Read	aNS	"$spath"/sub21.results/stats.sub21+tlrc.'[13]' \
			s22	Read	nNS	"$spath"/sub22.results/stats.sub22+tlrc.'[4]' \
			s22	Read	CS	"$spath"/sub22.results/stats.sub22+tlrc.'[1]' \
			s22	Read	US	"$spath"/sub22.results/stats.sub22+tlrc.'[10]' \
			s22	Read	SW	"$spath"/sub22.results/stats.sub22+tlrc.'[7]' \
            s22	Read	aNS	"$spath"/sub22.results/stats.sub22+tlrc.'[13]' \
			s23	Read	nNS	"$spath"/sub23.results/stats.sub23+tlrc.'[4]' \
			s23	Read	CS	"$spath"/sub23.results/stats.sub23+tlrc.'[1]' \
			s23	Read	US	"$spath"/sub23.results/stats.sub23+tlrc.'[10]' \
			s23	Read	SW	"$spath"/sub23.results/stats.sub23+tlrc.'[7]' \
            s23	Read	aNS	"$spath"/sub23.results/stats.sub23+tlrc.'[13]' \
			s24	Read	nNS	"$spath"/sub24.results/stats.sub24+tlrc.'[4]' \
			s24	Read	CS	"$spath"/sub24.results/stats.sub24+tlrc.'[1]' \
			s24	Read	US	"$spath"/sub24.results/stats.sub24+tlrc.'[10]' \
			s24	Read	SW	"$spath"/sub24.results/stats.sub24+tlrc.'[7]' \
            s24	Read	aNS	"$spath"/sub24.results/stats.sub24+tlrc.'[13]' \
			s25	Read	nNS	"$spath"/sub25.results/stats.sub25+tlrc.'[4]' \
			s25	Read	CS	"$spath"/sub25.results/stats.sub25+tlrc.'[1]' \
			s25	Read	US	"$spath"/sub25.results/stats.sub25+tlrc.'[10]' \
			s25	Read	SW	"$spath"/sub25.results/stats.sub25+tlrc.'[7]' \
            s25	Read	aNS	"$spath"/sub25.results/stats.sub25+tlrc.'[13]' \
			s26	Read	nNS	"$spath"/sub26.results/stats.sub26+tlrc.'[4]' \
			s26	Read	CS	"$spath"/sub26.results/stats.sub26+tlrc.'[1]' \
			s26	Read	US	"$spath"/sub26.results/stats.sub26+tlrc.'[10]' \
			s26	Read	SW	"$spath"/sub26.results/stats.sub26+tlrc.'[7]' \
            s26	Read	aNS	"$spath"/sub26.results/stats.sub26+tlrc.'[13]' \
			s27	Read	nNS	"$spath"/sub27.results/stats.sub27+tlrc.'[4]' \
			s27	Read	CS	"$spath"/sub27.results/stats.sub27+tlrc.'[1]' \
			s27	Read	US	"$spath"/sub27.results/stats.sub27+tlrc.'[10]' \
			s27	Read	SW	"$spath"/sub27.results/stats.sub27+tlrc.'[7]' \
            s27	Read	aNS	"$spath"/sub27.results/stats.sub27+tlrc.'[13]' \
			s28	Read	nNS	"$spath"/sub28.results/stats.sub28+tlrc.'[4]' \
			s28	Read	CS	"$spath"/sub28.results/stats.sub28+tlrc.'[1]' \
			s28	Read	US	"$spath"/sub28.results/stats.sub28+tlrc.'[10]' \
			s28	Read	SW	"$spath"/sub28.results/stats.sub28+tlrc.'[7]' \
            s28	Read	aNS	"$spath"/sub28.results/stats.sub28+tlrc.'[13]' \
			s29	Read	nNS	"$spath"/sub29.results/stats.sub29+tlrc.'[4]' \
			s29	Read	CS	"$spath"/sub29.results/stats.sub29+tlrc.'[1]' \
			s29	Read	US	"$spath"/sub29.results/stats.sub29+tlrc.'[10]' \
			s29	Read	SW	"$spath"/sub29.results/stats.sub29+tlrc.'[7]' \
            s29	Read	aNS	"$spath"/sub29.results/stats.sub29+tlrc.'[13]' \
			s33	Read	nNS	"$spath"/sub33.results/stats.sub33+tlrc.'[4]' \
			s33	Read	CS	"$spath"/sub33.results/stats.sub33+tlrc.'[1]' \
			s33	Read	US	"$spath"/sub33.results/stats.sub33+tlrc.'[10]' \
			s33	Read	SW	"$spath"/sub33.results/stats.sub33+tlrc.'[7]' \
            s33	Read	aNS	"$spath"/sub33.results/stats.sub33+tlrc.'[13]'



