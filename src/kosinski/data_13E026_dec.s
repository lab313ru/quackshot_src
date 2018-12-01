    cpu 68000
    supmode on
    padding off
    include "data_13E026_dec_structs.inc"
    include "data_13E026_dec_equals.inc"
    include "data_13E026_dec_externs.inc"
    include "data_13E026_dec_funcs.inc"

; segment "ROM"
off_FFA400:	dc.w tbl_level_start_params-off_FFA400
off_FFA402:	dc.w off_FFA91E-off_FFA402
off_FFA404:	dc.w off_FFAF8A-off_FFA404
off_FFA406:	dc.w off_FFBFF2-off_FFA406
tbl_level_start_params:dc.w tbl_start_level_0-tbl_level_start_params
		dc.w tbl_start_level_1-tbl_level_start_params
		dc.w tbl_start_level_2-tbl_level_start_params
		dc.w tbl_start_level_3-tbl_level_start_params
		dc.w tbl_start_level_4-tbl_level_start_params
		dc.w tbl_start_level_5-tbl_level_start_params
		dc.w tbl_start_level_6-tbl_level_start_params
		dc.w tbl_start_level_7-tbl_level_start_params
		dc.w tbl_start_level_8-tbl_level_start_params
		dc.w tbl_start_level_9-tbl_level_start_params
tbl_start_level_0:dc.w tbl_start_level_1_0-tbl_start_level_0
tbl_start_level_1:dc.w tbl_start_level_1_0-tbl_start_level_1
		dc.w tbl_start_level_1_1-tbl_start_level_1
		dc.w tbl_start_level_1_2-tbl_start_level_1
		dc.w tbl_start_level_1_3-tbl_start_level_1
		dc.w tbl_start_level_1_4-tbl_start_level_1
		dc.w tbl_start_level_1_5-tbl_start_level_1
		dc.w tbl_start_level_1_6-tbl_start_level_1
tbl_start_level_2:dc.w tbl_start_level_2_0-tbl_start_level_2
		dc.w tbl_start_level_2_1-tbl_start_level_2
		dc.w tbl_start_level_2_2-tbl_start_level_2
		dc.w tbl_start_level_2_3-tbl_start_level_2
		dc.w tbl_start_level_2_4-tbl_start_level_2
		dc.w tbl_start_level_2_5-tbl_start_level_2
		dc.w tbl_start_level_2_6-tbl_start_level_2
		dc.w tbl_start_level_2_7-tbl_start_level_2
tbl_start_level_3:dc.w tbl_start_level_3_0-tbl_start_level_3
		dc.w tbl_start_level_3_1-tbl_start_level_3
		dc.w tbl_start_level_3_2-tbl_start_level_3
		dc.w tbl_start_level_3_3-tbl_start_level_3
		dc.w tbl_start_level_3_4-tbl_start_level_3
		dc.w tbl_start_level_3_5-tbl_start_level_3
		dc.w tbl_start_level_3_6-tbl_start_level_3
		dc.w tbl_start_level_3_7-tbl_start_level_3
		dc.w tbl_start_level_3_8-tbl_start_level_3
tbl_start_level_4:dc.w tbl_start_level_4_0-tbl_start_level_4
		dc.w tbl_start_level_4_1-tbl_start_level_4
		dc.w tbl_start_level_4_2_7-tbl_start_level_4
		dc.w tbl_start_level_4_3-tbl_start_level_4
		dc.w tbl_start_level_4_4-tbl_start_level_4
		dc.w tbl_start_level_4_5-tbl_start_level_4
		dc.w tbl_start_level_4_6-tbl_start_level_4
		dc.w tbl_start_level_4_2_7-tbl_start_level_4
tbl_start_level_5:dc.w tbl_start_level_5_0-tbl_start_level_5
		dc.w tbl_start_level_5_1-tbl_start_level_5
		dc.w tbl_start_level_5_2-tbl_start_level_5
		dc.w tbl_start_level_5_3-tbl_start_level_5
		dc.w tbl_start_level_5_4-tbl_start_level_5
		dc.w tbl_start_level_5_5-tbl_start_level_5
		dc.w tbl_start_level_5_6-tbl_start_level_5
		dc.w tbl_start_level_5_7-tbl_start_level_5
		dc.w tbl_start_level_5_8-tbl_start_level_5
tbl_start_level_6:dc.w tbl_start_level_6_0-tbl_start_level_6
		dc.w tbl_start_level_6_1-tbl_start_level_6
		dc.w tbl_start_level_6_2-tbl_start_level_6
		dc.w tbl_start_level_6_3-tbl_start_level_6
		dc.w tbl_start_level_6_4-tbl_start_level_6
		dc.w tbl_start_level_6_5-tbl_start_level_6
		dc.w tbl_start_level_6_6-tbl_start_level_6
		dc.w tbl_start_level_6_7-tbl_start_level_6
		dc.w tbl_start_level_6_8-tbl_start_level_6
		dc.w tbl_start_level_6_9-tbl_start_level_6
		dc.w tbl_start_level_6_10-tbl_start_level_6
tbl_start_level_7:dc.w tbl_start_level_7_0-tbl_start_level_7
		dc.w tbl_start_level_7_1-tbl_start_level_7
		dc.w tbl_start_level_7_2-tbl_start_level_7
		dc.w tbl_start_level_7_3-tbl_start_level_7
		dc.w tbl_start_level_7_4-tbl_start_level_7
		dc.w tbl_start_level_7_5-tbl_start_level_7
		dc.w tbl_start_level_7_6-tbl_start_level_7
		dc.w tbl_start_level_7_7-tbl_start_level_7
		dc.w tbl_start_level_7_8-tbl_start_level_7
		dc.w tbl_start_level_7_9-tbl_start_level_7
		dc.w tbl_start_level_7_10-tbl_start_level_7
tbl_start_level_8:dc.w tbl_start_level_8_0-tbl_start_level_8
		dc.w tbl_start_level_8_1-tbl_start_level_8
		dc.w tbl_start_level_8_2-tbl_start_level_8
		dc.w tbl_start_level_8_3-tbl_start_level_8
		dc.w tbl_start_level_8_4-tbl_start_level_8
tbl_start_level_9:dc.w tbl_start_level_9_0-tbl_start_level_9
		dc.w tbl_start_level_9_1-tbl_start_level_9
		dc.w tbl_start_level_9_2-tbl_start_level_9
		dc.w tbl_start_level_9_3-tbl_start_level_9
tbl_start_level_1_0:lvl_start_params 0, 31, 0,	15, 0, 176, 61,	1, $83
tbl_start_level_1_1:lvl_start_params 1, 283, 0, 141, 0, 464, 63, 1, $83
tbl_start_level_1_2:lvl_start_params 0, 1, 4540, 0, 2270, 48, 4784, 0,	$83
tbl_start_level_1_3:lvl_start_params 2, 284, 0, 141, 0, 448, 66, 1, $8F
tbl_start_level_1_4:lvl_start_params 1, 287, 2238, 143, 1118, 416, 2480, 0, $83
tbl_start_level_1_5:lvl_start_params 0, 26, 4452, 13, 2226, 176, 4594,	1, $83
tbl_start_level_1_6:lvl_start_params 2, 284, 3519, 141, 1760, 448, 3680, 1, $8F
tbl_start_level_2_0:lvl_start_params 0, 27, 0,	14, 0, 208, 48,	1, $84
tbl_start_level_2_1:lvl_start_params 1, 60, 0,	30, 0, 176, 64,	1, $84
tbl_start_level_2_2:lvl_start_params 2, 29, 0,	14, 0, 192, 64,	1, $84
tbl_start_level_2_3:lvl_start_params 3, 543, 1, 271, 0, 720, 80, 1, $8B
tbl_start_level_2_4:lvl_start_params 0, 63, 3772, 31, 1886, 208, 4008,	0, $84
tbl_start_level_2_5:lvl_start_params 2, 29, 190, 14, 95, 192, 418, 0, $84
tbl_start_level_2_6:lvl_start_params 2, 31, 57, 15, 28, 192, 200, 1, $84
tbl_start_level_2_7:lvl_start_params 3, 113, 1669, 56,	834, 208, 1824,	1, $8B
tbl_start_level_3_0:lvl_start_params 0, 27, 1,	14, 0, 160, 64,	1, $88
tbl_start_level_3_1:lvl_start_params 1, 31, 0,	15, 0, 192, 64,	1, $88
tbl_start_level_3_2:lvl_start_params 2, 1, 1, 1, 1, 12, 26, 1,	$88
tbl_start_level_3_3:lvl_start_params 3, 285, 1, 30, 0,	448, 62, 1, $88
tbl_start_level_3_4:lvl_start_params 4, 797, 0, 797, 10, 960, 64, 1, $88
tbl_start_level_3_5:lvl_start_params 5, 285, 0, 141, 0, 448, 64, 1, $88
tbl_start_level_3_6:lvl_start_params 6, 31, 0,	17, 0, 192, 80,	1, $88
tbl_start_level_3_7:lvl_start_params 0, 31, 3714, 15, 1857, 160, 3840,	1, $88
tbl_start_level_3_8:lvl_start_params 0, 31, 3774, 15, 1887, 160, 4000,	0, $88
tbl_start_level_4_0:lvl_start_params 0, 12, 0,	6, 6, 176, 64, 1, $8E
tbl_start_level_4_1:lvl_start_params 1, 286, 1, 143, 0, 448, 50, 1, $8E
tbl_start_level_4_2_7:lvl_start_params 2, 0, 0, 0, 0, 176, 64,	1, $8E
tbl_start_level_4_3:lvl_start_params 3, 97, 1,	97, 1, 192, 80,	1, $8E
tbl_start_level_4_4:lvl_start_params 4, 28, 1,	28, 1, 208, 81,	1, $8E
tbl_start_level_4_5:lvl_start_params 0, 12, 2750, 6, 91, 176, 3008, 1,	$8E
tbl_start_level_4_6:lvl_start_params 2, 0, 77,	0, 2, 176, 236,	1, $8E
tbl_start_level_5_0:lvl_start_params 0, 542, 0, 270, 0, 704, 64, 1, $89
tbl_start_level_5_1:lvl_start_params 1, 287, 0, 143, 0, 400, 49, 1, $89
tbl_start_level_5_2:lvl_start_params 2, 31, 1,	31, 0, 192, 55,	1, $89
tbl_start_level_5_3:lvl_start_params 3, 113, 1, 56, 0,	208, 64, 1, $89
tbl_start_level_5_4:lvl_start_params 0, 541, 3774, 270, 1887, 704, 3951, 0, $89
tbl_start_level_5_5:lvl_start_params 1, 287, 2237, 143, 1118, 400, 2496, 0, $89
tbl_start_level_5_6:lvl_start_params 2, 31, 4799, 31, 2399, 192, 5026,	0, $89
tbl_start_level_5_7:lvl_start_params 0, 541, 3702, 270, 1851, 704, 3842, 1, $89
tbl_start_level_5_8:lvl_start_params 3, 513, 0, 256, 0, 608, 138, 1, $89
tbl_start_level_6_0:lvl_start_params 0, 31, 0,	15, 0, 192, 64,	1, $85
tbl_start_level_6_1:lvl_start_params 2, 81, 28, 29, 8,	176, 176, 0, $87
tbl_start_level_6_2:lvl_start_params 3, 283, 191, 0, 34, 464, 400, 0, $87
tbl_start_level_6_3:lvl_start_params 4, 543, 447, 0, 23, 704, 671, 0, $87
tbl_start_level_6_4:lvl_start_params 5, 544, 185, 0, 2, 704, 349, 1, $87
tbl_start_level_6_5:lvl_start_params 6, 49, 660, 23, 1, 144, 824, 1, $87
tbl_start_level_6_6:lvl_start_params 7, 287, 0, 0, 0, 448, 96,	1, $87
tbl_start_level_6_7:lvl_start_params 8, 28, 0,	14, 0, 192, 64,	1, $82
tbl_start_level_6_8:lvl_start_params 1, 29, 0,	12, 0, 192, 56,	1, $87
tbl_start_level_6_9:lvl_start_params 0, 28, 3775, 14, 1887, 192, 3968,	0, $85
tbl_start_level_6_10:lvl_start_params 0, 28, 3588, 14,	1794, 192, 3728, 1, $85
tbl_start_level_7_0:lvl_start_params 0, 27, 1,	14, 0, 192, 64,	1, $86
tbl_start_level_7_1:lvl_start_params 1, 797, 0, 399, 0, 976, 46, 1, $8B
tbl_start_level_7_2:lvl_start_params 2, 31, 0,	16, 0, 192, 40,	1, $8B
tbl_start_level_7_3:lvl_start_params 3, 49, 0,	24, 0, 144, 49,	1, $8B
tbl_start_level_7_4:lvl_start_params 4, 330, 0, 330, 0, 448, 40, 1, $8B
tbl_start_level_7_5:lvl_start_params 5, 4, 3773, 2, 1886, 0, 4008, 0, $8B
tbl_start_level_7_6:lvl_start_params 0, 27, 3774, 14, 1886, 160, 3985,	0, $86
tbl_start_level_7_7:lvl_start_params 1, 1, 1727, 10, 863, 96, 1984, 0,	$8B
tbl_start_level_7_8:lvl_start_params 2, 27, 2751, 14, 1375, 160, 3025,	0, $8B
tbl_start_level_7_9:lvl_start_params 3, 284, 3774, 142, 1886, 432, 4018, 0, $8B
tbl_start_level_7_10:lvl_start_params 0, 27, 3658, 14,	1828, 160, 3789, 1, $86
tbl_start_level_8_0:lvl_start_params 0, 284, 1, 142, 0, 448, 48, 1, $96
tbl_start_level_8_1:lvl_start_params 1, 1, 1, 0, 0, 80, 48, 1,	$96
tbl_start_level_8_2:lvl_start_params 2, 353, 0, 176, 0, 448, 69, 1, $96
tbl_start_level_8_3:lvl_start_params 3, 541, 3, 270, 1, 704, 64, 1, $96
tbl_start_level_8_4:lvl_start_params 4, 286, 1, 142, 0, 464, 82, 1, $82
tbl_start_level_9_0:lvl_start_params 0, 543, 0, 271, 0, 704, 80, 1, $8A
tbl_start_level_9_1:lvl_start_params 1, 541, 0, 269, 0, 704, 64, 1, $8B
tbl_start_level_9_2:lvl_start_params 2, 120, 1, 3, 0, 240, 61,	1, $8B
tbl_start_level_9_3:lvl_start_params 3, 30, 4,	15, 2, 208, 64,	1, $94
off_FFA91E:	dc.w off_FFA932-off_FFA91E
		dc.w off_FFA932-off_FFA91E
		dc.w off_FFA99E-off_FFA91E
		dc.w off_FFAA2E-off_FFA91E
		dc.w off_FFAB2A-off_FFA91E
		dc.w off_FFABDE-off_FFA91E
		dc.w off_FFAC6E-off_FFA91E
		dc.w off_FFAD6E-off_FFA91E
		dc.w off_FFAE46-off_FFA91E
		dc.w off_FFAEFA-off_FFA91E
off_FFA932:	dc.w stru_FFA938-off_FFA932
		dc.w stru_FFA95A-off_FFA932
		dc.w stru_FFA97C-off_FFA932
stru_FFA938:	lvl_params2 1,	ARRAY1_INDEX_2,	$8C, $7C, $78, $68, 1, ARRAY2_INDEX_0, $11C0, 0, $20, 0, ARRAY2_INDEX_C, $11C0,	0, $20,	0
stru_FFA95A:	lvl_params2 1,	ARRAY1_INDEX_3,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_1, $8C0, 0,	$120, 0, ARRAY2_INDEX_2, $8C0, 0, $120,	0
stru_FFA97C:	lvl_params2 1,	ARRAY1_INDEX_3,	$8C, $7C, $60, $5F, 0, ARRAY2_INDEX_3, $DC0, 0,	$120, 0, ARRAY2_INDEX_2, $DC0, 0, $120,	0
off_FFA99E:	dc.w stru_FFA9A6-off_FFA99E
		dc.w stru_FFA9C8-off_FFA99E
		dc.w stru_FFA9EA-off_FFA99E
		dc.w stru_FFAA0C-off_FFA99E
stru_FFA9A6:	lvl_params2 1,	ARRAY1_INDEX_4,	$8C, $7C, $78, $68, 0, ARRAY2_INDEX_4, $EC0, 0,	$20, 0,	ARRAY2_INDEX_C,	$EC0, 0, $20, 0
stru_FFA9C8:	lvl_params2 1,	ARRAY1_INDEX_7,	$8C, $7C, $78, $68, 0, ARRAY2_INDEX_5, $EC0, 0,	$40, 0,	ARRAY2_INDEX_C,	$EC0, 0, $40, 0
stru_FFA9EA:	lvl_params2 1,	ARRAY1_INDEX_7,	$A4, $94, $78, $68, 1, ARRAY2_INDEX_B, $C0, 0, $20, 0, ARRAY2_INDEX_C, $C0, 0, $20, 0
stru_FFAA0C:	lvl_params2 1,	ARRAY1_INDEX_6,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_6, $6C0, 0,	$220, 0, ARRAY2_INDEX_7, $6C0, 0, $220,	0
off_FFAA2E:	dc.w stru_FFAA3C-off_FFAA2E
		dc.w stru_FFAA5E-off_FFAA2E
		dc.w stru_FFAA80-off_FFAA2E
		dc.w stru_FFAAA2-off_FFAA2E
		dc.w stru_FFAAC4-off_FFAA2E
		dc.w stru_FFAAE6-off_FFAA2E
		dc.w stru_FFAB08-off_FFAA2E
stru_FFAA3C:	lvl_params2 1,	ARRAY1_INDEX_5,	$8C, $7C, $78, $68, 0, ARRAY2_INDEX_8, $EC0, 0,	$20, 0,	ARRAY2_INDEX_2,	$EC0, 0, $20, 0
stru_FFAA5E:	lvl_params2 1,	ARRAY1_INDEX_8,	$8C, $7C, $78, $68, 0, ARRAY2_INDEX_A, $EC0, 0,	$20, 0,	ARRAY2_INDEX_B,	$EC0, 0, $20, 0
stru_FFAA80:	lvl_params2 2,	ARRAY1_INDEX_8,	$8C, $7C, $60, $5F, 0, ARRAY2_INDEX_D, $8C0, 0,	$120, 0, ARRAY2_INDEX_2, $8C0, 0, $120,	0
stru_FFAAA2:	lvl_params2 1,	ARRAY1_INDEX_8,	$A4, $94, $78, $68, 0, ARRAY2_INDEX_E, $6C0, 0,	$120, 0, ARRAY2_INDEX_2, $EC0, 0, $20, 0
stru_FFAAC4:	lvl_params2 2,	ARRAY1_INDEX_8,	$A4, $94, $78, $68, 0, ARRAY2_INDEX_F, $8C0, 0,	$320, 0, ARRAY2_INDEX_10, $8C0,	0, $320, 0
stru_FFAAE6:	lvl_params2 1,	ARRAY1_INDEX_8,	$A4, $94, $78, $68, 0, ARRAY2_INDEX_11,	$6C0, 0, $120, 0, ARRAY2_INDEX_2, $8C0,	0, $120, 0
stru_FFAB08:	lvl_params2 1,	ARRAY1_INDEX_8,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_C, $C0, 0, $20, 0, ARRAY2_INDEX_B, $C0, 0, $20, 0
off_FFAB2A:	dc.w stru_FFAB34-off_FFAB2A
		dc.w stru_FFAB56-off_FFAB2A
		dc.w stru_FFAB78-off_FFAB2A
		dc.w stru_FFAB9A-off_FFAB2A
		dc.w stru_FFABBC-off_FFAB2A
stru_FFAB34:	lvl_params2 4,	ARRAY1_INDEX_9,	$8C, $7C, $51, $50, 0, ARRAY2_INDEX_A, $AB8, 0,	$20, 0,	ARRAY2_INDEX_C,	$AB8, 0, $20, 0
stru_FFAB56:	lvl_params2 4,	ARRAY1_INDEX_9,	$8C, $7C, $78, $77, 0, ARRAY2_INDEX_12,	$AC0, 0, $120, 0, ARRAY2_INDEX_2, $AC0,	0, $120, 0
stru_FFAB78:	lvl_params2 4,	ARRAY1_INDEX_9,	$A4, $94, $78, $68, 0, ARRAY2_INDEX_C, $C0, 0, $20, 0, ARRAY2_INDEX_C, $C0, 0, $20, 0
stru_FFAB9A:	lvl_params2 2,	ARRAY1_INDEX_A,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_13,	$3C0, 0, $220, 0, ARRAY2_INDEX_14, $3C0, 0, $220, 0
stru_FFABBC:	lvl_params2 2,	ARRAY1_INDEX_A,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_C, $C0, 0, $20, 0, ARRAY2_INDEX_14,	$C0, 0,	$20, 0
off_FFABDE:	dc.w stru_FFABE6-off_FFABDE
		dc.w stru_FFAC08-off_FFABDE
		dc.w stru_FFAC2A-off_FFABDE
		dc.w stru_FFAC4C-off_FFABDE
stru_FFABE6:	lvl_params2 1,	ARRAY1_INDEX_B,	$8C, $7C, $78, $77, 0, ARRAY2_INDEX_15,	$EC0, 0, $220, 0, ARRAY2_INDEX_2, $EC0,	0, $220, 0
stru_FFAC08:	lvl_params2 1,	ARRAY1_INDEX_B,	$8C, $7C, $60, $5F, 0, ARRAY2_INDEX_16,	$8C0, 0, $120, 0, ARRAY2_INDEX_2, $8C0,	0, $120, 0
stru_FFAC2A:	lvl_params2 3,	ARRAY1_INDEX_B,	$8C, $7C, $60, $5F, 0, ARRAY2_INDEX_17,	$12C0, 0, $20, 0, ARRAY2_INDEX_9, $12C0, 0, $20, 0
stru_FFAC4C:	lvl_params2 1,	ARRAY1_INDEX_B,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_18,	$2C0, 0, $420, 0, ARRAY2_INDEX_2, $2C0,	0, $420, 0
off_FFAC6E:	dc.w stru_FFAC80-off_FFAC6E
		dc.w stru_FFACA2-off_FFAC6E
		dc.w stru_FFACC4-off_FFAC6E
		dc.w stru_FFACE6-off_FFAC6E
		dc.w stru_FFAD08-off_FFAC6E
		dc.w stru_FFAD08-off_FFAC6E
		dc.w stru_FFAD2A-off_FFAC6E
		dc.w stru_FFAD2A-off_FFAC6E
		dc.w stru_FFAD4C-off_FFAC6E
stru_FFAC80:	lvl_params2 1,	ARRAY1_INDEX_4,	$8C, $7C, $78, $68, 0, ARRAY2_INDEX_19,	$EC0, 0, $20, 0, ARRAY2_INDEX_1A, $EC0,	0, $20,	0
stru_FFACA2:	lvl_params2 1,	ARRAY1_INDEX_D,	$A4, $94, $78, $68, 1, ARRAY2_INDEX_C, 0, 0, $20, 0, ARRAY2_INDEX_C, 0,	0, $20,	0
stru_FFACC4:	lvl_params2 1,	ARRAY1_INDEX_D,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_2, $C0, 0, $120, 0,	ARRAY2_INDEX_C,	$C0, 0,	$20, 0
stru_FFACE6:	lvl_params2 1,	ARRAY1_INDEX_D,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_2, $C0, 0, $120, 0,	ARRAY2_INDEX_C,	$C0, 0,	$20, 0
stru_FFAD08:	lvl_params2 1,	ARRAY1_INDEX_D,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_23,	$1C0, 0, $220, 0, ARRAY2_INDEX_C, $C0, 0, $20, 0
stru_FFAD2A:	lvl_params2 1,	ARRAY1_INDEX_D,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_24,	$3C0, 0, $120, 0, ARRAY2_INDEX_C, $C0, 0, $20, 0
stru_FFAD4C:	lvl_params2 1,	ARRAY1_INDEX_D,	$A4, $94, $60, $5F, 1, ARRAY2_INDEX_C, 0, 0, $20, 0, ARRAY2_INDEX_C, 0,	0, $20,	0
off_FFAD6E:	dc.w stru_FFAD7A-off_FFAD6E
		dc.w stru_FFAD9C-off_FFAD6E
		dc.w stru_FFADBE-off_FFAD6E
		dc.w stru_FFADE0-off_FFAD6E
		dc.w stru_FFAE02-off_FFAD6E
		dc.w stru_FFAE24-off_FFAD6E
stru_FFAD7A:	lvl_params2 1,	ARRAY1_INDEX_4,	$8C, $7C, $78, $68, 0, ARRAY2_INDEX_1B,	$EC0, 0, $20, 0, ARRAY2_INDEX_1C, $EC0,	0, $20,	0
stru_FFAD9C:	lvl_params2 1,	ARRAY1_INDEX_C,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_1D,	$6C0, 0, $320, 0, ARRAY2_INDEX_1E, $6C0, 0, $320, 0
stru_FFADBE:	lvl_params2 1,	ARRAY1_INDEX_C,	$8C, $7C, $78, $68, 1, ARRAY2_INDEX_1F,	$AC0, 0, $20, 0, ARRAY2_INDEX_C, $AC0, 0, $20, 0
stru_FFADE0:	lvl_params2 1,	ARRAY1_INDEX_C,	$8C, $7C, $60, $5F, 0, ARRAY2_INDEX_21,	$EC0, 0, $120, 0, ARRAY2_INDEX_2, $EC0,	0, $120, 0
stru_FFAE02:	lvl_params2 2,	ARRAY1_INDEX_C,	$A4, $94, $78, $68, 0, ARRAY2_INDEX_20,	$1C0, 0, $220, $100, ARRAY2_INDEX_5, $1C0, 0, $220, 0
stru_FFAE24:	lvl_params2 1,	ARRAY1_INDEX_13, $C4, $B4, $60,	$5F, 0,	ARRAY2_INDEX_22, $EC0, 0, $120,	0, ARRAY2_INDEX_2, $EC0, 0, $120, 0
off_FFAE46:	dc.w stru_FFAE50-off_FFAE46
		dc.w stru_FFAE72-off_FFAE46
		dc.w stru_FFAE94-off_FFAE46
		dc.w stru_FFAEB6-off_FFAE46
		dc.w stru_FFAED8-off_FFAE46
stru_FFAE50:	lvl_params2 1,	ARRAY1_INDEX_10, $8C, $7C, $60,	$5F, 0,	ARRAY2_INDEX_27, $EC0, 0, $120,	0, ARRAY2_INDEX_7, $EC0, 0, $120, 0
stru_FFAE72:	lvl_params2 1,	ARRAY1_INDEX_12, $8C, $7C, $51,	$50, 0,	ARRAY2_INDEX_25, $AC0, 0, $220,	0, ARRAY2_INDEX_2, $AC0, 0, $220, 0
stru_FFAE94:	lvl_params2 1,	ARRAY1_INDEX_E,	$8C, $7C, $60, $5F, 1, ARRAY2_INDEX_26,	$AC0, 0, $220, 0, ARRAY2_INDEX_2D, $AC0, 0, $220, 0
stru_FFAEB6:	lvl_params2 1,	ARRAY1_INDEX_E,	$A4, $94, $60, $5F, 0, ARRAY2_INDEX_28,	$8C0, 0, $220, 0, ARRAY2_INDEX_2D, $8C0, 0, $220, 0
stru_FFAED8:	lvl_params2 1,	ARRAY1_INDEX_E,	$9C, $9B, $60, $5F, 1, ARRAY2_INDEX_2, $C0, 0, $120, 0,	ARRAY2_INDEX_2D, $C0, 0, $120, 0
off_FFAEFA:	dc.w stru_FFAF02-off_FFAEFA
		dc.w stru_FFAF24-off_FFAEFA
		dc.w stru_FFAF46-off_FFAEFA
		dc.w stru_FFAF68-off_FFAEFA
stru_FFAF02:	lvl_params2 1,	ARRAY1_INDEX_10, $8C, $7C, $60,	$5F, 1,	ARRAY2_INDEX_29, $EC0, 0, $220,	0, ARRAY2_INDEX_7, $EC0, 0, $220, 0
stru_FFAF24:	lvl_params2 1,	ARRAY1_INDEX_F,	$A4, $94, $60, $5F, 1, ARRAY2_INDEX_2B,	$AC0, 0, $220, 0, ARRAY2_INDEX_2, $AC0,	0, $220, 0
stru_FFAF46:	lvl_params2 5,	ARRAY1_INDEX_11, $A4, $94, $78,	$68, 0,	ARRAY2_INDEX_2C, $2C0, 0, $120,	0, ARRAY2_INDEX_C, $2C0, 0, $120, 0
stru_FFAF68:	lvl_params2 1,	ARRAY1_INDEX_F,	$A4, $94, $60, $5F, 1, ARRAY2_INDEX_C, $C0, 0, $20, 0, ARRAY2_INDEX_C, $C0, 0, $20, 0
off_FFAF8A:	dc.w byte_FFAFE6-off_FFAF8A
		dc.w byte_FFB01C-off_FFAF8A
		dc.w byte_FFB068-off_FFAF8A
		dc.w byte_FFB0BA-off_FFAF8A
		dc.w byte_FFB10C-off_FFAF8A
		dc.w byte_FFB13E-off_FFAF8A
		dc.w byte_FFB170-off_FFAF8A
		dc.w byte_FFB1DA-off_FFAF8A
		dc.w byte_FFB226-off_FFAF8A
		dc.w byte_FFB068-off_FFAF8A
		dc.w byte_FFB28A-off_FFAF8A
		dc.w byte_FFB2BC-off_FFAF8A
		dc.w byte_FFB2F2-off_FFAF8A
		dc.w byte_FFB328-off_FFAF8A
		dc.w byte_FFB374-off_FFAF8A
		dc.w byte_FFB3BE-off_FFAF8A
		dc.w byte_FFB44A-off_FFAF8A
		dc.w byte_FFB4D6-off_FFAF8A
		dc.w byte_FFB520-off_FFAF8A
		dc.w byte_FFB56E-off_FFAF8A
		dc.w byte_FFB5D6-off_FFAF8A
		dc.w byte_FFB63E-off_FFAF8A
		dc.w byte_FFB6B0-off_FFAF8A
		dc.w byte_FFB70C-off_FFAF8A
		dc.w byte_FFB742-off_FFAF8A
		dc.w byte_FFB7E8-off_FFAF8A
		dc.w byte_FFB81A-off_FFAF8A
		dc.w byte_FFB84C-off_FFAF8A
		dc.w byte_FFB87E-off_FFAF8A
		dc.w byte_FFB8AA-off_FFAF8A
		dc.w byte_FFB934-off_FFAF8A
		dc.w byte_FFB9BE-off_FFAF8A
		dc.w byte_FFB9EC-off_FFAF8A
		dc.w byte_FFBA52-off_FFAF8A
		dc.w byte_FFBAA4-off_FFAF8A
		dc.w byte_FFBAF6-off_FFAF8A
		dc.w byte_FFBB5C-off_FFAF8A
		dc.w byte_FFBBA4-off_FFAF8A
		dc.w byte_FFBC12-off_FFAF8A
		dc.w byte_FFBCA4-off_FFAF8A
		dc.w byte_FFBDC8-off_FFAF8A
		dc.w byte_FFBE5A-off_FFAF8A
		dc.w byte_FFBEFC-off_FFAF8A
		dc.w byte_FFBEFE-off_FFAF8A
		dc.w byte_FFBF80-off_FFAF8A
		dc.w byte_FFBD46-off_FFAF8A
byte_FFAFE6:	dc.b 0,	1, 2, 3, 4, 5, 6, 7, 8,	9, $A, $B, $C, $D, $E, $F, $10,	$11, $12, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $FF
		align 2
byte_FFB01C:	dc.b 1,	2, 3, 4, 0, 5, 6, 7, 8,	9, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $A, $B, $C, $D, $E, $F, $10, $11
		dc.b $12, $13, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $FF
byte_FFB068:	dc.b 0,	1, 0, 1, 0, 1, 0, 1, 0,	1, 0, 1, 0, 1, 0, 1, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 2, 3, 2, 3, 2,	3, 2, 3
		dc.b 2,	3, 2, 3, 2, 3, 2, 3, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	$FF
byte_FFB0BA:	dc.b 0,	1, 2, 3, 4, 5, 6, 7, 8,	9, $A, $B, $C, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $D, $E, $F, $10, $11, $12, $13, $14
		dc.b $15, $16, $17, $18, $19, $1A, $1B,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $FF
		align 2
byte_FFB10C:	dc.b 0,	0, 1, $E, 3, 4,	5, 6, 2, 7, 8, 9, $A, $B, $C, $D, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFB13E:	dc.b 1,	2, 3, 4, 5, 6, 0, 7, 0,	8, $C, 0, 9, 0,	$A, $B,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFB170:	dc.b 0,	1, 2, 3, 4, 5, 6, 7, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 8, 9, $A, $B, $C, $D, $E, $F
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $10, $11, $12,	$13, $14, $15, $16, $17, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, $FF
byte_FFB1DA:	dc.b 0,	1, 0, 1, 0, 1, 0, 1, 0,	1, 0, 1, 0, 1, 0, 1, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 2, 3, 2, 3, 2,	3, 2, 3
		dc.b 2,	3, 2, 3, 2, 3, 2, 3, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $FF
byte_FFB226:	dc.b 0,	0, 1, 2, 3, 4, 5, 6, 7,	8, 9, $A, $B, $C, $D, $E, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $FF
byte_FFB28A:	dc.b 0,	1, 2, 3, 4, 5, 6, 7, 8,	9, $A, $B, $C, $D, $E, $F, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFB2BC:	dc.b 0,	1, 0, 1, 0, 1, 0, 1, 0,	1, 0, 1, 0, 1, 0, 1, 0,	1, 0, 1
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, $FF
byte_FFB2F2:	dc.b 1,	2, 1, 2, 1, 2, 1, 2, 1,	2, 1, 2, 1, 2, 1, 2, 1,	2, 1, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $FF
		align 2
byte_FFB328:	dc.b 0,	1, 2, 3, 4, 5, 6, 7, 8,	9, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $A, $B, $C, $D, $E, $F, $10, $11
		dc.b $12, $13, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $FF
byte_FFB374:	dc.b 7,	7, 7, 5, 6, 8, 7, 7, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 1, 2, 9, 3, 4,	1, 1, 1
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, $FF
byte_FFB3BE:	dc.b 0,	0, 0, 0, 0, $F,	$B, $C,	$D, $E,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$F, 9, $A
		dc.b $F, $10, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, $F, $F, $F, $F, $F, $F, 9, $A,	$F, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 1,	2, 3, 4
		dc.b 5,	6, 7, 8, $F, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $FF
		align 2
byte_FFB44A:	dc.b 1,	1, 1, 1, 2, 2, 3, 1, 1,	1, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 1, 1, 1, 1, 2,	2, 3, 1
		dc.b 1,	1, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 1, 1, 1, 1, 2,	2, 3, 1, 1, 1, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 1,	1, 1, 1
		dc.b 1,	1, 1, 1, 1, 1, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $FF
byte_FFB4D6:	dc.b $A, $A, $A, $A, $A, 8, 9, $B, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 1, 2, 3, 4, 5,	6, 7, 5
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, $FF
byte_FFB520:	dc.b 1,	2, 3, 4, 5, 6, 7, 8, 9,	$A, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $B, $C, $D, $E, $F, $10, $11, $12
		dc.b $16, $13, $14, $15, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFB56E:	dc.b 0,	1, 2, 3, 4, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 5, 6, 7, 8, 9,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $A, $B, $C, $D, $E, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, $FF
		align 2
byte_FFB5D6:	dc.b 0,	1, 2, 0, 1, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 1, 2, 0, 1,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 1, 2, 0, 1,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, $FF
		align 2
byte_FFB63E:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 1, 2, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 3, 4,	5, 6, 7
		dc.b 8,	0, 9, $A, $B, $C, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, $D, $E, $F, $10, $11, $12, $13, $14, $15, $16,	$17, $18, $19, $1A, $1B, $1C
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, $FF
byte_FFB6B0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 2, 1, 1, 1, 1,	1, 1, 1
		dc.b 1,	3, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $FF
byte_FFB70C:	dc.b 0,	1, 2, 3, 4, 5, 6, 7, 4,	8, 9, $A, $D, 4, 4, 4, 4, 4, $B, $C
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, $FF
byte_FFB742:	dc.b 0,	1, 2, 3, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 4, 5, 6, 7, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 8, 9, $A, 7, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $B, $C, $D, 7
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $E, $F, $10, $11, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, $FF
byte_FFB7E8:	dc.b 0,	0, 1, 2, 3, 1, 1, 1, 4,	5, 6, 7, 1, 8, 9, $A, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFB81A:	dc.b 2,	1, 2, 1, 2, 1, 2, 1, 2,	1, 2, 1, 2, 1, 2, 1, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFB84C:	dc.b 0,	1, 2, 3, 4, 4, 5, 6, 7,	8, 9, 4, 4, $A,	$B, $C,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFB87E:	dc.b 0,	1, 0, 1, 2, 0, 1, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, $FF
		align 2
byte_FFB8AA:	dc.b 0,	1, 2, 3, 4, 5, 6, 7, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 8, 9, $A, $B, $C, $D, $1C, $E
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $F, $10, $11, $12, $13, $14, $14, $15,	0, 0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $16, $17, $17, $18
		dc.b $17, $19, $1A, $1B, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFB934:	dc.b 0,	1, 0, 1, 0, 1, 0, 1, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 2, 3, 2, 3, 2,	3, 2, 3
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 4, 5, 4, 5, 4,	5, 4, 5, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 6,	7, 6, 7
		dc.b 6,	7, 6, 7, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFB9BE:	dc.b 0,	1, 2, 3, 4, 3, 5, 6, 7,	8, $A, 9, 0, 0,	0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, $FF
byte_FFB9EC:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 1, 2, 3, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 1, 4, 5, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $FF
		align 2
byte_FFBA52:	dc.b 0,	1, 2, 3, 3, 4, 5, 6, 7,	8, 9, $A, 3, 3,	$B, $C,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 3, 3, $D, $E, $E, $F, $10, 3
		dc.b $11, $12, $18, $13, $14, $15, $16,	$17, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	$FF
byte_FFBAA4:	dc.b 1,	0, $18,	2, 3, 4, 5, 6, 7, 8, 0,	9, $A, $B, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $C, $D, $E, $F, $10, $10, $11,	0
		dc.b $12, $13, $14, $15, $10, $16, $17,	$17, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	$FF
byte_FFBAF6:	dc.b 0,	1, 2, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 3, 4, 5, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 6, 7, 8, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $FF
		align 2
byte_FFBB5C:	dc.b 0,	1, 2, 3, 4, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 5, 6, 7, 8, 9,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $FF
		align 2
byte_FFBBA4:	dc.b 1,	2, 0, 0, 0, 0, 0, 0, 0,	0, 0, 3, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 3, 3, 4, 5, 0,	0, 6, 7
		dc.b 8,	9, $A, $B, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 3, 3, $C, $D, $E, $F, $10, $11, $11, $11, $11,	$11, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$FF
byte_FFBC12:	dc.b 1,	9, $A, $B, $15,	$16, $B, 9, $1A, $B, 9,	2, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 3, $C,	$D, $E,	$C, $10, $E, $18
		dc.b $19, $E, $C, 4, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 5, $11, $12, $13, $14,	$17, $13, $11, $12, $13, $11, 8, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $FF
		align 2
byte_FFBCA4:	dc.b $1B, 9, 2,	3, $19,	$19, $19, $19, $19, 4, $19, 5, 6, 7, 8,	$1D, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $A, $B, $C, $D, $1A, $1A, $1A,	$1A
		dc.b $E, $F, $1C, $10, $11, $12, $13, $14, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $15,	$16
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $17,	$18, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $FF
		align 2
byte_FFBD46:	dc.b 0,	1, 0, 1, 0, 1, 0, 1, 0,	1, 0, 1, 0, 1, 0, 1, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 2, 3, 2, 3, 2,	3, 2, 3
		dc.b 2,	3, 2, 3, 2, 3, 2, 3, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 4, 5, 4, 5, 4,	5, 4, 5, 4, 5, 4, 5, 4,	5, 4, 5
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $FF
		align 2
byte_FFBDC8:	dc.b 1,	0, 0, 0, 2, 3, 4, 5, 6,	7, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 8, 0, 9, $A, $B, $C, $D, $E
		dc.b $F, $10, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, $11, $12, $13,	$14, $15, $16, $17, $18, $19, $1A, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $FF
		align 2
byte_FFBE5A:	dc.b $14, $14, $14, $14, 1, 2, 3, 4, $14, $14, $14, $14, 6, 7, 8, 9, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $14, $14, $A, $B, $C, $D, $10,	$F
		dc.b $10, $10, $11, $12, $13, 7, 8, $15, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $17, $1F, $18,	$19, $19, 0, 0,	0, 0, 0, 0, 5, $1A, $1B, 8, $15
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 5, $1C, $1D, $E, $1E,	0, 0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $FF
		align 2
byte_FFBEFC:	dc.b $FF
		align 2
byte_FFBEFE:	dc.b 0,	0, 1, 2, 3, 4, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 5, 6, 7, 8, 9,	$A, $B,	$C
		dc.b $D, $E, $F, $10, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, $11, $12, $13,	$14, $15, $16, $17, $18, $19, $1A, $1B,	$1C, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $FF
		align 2
byte_FFBF80:	dc.b 1,	8, 5, 2, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 3, 7, 6, 4, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $FF
		align 2
off_FFBFF2:	dc.w byte_FFC01A-off_FFBFF2
		dc.w byte_FFC01A-off_FFBFF2
		dc.w byte_FFC01A-off_FFBFF2
		dc.w byte_FFC0EC-off_FFBFF2
		dc.w byte_FFC41E-off_FFBFF2
		dc.w byte_FFC1F2-off_FFBFF2
		dc.w byte_FFC1D0-off_FFBFF2
		dc.w byte_FFC1AE-off_FFBFF2
		dc.w byte_FFC218-off_FFBFF2
		dc.w byte_FFC23A-off_FFBFF2
		dc.w byte_FFC310-off_FFBFF2
		dc.w byte_FFC352-off_FFBFF2
		dc.w byte_FFC592-off_FFBFF2
		dc.w byte_FFC510-off_FFBFF2
		dc.w byte_FFC63E-off_FFBFF2
		dc.w byte_FFC73E-off_FFBFF2
		dc.w byte_FFC660-off_FFBFF2
		dc.w byte_FFC71C-off_FFBFF2
		dc.w byte_FFC5EC-off_FFBFF2
		dc.w byte_FFC5D0-off_FFBFF2
byte_FFC01A:	dc.b 0,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 3, 3,	1, 1, 1
		dc.b 1,	1, 1, 1, 3, 3, 3, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 1, 1, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $FF
		align 2
byte_FFC0EC:	dc.b 0,	3, 3, 3, 3, 3, 3, 3, 3,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1
		dc.b 1,	1, 0, 0, 0, 0, 0, 0, 0,	0, 0, $14, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $14, $14, 0, 1, 1, 1, 1, 1, $FF
		align 2
byte_FFC1AE:	dc.b 0,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $14, $FF
		align 2
byte_FFC1D0:	dc.b 0,	1, 1, 1, 1, 1, 1, $B, $27, 5, $25, $D, $C, $28,	6, 7, $26, $21,	$22, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $FF
		align 2
byte_FFC1F2:	dc.b 0,	1, 1, 1, $B, 5,	$27, $25, $D, $C, 6, 7,	1, 1, 1, 1, 1, 1, 1, 1
		dc.b 1,	1, $11,	$28, $26, 0, 0,	0, 0, 0, 0, 0, 0, 0, $14, $14, $FF
		align 2
byte_FFC218:	dc.b 0,	1, 1, 1, 6, 7, $26, $28, $D, $C, 0, 0, 0, 0, 5,	$25, $B, $27, 1, 1
		dc.b 1,	1, 1, 1, 1, 1, 1, 0, $21, $22, $24, $23, $FF
		align 2
byte_FFC23A:	dc.b 0,	6, $C, 7, $26, $28, $D,	$B, 5, $27, $25, 1, 1, 1, 1, 1,	1, 1, 1, 1
		dc.b $25, 5, $25, $25, 5, $B, $27, 1, $B, $27, 1, 1, 1,	1, 3, 3, 3, 3, 1, 1
		dc.b 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, $B, 1, 1, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $14, $14, $14, $14, $14, $14, $14,	$14, $14, $14, $14, $14, 0, 0, $B, 0, 1, 1, $14, $14
		dc.b $14, $14, $14, $14, $27, $26, $28,	3, 3, 3, 3, $25, $FF
		align 2
byte_FFC310:	dc.b 0,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 1, 1,	0, 0, 0
		dc.b 0,	0, 0, 0, $FF
		align 2
byte_FFC352:	dc.b 0,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	5, $B, $25
		dc.b $27, 6, 7,	$D, $C,	$26, $28, $D, $C, $D, $C, $D, $C, $D, $C, $D, $C, 6, 7,	6
		dc.b 7,	6, 7, 6, 7, 6, 7, $B, $B, $B, $B, $B, 5, 5, 5, 5, 5, 0,	0, 0
		dc.b 0,	$29, $2B, $2A, $2C, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $14, $14,	$14, $14, $14, 0, 0, 0,	0
		dc.b 0,	0, 3, 3, 0, 0, 0, 1, $14, 1, 1,	1, 1, 0, 0, 8, $E, 1, 1, 1
		dc.b 1,	1, $FF
		align 2
byte_FFC41E:	dc.b 0,	1, 1, 5, 5, $25, $25, $D, $C, $28, $28,	6, 7, $26, $26,	$B, $B,	$27, $27, $13
		dc.b 1,	1, 0, 0, 1, 1, 3, 3, 0,	0, 0, 1, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 1, 1, 1, 1, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 1,	1, 1, 1, 0, 0, 0, $2D, $2D, $2D, $2D, $2D, $2D,	0, $2D,	$2D, $2D, $2D, $2D, 0
		dc.b $2D, $2D, $2D, $2D, $2D, $2D, $2D,	$2D, $2D, $2D, 0, $2D, 0, $2D, $2D, $2D, $2D, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 1, 1, 1, 1,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $13, 0, 0, 0, 0, 0, 0,	0
		dc.b $FF
		align 2
byte_FFC510:	dc.b 0,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 1, 1, 1,	1, 1, 1
		dc.b 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 1, 1, 1, $FF
		align 2
byte_FFC592:	dc.b 0,	1, 1, 1, 1, 0, 0, 0, 1,	5, 1, 1, 1, 1, 1, $B, $22, 0, 0, 0
		dc.b 0,	6, 7, $D, $C, $21, 1, 1, $23, $24, $25,	$26, 0,	0, 0, 0, 0, 0, 1, 1
		dc.b 1,	1, 1, 0, 0, 0, 0, 0, $12, $27, $28, $25, $26, $27, $28,	0, 0, $12, $12,	$12
		dc.b $12, $FF
byte_FFC5D0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	1, 0, 0
		dc.b 1,	1, 0, 0, 1, $23, $FF
		align 2
byte_FFC5EC:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	0, 0, 0
		dc.b $FF
		align 2
byte_FFC63E:	dc.b 0,	3, 3, 1, 1, 1, 1, 1, 1,	1, 1, 1, 3, 3, 3, 3, 3,	3, 3, 3
		dc.b $24, $14, $14, 0, 0, 0, 0,	0, 0, 0, 0, $14, $FF
		align 2
byte_FFC660:	dc.b 0,	1, 1, 6, 7, $D,	$C, $26, 5, $B,	$25, $27, $26, $28, 1, 1, 1, 1,	1, 1
		dc.b 1,	1, 3, 3, $14, $14, $14,	$14, $14, $14, $14, $14, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	$14, $14, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, $14, $FF
byte_FFC71C:	dc.b 0,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, $14,	$14
		dc.b $14, $14, $14, 0, 0, 0, 0,	0, 0, 0, 0, $14, $FF
		align 2
byte_FFC73E:	dc.b 0,	1, 1, 1, 1, 1, 1, 1, 5,	$C, 6, 7, $D, $C, 3, 3,	3, 1, 1, 1
		dc.b 1,	1, 1, 1, $25, $27, $26,	$28, $21, $22, $23, $24, $FF
		align 2
