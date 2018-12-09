    cpu 68000
    supmode on
    padding off
    include "kosinski_dialogs_dec_structs.inc"
    include "kosinski_dialogs_dec_equals.inc"
    include "kosinski_dialogs_dec_externs.inc"
    include "kosinski_dialogs_dec_funcs.inc"

; segment "ROM"
offset0:	dc.w dialog_infos-offset0
offset2:	dc.w rect_infos-offset0
dialog_infos:	dialog_info RECT_IDX_2, word_FFCF5A-dialog_infos
		dialog_info RECT_IDX_7, word_FFCF5A-dialog_infos
		dialog_info RECT_IDX_E, word_FFD068-dialog_infos
		dialog_info RECT_IDX_7, word_FFD0DE-dialog_infos
		dialog_info RECT_IDX_9, word_FFD1FE-dialog_infos
		dialog_info RECT_IDX_7, word_FFD392-dialog_infos
		dialog_info RECT_IDX_9, word_FFD414-dialog_infos
		dialog_info RECT_IDX_7, word_FFD53A-dialog_infos
		dialog_info RECT_IDX_A, word_FFD592-dialog_infos
		dialog_info RECT_IDX_A, word_FFD808-dialog_infos
		dialog_info RECT_IDX_B, word_FFD8A6-dialog_infos
		dialog_info RECT_IDX_9, word_FFD8DC-dialog_infos
		dialog_info RECT_IDX_8, word_FFD94A-dialog_infos
		dialog_info RECT_IDX_7, word_FFDB30-dialog_infos
		dialog_info RECT_IDX_8, word_FFDB76-dialog_infos
		dialog_info RECT_IDX_7, word_FFDDA2-dialog_infos
		dialog_info RECT_IDX_9, word_FFDDFC-dialog_infos
		dialog_info RECT_IDX_7, word_FFE00A-dialog_infos
		dialog_info RECT_IDX_7, word_FFE05E-dialog_infos
		dialog_info RECT_IDX_7, word_FFE100-dialog_infos
		dialog_info RECT_IDX_5, word_FFE142-dialog_infos
		dialog_info RECT_IDX_D, word_FFE184-dialog_infos
		dialog_info RECT_IDX_7, word_FFE296-dialog_infos
		dialog_info RECT_IDX_7, word_FFE332-dialog_infos
		dialog_info RECT_IDX_7, word_FFE386-dialog_infos
		dialog_info RECT_IDX_7, word_FFE3D4-dialog_infos
		dialog_info RECT_IDX_7, word_FFE416-dialog_infos
		dialog_info RECT_IDX_6, word_FFE45A-dialog_infos
		dialog_info RECT_IDX_7, word_FFE520-dialog_infos
		dialog_info RECT_IDX_7, word_FFE564-dialog_infos
		dialog_info RECT_IDX_7, word_FFE5B8-dialog_infos
		dialog_info RECT_IDX_7, word_FFE60C-dialog_infos
		dialog_info RECT_IDX_7, word_FFE66A-dialog_infos
		dialog_info RECT_IDX_D, word_FFE6CA-dialog_infos
		dialog_info RECT_IDX_7, word_FFE77C-dialog_infos
		dialog_info RECT_IDX_7, word_FFE7BE-dialog_infos
		dialog_info RECT_IDX_9, word_FFE802-dialog_infos
		dialog_info RECT_IDX_7, word_FFE866-dialog_infos
		dialog_info RECT_IDX_7, word_FFE8A6-dialog_infos
		dialog_info RECT_IDX_7, word_FFE8E6-dialog_infos
		dialog_info RECT_IDX_9, word_FFE92A-dialog_infos
		dialog_info RECT_IDX_8, word_FFE970-dialog_infos
		dialog_info RECT_IDX_2, word_FFE9E4-dialog_infos
		dialog_info RECT_IDX_2, word_FFE9E6-dialog_infos
		dialog_info RECT_IDX_2, word_FFE9E8-dialog_infos
		dialog_info RECT_IDX_2, word_FFE9EA-dialog_infos
		dialog_info RECT_IDX_2, word_FFE9EC-dialog_infos
		dialog_info RECT_IDX_2, word_FFE9EE-dialog_infos
		dialog_info RECT_IDX_2, word_FFEA02-dialog_infos
		dialog_info RECT_IDX_2, word_FFEA16-dialog_infos
		dialog_info RECT_IDX_5, word_FFEA2A-dialog_infos
		dialog_info RECT_IDX_5, word_FFEA60-dialog_infos
		dialog_info RECT_IDX_5, word_FFEA98-dialog_infos
		dialog_info RECT_IDX_5, word_FFEAD0-dialog_infos
		dialog_info RECT_IDX_5, word_FFEB0A-dialog_infos
		dialog_info RECT_IDX_6, word_FFEB4C-dialog_infos
		dialog_info RECT_IDX_5, word_FFEC02-dialog_infos
		dialog_info RECT_IDX_5, word_FFEC52-dialog_infos
		dialog_info RECT_IDX_5, word_FFEC8C-dialog_infos
		dialog_info RECT_IDX_2, word_FFECC0-dialog_infos
		dialog_info RECT_IDX_F, word_FFECD4-dialog_infos
		dialog_info RECT_IDX_5, word_FFED22-dialog_infos
		dialog_info RECT_IDX_A, word_FFED74-dialog_infos
rect_infos:	rect_info $421E, $13, 8
		rect_info $421E, $13, 2
		rect_info $421E, $B, 3
		rect_info $4122, $14, 5
		rect_info $4122, $15, 9
		rect_info $4122, $15, $15
		rect_info $4110, $17, 8
		rect_info $4190, $17, $C
		rect_info $4190, $17, $A
		rect_info $4610, $17, 8
		rect_info $4610, $15, 9
		rect_info $4000, 1, 1
		rect_info $409A, $1A, 9
		rect_info $4110, $17, $A
		rect_info $4122, $15, 7
word_FFCF5A:	dc.w 3
		dc.l byte_FFCF6C
		dc.l byte_FFCFAC
		dc.l byte_FFCFF4
		dc.l byte_FFD02C
byte_FFCF6C:	dc.b 0,	$FF, $28, $12, $F, $22,	$27, $3B, $12, $B, $1F,	$F, $3B, $22, 1, $1E, $3B, $1C,	$F, $F
		dc.b $18, $FF, $FF, $3B, $1D, $12, $F, $3B, $12, $F, $1B, 1, $3B, $15, $F, $22,	$24, $29, $FF, $FF
		dc.b $FF, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $38, $FF
		align 2, 0
byte_FFCFAC:	dc.b 1,	$FF, $28, $13, $2D, $1F, $F, $3B, $11, 1, $1D, $3B, $13, $1D, $3B, $1B,	$13, $11, $12, $1D
		dc.b $FF, $FF, $3B, $12, $F, $1B, $F, $26, $3B,	$B, $1B, $F, $3B, $22, 1, $1E, $3B, $B,	$3B, $FF
		dc.b $FF, $3B, $12, $F,	$1B, 1,	$24, $29, $FF, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $FF
		align 2, 0
byte_FFCFF4:	dc.b 0,	$FF, $28, $13, $2D, $17, $3B, $1D, $1B,	$22, $13, $18, $11, $3B, $1D, 1, $3B, $C, $F, $3B
		dc.b $B, $FF, $FF, $3B,	$12, $F, $1B, 1, $26, $29, $FF,	$FF, $FF, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $38, $FF
		align 2, 0
byte_FFD02C:	dc.b 1,	$FF, $28, $1D, $12, $F,	$18, $3B, $1D, $B, $15,	$F, $3B, $13, $1D, $27,	$3B, $B, $18, $E
		dc.b $FF, $FF, $3B, $11, 1, 1, $E, $3B,	$16, $1E, $D, $15, $26,	$29, $FF, $FF, $FF, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $FF
		align 2, 0
word_FFD068:	dc.w 0
		dc.l byte_FFD06E
byte_FFD06E:	dc.b 1,	$28, $22, 1, $1E, $3B, $20, 1, $18, $2D, $1D, $3B, $C, $F, $3B,	$B, $C,	$16, $F, $3B
		dc.b $1D, 1, $3B, $FF, $3B, $D,	1, $18,	$1D, $13, $18, $1E, $F,	$3B, $17, $1E, $D, $12,	$3B, $10
		dc.b $B, $1B, $1D, $12,	$F, $1B, $FF, $3B, $20,	$13, $1D, $12, 1, $1E, $1D, $3B, $1D, $12, $F, $3B
		dc.b $1B, $13, $11, $12, $1D, $FF, $FF,	$3B, $1D, 1, 1,	$16, $1C, $3B, $1D, 1, $3B, $D,	$16, $13
		dc.b $17, $C, $3B, $12,	$13, $11, $12, $FF, $FF, $3B, $20, $B, $16, $16, $1C, $26, $29,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
word_FFD0DE:	dc.w 3
		dc.l byte_FFD0F0
		dc.l byte_FFD13C
		dc.l byte_FFD16A
		dc.l byte_FFD1AE
byte_FFD0F0:	dc.b 1,	$FF, $28, $11, 1, 1, $10, $22, $3B, $12, $B, $1C, $3B, $1D, $12, $F, $3B, $1D, 1, 1
		dc.b $16, $1C, $FF, $FF, $3B, $1D, 1, $3B, $D, $16, $13, $17, $C, $3B, $1D, $12, $F, $3B, $12, $13
		dc.b $11, $12, $FF, $FF, $3B, $20, $B, $16, $16, $1C, $26, $29,	$FF, $3B, $3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
byte_FFD13C:	dc.b 0,	$FF, $28, $20, $12, $F,	$1B, $F, $3B, $13, $1C,	$3B, $11, 1, 1,	$10, $22, $24, $29, $FF
		dc.b $FF, $FF, $FF, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $38, $3B, $FF
byte_FFD16A:	dc.b 1,	$FF, $28, $12, $F, $3B,	$1C, $B, $13, $E, $3B, $12, $F,	$3B, $20, $B, $1C, $3B,	$11, 1
		dc.b $13, $18, $11, $3B, $FF, $3B, $1D,	1, $3B,	$1F, $13, $1C, $13, $1D, $3B, $17, $F, $21, $13, $D
		dc.b 1,	$26, $FF, $FF, $FF, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
byte_FFD1AE:	dc.b 1,	$FF, $3B, $3B, $1C, 1, $17, $F,	$1D, $12, $13, $18, $11, $3B, $B, $C, 1, $1E, $1D, $FF
		dc.b $FF, $3B, $3B, $20, $B, $18, $1D, $13, $18, $11, $3B, $1D,	1, $3B,	$1C, $F, $F, $FF, $FF, $3B
		dc.b $3B, $B, $18, $D, $13, $F,	$18, $1D, $3B, $1B, $1E, $13, $18, $1C,	$26, $29, $FF, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
word_FFD1FE:	dc.w 4
		dc.l byte_FFD214
		dc.l byte_FFD260
		dc.l byte_FFD2AE
		dc.l byte_FFD316
		dc.l byte_FFD360
byte_FFD214:	dc.b 1,	$FF, $3B, $28, $E, 1, $18, $B, $16, $E,	$27, $3B, $14, $1E, $1C, $1D, $3B, $1D,	$12, $F
		dc.b $FF, $FF, $3B, $3B, $10, $F, $16, $16, 1, $20, $3B, $13, $3B, $20,	$B, $18, $1D, $F, $E, $3B
		dc.b $1D, 1, $FF, $FF, $3B, $3B, $1C, $F, $F, $26, $FF,	$FF, $FF, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
byte_FFD260:	dc.b 1,	$FF, $3B, $20, 1, $1E, $16, $E,	$3B, $22, 1, $1E, $3B, $19, $16, $F, $B, $1C, $F, $3B
		dc.b $1D, $1B, $22, $3B, $FF, $3B, 1, $1E, $1D,	$3B, $17, $22, $3B, $18, $F, $20, $F, $1C, $1D,	$FF
		dc.b $FF, $3B, $13, $18, $1F, $F, $18, $1D, $13, 1, $18, $24, $FF, $FF,	$FF, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$38, $3B
		align 2, 0
byte_FFD2AE:	dc.b 1,	$3B, $13, $1D, $2D, $1C, $3B, $C, $1E, $C, $C, $16, $F,	$11, $1E, $17, $3B, $B,	$17, $17
		dc.b 1,	$26, $FF, $FF, $3B, $20, $12, $F, $18, $3B, $22, 1, $1E, $3B, $1E, $1C,	$F, $3B, $13, $1D
		dc.b $3B, $13, $18, $FF, $FF, $3B, $22,	1, $1E,	$1B, $3B, $1C, $12, 1, 1, $1D, $F, $1B,	$27, $3B
		dc.b $13, $1D, $FF, $FF, $3B, $17, $B, $15, $F,	$1C, $3B, $F, $21, $19,	$16, 1,	$E, $13, $18, $11
		dc.b $FF, $FF, $3B, $C,	$1E, $C, $C, $16, $F, $1C, $26,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $38, $FF
byte_FFD316:	dc.b 1,	$FF, $3B, $13, $2D, $16, $16, $3B, $11,	$13, $1F, $F, $3B, $22,	1, $1E,	$3B, $17, 1, $1B
		dc.b $F, $FF, $FF, $3B,	$20, $12, $F, $18, $F, $1F, $F,	$1B, $3B, $22, 1, $1E, $FF, $FF, $3B, $1B
		dc.b $1E, $18, $3B, 1, $1E, $1D, $26, $29, $FF,	$FF, $FF, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
byte_FFD360:	dc.b 0,	$FF, $3B, $28, $1D, $12, $B, $18, $15, $3B, $22, 1, $1E, $27, $3B, $11,	$22, $1B, 1, $25
		dc.b $29, $FF, $FF, $FF, $FF, $FF, $FF,	$FF, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
word_FFD392:	dc.w 1
		dc.l byte_FFD39C
		dc.l byte_FFD3E4
byte_FFD39C:	dc.b 1,	$FF, $28, $22, 1, $1E, $2D, $1F, $F, $3B, $1B, $1E, $18, $3B, 1, $1E, $1D, $FF,	$FF, $3B
		dc.b $B, $16, $1B, $F, $B, $E, $22, $24, $FF, $FF, $3B,	$12, $F, $1B, $F, $3B, $1D, $B,	$15, $F
		dc.b $3B, $1D, $12, $F,	$1C, $F, $26, $29, $FF,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
byte_FFD3E4:	dc.b 0,	$FF, $3B, $28, $1D, $12, $B, $18, $15, $3B, $22, 1, $1E, $27, $3B, $11,	$22, $1B, 1, $25
		dc.b $29, $FF, $FF, $FF, $FF, $FF, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $38,	$3B
word_FFD414:	dc.w 2
		dc.l byte_FFD422
		dc.l byte_FFD490
		dc.l byte_FFD4FC
byte_FFD422:	dc.b 1,	$FF, $3B, $28, $E, 1, $18, $B, $16, $E,	$27, $3B, $E, 1, $18, $2D, $1D,	$3B, $22, 1
		dc.b $1E, $FF, $FF, $3B, $3B, $15, $18,	1, $20,	$3B, $1D, $12, $B, $1D,	$3B, $22, 1, $1E, $3B, $18
		dc.b $F, $F, $E, $FF, $FF, $3B,	$3B, $B, $3B, $1C, $19,	$F, $D,	$13, $B, $16, $3B, $15,	$F, $22
		dc.b $3B, $1D, 1, $3B, $11, 1, $3B, $FF, $3B, $3B, $13,	$18, $1D, 1, $3B, $1D, $12, $F,	$1C, $F
		dc.b $3B, $1B, $1E, $13, $18, $1C, $24,	$FF, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
byte_FFD490:	dc.b 1,	$FF, $3B, $B, $3B, $1D,	$F, $B,	$17, $3B, 1, $10, $3B, $F, $21,	$19, $16, 1, $1B, $F
		dc.b $1B, $1C, $FF, $FF, $3B, $1B, $F, $1D, $1E, $1B, $18, $F, $E, $3B,	$1D, 1,	$3B, $E, $1E, $D
		dc.b $15, $C, $1E, $1B,	$11, $3B, $FF, $3B, $20, $13, $1D, $12,	$3B, $13, $1D, $26, $3B, $13, $1D, $2D
		dc.b $1C, $3B, $D, $B, $16, $16, $F, $E, $3B, $FF, $3B,	$1D, $12, $F, $3B, $12,	$F, $1B, 1, $3B
		dc.b $15, $F, $22, $26,	$29, $FF, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $38,	$3B
byte_FFD4FC:	dc.b 0,	$FF, $3B, $28, $1D, $12, $B, $18, $15, $3B, $22, 1, $1E, $27, $3B, $1C,	$20, $F, $F, $1D
		dc.b $FF, $FF, $3B, $3B, $1C, $F, $18, 1, $1B, $13, $1D, $B, $26, $29, $FF, $FF, $FF, $FF, $FF,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38
		dc.b $3B
		align 2, 0
word_FFD53A:	dc.w 0
		dc.l byte_FFD540
byte_FFD540:	dc.b 1,	$FF, $3B, $28, $22, 1, $1E, $3B, $D, $B, $18, $3B, 1, $19, $F, $18, $3B, $1D, $12, $13
		dc.b $1C, $FF, $FF, $3B, $3B, $E, 1, 1,	$1B, $3B, $13, $10, $3B, $22, 1, $1E, $3B, $1E,	$1C, $F
		dc.b $3B, $1D, $12, $F,	$3B, $FF, $3B, $3B, $12, $F, $1B, 1, $3B, $15, $F, $22,	$26, $29, $FF, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38
		dc.b $3B
		align 2, 0
word_FFD592:	dc.w 8
		dc.l byte_FFD5B8
		dc.l byte_FFD5FE
		dc.l byte_FFD63C
		dc.l byte_FFD690
		dc.l byte_FFD6CE
		dc.l byte_FFD6FC
		dc.l byte_FFD724
		dc.l byte_FFD768
		dc.l byte_FFD7C0
byte_FFD5B8:	dc.b 1,	$FF, $3B, $28, $11, $B,	$20, $1B, $1C, $12, $27, $3B, $E, 1, $18, $B, $16, $E, $27, $3B
		dc.b $13, $1D, $2D, $1C, $FF, $3B, $3B,	$1C, $20, $F, $16, $16,	$3B, $1D, 1, $3B, $1C, $F, $F, $3B
		dc.b $22, 1, $1E, $26, $29, $FF, $FF, $FF, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
byte_FFD5FE:	dc.b 0,	$FF, $28, $11, 1, 1, $10, $22, $27, $3B, $20, $12, $B, $1D, $3B, $B, $1B, $F, $3B, $22
		dc.b 1,	$1E, $FF, $FF, $3B, $E,	1, $13,	$18, $11, $3B, $12, $F,	$1B, $F, $24, $29, $FF,	$FF, $FF
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $38, $3B
byte_FFD63C:	dc.b 1,	$FF, $28, 1, 1,	1, $12,	$27, $3B, $14, $1E, $1C, $1D, $3B, $16,	1, 1, $15, $13,	$18
		dc.b $11, $FF, $FF, $3B, $B, $1B, 1, $1E, $18, $E, $26,	$3B, $13, $3B, $10, 1, $1E, $18, $E, $3B
		dc.b $1D, $12, $13, $1C, $FF, $FF, $3B,	$1C, $1D, $1B, $B, $18,	$11, $F, $3B, $18, 1, $1D, $F, $26
		dc.b $FF, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $38, $3B
		align 2, 0
byte_FFD690:	dc.b 1,	$FF, $3B, $13, $3B, $E,	1, $18,	$2D, $1D, $3B, $15, $18, 1, $20, $3B, $20, $12,	$B, $1D
		dc.b $FF, $FF, $3B, $1D, 1, $3B, $E, 1,	$3B, $20, $13, $1D, $12, $3B, $13, $1D,	$26, $FF, $FF, $FF
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $38, $3B
byte_FFD6CE:	dc.b 1,	$FF, $3B, $E, 1, $3B, $22, 1, $1E, $3B,	$20, $B, $18, $1D, $3B,	$13, $1D, $24, $29, $FF
		dc.b $FF, $FF, $FF, $FF, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $38, $3B
byte_FFD6FC:	dc.b 0,	$FF, $28, $22, 1, $1E, $3B, $C,	$F, $1D, $25, $29, $FF,	$FF, $FF, $FF, $FF, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
byte_FFD724:	dc.b 1,	$FF, $28, $13, $3B, $B,	$16, $1C, 1, $3B, $10, 1, $1E, $18, $E,	$3B, $1D, $12, $13, $1C
		dc.b $FF, $FF, $3B, $10, $1E, $18, $18,	$22, $3B, $19, $16, $1E, $18, $11, $F, $1B, $3B, $1D, $12, $13
		dc.b $18, $11, $26, $FF, $FF, $FF, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $38,	$3B
byte_FFD768:	dc.b 1,	$3B, $17, $B, $22, $C, $F, $3B,	$13, $10, $3B, $22, 1, $1E, $3B, $1C, $12, 1, 1, $1D
		dc.b $3B, $13, $1D, $FF, $3B, $B, $1D, $3B, $20, $B, $16, $16, $1C, $3B, $B, $18, $E, $3B, $1D,	$12
		dc.b $13, $18, $11, $1C, $FF, $FF, $3B,	$13, $1D, $3B, $20, $13, $16, $16, $3B,	$12, $F, $16, $19, $3B
		dc.b $22, 1, $1E, $3B, $FF, $FF, $3B, $1B, $F, $B, $D, $12, $3B, $12, $13, $11,	$12, $3B, $19, $16
		dc.b $B, $D, $F, $1C, $26, $3B,	$38, $3B
byte_FFD7C0:	dc.b 1,	$3B, $B, $18, $E, $3B, $11, $22, $1B, 1, $3B, $13, $18,	$3B, $E, $1E, $D, $15, $C, $1E
		dc.b $1B, $11, $3B, $FF, $3B, $13, $1C,	$3B, $16, 1, 1,	$15, $13, $18, $11, $3B, $10, 1, $1B, $3B
		dc.b $22, 1, $1E, $26, $29, $3B, $FF, $FF, $FF,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $FF
		align 2, 0
word_FFD808:	dc.w 1
		dc.l byte_FFD812
		dc.l byte_FFD854
byte_FFD812:	dc.b 1,	$FF, $28, $1D, $12, $F,	$1B, $F, $2D, $1C, $3B,	$18, 1,	$1D, $12, $13, $18, $11, $3B, $C
		dc.b $1E, $1D, $FF, $FF, $3B, $E, $F, $B, $E, $3B, $F, $18, $E,	$1C, $3B, $B, $12, $F, $B, $E
		dc.b $26, $FF, $FF, $FF, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $38, $3B
byte_FFD854:	dc.b 1,	$3B, $13, $1D, $3B, $16, 1, 1, $15, $1C, $3B, $16, $13,	$15, $F, $3B, $1D, $12,	$F, $FF
		dc.b $FF, $3B, 1, $18, $16, $22, $3B, $20, $B, $22, $3B, 1, $1E, $1D, $3B, $13,	$1C, $FF, $FF, $3B
		dc.b $1D, 1, $3B, $11, 1, $3B, $C, $B, $D, $15,	$3B, $1D, 1, $3B, $1D, $12, $F,	$FF, $FF, $3B
		dc.b $F, $18, $1D, $1B,	$B, $18, $D, $F, $26, $29, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$38
		dc.b $3B
		align 2, 0
word_FFD8A6:	dc.w 0
		dc.l byte_FFD8AC
byte_FFD8AC:	dc.b 0,	$FF, $FF, $FF, 2, $3B, $1C, $1E, $18, $3B, 3, $3B, $17,	1, 1, $18, $3B,	4, $3B,	$1C
		dc.b $1D, $B, $1B, $3B,	$FF, $FF, $FF, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
word_FFD8DC:	dc.w 0
		dc.l byte_FFD8E2
byte_FFD8E2:	dc.b 1,	$28, $13, $10, $3B, $22, 1, $1E, $3B, $E, 1, $18, $2D, $1D, $3B, $12, $B, $1F, $F, $FF
		dc.b $FF, $3B, $1C, 1, $17, $F,	$1D, $12, $13, $18, $11, $3B, $1D, 1, $3B, $C, $16, 1, $20, $3B
		dc.b $1E, $19, $3B, $FF, $3B, $1D, $12,	$13, $1C, $3B, $20, $B,	$16, $16, $3B, $20, $13, $1D, $12, $27
		dc.b $3B, $22, 1, $1E, $FF, $FF, $3B, $D, $B, $18, $2D,	$1D, $3B, $11, 1, $3B, $B, $18,	$22, $FF
		dc.b $FF, $3B, $10, $B,	$1B, $1D, $12, $F, $1B,	$26, $29, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $38, $3B
		align 2, 0
word_FFD94A:	dc.w 4
		dc.l byte_FFD960
		dc.l byte_FFD9AA
		dc.l byte_FFDA06
		dc.l byte_FFDA54
		dc.l byte_FFDACA
byte_FFD960:	dc.b 1,	$FF, $28, $C, $16, 1, $20, $3B,	$1E, $19, $3B, $1D, $12, $F, $3B, $20, $B, $16,	$16, $3B
		dc.b $20, $13, $1D, $12, $FF, $3B, $1D,	$12, $F, $3B, $C, $1E, $C, $C, $16, $F,	$11, $1E, $17, $3B
		dc.b $B, $17, $17, 1, $26, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $38, $3B
byte_FFD9AA:	dc.b 1,	$FF, $3B, $C, $1E, $1D,	$3B, $20, $12, $22, $3B, $13, $18, $3B,	$1D, $12, $F, $3B, $20,	1
		dc.b $1B, $16, $E, $3B,	$FF, $3B, $E, $13, $E, $3B, $22, 1, $1E, $3B, $D, 1, $17, $F, $3B, $1D
		dc.b 1,	$3B, $1C, $1E, $D, $12,	$3B, $FF, $3B, $B, $3B,	$1C, $D, $B, $1B, $22, $3B, $19, $16, $B
		dc.b $D, $F, $24, $29, $FF, $FF, $FF, $FF, $FF,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
byte_FFDA06:	dc.b 0,	$FF, $3B, $28, $13, $2D, $17, $3B, $16,	1, 1, $15, $13,	$18, $11, $3B, $10, 1, $1B, $FF
		dc.b $FF, $3B, $3B, $15, $13, $18, $11,	$3B, $11, $B, $1B, $1E,	$23, $13, $B, $2D, $1C,	$FF, $FF, $3B
		dc.b $3B, $1D, $1B, $F,	$B, $1C, $1E, $1B, $F, $26, $29, $FF, $FF, $FF,	$FF, $FF, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
byte_FFDA54:	dc.b 1,	$28, $15, $13, $18, $11, $3B, $11, $B, $1B, $1E, $23, $13, $B, $2D, $1C, $FF, $FF, $3B,	$1D
		dc.b $1B, $F, $B, $1C, $1E, $1B, $F, $25, $3B, $18, 1, $20, $3B, $13, $FF, $FF,	$3B, $1B, $F, $17
		dc.b $F, $17, $C, $F, $1B, $25,	$3B, $D, 1, $1E, $18, $1D, $3B,	$FF, $FF, $3B, $E, $1B,	$B, $D
		dc.b $1E, $16, $B, $3B,	$12, $B, $1C, $3B, $1D,	$12, $F, $FF, $FF, $3B,	$1D, $1B, $F, $B, $1C, $1E
		dc.b $1B, $F, $3B, $17,	$B, $19, $3B, $13, $18,	$3B, $1D, $12, $13, $1C, $3B, $FF, $3B,	$D, $B,	$1C
		dc.b $1D, $16, $F, $26,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38, $3B
byte_FFDACA:	dc.b 1,	$FF, $3B, $C, $1E, $1D,	$3B, $13, $3B, $E, 1, $18, $2D,	$1D, $3B, $1D, $12, $13, $18, $15
		dc.b $FF, $FF, $3B, $E,	$1B, $B, $D, $1E, $16, $B, $3B,	$20, $13, $16, $16, $3B, $11, $13, $1F,	$F
		dc.b $3B, $1E, $19, $3B, $FF, $3B, $1D,	$12, $F, $3B, $1D, $1B,	$F, $B,	$1C, $1E, $1B, $F, $3B,	$17
		dc.b $B, $19, $3B, $1D,	1, 1, $3B, $FF,	$3B, $F, $B, $1C, $13, $16, $22, $26, $29, $FF,	$FF, $FF
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $38, $3B
word_FFDB30:	dc.w 0
		dc.l byte_FFDB36
byte_FFDB36:	dc.b 0,	$FF, $E, 1, $18, $B, $16, $E, $3B, $1D,	$B, $15, $F, $1C, $3B, $1D, $12, $F, $3B, $1B
		dc.b $F, $B, $16, $3B, $FF, $1D, $1B, $F, $B, $1C, $1E,	$1B, $F, $3B, $17, $B, $19, $26, $FF, $FF
		dc.b $FF, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $38, $FF
		align 2, 0
word_FFDB76:	dc.w 5
		dc.l byte_FFDB90
		dc.l byte_FFDBD8
		dc.l byte_FFDC0E
		dc.l byte_FFDC76
		dc.l byte_FFDCF8
		dc.l byte_FFE98A
byte_FFDB90:	dc.b 1,	$FF, $3B, $28, 1, $12, $27, $3B, $1D, $12, $13,	$1C, $3B, $13, $1C, $FF, $FF, $3B, $3B,	$1D
		dc.b $F, $1B, $1B, $13,	$C, $16, $F, $26, $26, $26, $FF, $FF, $3B, $3B,	$1D, $F, $1B, $1B, $13,	$C
		dc.b $16, $F, $26, $29,	$FF, $FF, $FF, $FF, $FF, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
byte_FFDBD8:	dc.b 0,	$FF, $3B, $28, $20, $12, $B, $1D, $2D, $1C, $3B, $1D, $12, $F, $3B, $17, $B, $1D, $1D, $F
		dc.b $1B, $24, $29, $3B, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $38, $3B
byte_FFDC0E:	dc.b 1,	$FF, $3B, $28, $13, $3B, $20, $B, $1C, $3B, $1D, $12, $F, $3B, $D, $B, $19, $1D, $B, $13
		dc.b $18, $FF, $FF, $3B, $3B, 1, $10, $3B, $1D,	$12, $13, $1C, $3B, $1C, $12, $13, $19,	$3B, $C, $1E
		dc.b $1D, $FF, $FF, $3B, $3B, $13, $1D,	$2D, $1C, $3B, $C, $F, $F, $18,	$3B, $1D, $B, $15, $F, $18
		dc.b $FF, $FF, $3B, $3B, 1, $1F, $F, $1B, $3B, $C, $22,	$3B, $11, $12, 1, $1C, $1D, $1C, $26, $FF
		dc.b $FF, $FF, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $38, $3B
byte_FFDC76:	dc.b 1,	$3B, $3B, $13, $10, $3B, $22, 1, $1E, $3B, $1D,	$B, $15, $F, $3B, $13, $1D, $3B, $C, $B
		dc.b $D, $15, $3B, $FF,	$3B, $3B, $10, 1, $1B, $3B, $17, $F, $27, $3B, $13, $3B, $D, $B, $18, $3B
		dc.b $11, $13, $1F, $F,	$FF, $FF, $3B, $3B, $22, 1, $1E, $3B, $B, $3B, $1F, $13, $15, $13, $18,	$11
		dc.b $3B, $E, $13, $B, $1B, $22, $FF, $FF, $3B,	$3B, $1D, $12, $B, $1D,	$3B, $20, $13, $16, $16, $3B
		dc.b $12, $F, $16, $19,	$FF, $FF, $3B, $3B, $22, 1, $1E, $3B, $10, $13,	$18, $E, $3B, $1D, $12,	$F
		dc.b $3B, $11, $1B, $F,	$B, $1D, $FF, $FF, $3B,	$3B, $E, $1E, $D, $15, $3B, $1D, $1B, $F, $B, $1C
		dc.b $1E, $1B, $F, $26,	$29, $3B, $3B, $3B, $38, $3B
byte_FFDCF8:	dc.b 0,	$FF, $3B, $28, $11, $1B, $F, $B, $1D, $25, $3B,	$13, $2D, $16, $16, $3B, $E, 1,	$3B, $13
		dc.b $1D, $25, $29, $3B, $FF, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $38, $3B, 1, $FF, $28,	$13, $2D, $17
		dc.b $3B, $1C, 1, $1B, $1B, $22, $3B, $C, $1E, $1D, $FF, $FF, $3B, $22,	1, $1E,	$2D, $16, $16, $3B
		dc.b $18, $F, $F, $E, $3B, $1D,	$12, $F, $3B, $16, 1, $1C, $1D,	$3B, $FF, $3B, $1F, $13, $15, $13
		dc.b $18, $11, $3B, $15, $F, $22, $3B, $13, $10, $3B, $22, 1, $1E, $FF,	$FF, $3B, $20, $B, $18,	$1D
		dc.b $3B, $1D, 1, $3B, $11, 1, $3B, $13, $18, $1C, $13,	$E, $F,	$FF, $FF, $3B, $1D, $12, $F, $3B
		dc.b $1C, $12, $13, $19, $26, $29, $FF,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$38, $3B
		align 2, 0
word_FFDDA2:	dc.w 0
		dc.l byte_FFDDA8
byte_FFDDA8:	dc.b 1,	$FF, $28, $19, $16, $F,	$B, $1C, $F, $3B, $11, 1, $3B, $13, $18, $1C, $13, $E, $F, $FF
		dc.b $FF, $3B, $1D, $12, $F, $3B, $1C, $12, $13, $19, $3B, $B, $18, $E,	$3B, $11, $F, $1D, $3B,	$1B
		dc.b $13, $E, $3B, $FF,	$3B, 1,	$10, $3B, $1D, $12, $F,	$3B, $11, $12, 1, $1C, $1D, $1C, $26, $29
		dc.b $FF, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $38, $3B
		align 2, 0
word_FFDDFC:	dc.w 5
		dc.l byte_FFDE16
		dc.l byte_FFDE76
		dc.l byte_FFDED4
		dc.l byte_FFDEFE
		dc.l byte_FFDF62
		dc.l byte_FFDFB2
byte_FFDE16:	dc.b 0,	$FF, $3B, $28, $13, $3B, $11, 1, $1D, $3B, $1B,	$13, $E, $3B, 1, $10, $3B, $B, $16, $16
		dc.b $FF, $FF, $3B, $3B, $1D, $12, $F, $3B, $11, $12, 1, $1C, $1D, $1C,	$26, $3B, $D, $B, $18, $3B
		dc.b $13, $FF, $FF, $3B, $3B, $12, $B, $1F, $F,	$3B, $1D, $12, $F, $3B,	$1F, $13, $15, $13, $18, $11
		dc.b $3B, $FF, $FF, $3B, $3B, $E, $13, $B, $1B,	$22, $24, $29, $FF, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
byte_FFDE76:	dc.b 1,	$FF, $3B, $28, $13, $2D, $17, $3B, $1C,	1, $1B,	$1B, $22, $27, $3B, $C,	$1E, $1D, $3B, $1D
		dc.b 1,	$FF, $FF, $3B, $3B, $1D, $F, $16, $16, $3B, $1D, $12, $F, $3B, $1D, $1B, $1E, $1D, $12,	$27
		dc.b $3B, $13, $FF, $FF, $3B, $3B, $E, 1, $18, $2D, $1D, $3B, $1B, $F, $B, $16,	$16, $22, $3B, $12
		dc.b $B, $1F, $F, $FF, $FF, $3B, $3B, $13, $1D,	$26, $29, $FF, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $38, $3B
byte_FFDED4:	dc.b 0,	$FF, $3B, $28, $20, $12, $B, $1D, $25, $25, $25, $29, $FF, $FF,	$FF, $FF, $FF, $FF, $FF, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38
		dc.b $3B
		align 2, 0
byte_FFDEFE:	dc.b 1,	$FF, $28, $C, $1E, $1D,	$3B, $B, $18, $3B, 1, $16, $E, $3B, $16, $F, $11, $F, $18, $E
		dc.b $FF, $FF, $3B, $1C, $B, $22, $1C, $3B, $1D, $12, $B, $1D, $3B, $13, $1D, $3B, $13,	$1C, $FF, $FF
		dc.b $3B, $12, $13, $E,	$E, $F,	$18, $3B, $13, $18, $3B, $13, $D, $F, $FF, $FF,	$3B, $18, $F, $B
		dc.b $1B, $3B, $1D, $12, $F, $3B, $1C, 1, $1E, $1D, $12, $3B, $19, 1, $16, $F, $26, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $38, $3B
byte_FFDF62:	dc.b 1,	$FF, $3B, $17, $B, $22,	$C, $F,	$3B, $1D, $12, $13, $1C, $3B, $B, $18, $D, $13,	$F, $18
		dc.b $1D, $FF, $FF, $3B, $1F, $13, $15,	$13, $18, $11, $3B, $19, $16, $1E, $18,	$11, $F, $1B, $3B, $20
		dc.b $13, $16, $16, $FF, $FF, $3B, $12,	$F, $16, $19, $3B, $22,	1, $1E,	$26, $FF, $FF, $FF, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $38, $3B
byte_FFDFB2:	dc.b 1,	$FF, $3B, $13, $1D, $3B, $D, $B, $18, $3B, $C, $F, $3B,	$1E, $1C, $F, $E, $3B, $1D, 1
		dc.b $3B, $10, $16, $22, $FF, $3B, $20,	$13, $1D, $12, $3B, $C,	$22, $3B, $D, $B, $1D, $D, $12,	$13
		dc.b $18, $11, $FF, $FF, $3B, $1D, $12,	$13, $18, $11, $1C, $3B, $1D, $12, $B, $1D, $3B, $10, $16, $22
		dc.b $26, $29, $FF, $FF, $FF, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
word_FFE00A:	dc.w 0
		dc.l byte_FFE010
byte_FFE010:	dc.b 0,	$FF, $3B, $13, $1D, $2D, $1C, $3B, $B, $3B, $15, $F, $22, $3B, $10, $1B, 1, $23, $F, $18
		dc.b $3B, $13, $18, $3B, $FF, $3B, $13,	$D, $F,	$25, $3B, $C, $1E, $1D,	$3B, $12, 1, $20, $3B, $1D
		dc.b 1,	$3B, $11, $F, $1D, $FF,	$FF, $3B, $13, $1D, $3B, 1, $1E, $1D, $24, $FF,	$3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
word_FFE05E:	dc.w 1
		dc.l byte_FFE068
		dc.l byte_FFE0B6
byte_FFE068:	dc.b 0,	$FF, $28, $13, $2D, $16, $16, $3B, $18,	$F, $F,	$E, $3B, $1C, 1, $17, $F, $1D, $12, $13
		dc.b $18, $11, $FF, $FF, $3B, $1D, 1, $3B, $10,	$16, $22, $3B, $1D, $12, $1B, 1, $1E, $11, $12,	$3B
		dc.b $1D, $12, $F, $FF,	$FF, $3B, $B, $13, $1B,	$3B, $12, $F, $1B, $F, $26, $FF, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
byte_FFE0B6:	dc.b 0,	$3B, $C, $1E, $1D, $3B,	$13, $3B, $D, $B, $18, $2D, $1D, $3B, $D, $B, $16, $16,	$3B, $17
		dc.b $22, $FF, $FF, $3B, $19, $16, $B, $18, $F,	$3B, $14, $1E, $1C, $1D, $3B, $10, 1, $1B, $FF,	$FF
		dc.b $3B, $1D, $12, $13, $1C, $26, $26,	$26, $29, $FF, $FF, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
word_FFE100:	dc.w 0
		dc.l byte_FFE106
byte_FFE106:	dc.b 0,	$FF, $3B, $E, 1, $18, $B, $16, $E, $3B,	$1D, $B, $15, $F, $1C, $3B, $1D, $12, $F, $FF
		dc.b $FF, $3B, $1F, $13, $15, $13, $18,	$11, $3B, $E, $13, $B, $1B, $22, $26, $FF, $FF,	$FF, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $38, $3B
word_FFE142:	dc.w 0
		dc.l byte_FFE148
byte_FFE148:	dc.b 0,	$FF, $3B, $13, $1D, $2D, $1C, $3B, $1D,	1, 1, $3B, $E, $B, $1B,	$15, $3B, $1D, 1, $FF
		dc.b $FF, $3B, $1B, $F,	$B, $E,	$3B, $13, $18, $3B, $12, $F, $1B, $F, $26, $FF,	$FF, $FF, $FF, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
word_FFE184:	dc.w 2
		dc.l byte_FFE192
		dc.l byte_FFE210
		dc.l byte_FFE24E
byte_FFE192:	dc.b 1,	$28, $E, 1, $18, $B, $16, $E, $27, $3B,	$13, $10, $3B, $22, 1, $1E, $3B, $20, $B, $18
		dc.b $1D, $3B, $1D, 1, $3B, $FF, $FF, $3B, $1C,	$B, $1F, $F, $3B, $22, 1, $1E, $1B, $3B, $18, $F
		dc.b $19, $12, $F, $20,	$1C, $27, $3B, $22, 1, $1E, $2D, $E, $FF, $3B, $C, $F, $1D, $1D, $F, $1B
		dc.b $3B, $11, $13, $1F, $F, $3B, $17, $F, $3B,	$1D, $12, $B, $1D, $3B,	$FF, $FF, $3B, $1D, $1B, $F
		dc.b $B, $1C, $1E, $1B,	$F, $3B, $17, $B, $19, $3B, $B,	$18, $E, $3B, $E, $13, $B, $1B,	$22, $25
		dc.b $29, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $38, $3B
byte_FFE210:	dc.b 0,	$FF, $3B, $28, $12, $F,	$16, $19, $25, $3B, $1E, $18, $D, $B, $3B, $E, 1, $18, $B, $16
		dc.b $E, $27, $FF, $FF,	$3B, $3B, $12, $F, $16,	$19, $25, $29, $FF, $FF, $FF, $FF, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38
		dc.b $3B
		align 2, 0
byte_FFE24E:	dc.b 0,	$FF, $3B, $28, 1, $26, $15, $26, $3B, $13, $2D,	$16, $16, $3B, $E, 1, $3B, $13,	$1D, $26
		dc.b $FF, $FF, $3B, $3B, $11, $13, $1F,	$F, $3B, $17, $F, $3B, $1D, $12, $F, $3B, $C, 1, $22, $1C
		dc.b $25, $29, $FF, $FF, $FF, $FF, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
word_FFE296:	dc.w 1
		dc.l byte_FFE2A0
		dc.l byte_FFE2D6
byte_FFE2A0:	dc.b 1,	$FF, $28, $13, $3B, 1, $10, $10, $F, $1B, $3B, $22, 1, $1E, $3B, $B, $FF, $FF, $3B, $D
		dc.b $12, $B, $16, $16,	$F, $18, $11, $F, $26, $FF, $FF, $FF, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $38, $3B
byte_FFE2D6:	dc.b 1,	$3B, $13, $10, $3B, $22, 1, $1E, $3B, $D, $B, $18, $3B,	$E, $F,	$10, $F, $B, $1D, $3B
		dc.b $1D, $12, $F, $FF,	$3B, $1D, $13, $11, $F,	$1B, $3B, $13, $18, $3B, $1D, $12, $F, $3B, $11, $B
		dc.b $1B, $E, $F, $18, $27, $3B, $FF, $3B, $13,	$2D, $16, $16, $3B, $1B, $F, $20, $B, $1B, $E, $3B
		dc.b $22, 1, $1E, $3B, $20, $13, $1D, $12, $3B,	$FF, $3B, $1D, $12, $13, $1C, $3B, $1C,	$19, $12, $13
		dc.b $18, $21, $3B, $1D, $F, $B, $1B, $26, $29,	$3B, $38, $3B
word_FFE332:	dc.w 0
		dc.l byte_FFE338
byte_FFE338:	dc.b 1,	$FF, $28, $B, $1C, $3B,	$13, $3B, $19, $1B, 1, $17, $13, $1C, $F, $E, $27, $3B,	$13, $3B
		dc.b $20, $13, $16, $16, $FF, $3B, $11,	$13, $1F, $F, $3B, $22,	1, $1E,	$3B, $1D, $12, $F, $3B,	$1C
		dc.b $19, $12, $13, $18, $21, $FF, $FF,	$3B, $1D, $F, $B, $1B, $26, $29, $FF, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$38, $3B
		align 2, 0
word_FFE386:	dc.w 0
		dc.l byte_FFE38C
byte_FFE38C:	dc.b 0,	$FF, $28, $1D, $12, $F,	$3B, $E, 1, 1, $1B, $3B, $13, $1C, $3B,	$D, $16, 1, $1C, $F
		dc.b $E, $FF, $FF, $3B,	$B, $18, $E, $3B, $13, $3B, $D,	$B, $18, $2D, $1D, $3B,	$11, 1,	$FF, $FF
		dc.b $3B, $13, $18, $1C, $13, $E, $F, $26, $29,	$FF, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $38, $3B
word_FFE3D4:	dc.w 0
		dc.l byte_FFE3DA
byte_FFE3DA:	dc.b 0,	$FF, $3B, $E, 1, $18, $B, $16, $E, $3B,	$11, $F, $1D, $1C, $3B,	$1D, $12, $F, $FF, $FF
		dc.b $3B, $1C, $D, $F, $19, $1D, $F, $1B, $3B, 1, $10, $3B, $1B, $B, $26, $FF, $FF, $FF, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $38, $3B
word_FFE416:	dc.w 0
		dc.l byte_FFE41C
byte_FFE41C:	dc.b 0,	$FF, $E, 1, $18, $B, $16, $E, $3B, $11,	$F, $1D, $1C, $3B, $1D,	$12, $F, $3B, $1F, $13
		dc.b $15, $13, $18, $11, $FF, $E, $13, $B, $1B,	$22, $3B, $C, $B, $D, $15, $26,	$FF, $FF, $FF, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38
		dc.b $3B
		align 2, 0
word_FFE45A:	dc.w 0
		dc.l byte_FFE460
byte_FFE460:	dc.b 0,	$FF, $3B, $13, $1D, $2D, $1C, $3B, $1D,	$12, $F, $3B, $B, $18, $D, $13,	$F, $18, $1D, $FF
		dc.b $FF, $3B, $1F, $13, $15, $13, $18,	$11, $3B, $E, $13, $B, $1B, $22, $26, $FF, $FF,	$3B, $1D, $12
		dc.b $F, $3B, $E, $13, $B, $1B,	$22, $3B, $1B, $F, $1F,	$F, $B,	$16, $1C, $FF, $FF, $3B, $1D, $12
		dc.b $B, $1D, $3B, $1D,	$12, $F, $3B, $17, $B, $19, $3B, $17, $1E, $1C,	$1D, $FF, $FF, $3B, $C,	$F
		dc.b $3B, $E, $13, $19,	$19, $F, $E, $3B, $13, $18, $3B, $20, $B, $1D, $F, $1B,	$26, $FF, $3B, $20
		dc.b $12, $F, $18, $3B,	$1D, $12, $13, $1C, $3B, $13, $1C, $3B,	$E, 1, $18, $F,	$27, $3B, $FF, $3B
		dc.b $1D, $12, $F, $3B,	$16, 1,	$D, $B,	$1D, $13, 1, $18, $3B, 1, $10, $FF, $FF, $3B, $1D, $12
		dc.b $F, $3B, $1B, $F, $B, $16,	$3B, $1D, $1B, $F, $B, $1C, $1E, $1B, $F, $FF, $FF, $3B, $20, $13
		dc.b $16, $16, $3B, $B,	$19, $19, $F, $B, $1B, $26, $FF, $FF, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $38, $FF
word_FFE520:	dc.w 0
		dc.l byte_FFE526
byte_FFE526:	dc.b 0,	$FF, $28, $16, $F, $1D,	$2D, $1C, $3B, $1D, $1B, $22, $3B, $E, $13, $19, $19, $13, $18,	$11
		dc.b $3B, $13, $1D, $3B, $FF, $3B, $13,	$18, $3B, $20, $B, $1D,	$F, $1B, $26, $29, $FF,	$FF, $FF, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38
		dc.b $3B
		align 2, 0
word_FFE564:	dc.w 0
		dc.l byte_FFE56A
byte_FFE56A:	dc.b 0,	$FF, $3B, $28, $16, $F,	$1D, $2D, $1C, $3B, $11, 1, $3B, $1D, 1, $3B, $1D, $12,	$F, $FF
		dc.b $FF, $3B, $3B, $11, $1B, $F, $B, $1D, $3B,	$E, $1E, $D, $15, $3B, $1D, $1B, $F, $B, $1C, $1E
		dc.b $1B, $F, $3B, $FF,	$3B, $3B, $13, $1C, $16, $B, $18, $E, $26, $29,	$FF, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$38, $3B
		align 2, 0
word_FFE5B8:	dc.w 0
		dc.l byte_FFE5BE
byte_FFE5BE:	dc.b 1,	$28, $10, $13, $18, $B,	$16, $16, $22, $27, $3B, $1C, 1, $17, $F, 1, $18, $F, $3B, $20
		dc.b $12, 1, $3B, $FF, $3B, $13, $1C, $3B, $20,	1, $1B,	$1D, $12, $22, $3B, 1, $10, $3B, $1D, $12
		dc.b $F, $FF, $FF, $3B,	$1D, $1B, $F, $B, $1C, $1E, $1B, $F, $26, $29, $FF, $FF, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
word_FFE60C:	dc.w 0
		dc.l byte_FFE612
byte_FFE612:	dc.b 0,	$3B, $28, 1, $12, $3B, $17, $22, $3B, $11, 1, $1C, $12,	$25, $3B, $13, $1D, $3B, $13, $1C
		dc.b $FF, $FF, $3B, $3B, $14, $1E, $1C,	$1D, $3B, $B, $3B, $19,	$16, $B, $13, $18, $3B,	$1C, $1D, 1
		dc.b $18, $F, $FF, $FF,	$3B, $3B, $10, $13, $11, $1E, $1B, $13,	$18, $F, $3B, 1, $10, $3B, $B, $3B
		dc.b $E, $1E, $D, $15, $FF, $FF, $3B, $3B, $19,	$1B, $13, $18, $D, $F, $1C, $1C, $25, $25, $29,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $38,	$3B
word_FFE66A:	dc.w 0
		dc.l byte_FFE670
byte_FFE670:	dc.b 1,	$28, $13, $10, $3B, $22, 1, $1E, $3B, $E, $F, $10, $F, $B, $1D,	$3B, $17, $F, $27, $FF
		dc.b $FF, $3B, $13, $2D, $16, $16, $3B,	$11, $13, $1F, $F, $3B,	$22, 1,	$1E, $3B, $1D, $12, $F,	$3B
		dc.b $17, $B, $19, $FF,	$3B, $B, $18, $E, $3B, $1D, $12, $F, $3B, $1F, $13, $15, $13, $18, $11,	$3B
		dc.b $E, $13, $B, $1B, $22, $26, $FF, $3B, $12,	$B, $27, $12, $B, $27, $12, $B,	$27, $26, $26, $26
		dc.b $29, $3B, $3B, $3B, $3B, $3B, $3B,	$38, $3B
		align 2, 0
word_FFE6CA:	dc.w 1
		dc.l byte_FFE6D4
		dc.l byte_FFE714
byte_FFE6D4:	dc.b 0,	$3B, $28, $20, $F, $2D,	$1B, $F, $3B, $1C, 1, $1B, $1B,	$22, $3B, $1E, $18, $D,	$B, $FF
		dc.b $FF, $3B, $3B, $E,	1, $18,	$B, $16, $E, $26, $26, $26, $29, $FF, $FF, $FF,	$FF, $FF, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $38, $3B
		align 2, 0
byte_FFE714:	dc.b 0,	$FF, $28, $16, $F, $1D,	$2D, $1C, $3B, $12, $1E, $1B, $1B, $22,	$3B, $C, $B, $D, $15, $3B
		dc.b $1D, 1, $3B, 1, $1E, $1B, $3B, $FF, $3B, $B, $13, $1B, $19, $16, $B, $18, $F, $3B,	$B, $18
		dc.b $E, $3B, $D, $12, $B, $1C,	$F, $3B, $B, $10, $1D, $F, $1B,	$FF, $3B, $19, $F, $1D,	$F, $3B
		dc.b $1D, 1, $3B, $1D, $B, $15,	$F, $3B, $C, $B, $D, $15, $3B, $1D, $12, $F, $FF, $FF, $3B, $E
		dc.b $13, $B, $1B, $22,	$3B, $B, $18, $E, $3B, $17, $B,	$19, $26, $29, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $38, $FF
		align 2, 0
word_FFE77C:	dc.w 0
		dc.l byte_FFE782
byte_FFE782:	dc.b 0,	$3B, $E, 1, $18, $B, $16, $E, $3B, $1D,	$B, $15, $F, $1C, $3B, $1D, $12, $F, $FF, $FF
		dc.b $3B, $1F, $13, $15, $13, $18, $11,	$3B, $15, $F, $22, $26,	$3B, $FF, $FF, $FF, $FF, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
word_FFE7BE:	dc.w 0
		dc.l byte_FFE7C4
byte_FFE7C4:	dc.b 1,	$28, $22, 1, $1E, $3B, $12, $B,	$1F, $F, $3B, $F, $18, 1, $1E, $11, $12, $FF, $FF, $3B
		dc.b $C, $1E, $C, $C, $16, $F, $11, $1E, $17, $3B, $B, $17, $17, 1, $26, $29, $FF, $FF,	$FF, $FF
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $38, $3B
word_FFE802:	dc.w 0
		dc.l byte_FFE808
byte_FFE808:	dc.b 1,	$FF, $28, $13, $2D, $17, $3B, $1C, 1, $1B, $1B,	$22, $27, $3B, $C, $1E,	$1D, $3B, $FF, $FF
		dc.b $3B, $13, $3B, $E,	1, $18,	$2D, $1D, $3B, $15, $18, 1, $20, $3B, $B, $C, 1, $1E, $1D, $FF
		dc.b $FF, $3B, $1D, $12, $F, $3B, $1F, $13, $15, $13, $18, $11,	$3B, $E, $13, $B, $1B, $22, $FF, $FF
		dc.b $3B, $B, $18, $22,	$17, 1,	$1B, $F, $26, $29, $FF,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
word_FFE866:	dc.w 0
		dc.l byte_FFE86C
byte_FFE86C:	dc.b 0,	$FF, $3B, $3B, $E, 1, $18, $B, $16, $E,	$3B, $1D, $B, $15, $F, $1C, $3B, $1D, $12, $F
		dc.b $FF, $FF, $3B, $3B, $12, $F, $1B, 1, $3B, $15, $F,	$22, $26, $FF, $FF, $FF, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
word_FFE8A6:	dc.w 0
		dc.l byte_FFE8AC
byte_FFE8AC:	dc.b 0,	$FF, $3B, $E, 1, $18, $B, $16, $E, $3B,	$11, $F, $1D, $1C, $3B,	$1D, $12, $F, $FF, $FF
		dc.b $3B, $1C, $19, $12, $13, $18, $21,	$3B, $1D, $F, $B, $1B, $26, $FF, $FF, $FF, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
word_FFE8E6:	dc.w 0
		dc.l byte_FFE8EC
byte_FFE8EC:	dc.b 0,	$FF, $3B, $E, 1, $18, $B, $16, $E, $3B,	$1D, $B, $15, $F, $1C, $3B, $1D, $12, $F, $FF
		dc.b $FF, $3B, $11, $1B, $F, $F, $18, $3B, $19,	$16, $1E, $18, $11, $F,	$1B, $26, $FF, $FF, $FF, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38
		dc.b $3B
		align 2, 0
word_FFE92A:	dc.w 0
		dc.l byte_FFE930
byte_FFE930:	dc.b 0,	$FF, $3B, $E, 1, $18, $B, $16, $E, $3B,	$1D, $B, $15, $F, $1C, $3B, $1D, $12, $F, $FF
		dc.b $FF, $3B, $C, $1E,	$C, $C,	$16, $F, $11, $1E, $17,	$3B, $B, $17, $17, 1, $26, $FF,	$FF, $FF
		dc.b $FF, $FF, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $38, $3B
word_FFE970:	dc.w 5
		dc.l byte_FFDB90
		dc.l byte_FFDBD8
		dc.l byte_FFDC0E
		dc.l byte_FFDC76
		dc.l byte_FFDCF8
		dc.l byte_FFE98A
byte_FFE98A:	dc.b 1,	$FF, $3B, $28, $19, $16, $F, $B, $1C, $F, $3B, $11, 1, $3B, $13, $18, $1C, $13,	$E, $F
		dc.b $FF, $FF, $3B, $3B, $1D, $12, $F, $3B, $1C, $12, $13, $19,	$3B, $B, $18, $E, $3B, $11, $F,	$1D
		dc.b $3B, $1B, $13, $E,	$FF, $3B, $3B, 1, $10, $3B, $1D, $12, $F, $3B, $11, $12, 1, $1C, $1D, $1C
		dc.b $26, $29, $FF, $FF, $FF, $FF, $FF,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$38, $3B
		align 2, 0
word_FFE9E4:	dc.w 0
word_FFE9E6:	dc.w 0
word_FFE9E8:	dc.w 0
word_FFE9EA:	dc.w 0
word_FFE9EC:	dc.w 0
word_FFE9EE:	dc.w 0
		dc.l byte_FFE9F4
byte_FFE9F4:	dc.b 1,	$17, $F, $1C, $1C, $B, $11, $F,	$3B, $18, 1, 5,	8, $FF
word_FFEA02:	dc.w 0
		dc.l byte_FFEA08
byte_FFEA08:	dc.b 1,	$17, $F, $1C, $1C, $B, $11, $F,	$3B, $18, 1, 5,	9, $FF
word_FFEA16:	dc.w 0
		dc.l byte_FFEA1C
byte_FFEA1C:	dc.b 1,	$17, $F, $1C, $1C, $B, $11, $F,	$3B, $18, 1, 5,	$A, $FF
word_FFEA2A:	dc.w 0
		dc.l byte_FFEA30
byte_FFEA30:	dc.b 0,	$FF, $3B, $13, $1D, $2D, $1C, $3B, $1D,	$12, $F, $3B, $12, $F, $1B, 1, $3B, $15, $F, $22
		dc.b $26, $3B, $FF, $FF, $FF, $FF, $FF,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
word_FFEA60:	dc.w 0
		dc.l byte_FFEA66
byte_FFEA66:	dc.b 0,	$FF, $3B, $13, $1D, $2D, $1C, $3B, $1D,	$12, $F, $3B, $1F, $13,	$15, $13, $18, $11, $FF, $FF
		dc.b $3B, $15, $F, $22,	$26, $FF, $FF, $FF, $FF, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$38, $3B
		align 2, 0
word_FFEA98:	dc.w 0
		dc.l byte_FFEA9E
byte_FFEA9E:	dc.b 0,	$FF, $3B, $13, $1D, $2D, $1C, $3B, $1D,	$12, $F, $3B, $1C, $19,	$12, $13, $18, $21, $FF, $FF
		dc.b $3B, $1D, $F, $B, $1B, $26, $FF, $FF, $FF,	$FF, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $38, $3B
word_FFEAD0:	dc.w 0
		dc.l byte_FFEAD6
byte_FFEAD6:	dc.b 0,	$FF, $3B, $13, $1D, $2D, $1C, $3B, $1D,	$12, $F, $3B, $1C, $D, $F, $19,	$1D, $F, $1B, $FF
		dc.b $FF, $3B, 1, $10, $3B, $1B, $B, $26, $FF, $FF, $FF, $FF, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $38, $3B
word_FFEB0A:	dc.w 0
		dc.l byte_FFEB10
byte_FFEB10:	dc.b 0,	$FF, $3B, $13, $1D, $2D, $1C, $3B, $1D,	1, 1, $3B, $E, $B, $1B,	$15, $3B, $1D, 1, $FF
		dc.b $FF, $3B, $1B, $F,	$B, $E,	$3B, $13, $18, $3B, $12, $F, $1B, $F, $26, $FF,	$FF, $FF, $FF, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
word_FFEB4C:	dc.w 0
		dc.l byte_FFEB52
byte_FFEB52:	dc.b 0,	$FF, $3B, $13, $1D, $2D, $1C, $3B, $1D,	$12, $F, $3B, $B, $18, $D, $13,	$F, $18, $1D, $FF
		dc.b $FF, $3B, $1F, $13, $15, $13, $18,	$11, $3B, $E, $13, $B, $1B, $22, $26, $FF, $FF,	$3B, $1D, $12
		dc.b $F, $3B, $E, $13, $B, $1B,	$22, $3B, $1B, $F, $1F,	$F, $B,	$16, $1C, $FF, $FF, $3B, $1D, $12
		dc.b $B, $1D, $3B, $1D,	$12, $F, $3B, $17, $B, $19, $3B, $17, $1E, $1C,	$1D, $FF, $FF, $3B, $C,	$F
		dc.b $3B, $E, $13, $19,	$19, $F, $E, $3B, $13, $18, $3B, $20, $B, $1D, $F, $1B,	$26, $FF, $3B, $20
		dc.b $12, $F, $18, $3B,	$1D, $12, $13, $1C, $3B, $13, $1C, $3B,	$E, 1, $18, $F,	$27, $3B, $FF, $3B
		dc.b $1D, $12, $F, $3B,	$16, 1,	$D, $B,	$1D, $13, 1, $18, $3B, 1, $10, $FF, $FF, $3B, $1D, $12
		dc.b $F, $3B, $1B, $F, $B, $16,	$3B, $1D, $1B, $F, $B, $1C, $1E, $1B, $F, $FF, $FF, $3B, $20, $13
		dc.b $16, $16, $3B, $B,	$19, $19, $F, $B, $1B, $26, $3B, $3B, $38, $FF,	$FF, $FF
word_FFEC02:	dc.w 0
		dc.l byte_FFEC08
byte_FFEC08:	dc.b 0,	$FF, $3B, $22, 1, $1E, $3B, $D,	$B, $18, $2D, $1D, $FF,	$FF, $3B, $D, 1, $17, $17, $1E
		dc.b $18, $13, $D, $B, $1D, $F,	$3B, $20, $13, $1D, $12, $FF, $FF, $3B,	$1D, $12, $F, $3B, $B, $13
		dc.b $1B, $19, $16, $B,	$18, $F, $3B, $10, $1B,	1, $17,	$FF, $FF, $3B, $12, $F,	$1B, $F, $26, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
word_FFEC52:	dc.w 0
		dc.l byte_FFEC58
byte_FFEC58:	dc.b 0,	$FF, $3B, $22, 1, $1E, $3B, $D,	$B, $18, $2D, $1D, $3B,	$1E, $1C, $F, $3B, $13,	$1D, $FF
		dc.b $FF, $3B, $12, $F,	$1B, $F, $26, $FF, $FF,	$FF, $FF, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
word_FFEC8C:	dc.w 0
		dc.l byte_FFEC92
byte_FFEC92:	dc.b 0,	$FF, $3B, $E, 1, $18, $B, $16, $E, $3B,	$1E, $1C, $F, $E, $3B, $13, $1D, $2F, $2F, $2F
		dc.b $FF, $FF, $FF, $FF, $FF, $FF, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $38, $3B
word_FFECC0:	dc.w 0
		dc.l byte_FFECC6
byte_FFECC6:	dc.b 0,	$17, $F, $1C, $1C, $B, $11, $F,	$3B, $18, 1, 6,	$A, $FF
word_FFECD4:	dc.w 0
		dc.l byte_FFECDA
byte_FFECDA:	dc.b 0,	$28, $20, 1, $20, $25, $3B, $1D, $12, $13, $1C,	$3B, $13, $1C, $3B, $1D, $12, $F, $FF, $FF
		dc.b $3B, $10, $B, $17,	1, $1E,	$1C, $3B, $E, $1B, $B, $D, $1E,	$16, $B, $2D, $1C, $FF,	$FF, $3B
		dc.b $D, $B, $1C, $1D, $16, $F,	$2F, $2F, $2F, $29, $FF, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $38, $3B
		align 2, 0
word_FFED22:	dc.w 0
		dc.l byte_FFED28
byte_FFED28:	dc.b 0,	$FF, $3B, $28, $20, 1, $20, $25, $3B, $1D, $12,	$13, $1C, $3B, $13, $1C, $3B, $1D, $12,	$F
		dc.b $FF, $FF, $3B, $3B, $C, $13, $11, $3B, $17, $B, $12, $B, $1B, $B, $14, $B,	$12, $2D, $1C, $3B
		dc.b $FF, $FF, $3B, $3B, $19, $B, $16, $B, $D, $F, $2F,	$2F, $2F, $29, $FF, $FF, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $38,	$3B
word_FFED74:	dc.w 0
		dc.l byte_FFED7A
byte_FFED7A:	dc.b 0,	$FF, $3B, $E, 1, $18, $B, $16, $E, $3B,	$1D, $B, $15, $F, $1C, $3B, $1D, $12, $F, $3B
		dc.b $18, 1, $1D, $F, $FF, $3B,	$B, $18, $E, $3B, $1B, $F, $E, $3B, $19, $16, $1E, $18,	$11, $F
		dc.b $1B, $26, $FF, $FF, $FF, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B
		dc.b $3B, $3B, $3B, $3B, $3B, $38, $3B
		align 2, 0
