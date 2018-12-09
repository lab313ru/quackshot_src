    cpu 68000
    supmode on
    padding off
    include "qs_structs.inc"
    include "qs_equals.inc"
    include "qs_rams.inc"
    include "qs_externs.inc"
    include "qs_funcs.inc"

; segment "ROM"
; ROM segment
vectors:	dc.l rand_seed
		dc.l Reset
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Check
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l VBLANK
		dc.l Reserv3F
		dc.l do_raw_copy_data
		dc.l do_decompress_nemesis_to_vram
		dc.l do_decompress_nemesis_to_ram
		dc.l do_decompress_enigma_to_ram
		dc.l do_decompress_kosinski_to_ram
		dc.l do_copy_4_palettes_to_ram
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
		dc.l Reserv3F
header:		dc.b $53, $45, $47, $41, $20, $4D, $45,	$47, $41, $20, $44, $52, $49, $56, $45,	$20, $28, $43, $29, $53
		dc.b $45, $47, $41, $20, $31, $39, $39,	$31, $2E, $53, $45, $50
		dc.b $49, $20, $4C, $4F, $56, $45, $20,	$44, $4F, $4E, $41, $4C, $44, $20, $44,	$55, $43, $4B, $20, $47
		dc.b $55, $52, $55, $5A, $49, $41, $20,	$4F, $48, $20, $4E, $4F, $48, $49, $48,	$4F, $55, $20, $20, $20
		dc.b $20, $20, $20, $20, $20, $20, $20,	$20
		dc.b $51, $55, $41, $43, $4B, $20, $53,	$48, $4F, $54, $20, $53, $54, $41, $52,	$52, $49, $4E, $47, $20
		dc.b $44, $4F, $4E, $41, $4C, $44, $20,	$44, $55, $43, $4B, $20, $20, $20, $20,	$20, $20, $20, $20, $20
		dc.b $20, $20, $20, $20, $20, $20, $20,	$20
		dc.b $47, $4D, $20, $30, $30, $30, $30,	$34, $30, $35, $34, $2D, $30, $31
word_18E:	dc.w $A4B3
		dc.b $4A, $20, $20, $20, $20, $20, $20,	$20, $20, $20, $20, $20, $20, $20, $20,	$20
		dc.l 0
		dc.l rom_end
		dc.l M68K_RAM
		dc.l unk_FFFFFF
		dc.b $20, $20, $20, $20, $20, $20, $20,	$20, $20, $20, $20, $20
		dc.b $20, $20, $20, $20, $20, $20, $20,	$20, $20, $20, $20, $20
		dc.b $20, $20, $20, $20, $20, $20, $20,	$20, $20, $20, $20, $20, $20, $20, $20,	$20, $20, $20, $20, $20
		dc.b $20, $20, $20, $20, 0, 4, 0, 0, 0,	$F, $FF, $FF, $20, $20,	$20, $20, $20, $20, $20, $20
		dc.b $4A, $55, $45, $20, $20, $20, $20,	$20, $20, $20, $20, $20, $20, $20, $20,	$20
Reserv3F:
		nop
		nop
		bra.s	Reserv3F

Reset:
		tst.l	(IO_CT1_CTRL).l
		bne.s	loc_214
		tst.w	(IO_EXT_CTRL).l

loc_214:
		bne.s	loc_292
		lea	word_294(pc),a5
		movem.w	(a5)+,d5-d7
		movem.l	(a5)+,a0-a4
		move.b	-$10FF(a1),d0
		andi.b	#$F,d0
		beq.s	loc_234
		move.l	#$53454741,$2F00(a1)

loc_234:
		move.w	(a4),d0
		moveq	#0,d0
		movea.l	d0,a6
		move	a6,usp
		moveq	#23,d1

loc_23E:
		move.b	(a5)+,d5
		move.w	d5,(a4)
		add.w	d7,d5
		dbf	d1,loc_23E
		move.l	(a5)+,(a4)
		move.w	d0,(a3)
		move.w	d7,(a1)
		move.w	d7,(a2)

loc_250:
		btst	d0,(a1)
		bne.s	loc_250
		moveq	#37,d2

loc_256:
		move.b	(a5)+,(a0)+
		dbf	d2,loc_256
		move.w	d0,(a2)
		move.w	d0,(a1)
		move.w	d7,(a2)

loc_262:
		move.l	d0,-(a6)
		dbf	d6,loc_262
		move.l	(a5)+,(a4)
		move.l	(a5)+,(a4)
		moveq	#$1F,d3

loc_26E:
		move.l	d0,(a3)
		dbf	d3,loc_26E
		move.l	(a5)+,(a4)
		moveq	#$13,d4

loc_278:
		move.l	d0,(a3)
		dbf	d4,loc_278
		moveq	#3,d5

loc_280:
		move.b	(a5)+,$11(a3)
		dbf	d5,loc_280
		move.w	d0,(a2)
		movem.l	(a6),d0-a6
		move	#$2700,sr

loc_292:
		bra.s	loc_300
word_294:	dc.w $8000
		dc.w $3FFF	
		dc.w $100	
		dc.l Z80_RAM		; a0
		dc.l IO_Z80BUS		; a1
		dc.l IO_Z80RES		; a2
		dc.l VDP_DATA		; a3
		dc.l VDP_CTRL		; a4
		dc.b   4,$14,$30,$3C,  7,$6C,  0,  0
		dc.b   0,  0,$FF,  0,$81,$37,  0,  1
		dc.b   1,  0,  0,$FF,$FF,  0,  0,$80
		dc.l $40000080
init_z80_driver:
    binclude "src/init_z80.bin"
    align 2, 0
		dc.l $81048F02
		dc.l $C0000000
		dc.l $40000010
		dc.b $9F,$BF,$DF,$FF

loc_300:
		tst.w	(VDP_CTRL).l

loc_306:
		nop
		nop
		move.w	(VDP_CTRL).l,d0
		btst	#1,d0
		bne.s	loc_306
		move.b	(IO_PCBVER+1).l,d0
		move.b	d0,(pcb_ver).w
		andi.b	#$F,d0
		beq.s	loc_330
		move.l	#$53454741,($A14000).l

loc_330:
		lea	dword_4E4(pc),a6
		movem.l	(a6),d0-d3
		movem.l	(a6),d4-d7
		movem.l	(a6),a0-a3
		movem.l	(a6),a4-a6
		move	sr,-(sp)
		move	#$2700,sr
		move.w	#$100,(IO_Z80BUS).l
		move.w	#$100,(IO_Z80RES).l

loc_35A:
		btst	#0,(IO_Z80BUS).l
		bne.s	loc_35A
		lea	(Z80_RAM).l,a1
		move.b	#$F3,(a1)+
		move.b	#$F3,(a1)+
		move.b	#$C3,(a1)+
		move.b	#0,(a1)+
		move.b	#0,(a1)+
		move.w	#0,(IO_Z80RES).l
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		nop
		move.w	#0,(IO_Z80BUS).l
		move.w	#$100,(IO_Z80RES).l
		move	(sp)+,sr
		moveq	#-1,d0
		move.b	d0,(VDP_PSG).l
		nop
		nop
		subi.b	#$20,d0
		move.b	d0,(VDP_PSG).l
		nop
		nop
		subi.b	#$20,d0
		move.b	d0,(VDP_PSG).l
		nop
		nop
		subi.b	#$20,d0
		move.b	d0,(VDP_PSG).l
		lea	(VDP_CTRL).l,a5
		lea	(VDP_DATA).l,a6
		btst	#6,(IO_EXT_CTRL+1).l
		bne.s	loc_44E
		jsr	check_crc(pc)
		move.b	(pcb_ver).w,d0
		lea	(rand_seed).l,a1
		moveq	#0,d1
		jsr	fill_ram_128_bytes ; d1	= dword
		jsr	fill_ram_128_bytes ; d1	= dword
		move.w	#$9C00,(word_FFFF10).w
		move.w	#$810,(word_FFFF12).w
		move.w	#$1000,(word_FFFF14).w
		move.b	d0,(pcb_ver).w
		btst	#PAL_OR_NTSC,d0
		bne.s	is_pal_mode
		move.w	#$8134,(disable_display).w
		move.w	#$8174,(enable_display).w
		bra.s	loc_44E

is_pal_mode:
		move.w	#$813C,(disable_display).w
		move.w	#$817C,(enable_display).w

loc_44E:
		lea	(VDP_CTRL).l,a5
		lea	(VDP_DATA).l,a6
		jsr	clear_ram_0000_fd00(pc)
		move.w	#0,(word_FFFF20).w
		btst	#USA_EUROPE_JAPAN,(pcb_ver).w
		sne	(is_usa_europe_version).w
		jsr	init_joypads(pc)
		jsr	clear_vram_cram_vsram(pc)
		jsr	init_sound_type1
		move.w	#INIT_SHOW_SEGA_LOGO,(init_step).w

init_steps_loop:
		moveq	#0,d0
		move.b	(init_step+1).w,d0
		add.w	d0,d0
		add.w	d0,d0
		movea.l	tbl_init_funcs(pc,d0.w),a0
		jsr	(a0)
		moveq	#0,d7

loc_494:
		jsr	wait_for_vblank
		dbf	d7,loc_494
		bra.s	init_steps_loop

tbl_init_funcs:	dc.l show_sega_logo
		dc.l sub_A4CC
		dc.l sub_9CB2
		dc.l sub_4670
		dc.l sub_46A0
		dc.l sub_47CE
		dc.l sub_49CE
		dc.l sub_4A7A
		dc.l sub_7CE
		dc.l sub_A3A8
		dc.l sub_A1C6
		dc.l sub_4ACA
		dc.l sub_5068
		dc.l red_inf_screen
		dc.l sub_4658
		dc.l sub_48D2
		dc.l sub_4924
dword_4E4:	dc.l 0,	0, 0, 0

check_crc:
    lea	($200).w,a0
    lea	(rom_end).l,a1
    move.l  a1,d0
    moveq   #0,d1
loc_516:
		add.w	(a0)+,d1
		cmp.l	a0,d0
		bcc.s	loc_516
		movea.l	#word_18E,a1
		cmp.w	(a1),d1
		bne.s	red_inf_screen
		rts

red_inf_screen:
		move.l	d1,-(sp)
		jsr	init_joypads(pc)
		move.l	(sp)+,d1
		move.l	#$C0000000,(a5)
		moveq	#$3F,d7
		moveq	#$E,d6

loc_53A:
		move.w	d6,(VDP_DATA).l
		dbf	d7,loc_53A

loc_544:
		bra.s	loc_544

Check:
		move.l	(dword_FFEF08).w,2(sp)
		rte

VBLANK:
		movem.l	d0-a6,-(sp)
		tst.b	(vblank_active_flag).w
		beq.w	exit_vblank
		move.b	#0,(vblank_active_flag).w
		move.w	(a5),d0
		bclr	#0,(cram_update_needed).w
		beq.s	loc_59A
		jsr	request_z80_bus
		move.l	#$93409400,(a5)
		move.l	#$95C096FA,(a5)
		move.w	#$977F,(a5)
		move.w	#$C000,(a5)
		move.w	#$80,-(sp)
		move.w	(sp)+,(a5)
		move.l	#$C0000000,(a5)
		move.w	(ram_palette_0).w,(a6)
		jsr	release_z80_bus

loc_59A:
		move.w	(vblank_sub_index).w,d0
		add.w	d0,d0
		add.w	d0,d0
		jmp	tbl_vblank_subs(pc,d0.w)

tbl_vblank_subs:
		bra.w	send_sprites_to_vram
		bra.w	loc_5F6
		bra.w	loc_5FA
		bra.w	loc_63C
		bra.w	loc_790
		bra.w	loc_756

send_sprites_to_vram:
		jsr	request_z80_bus
		move.l	#$93409401,(a5)
		move.l	#$958096F9,(a5)
		move.w	#$977F,(a5)
		move.w	#$5400,(a5)
		move.w	#$83,-(sp)
		move.w	(sp)+,(a5)
		move.l	#$54000003,(a5)
		move.w	(sprites_ram).w,(a6)
		jsr	release_z80_bus
		jsr	sub_28DC(pc)
		bra.w	loc_790

loc_5F6:
		jsr	sub_6084(pc)

loc_5FA:
		jsr	request_z80_bus
		move.l	#$93409401,(a5)
		move.l	#$958096F9,(a5)
		move.w	#$977F,(a5)
		move.w	#$5400,(a5)
		move.w	#$83,-(sp)
		move.w	(sp)+,(a5)
		move.l	#$54000003,(a5)
		move.w	(sprites_ram).w,(a6)
		jsr	release_z80_bus
		jsr	sub_28DC(pc)
		jsr	sub_4218(pc)
		jsr	(sub_DD6).l
		bra.w	loc_790

loc_63C:
		cmpi.w	#1,(init_step).w
		bne.s	loc_676
		jsr	request_z80_bus
		move.l	#$93409401,(a5)
		move.l	#$958096F9,(a5)
		move.w	#$977F,(a5)
		move.w	#$7400,(a5)
		move.w	#$82,-(sp)
		move.w	(sp)+,(a5)
		move.l	#$74000002,(a5)
		move.w	(sprites_ram).w,(a6)
		jsr	release_z80_bus
		bra.s	loc_6A6

loc_676:
		jsr	request_z80_bus
		move.l	#$93409401,(a5)
		move.l	#$958096F9,(a5)
		move.w	#$977F,(a5)
		move.w	#$5400,(a5)
		move.w	#$83,-(sp)
		move.w	(sp)+,(a5)
		move.l	#$54000003,(a5)
		move.w	(sprites_ram).w,(a6)
		jsr	release_z80_bus

loc_6A6:
		bclr	#0,(byte_FFFC00).w
		beq.s	loc_6E8
		move.w	#$8F01,(a5)
		jsr	request_z80_bus
		move.l	#$93FF941F,(a5)
		move.w	#$9780,(a5)
		move.l	#$40000083,(a5)
		move.w	#0,(a6)

loc_6CC:
		btst	#1,1(a5)
		bne.s	loc_6CC
		move.l	#$40000003,(a5)
		move.w	#0,(a6)
		jsr	release_z80_bus
		move.w	#$8F02,(a5)

loc_6E8:
		move.l	#$40000010,(a5)
		move.w	(planea_start_y).w,(a6)
		move.w	(planeb_start_y).w,(a6)
		tst.b	(byte_FFFC06).w
		bne.s	loc_736
		move.w	#$8F20,(a5)
		move.l	#$70000002,(a5)
		move.w	(planea_start_x).w,d1
		neg.w	d1
		jsr	send_18_words_to_vdp(pc) ; d1 =	word
		tst.b	(byte_FFFC04).w
		bne.s	loc_718
		moveq	#0,d1

loc_718:
		jsr	send_10_words_to_vdp(pc) ; d1 =	word
		move.l	#$70020002,(a5)
		move.w	(planeb_start_x).w,d1
		neg.w	d1
		jsr	send_18_words_to_vdp(pc) ; d1 =	word
		jsr	send_10_words_to_vdp(pc) ; d1 =	word
		move.w	#$8F02,(a5)
		bra.s	loc_74C

loc_736:
		move.l	#$50000003,(a5)
		move.w	(planea_start_x).w,d1
		neg.w	d1
		move.w	d1,(a6)
		move.w	(planeb_start_x).w,d1
		neg.w	d1
		move.w	d1,(a6)

loc_74C:
		jsr	(sub_6084).l
		bra.w	loc_790

loc_756:
		jsr	request_z80_bus
		move.l	#$93409401,(a5)
		move.l	#$958096F9,(a5)
		move.w	#$977F,(a5)
		move.w	#$5400,(a5)
		move.w	#$83,-(sp)
		move.w	(sp)+,(a5)
		move.l	#$54000003,(a5)
		move.w	(sprites_ram).w,(a6)
		jsr	release_z80_bus
		jsr	(sub_4FD2).l
		bra.w	*+4

loc_790:
		bsr.w	sub_214E
		tst.w	(word_FF8F28).w
		beq.s	loc_79E
		subq.w	#1,(word_FF8F28).w

loc_79E:
		addq.w	#1,(word_FF8F2A).w

exit_vblank:
		movem.l	(sp)+,d0-a6
		rte
; d1 = word

send_18_words_to_vdp:
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
; d1 = word

send_10_words_to_vdp:
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		move.w	d1,(a6)
		rts

sub_7CE:
		jsr	(sub_1060).l
		move.w	(word_FF8FA4).w,d0
		add.w	d0,d0
		lea	off_7E4(pc),a1
		adda.w	(a1,d0.w),a1
		jmp	(a1)

off_7E4:	dc.w sub_8AE-off_7E4
		dc.w sub_7EA-off_7E4
		dc.w sub_81E-off_7E4
sub_7EA:
		jsr	sub_C3C(pc)
		jsr	sub_B24(pc)
		jsr	sub_B80(pc)
		jsr	sub_DD6(pc)
		move.b	(word_FF8FB0+1).w,d5
		btst	#7,d5
		bne.w	loc_810
		andi.b	#$60,d5
		bne.w	sub_D02
		rts

loc_810:
		cmpi.w	#3,(word_FF8F9C).w
		bcc.w	loc_D9C
		bra.w	sub_D02

sub_81E:
		btst	#7,(word_FF8FB0+1).w
		bne.w	loc_D9C
		jsr	sub_C3C(pc)
		move.b	(word_FF8FB0+1).w,d0
		btst	#4,d0
		bne.s	loc_854
		btst	#6,d0
		bne.s	loc_860
		btst	#5,d0
		bne.s	loc_860
		andi.b	#3,d0
		beq.s	loc_84E
		bchg	#0,(word_FF8F9C+1).w

loc_84E:
		jsr	sub_B80(pc)
		rts

loc_854:
		move.w	(word_FF8F9E).w,(word_FF8F9C).w
		subq.w	#1,(word_FF8FA4).w
		rts

loc_860:
		move.w	(word_FF8F9E).w,d0
		subq.w	#3,d0
		add.w	d0,d0
		btst	#0,(word_FF8F9C+1).w
		beq.s	loc_888
		lea	off_896(pc),a1
		adda.w	(a1,d0.w),a1
		sf	(byte_FFEE7B).w
		jsr	(a1)
		tst.b	(byte_FFEE7B).w
		bne.w	loc_D9C

loc_886:
		bra.s	loc_854

loc_888:
		lea	off_8A2(pc),a1
		adda.w	(a1,d0.w),a1
		jsr	(a1)
		bra.w	loc_D9C

off_896:	dc.w sub_FAA-off_896
		dc.w sub_FB0-off_896
		dc.w sub_FB6-off_896
		dc.w sub_FBC-off_896
		dc.w sub_FC2-off_896
		dc.w sub_FC8-off_896
off_8A2:	dc.w sub_FF0-off_8A2
		dc.w sub_1006-off_8A2
		dc.w sub_1016-off_8A2
		dc.w sub_102C-off_8A2
		dc.w sub_103C-off_8A2
		dc.w sub_103E-off_8A2
sub_8AE:
		move	#$2700,sr
		moveq	#0,d0
		move.l	#$54000003,(a5)
		move.l	d0,(a6)
		move.l	d0,(a6)
		move.l	(dword_FF8FB2).w,(dword_FFEF64).w
		move.l	d0,(dword_FF8FB2).w
		move.w	#$8B00,(a5)
		move.l	#$40000010,(a5)
		move.w	d0,(a6)
		move.l	#$50000003,(a5)
		move.w	d0,(a6)
		move.l	#$2000000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$7000000,d0
		trap	#RAW_COPY_DATA	; do_raw_copy_data
		moveq	#0,d0
		move.w	#$802E,d1
		move.w	#$8000,d2
		move.l	#$42A80003,(a5)
		move.w	d1,(a6)
		move.w	(word_FF8F90).w,d0
		jsr	j_draw_lives_count(pc)
		tst.b	(byte_FFEEE7).w
		beq.s	loc_91E
		move.l	#$42B80003,(a5)
		move.w	d1,(a6)
		move.w	(word_FF8F92).w,d0
		jsr	j_draw_lives_count(pc)
		bra.s	loc_936

loc_91E:
		move.l	#$42320003,(a5)
		move.l	#$803B803B,(a6)
		move.l	#$42B20003,(a5)
		move.l	#$803B803B,(a6)

loc_936:
		moveq	#0,d6
		lea	(byte_FFEEE0).w,a0
		move.w	#$80AA,d3

loc_940:
		tst.b	(a0)+
		beq.s	loc_972
		move.w	d6,d1
		add.w	d1,d1
		moveq	#0,d0
		lea	word_AA0(pc),a1
		move.w	(a1,d1.w),d0
		jsr	j_get_vram_write_cmd(pc)
		moveq	#2,d7

loc_958:
		move.l	d0,(a5)
		move.w	d3,(a6)
		addq.w	#1,d3
		move.w	d3,(a6)
		addq.w	#1,d3
		move.w	d3,(a6)
		addq.w	#1,d3
		addi.l	#$800000,d0
		dbf	d7,loc_958
		bra.s	loc_976

loc_972:
		addi.w	#9,d3

loc_976:
		addq.w	#1,d6
		cmpi.w	#6,d6
		bne.s	loc_940
		move.l	#$46320003,(a5)
		btst	#7,(pcb_ver).w
		bne.s	loc_9A4
		move.l	#$80518045,(a6)
		move.w	#$8042,(a6)
		move.l	#$47B20003,(a5)
		move.l	#$805F8068,(a6)
		bra.s	loc_9C0

loc_9A4:
		move.l	#$801E801C,(a6)
		move.w	#$800F,(a6)
		move.l	#$47B20003,(a5)
		move.l	#$80168001,(a6)
		move.l	#$80018015,(a6)

loc_9C0:
		lea	(word_A60).l,a1
		btst	#7,(pcb_ver).w
		bne.s	loc_9D4
		lea	(word_A80).l,a1

loc_9D4:
		moveq	#7,d1
		moveq	#1,d2
		move.l	#$49320003,d0
		jsr	copy_data_to_vdp(pc) ; a1 = source
		move.l	#$430C0003,(a5)
		moveq	#$11,d7
		lea	(word_AAC).l,a1
		btst	#7,(pcb_ver).w
		bne.s	loc_9FE
		lea	(word_AD0).l,a1

loc_9FE:
		jsr	copy_to_vram(pc) ; d7 =	count
		tst.b	(byte_FFEEE7).w
		beq.s	loc_A28
		move.l	#$43300003,(a5)
		moveq	#9,d7
		lea	(word_AF4).l,a1
		btst	#7,(pcb_ver).w
		bne.s	loc_A24
		lea	(word_B08).l,a1

loc_A24:
		jsr	copy_to_vram(pc) ; d7 =	count

loc_A28:
		addq.w	#1,(word_FF8FA4).w
		move.w	(weapon_index).w,(word_FF8F9C).w
		tst.b	(byte_FFEE5C).w
		beq.s	loc_A3E
		move.w	#9,(word_FF8F9C).w

loc_A3E:
		move.b	#$AF,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd
		move.w	(vblank_sub_index).w,(vblank_sub_index_bak).w
		move.w	#4,(vblank_sub_index).w
		move	#$2500,sr
		move.w	(enable_display).w,(a5)
		rts

word_A60:	dc.w $800D,$800B,$8016,$8016,$803B,$801D,$8012,$800F,$800B,$8013,$801B,$8019,$8016,$800B,$8018,$800F
word_A80:	dc.w $803B, $803B, $803B, $803B, $803B,	$803B, $803D, $803B, $808C, $807B, $803C, $8078, $806C,	$8065, $805B, $803B
word_AA0:	dc.w $C60E, $C61A, $C626, $C88E, $C89A,	$C8A6
word_AAC:	dc.w $8019, $8016, $801E, $8018, $8011,	$800F, $801B, $803B, $803B, $8019, $8001, $8019, $800D,	$8001, $801B, $8018, $803B, $803B
word_AD0:	dc.w $803B, $807D, $80A2, $80A0, $808F,	$983E, $809F, $803B, $803B, $808F, $983E, $80A0, $808D,	$983E, $807B, $803C, $809F, $803B
word_AF4:	dc.w $800C, $801E, $800C, $800C, $8016,	$800F, $803B, $8011, $801E, $8017
word_B08:	dc.w $803B, $808B, $983D, $808D, $983D,	$809A, $8077, $983D, $8092, $803B

; d7 = count
; a1 = source
; a6 = VDP_DATA

copy_to_vram:
		move.w	(a1)+,(a6)
		dbf	d7,copy_to_vram	; d7 = count
		rts

sub_B24:
		move.w	(word_FF8F9C).w,d0
		move.b	(word_FF8FB0+1).w,d5
		btst	#2,d5
		beq.s	loc_B3A
		subq.w	#1,d0
		bpl.s	loc_B6E
		moveq	#9,d0
		bra.s	loc_B6E

loc_B3A:
		btst	#0,d5
		beq.s	loc_B48
		subq.w	#3,d0
		bpl.s	loc_B6E
		addq.w	#3,d0
		bra.s	loc_B6E

loc_B48:
		btst	#1,d5
		beq.s	loc_B5A
		addq.w	#3,d0
		cmpi.w	#9,d0
		bcs.s	loc_B6E
		subq.w	#3,d0
		bra.s	loc_B6E

loc_B5A:
		btst	#3,d5
		beq.s	loc_B7A
		addq.w	#1,d0
		cmpi.w	#9,d0
		bls.s	loc_B6E
		moveq	#0,d0
		bra.s	loc_B6E
		rts

loc_B6E:
		move.b	#$B2,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd

loc_B7A:
		move.w	d0,(word_FF8F9C).w
		rts

sub_B80:
		jsr	sub_CD6(pc)
		move	#$2700,sr
		jsr	j_get_vram_write_cmd(pc)
		move.l	d0,(a5)
		move.w	(word_FF8F9C).w,d2
		cmpi.w	#$A,d2
		bcc.s	loc_BEC
		cmpi.w	#9,d2
		bcc.s	loc_BE2
		cmpi.w	#3,d2
		bcc.s	loc_BCE
		move.w	#$8035,(a6)
		addi.l	#$60000,d0
		move.l	d0,(a5)
		move.w	#$8835,(a6)
		addi.l	#$7A0000,d0
		move.l	d0,(a5)
		move.w	#$9035,(a6)
		addi.l	#$60000,d0
		move.l	d0,(a5)
		move.w	#$9835,(a6)
		rts

loc_BCE:
		move.w	#$8035,(a6)
		bsr.s	sub_C08
		addi.l	#$2000000,d0
		move.l	d0,(a5)
		move.w	#$9035,(a6)
		bra.s	loc_C2A

loc_BE2:
		bsr.s	sub_BF6
		addi.l	#$1800000,d0
		bra.s	sub_C16

loc_BEC:
		bsr.s	sub_BF6
		addi.l	#$1000000,d0
		bra.s	sub_C16

sub_BF6:
		move.l	#$80358036,(a6)
		move.l	#$80368036,(a6)
		move.l	#$80368036,(a6)

sub_C08:
		move.l	#$80368036,(a6)
		move.l	#$80368835,(a6)
		rts

sub_C16:
		move.l	d0,(a5)
		move.l	#$90359036,(a6)
		move.l	#$90369036,(a6)
		move.l	#$90369036,(a6)

loc_C2A:
		move.l	#$90369036,(a6)
		move.l	#$90369835,(a6)
		move	#$2500,sr
		rts

sub_C3C:
		jsr	sub_CD6(pc)
		move	#$2700,sr
		jsr	j_get_vram_write_cmd(pc)
		move.l	#$803B803B,d1
		move.l	d0,(a5)
		cmpi.w	#$A,(word_FF8F9C).w
		bcc.s	loc_CB8
		cmpi.w	#9,(word_FF8F9C).w
		bcc.s	loc_CA8
		cmpi.w	#3,(word_FF8F9C).w
		bcc.s	loc_C8E
		move.w	d1,(a6)
		addi.l	#$60000,d0
		move.l	d0,(a5)
		move.w	d1,(a6)
		addi.l	#$7A0000,d0
		move.l	d0,(a5)
		move.w	d1,(a6)
		addi.l	#$60000,d0
		move.l	d0,(a5)
		move.w	d1,(a6)
		move	#$2500,sr
		rts

loc_C8E:
		move.w	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		addi.l	#$2000000,d0
		move.l	d0,(a5)
		move.w	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move	#$2500,sr
		rts

loc_CA8:
		move.l	d1,(a6)
		jsr	fill_vram_8_words ; d1 = word|word
		addi.l	#$1800000,d0
		bra.s	loc_CC6

loc_CB8:
		move.l	d1,(a6)
		jsr	fill_vram_8_words ; d1 = word|word
		addi.l	#$1000000,d0

loc_CC6:
		move.l	d0,(a5)
		move.l	d1,(a6)
		jsr	fill_vram_8_words ; d1 = word|word
		move	#$2500,sr
		rts

sub_CD6:
		lea	(word_CEA).l,a1
		moveq	#0,d0
		move.w	(word_FF8F9C).w,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		rts

word_CEA:	dc.w $C210, $C220, $C230, $C58C, $C598,	$C5A4
		dc.w $C80C, $C818, $C824, $C8B0, $C5B0,	$C730
sub_D02:
		move.w	(word_FF8F9C).w,d0
		cmpi.w	#9,d0
		beq.s	loc_D50
		cmpi.w	#3,d0
		bcc.s	loc_D70
		cmpi.w	#2,d0
		bne.s	loc_D20
		tst.b	(byte_FFEEE7).w
		beq.w	loc_D9C

loc_D20:
		move.b	#$E5,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd
		move.b	#1,(byte_FFEE5B).w
		move.w	d0,(weapon_index).w
		subq.w	#1,d0
		bmi.s	loc_D4E
		beq.s	loc_D46
		move.l	#$22000000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		bra.s	loc_D9C

loc_D46:
		move.l	#$21000000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram

loc_D4E:
		bra.s	loc_D9C

loc_D50:
		tst.b	(byte_FFEE5C).w
		beq.s	loc_D96
		jsr	sub_5108(pc)
		lea	(word_FFA300).w,a3
		moveq	#0,d1
		movea.l	a3,a1
		jsr	fill_ram_64_bytes ; d1 = dword
		move.w	#$A2,0.w(a3)
		bra.s	loc_D9C

loc_D70:
		move.w	(word_FF8F9C).w,d0
		subq.w	#3,d0
		lea	(byte_FFEEE0).w,a2
		tst.b	(a2,d0.w)
		beq.s	locret_D94
		jsr	sub_C3C(pc)
		move.w	(word_FF8F9C).w,(word_FF8F9E).w
		move.w	#$A,(word_FF8F9C).w
		addq.w	#1,(word_FF8FA4).w

locret_D94:
		rts

loc_D96:
		moveq	#$38,d1
		jsr	sub_1046(pc)

loc_D9C:
		move.w	(disable_display).w,(a5)
		move.w	#5,(init_step).w
		move.l	(dword_FFEF64).w,(dword_FF8FB2).w
		move.w	(vblank_sub_index_bak).w,(vblank_sub_index).w
		btst	#0,(byte_FFEE01).w
		beq.s	loc_DBE
		move.w	#$8B03,(a5)

loc_DBE:
		jsr	(sub_3FE6).l
		move.b	#0,(byte_FFEE5A).w
		jsr	wait_for_vblank
		move.w	(enable_display).w,(a5)
		rts

sub_DD6:
		move	#$2700,sr
		move.l	#$5D020003,(a5)
		moveq	#8,d0
		sub.w	(word_FF8F96).w,d0
		add.w	d0,d0
		lea	unk_F6A(pc),a1
		lea	(a1,d0.w),a1
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1),(a6)
		move.l	#$5D140003,(a5)
		moveq	#5,d0
		sub.w	(word_FF8F9A).w,d0
		add.w	d0,d0
		lea	word_F8A(pc),a1
		lea	(a1,d0.w),a1
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.w	(a1),(a6)
		move.l	#$5D240003,(a5)
		moveq	#0,d0
		move.w	(lives_count).w,d0
		move.w	#$8000,d2
		jsr	j_draw_lives_count(pc)
		tst.w	(word_FF8F7A).w
		beq.s	loc_E80
		move.l	(dword_FFEF34).w,d0
		addi.l	#$A,(dword_FFEF34).w
		subi.w	#$A,(word_FF8F7A).w
		move.l	(dword_FFEF34).w,d1
		move.l	#10000,d7
		cmp.l	d7,d0
		bcc.s	loc_E62
		cmp.l	d7,d1
		bcs.s	loc_E62
		addq.w	#1,(lives_count).w
		move.b	#$B0,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd

loc_E62:
		lsl.l	#2,d7
		divu.w	d7,d0
		divu.w	d7,d1
		cmp.w	d0,d1
		beq.s	loc_E7C
		addq.w	#1,(lives_count).w
		move.b	#$B0,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd

loc_E7C:
		jsr	sub_F36(pc)

loc_E80:
		bclr	#0,(byte_FFEE5B).w
		beq.s	loc_EC2
		move.w	(weapon_index).w,d1
		jsr	draw_weapon_icon(pc) ; d1 = weapon type
		move.l	#$5D2E0003,(a5)
		move.w	(weapon_index).w,d1
		subq.w	#1,d1
		bmi.s	loc_EB8
		move.w	#$802E,(a6)
		add.w	d1,d1
		lea	(word_FF8F90).w,a1
		moveq	#0,d0
		move.w	(a1,d1.w),d0
		move.w	#$8000,d2
		jsr	j_draw_lives_count(pc)
		bra.s	loc_EC2

loc_EB8:
		move.w	#$803B,(a6)
		move.l	#$803B803B,(a6)

loc_EC2:
		tst.b	(byte_FFEE5C).w
		beq.s	loc_EDC
		subq.b	#1,(byte_FFEE5D).w
		btst	#4,(byte_FFEE5D).w
		beq.s	loc_EDC
		moveq	#3,d1
		jsr	draw_weapon_icon(pc) ; d1 = weapon type
		bra.s	loc_EF4

loc_EDC:
		move.l	#$5CB60003,(a5)
		move.l	#$803B803B,(a6)
		move.l	#$5D360003,(a5)
		move.l	#$803B803B,(a6)

loc_EF4:
		move	#$2500,sr
		rts
; d1 = weapon type

draw_weapon_icon:
		add.w	d1,d1
		add.w	d1,d1
		moveq	#0,d0
		lea	tbl_weapon_types(pc,d1.w),a1
		move.w	(a1)+,d0
		jsr	j_get_vram_write_cmd(pc)
		move.l	d0,(a5)
		move.w	(a1),d2
		move.w	d2,(a6)
		addq.w	#1,d2
		move.w	d2,(a6)
		addi.l	#$800000,d0
		move.l	d0,(a5)
		addq.w	#1,d2
		move.w	d2,(a6)
		addq.w	#1,d2
		move.w	d2,(a6)
		rts

tbl_weapon_types:weapon_type $DCAA, $839C
		weapon_type $DCAA, $8390
		weapon_type $DCAA, $8394
		weapon_type $DCB6, $8398
sub_F36:
		move.l	#$5D3E0003,(a5)
		move.w	#$8000,d2
		move.l	(dword_FFEF34).w,d0
		move.l	d0,d7
		asl.l	#3,d7
		add.l	d0,d0
		add.l	d7,d0
		divu.w	#10000,d0
		swap	d0
		moveq	#0,d7
		move.w	d0,d7
		swap	d0
		ext.l	d0

sub_F5A:
		jsr	print_value	; d0 = value
		move.l	d7,d0
		jsr	print_value	; d0 = value
		rts

unk_F6A:	dc.b $80
		dc.b $30
		dc.b $80
		dc.b $30
		dc.b $80
		dc.b $30
		dc.b $80
		dc.b $30
		dc.b $80
		dc.b $30
		dc.b $80
		dc.b $30
		dc.b $80
		dc.b $30
		dc.b $80
		dc.b $30
		dc.b $80
		dc.b $31
		dc.b $80
		dc.b $31
		dc.b $80
		dc.b $31
		dc.b $80
		dc.b $31
		dc.b $80
		dc.b $31
		dc.b $80
		dc.b $31
		dc.b $80
		dc.b $31
		dc.b $80
		dc.b $31
word_F8A:	dc.w $8032, $8032, $8032, $8032, $8032
		dc.w $8033, $8033, $8033, $8033, $8033

j_get_vram_write_cmd:
		jmp	get_vram_write_cmd ; d0	= vram dest

j_draw_lives_count:
		jmp	draw_xx_value	; d0 = value

sub_FAA:
		moveq	#$32,d1
		jmp	sub_1046(pc)

sub_FB0:
		moveq	#$33,d1
		jmp	sub_1046(pc)

sub_FB6:
		moveq	#$34,d1
		jmp	sub_1046(pc)

sub_FBC:
		moveq	#$35,d1
		jmp	sub_1046(pc)

sub_FC2:
		moveq	#$A,d1
		jmp	sub_1046(pc)

sub_FC8:
		tst.b	(byte_FFEEF8).w
		beq.s	loc_FEA
		move.b	#$92,(byte_FFEE76).w
		move.b	#1,(byte_FFEE77).w
		moveq	#$1B,d1
		jsr	sub_1046(pc)
		st	(byte_FFEEFA).w
		jmp	(loc_D9C).l

loc_FEA:
		moveq	#$14,d1
		jmp	sub_1046(pc)

sub_FF0:
		tst.b	(byte_FFEED6).w
		beq.w	sub_1040
		st	(byte_FFEED0).w
		bset	#4,(byte_FFA2CD).w
		bra.w	sub_1044

sub_1006:
		tst.b	(byte_FFEED7).w
		beq.w	sub_1040
		st	(byte_FFEED1).w
		bra.w	sub_1044

sub_1016:
		tst.b	(byte_FFEED8).w
		beq.w	sub_1040
		st	(byte_FFEED2).w
		bset	#4,(byte_FFA2CD).w
		bra.w	sub_1044

sub_102C:
		tst.b	(byte_FFEED9).w
		beq.w	sub_1040
		st	(byte_FFEED3).w
		bra.w	sub_1044
sub_103C:
		bra.s	sub_FC2
sub_103E:
		bra.s	sub_FC8

sub_1040:
		moveq	#$39,d1
		bra.s	sub_1046

sub_1044:
		moveq	#$3A,d1

sub_1046:
		jsr	sub_105A(pc)
		jmp	sub_1060(pc)

sub_104E:
		tst.b	(byte_FFEE64).w
		bne.s	locret_1058
		move.w	d1,(word_FF8FBC).w

locret_1058:
		rts

sub_105A:
		move.w	d1,(word_FF8FBC).w
		rts

sub_1060:
		move.w	(word_FF8FBC).w,d1
		beq.w	locret_10D2
		move.w	#0,(word_FF8FBC).w
		cmpi.w	#8,(init_step).w
		beq.s	get_dialog	; d1 = dialog index
		move.b	#$90,d0
		tst.b	(byte_FFEE76).w
		beq.s	loc_1086
		bpl.s	loc_1090
		move.b	(byte_FFEE76).w,d0

loc_1086:
		move.b	d0,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd

loc_1090:
		move.b	#0,(byte_FFEE76).w
		st	(byte_FFEE64).w
		bsr.s	get_dialog	; d1 = dialog index
		tst.b	(byte_FFEE77).w
		bne.s	loc_10B4
		move.b	(smps_cmd1_new).w,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		jsr	wait_for_vblank

loc_10B4:
		move.b	#0,(byte_FFEE77).w
		rts
; d1 = dialog index

get_dialog:
		add.w	d1,d1
		add.w	d1,d1
		lea	(unk_FFCE00).w,a1
		adda.w	(a1),a1
		move.w	(a1,d1.w),d0
		adda.w	2(a1,d1.w),a1
		jsr	sub_10D6(pc)	; a1 = dialog data

locret_10D2:
		rts

nullsub_1:
		rts
; a1 = dialog data

sub_10D6:
		movem.l	d0-d6/a1-a2,-(sp)
		jsr	sub_1552(pc)
		movem.l	d0/d7-a2,-(sp)
		bsr.s	sub_115A
		movem.l	(sp)+,d0/d7-a2
		bsr.w	sub_1208
		moveq	#0,d7
		move.w	(a1)+,d7
		movea.l	a1,a2
		movea.l	(a2)+,a1

loc_10F4:
		move.w	#$258,(word_FF8F70).w
		move.w	#$8000,(dialog_border_mask).w
		tst.b	(a1)+
		beq.s	loc_110A
		move.w	#$A000,(dialog_border_mask).w

loc_110A:
		bsr.w	sub_12AA
		jsr	sub_149C(pc)

loc_1112:
		jsr	wait_for_vblank
		movem.l	d0/d7-a2,-(sp)
		bsr.s	sub_115A
		movem.l	(sp)+,d0/d7-a2
		move.b	(word_FF8FB0+1).w,d0
		tst.b	(byte_FFEE5E).w
		beq.s	loc_1130
		move.b	(byte_FF8FA3).w,d0

loc_1130:
		andi.b	#$F0,d0
		beq.w	loc_1112
		smi	(byte_FFEE7B).w
		move.w	#$FFFF,(word_FF8F70).w
		bsr.w	sub_13B0
		movea.l	(a2)+,a1
		dbf	d7,loc_10F4
		jsr	sub_141A(pc)
		jsr	sub_1594(pc)
		movem.l	(sp)+,d0-d6/a1-a2
		rts

sub_115A:
		move.w	#$F200,(word_FF8F50).w
		move.w	#$F282,(word_FF8F52).w
		clr.w	(word_FFF280).w
		lea	(word_FFA300).w,a0
		moveq	#0,d7
		bsr.s	sub_11B0
		lea	(unk_FF9C00).w,a0
		moveq	#$A,d7
		bsr.w	sub_11B0
		lea	(objects_memory).w,a0
		moveq	#$F,d7
		bsr.w	sub_11B0
		lea	(word_FF9000).w,a0
		moveq	#$2F,d7
		bsr.w	sub_11B0
		lea	(word_FFA2C0).w,a0
		move.w	(a0),d0
		beq.s	loc_11AA
		move.w	(word_FF8F52).w,-(sp)
		move.w	#$F280,(word_FF8F52).w
		jsr	sub_11CE(pc)
		move.w	(sp)+,(word_FF8F52).w

loc_11AA:
		jmp	sub_9A6A

sub_11B0:
		move.w	(a0),d0
		beq.s	loc_11C4
		tst.l	$20(a0)
		beq.s	loc_11C4
		movem.l	d7-a0,-(sp)
		bsr.s	sub_11CE
		movem.l	(sp)+,d7-a0

loc_11C4:
		lea	$40(a0),a0
		dbf	d7,sub_11B0
		rts

sub_11CE:
		cmp.w	(word_FF8F72).w,d0
		bne.s	loc_11DC
		bclr	#1,$D(a0)
		bra.s	loc_11E0

loc_11DC:
		clr.b	8(a0)

loc_11E0:
		btst	#2,$D(a0)
		bne.s	locret_1206
		btst	#7,$C(a0)
		bne.s	loc_11FC
		movea.w	(word_FF8F52).w,a1
		move.w	a0,(a1)+
		move.w	a1,(word_FF8F52).w
		rts

loc_11FC:
		movea.w	(word_FF8F50).w,a1
		move.w	a0,(a1)+
		move.w	a1,(word_FF8F50).w

locret_1206:
		rts

sub_1208:
		movem.l	a1,-(sp)
		moveq	#0,d1
		move.b	d0,d1
		beq.w	locret_1272
		mulu.w	#6,d1
		moveq	#0,d2
		move.w	(dword_FF8FB2+2).w,d2
		move.w	(dword_FF8FB2).w,d3
		lea	(unk_FFCE00).w,a2
		adda.w	word_FFCE02-unk_FFCE00(a2),a2
		lsl.w	#4,d3
		andi.w	#$F80,d3
		add.w	-6(a2,d1.w),d3
		move.w	d3,d0
		andi.w	#$7E,d3
		lsr.w	#2,d2
		andi.w	#$7E,d2
		add.w	d3,d2
		andi.w	#$7E,d2
		andi.w	#$FF80,d0
		add.w	d2,d0
		andi.w	#$FFF,d0
		ori.w	#$4000,d0
		move.w	-2(a2,d1.w),d2
		move.w	-4(a2,d1.w),d1
		lea	(unk_FFA360).w,a2
		move.w	d0,(a2)+
		move.w	d1,(a2)+
		move.w	d2,(a2)+
		bclr	#$E,d0
		bsr.w	sub_1274
		movem.l	(sp)+,a1

locret_1272:
		rts

sub_1274:
		move.w	#$80,d6

loc_1278:
		move.w	d0,d5
		move.w	d1,d3

loc_127C:
		move.w	d5,(a5)
		move.w	#3,(a5)
		move.w	(a6),(a2)+
		move.w	d5,d4
		addq.w	#2,d4
		andi.w	#$7F,d4
		andi.w	#$FF80,d5
		or.w	d4,d5
		dbf	d3,loc_127C
		move.w	d0,d4
		add.w	d6,d4
		andi.w	#$FFF,d4
		andi.w	#$F000,d0
		or.w	d4,d0
		dbf	d2,loc_1278
		rts

sub_12AA:
		movem.l	a1-a2,-(sp)
		move.w	#$80,d6
		lea	(unk_FFA360).w,a2
		move.w	0.w(a2),d0
		move.w	2(a2),d1
		move.w	4(a2),d2
		move.w	d2,d3
		asr.w	#1,d3
		addq.w	#1,d3
		move.w	d3,(word_FFA348).w
		move.w	#1,(word_FFA34A).w
		btst	#0,d2
		bne.s	loc_12DE
		move.w	#$FFFF,(word_FFA34A).w

loc_12DE:
		lea	(stru_15C6).l,a1
		adda.l	#(stru_15CC-stru_15C6),a1

loc_12EA:
		jsr	wait_for_vblank
		cmpi.w	#1,d2
		bgt.s	loc_130C
		blt.s	loc_1300
		lea	(stru_15C6).l,a1
		bra.s	loc_130C

loc_1300:
		lea	(stru_15C6).l,a1
		adda.l	#(stru_15D2-stru_15C6),a1

loc_130C:
		move.w	0.w(a2),d0
		move.w	(word_FFA348).w,d3
		move.w	d3,d4
		add.w	(word_FFA34A).w,d4
		move.w	d4,(word_FFA348).w
		tst.w	(word_FFA34A).w
		blt.s	loc_132E
		addq.w	#1,(word_FFA34A).w
		neg.w	(word_FFA34A).w
		bra.s	loc_1336

loc_132E:
		subq.w	#1,(word_FFA34A).w
		neg.w	(word_FFA34A).w

loc_1336:
		subq.b	#1,d3
		beq.s	loc_134A
		move.w	d0,d4
		add.w	d6,d4
		andi.w	#$FFF,d4
		andi.w	#$F000,d0
		or.w	d4,d0
		bra.s	loc_1336

loc_134A:
		bsr.w	sub_1358	; d0 = ?
		dbf	d2,loc_12EA
		movem.l	(sp)+,a1-a2
		rts
; d0 = ?
; d1 = count
; a1 = ?

sub_1358:
		move.w	d0,d5
		move.w	d5,(a5)
		move.w	#3,(a5)
		move.w	0.w(a1),d4
		add.w	(dialog_border_mask).w,d4
		move.w	d4,(a6)
		move.w	d5,d4
		addq.w	#2,d4
		andi.w	#$7F,d4
		andi.w	#$FF80,d5
		or.w	d4,d5
		move.w	d1,d3
		subq.w	#2,d3

loc_137C:
		move.w	d5,(a5)
		move.w	#3,(a5)
		move.w	2(a1),d4
		add.w	(dialog_border_mask).w,d4
		move.w	d4,(a6)
		move.w	d5,d4
		addq.w	#2,d4
		andi.w	#$7F,d4
		andi.w	#$FF80,d5
		or.w	d4,d5
		dbf	d3,loc_137C
		move.w	d5,(a5)
		move.w	#3,(a5)
		move.w	4(a1),d4
		add.w	(dialog_border_mask).w,d4
		move.w	d4,(a6)
		rts

sub_13B0:
		movem.l	a2,-(sp)
		lea	(unk_FFA360).w,a2
		move.w	(a2)+,d0
		move.w	(a2)+,d1
		move.w	(a2)+,d2
		move.w	#$80,d6
		subq.w	#2,d1
		subq.w	#2,d2
		move.w	d0,d4
		add.w	d6,d4
		andi.w	#$FFF,d4
		andi.w	#$F000,d0
		or.w	d4,d0
		move.w	d0,d4
		addq.w	#2,d4
		andi.w	#$7F,d4
		andi.w	#$FF80,d0
		or.w	d4,d0

loc_13E2:
		move.w	d0,d5
		move.w	d1,d3

loc_13E6:
		move.w	d5,(a5)
		move.w	#3,(a5)
		move.w	#$803B,(a6)
		move.w	d5,d4
		addq.w	#2,d4
		andi.w	#$7F,d4
		andi.w	#$FF80,d5
		or.w	d4,d5
		dbf	d3,loc_13E6
		move.w	d0,d4
		add.w	d6,d4
		andi.w	#$FFF,d4
		andi.w	#$F000,d0
		or.w	d4,d0
		dbf	d2,loc_13E2
		movem.l	(sp)+,a2
		rts

sub_141A:
		lea	(unk_FFA360).w,a2
		move.w	(a2)+,d0
		move.w	(a2)+,d1
		move.w	(a2)+,d2
		move.w	#$80,d6

loc_1428:
		jsr	wait_for_vblank
		move.w	d0,d5
		move.w	d1,d3

loc_1432:
		move.w	d5,(a5)
		move.w	#3,(a5)
		move.w	(a2)+,(a6)
		move.w	d5,d4
		addq.w	#2,d4
		andi.w	#$7F,d4
		andi.w	#$FF80,d5
		or.w	d4,d5
		dbf	d3,loc_1432
		move.w	d0,d4
		add.w	d6,d4
		andi.w	#$FFF,d4
		andi.w	#$F000,d0
		or.w	d4,d0
		dbf	d2,loc_1428
		rts

sub_1460:
		movem.l	d0-d2,-(sp)
		move.w	#$80,d6
		bclr	#$E,d0
		subq.w	#2,d1

loc_146E:
		move.w	d0,d4
		addq.w	#2,d4
		andi.w	#$7F,d4
		andi.w	#$FF80,d0
		andi.w	#$FF80,d5
		or.w	d4,d0
		or.w	d4,d5
		move.w	d0,(a5)
		move.w	#3,(a5)
		move.w	(a6),d2
		move.w	d5,(a5)
		move.w	#3,(a5)
		move.w	d2,(a6)
		dbf	d1,loc_146E
		movem.l	(sp)+,d0-d2
		rts

sub_149C:
		movem.l	d0-d6/a1-a2,-(sp)
		move.w	(dialog_border_mask).w,d4
		lea	(unk_FFA360).w,a2
		move.w	0.w(a2),d0
		move.w	4(a2),d2
		subq.w	#2,d2
		sf	(byte_FFA341).w
		btst	#0,d2
		bne.s	loc_14C0
		st	(byte_FFA341).w

loc_14C0:
		move.w	d0,d5
		addq.w	#2,d5
		andi.w	#$7F,d5
		andi.w	#$FF80,d0
		or.w	d5,d0

loc_14CE:
		move.w	2(a2),d1
		subq.w	#2,d1
		move.w	d0,d5
		add.w	d6,d5
		andi.w	#$FFF,d5
		andi.w	#$F000,d0
		or.w	d5,d0
		movem.l	d0,-(sp)

loc_14E6:
		moveq	#0,d3
		move.b	(a1)+,d3
		cmpi.b	#$FF,d3
		bne.s	loc_1516

loc_14F0:
		move.w	d0,(a5)
		move.w	#3,(a5)
		move.w	#$3B,d3
		add.w	d4,d3
		move.w	d3,(a6)
		move.w	d0,d5
		addq.w	#2,d5
		andi.w	#$7F,d5
		andi.w	#$FF80,d0
		or.w	d5,d0
		dbf	d1,loc_14F0
		movem.l	(sp)+,d0
		bra.s	loc_1536

loc_1516:
		move.w	d0,(a5)
		move.w	#3,(a5)
		add.w	d4,d3
		move.w	d3,(a6)
		move.w	d0,d5
		addq.w	#2,d5
		andi.w	#$7F,d5
		andi.w	#$FF80,d0
		or.w	d5,d0
		dbf	d1,loc_14E6
		movem.l	(sp)+,d0

loc_1536:
		move.b	(byte_FFA341).w,d5
		eor.b	d2,d5
		btst	#0,d5
		beq.s	loc_1548
		jsr	wait_for_vblank

loc_1548:
		dbf	d2,loc_14CE
		movem.l	(sp)+,d0-d6/a1-a2
		rts

sub_1552:
		movem.l	d5-d7/a1-a2,-(sp)
		lea	(word_FF9000).w,a1
		lea	(unk_FFA350).w,a2
		moveq	#4,d7

loc_1560:
		moveq	#$F,d6
		moveq	#0,d5

loc_1564:
		rol.w	#1,d5
		btst	#7,$A(a1)
		beq.s	loc_1580
		bset	#0,d5
		btst	#4,$D(a1)
		bne.s	loc_1580
		bclr	#7,$A(a1)

loc_1580:
		lea	$40(a1),a1
		dbf	d6,loc_1564
		move.w	d5,(a2)+
		dbf	d7,loc_1560
		movem.l	(sp)+,d5-d7/a1-a2
		rts

sub_1594:
		movem.l	d5-d7/a1-a2,-(sp)
		lea	(word_FF9000).w,a1
		lea	(unk_FFA350).w,a2
		moveq	#4,d7

loc_15A2:
		move.w	(a2)+,d5
		moveq	#$F,d6

loc_15A6:
		rol.w	#1,d5
		btst	#0,d5
		beq.s	loc_15B4
		bset	#7,$A(a1)

loc_15B4:
		lea	$40(a1),a1
		dbf	d6,loc_15A6
		dbf	d7,loc_15A2
		movem.l	(sp)+,d5-d7/a1-a2
		rts

stru_15C6:	struc_1 $35, $36, $835
stru_15CC:	struc_1 $37, $3B, $837
stru_15D2:	struc_1 $1035,	$1036, $1835
do_raw_copy_data:
		bsr.s	raw_data_copy_to_vdp ; d0 = indexes
		rte
; d0 = indexes

raw_data_copy_to_vdp:
		move	#$2700,sr
		moveq	#3,d2

loc_15E2:
		moveq	#0,d1
		move.b	d0,d1
		beq.s	loc_1604
		mulu.w	#$C,d1
		movem.l	d0-d2,-(sp)
		lea	tbl_raw_copy_data(pc,d1.w),a1
		move.w	-(a1),d2
		move.w	-(a1),d1
		move.l	-(a1),d0
		movea.l	-(a1),a1
		jsr	copy_data_to_vdp(pc) ; a1 = source
		movem.l	(sp)+,d0-d2

loc_1604:
		ror.l	#8,d0
		dbf	d2,loc_15E2
		move	#$2500,sr
		rts

tbl_raw_copy_data:raw_data_vdp M68K_RAM, $459C0003, $D, 3
		raw_data_vdp M68K_RAM,	$5C000003, $27,	5
		raw_data_vdp 0, $40000000, $FFFF, $FFFF
		raw_data_vdp unk_FF1000, $60000003, $1F, $1B
		raw_data_vdp unk_FF1000, $60400003, $1F, $1B
		raw_data_vdp word_12A87A, $449A0003, $C, 2
		raw_data_vdp unk_FFB000, $40000003, $27, $17
		raw_data_vdp M68K_RAM,	$60000003, $27,	$D
		raw_data_vdp unk_FF1000, $67000003, $27, $D
		raw_data_vdp unk_FF2000, $428C0003, $19, $10
		raw_data_vdp word_4F78, $441E0003, 4, 0
		raw_data_vdp word_4F82, $469E0003, 6, 0
		raw_data_vdp word_4F90, $43160003, 9, 0
		raw_data_vdp word_4FA4, $45160003, 6, 0
		raw_data_vdp word_4FB2, $48160003, 3, 0
		raw_data_vdp M68K_RAM,	$432C0003, $B, 0
		raw_data_vdp unk_FFB000, $452C0003, 6,	5
		raw_data_vdp M68K_RAM,	$60000003, $27,	$1F
		raw_data_vdp unk_FF1000, $629C0003, $B, 9
		raw_data_vdp unk_FF2000, $450C0003, $13, 2
		raw_data_vdp unk_FF1000, $621A0003, $D, $B
		raw_data_vdp word_1718, $45120003, $16, 4
word_1718:	dc.w $35, $36, $36, $36, $36
		dc.w $36, $36, $36, $36, $36
		dc.w $36, $36, $36, $36, $36
		dc.w $36, $36, $36, $36, $36
		dc.w $36, $36, $835, $37, $3B
		dc.w $3B, $D, 1, $18, $1D
		dc.w $13, $18, $1E, $F,	$3B
		dc.w $3B, $3B, $3B, $3B, $3B
		dc.w $3B, $3B, $3B, $3B, $3B
		dc.w $837, $37,	$3B, $3B, $3B
		dc.w $3B, $3B, $3B, $3B, $3B
		dc.w $3B, $3B, $3B, $3B, $3B
		dc.w $3B, $3B, $3B, $3B, $3B
		dc.w $3B, $3B, $3B, $837, $37
		dc.w $3B, $3B, $1C, $1D, 1
		dc.w $19, $3B, $1D, $12, $F
		dc.w $3B, $B, $E, $1F, $F
		dc.w $18, $1D, $1E, $1B, $F
		dc.w $3B, $837,	$1035, $1036, $1036
		dc.w $1036, $1036, $1036, $1036, $1036
		dc.w $1036, $1036, $1036, $1036, $1036
		dc.w $1036, $1036, $1036, $1036, $1036
		dc.w $1036, $1036, $1036, $1036, $1835
do_decompress_nemesis_to_vram:
		bsr.s	decompress_nemesis_to_vram_trap	; d0 = indexes
		rte
; d0 = indexes

decompress_nemesis_to_vram_trap:
		moveq	#3,d2

loc_1804:
		moveq	#0,d1
		move.b	d0,d1
		beq.s	loc_181E
		lsl.w	#3,d1
		lea	tbl_nemesis_vram(pc),a0
		move.l	-8(a0,d1.w),(a5)
		movea.l	-4(a0,d1.w),a0
		jsr	(decompress_nemesis_to_vram).l ; a0 = source

loc_181E:
		ror.l	#8,d0
		dbf	d2,loc_1804
		rts

tbl_nemesis_vram:nemesis_vram $40200000, nemesis_main_font
		nemesis_vram $72000001, nemesis_01CBEA
		nemesis_vram $56800003, nemesis_01D70E
		nemesis_vram $55400000, nemesis_01D15A
		nemesis_vram $60000000, nemesis_102A00
		nemesis_vram $7A000000, nemesis_1034B4
		nemesis_vram $60000000, nemesis_1039F6
		nemesis_vram $7A000000, nemesis_1034B4
		nemesis_vram $60000000, nemesis_104370
		nemesis_vram $40A00001, nemesis_10593E
		nemesis_vram $60000000, nemesis_1071D4
		nemesis_vram $7A000000, nemesis_107AFA
		nemesis_vram $40200000, nemesis_sega_logo
		nemesis_vram $60000000, nemesis_1068A0
		nemesis_vram $7A000000, nemesis_106A34
		nemesis_vram $60000000, nemesis_1061D6
		nemesis_vram $64000001, nemesis_01E898
		nemesis_vram $40000000, nemesis_02C68E
		nemesis_vram $4C200000, nemesis_02CD86
		nemesis_vram $64000000, nemesis_02D2BA
		nemesis_vram $70000000, nemesis_02D6EE
		nemesis_vram $40000002, nemesis_030566
		nemesis_vram $42000002, nemesis_02BF24
		nemesis_vram $5E000000, nemesis_031E84
		nemesis_vram $55400000, nemesis_031BF8
		nemesis_vram $40000000, nemesis_031620
		nemesis_vram $40200002, nemesis_main_font
		nemesis_vram $4C000002, nemesis_030946
		nemesis_vram $60000000, nemesis_10812A
		nemesis_vram $7A000000, nemesis_108C16
		nemesis_vram $5C000000, nemesis_01E2BA
		nemesis_vram $75000003, nemesis_02BF24
		nemesis_vram $7C200003, nemesis_02C1E6
		nemesis_vram $7C200003, nemesis_02C23C
		nemesis_vram $40000000, 0
		nemesis_vram $60000000, nemesis_10B5B8
		nemesis_vram $7B000000, nemesis_10C436
		nemesis_vram $7B000000, nemesis_10CADC
		nemesis_vram $60000000, nemesis_1093E6
		nemesis_vram $7A000000, nemesis_10A2AE
		nemesis_vram $60000000, nemesis_10A810
		nemesis_vram $7A000000, nemesis_10AFDC
		nemesis_vram $40A00001, nemesis_10DE54
		nemesis_vram $40A00001, nemesis_10CF40
		nemesis_vram $60000000, nemesis_10E9E4
		nemesis_vram $7A000000, nemesis_10ED2A
		nemesis_vram $4C000000, nemesis_031620
		nemesis_vram $60000000, nemesis_12BCDC
		nemesis_vram $76000001, nemesis_12BCDC
		nemesis_vram $78000001, nemesis_12C226
		nemesis_vram $60000000, nemesis_10F6B4
		nemesis_vram $60000001, nemesis_020E9A
		nemesis_vram $7C000001, nemesis_enemy_tiles_62
		nemesis_vram $60000001, nemesis_01E242
		nemesis_vram $60000001, nemesis_01E0B4
		nemesis_vram $62000001, nemesis_01DAEC
		nemesis_vram $68000001, nemesis_01FF84
		nemesis_vram $62000001, nemesis_020200
		nemesis_vram $4C000001, nemesis_031620
		nemesis_vram $6A000001, nemesis_enemy_tiles_34
		nemesis_vram $6A000001, nemesis_01E242
		nemesis_vram $60000000, nemesis_10D6A0
		nemesis_vram $60000000, nemesis_11044C
		nemesis_vram $7A000000, nemesis_1111F0
		nemesis_vram $64000001, nemesis_01E644
		nemesis_vram $60000000, nemesis_112728
		nemesis_vram $7A000000, nemesis_113C5E
		nemesis_vram $60000000, nemesis_128028
		nemesis_vram $68000001, nemesis_02D6EE
		nemesis_vram $60000000, nemesis_10FB88
		nemesis_vram $7A000000, nemesis_10FF98
		nemesis_vram $6A000001, nemesis_01F482
		nemesis_vram $60000000, nemesis_1117EA
		nemesis_vram $7A000000, nemesis_1122C8
		nemesis_vram $60000000, nemesis_112D44
		nemesis_vram $7A000000, nemesis_1135BC
		nemesis_vram $64000001, nemesis_01FD9C
		nemesis_vram $78000001, nemesis_enemy_tiles_49
		nemesis_vram $60000000, nemesis_1291A4
		nemesis_vram $64000001, nemesis_020534
		nemesis_vram $6A000001, nemesis_enemy_tiles_29
		nemesis_vram $64000001, nemesis_020834
		nemesis_vram $60000001, nemesis_127EC6
		nemesis_vram $60000000, nemesis_12E4C8
		nemesis_vram $6C000001, nemesis_01F55C
		nemesis_vram $6C000001, nemesis_01F900
		nemesis_vram $5F000000, nemesis_020D8C
		nemesis_vram $61000001, nemesis_127DA2
		nemesis_vram $70000003, nemesis_01FBA0
		nemesis_vram $54000001, nemesis_031620
		nemesis_vram $6C000001, nemesis_01FEEA
do_decompress_nemesis_to_ram:
		bsr.s	decompress_nemesis_to_ram_trap ; d0 = indexes
		rte
; d0 = indexes

decompress_nemesis_to_ram_trap:
		moveq	#3,d2

loc_1B04:
		moveq	#0,d1
		move.b	d0,d1
		beq.s	loc_1B18
		lsl.w	#3,d1
		movea.l	tbl_nemesis_ram-8(pc,d1.w),a0
		movea.l	tbl_nemesis_ram-4(pc,d1.w),a4
		jsr	decompress_nemesis_to_ram(pc) ;	a0 = source

loc_1B18:
		ror.l	#8,d0

loc_1B1A:
		dbf	d2,loc_1B04
		rts

tbl_nemesis_ram:nemesis_ram nemesis_106FC4, unk_FF6020
		nemesis_ram nemesis_1092BC, unk_FF6020
		nemesis_ram nemesis_10F300, unk_FF6020
		nemesis_ram nemesis_11174C, unk_FF6020
		nemesis_ram nemesis_1041EA, unk_FF6020
do_decompress_enigma_to_ram:
		bsr.s	decompress_enigma_to_ram_trap ;	d1 = indexes
		rte
; d1 = indexes

decompress_enigma_to_ram_trap:
		move	#$2700,sr
		move.l	d3,-(sp)
		moveq	#3,d2

loc_1B54:
		moveq	#0,d0
		move.b	d1,d0
		beq.s	loc_1B70
		mulu.w	#$A,d0
		lea	tbl_enigma_data(pc,d0.w),a0
		move.w	-(a0),d0
		movea.l	-(a0),a1
		move.l	-(a0),d3
		movea.l	d3,a0
		jsr	(decompress_enigma_to_ram).l ; a0 = source

loc_1B70:
		ror.l	#8,d1
		dbf	d2,loc_1B54
		move.l	(sp)+,d3
		move	#$2500,sr
		rts

tbl_enigma_data:enigma_data 0, 0, 0
		enigma_data enigma_01CFB6, unk_FFB000,	$8390
		enigma_data 0, 0, 0
		enigma_data 0, 0, 0
		enigma_data enigma_032200, unk_FF5000,	$4100
		enigma_data enigma_0325F2, unk_FF5800,	$61D0
		enigma_data enigma_01CF5A, M68K_RAM, $8390
		enigma_data enigma_032802, unk_FF5000,	$4100
		enigma_data enigma_033F3C, unk_FF5000,	$4100
		enigma_data enigma_03439E, unk_FF5800,	$6205
		enigma_data enigma_035200, unk_FF5000,	$100
		enigma_data enigma_03535C, unk_FF5800,	$61D0
		enigma_data enigma_034486, unk_FF5000,	$4100
		enigma_data enigma_0344CE, unk_FF5800,	$61D0
		enigma_data enigma_034420, unk_FF5000,	$4100
		enigma_data 0, 0, 0
		enigma_data enigma_sega_logo_mapping, M68K_RAM, 1
		enigma_data enigma_035474, unk_FF5000,	$4100
		enigma_data enigma_035688, unk_FF5800,	$61D0
		enigma_data enigma_035474, unk_FF5800,	$4100
		enigma_data enigma_035474, unk_FF5800,	$C100
		enigma_data enigma_038F76, unk_FF5000,	$4100
		enigma_data enigma_0392F6, unk_FF5800,	$61D8
		enigma_data enigma_0394D2, unk_FF5800,	$61D8
		enigma_data enigma_036FA2, unk_FF5000,	$4100
		enigma_data enigma_037368, unk_FF5800,	$61D0
		enigma_data enigma_037500, unk_FF5000,	$4100
		enigma_data enigma_037672, unk_FF5800,	$61D0
		enigma_data enigma_03BF4A, unk_FF5800,	$6205
		enigma_data enigma_03A77A, unk_FF5800,	$6205
		enigma_data enigma_03C1AA, unk_FF5000,	$C100
		enigma_data enigma_03C27C, unk_FF5800,	$61D0
		enigma_data enigma_03C2EA, unk_FF5000,	$4100
		enigma_data 0, 0, 0
		enigma_data 0, 0, 0
		enigma_data enigma_03C1AA, unk_FF5000,	$4100
		enigma_data enigma_03C1AA, unk_FF5800,	$C100
		enigma_data enigma_03AAA8, unk_FF5000,	$4100
		enigma_data enigma_1002E4, unk_FF5000,	$100
		enigma_data enigma_100514, unk_FF5800,	$61D0
		enigma_data enigma_03E184, unk_FF5000,	$4100
		enigma_data enigma_03E2A6, unk_FF5800,	$61D0
		enigma_data enigma_100000, unk_FF5000,	$4100
		enigma_data enigma_10012A, unk_FF5800,	$61D0
		enigma_data 0, 0, 0
		enigma_data enigma_03D978, unk_FF5000,	$4100
		enigma_data enigma_03DCD4, unk_FF5800,	$61D0
		enigma_data enigma_03DDF2, unk_FF5000,	$4100
		enigma_data enigma_03DFC6, unk_FF5800,	$61D0
do_decompress_kosinski_to_ram:
		bsr.s	decompress_kosinski_to_ram_trap	; d0 = indexes
		rte
; d0 = indexes

decompress_kosinski_to_ram_trap:
		moveq	#3,d2

loc_1D6E:
		moveq	#0,d1
		move.b	d0,d1
		beq.s	loc_1D8A
		lsl.w	#3,d1
		movea.l	tbl_kosinski_data-8(pc,d1.w),a0
		movea.l	tbl_kosinski_data-4(pc,d1.w),a1
		movem.l	d0/d2,-(sp)
		jsr	decompress_kosinski_to_ram(pc) ; a0 = source
		movem.l	(sp)+,d0/d2

loc_1D8A:
		ror.l	#8,d0

loc_1D8C:
		dbf	d2,loc_1D6E
		rts

tbl_kosinski_data:kosinski_data kosinski_032B4C, M68K_RAM
		kosinski_data kosinski_03320C,	unk_FF2800
		kosinski_data kosinski_03335C,	M68K_RAM
		kosinski_data kosinski_0338FC,	unk_FF2800
		kosinski_data kosinski_0345C0,	M68K_RAM
		kosinski_data kosinski_0348A0,	unk_FF2800
		kosinski_data kosinski_035772,	M68K_RAM
		kosinski_data kosinski_035A62,	unk_FF2800
		kosinski_data kosinski_034BB0,	M68K_RAM
		kosinski_data kosinski_034FE0,	unk_FF2800
		kosinski_data kosinski_034980,	M68K_RAM
		kosinski_data kosinski_035170,	M68K_RAM
		kosinski_data kosinski_035AE2,	M68K_RAM
		kosinski_data kosinski_035FC2,	unk_FF2800
		kosinski_data kosinski_036052,	M68K_RAM
		kosinski_data kosinski_036382,	unk_FF2800
		kosinski_data kosinski_0364E2,	M68K_RAM
		kosinski_data kosinski_036752,	M68K_RAM
		kosinski_data kosinski_036ED2,	unk_FF2800
		kosinski_data kosinski_036BD2,	M68K_RAM
		kosinski_data kosinski_03951A,	M68K_RAM
		kosinski_data kosinski_03A5CA,	unk_FF2800
		kosinski_data kosinski_039B5A,	M68K_RAM
		kosinski_data kosinski_039BBA,	M68K_RAM
		kosinski_data kosinski_03A70A,	unk_FF2800
		kosinski_data kosinski_039DDA,	M68K_RAM
		kosinski_data kosinski_037856,	M68K_RAM
		kosinski_data kosinski_037D46,	unk_FF2800
		kosinski_data kosinski_037E66,	M68K_RAM
		kosinski_data kosinski_0385C6,	unk_FF2800
		kosinski_data kosinski_038876,	M68K_RAM
		kosinski_data kosinski_038C46,	unk_FF2800
		kosinski_data kosinski_038E26,	M68K_RAM
		kosinski_data 0, 0
		kosinski_data kosinski_036F02,	M68K_RAM
		kosinski_data kosinski_033A1C,	M68K_RAM
		kosinski_data kosinski_033DCC,	unk_FF2800
		kosinski_data kosinski_03C388,	M68K_RAM
		kosinski_data kosinski_03C528,	unk_FF2800
		kosinski_data kosinski_03C6A8,	M68K_RAM
		kosinski_data kosinski_03CB88,	unk_FF2800
		kosinski_data kosinski_03CCF8,	M68K_RAM
		kosinski_data kosinski_03CE58,	unk_FF2800
		kosinski_data kosinski_03CF58,	M68K_RAM
		kosinski_data kosinski_03D428,	unk_FF2800
		kosinski_data kosinski_03ACDA,	M68K_RAM
		kosinski_data kosinski_03B06A,	unk_FF2800
		kosinski_data kosinski_03BDBA,	M68K_RAM
		kosinski_data kosinski_03BE9A,	M68K_RAM
		kosinski_data kosinski_0386D6,	M68K_RAM
		kosinski_data kosinski_1025B4,	M68K_RAM
		kosinski_data 0, 0
		kosinski_data kosinski_03D778,	M68K_RAM
		kosinski_data kosinski_03D5A8,	M68K_RAM
		kosinski_data kosinski_03D6C8,	unk_FF2800
		kosinski_data kosinski_13DAD6,	unk_FFB000
		kosinski_data kosinski_03B19A,	M68K_RAM
		kosinski_data kosinski_03B33A,	M68K_RAM
		kosinski_data kosinski_03B4CA,	M68K_RAM
		kosinski_data kosinski_03B7EA,	M68K_RAM
		kosinski_data kosinski_03BBAA,	unk_FF2800
		kosinski_data kosinski_102744,	unk_FF2800
		kosinski_data kosinski_03FC66,	M68K_RAM
		kosinski_data kosinski_03FD76,	unk_FF2800
		kosinski_data kosinski_101294,	M68K_RAM
		kosinski_data kosinski_101924,	unk_FF2800
		kosinski_data kosinski_101A64,	M68K_RAM
		kosinski_data kosinski_03E446,	M68K_RAM
		kosinski_data kosinski_03F0F6,	unk_FF2800
		kosinski_data kosinski_100594,	M68K_RAM
		kosinski_data kosinski_101E44,	M68K_RAM
		kosinski_data kosinski_03F486,	M68K_RAM
		kosinski_data kosinski_03FA36,	unk_FF2800
		kosinski_data kosinski_03F196,	M68K_RAM
		kosinski_data kosinski_03F316,	unk_FF2800
		kosinski_data kosinski_level_params, level_params1
		kosinski_data kosinski_019F18,	level_params1
		kosinski_data kosinski_dialogs, unk_FFCE00
		kosinski_data kosinski_13BD40,	unk_FFCE00
init_joypads:
		jsr	request_z80_bus
		moveq	#$40,d0
		move.b	d0,(IO_CT1_CTRL+1).l
		move.b	d0,(IO_CT2_CTRL+1).l
		move.b	d0,(IO_EXT_CTRL+1).l
		move.b	#$C0,(IO_CT1_DATA+1).l
		jsr	release_z80_bus

set_initial_vdp_regs:
		lea	initial_vdp_regs(pc),a0

init_vdp_regs:
		move.w	#$8000,d0
		moveq	#$12,d7

loc_203C:
		move.b	(a0)+,d0
		move.w	d0,(a5)
		addi.w	#$100,d0
		dbf	d7,loc_203C
		rts

initial_vdp_regs:dc.b 4, $14, $30, $34,	7, $6A,	0, 0, 0, 0, 0, 0, $81, $34, 0, 2, 1, 0,	0
		align 2, 0
sub_205E:
		jsr	(clear_cram).l
		bsr.s	clear_first_sprite
		move.l	#$40000003,(a5)
		bsr.s	sub_2074
		move.l	#$60000003,(a5)

sub_2074:
		moveq	#0,d1
		move.w	#$1F,d7

loc_207A:
		jsr	fill_vram_64_words(pc) ; d1 = word|word
		dbf	d7,loc_207A
		rts

clear_first_sprite:
		moveq	#0,d1
		move.l	#$54000003,(a5)
		move.l	d1,(a6)
		move.l	d1,(sprites_ram).w
		rts
; a1 = source
; d0 = vdp cmd
; d1 = width (tiles)
; d2 = height (tiles)

copy_data_to_vdp:
		move.l	#$800000,d4

loc_209A:
		move.l	d0,(a5)
		move.w	d1,d3

loc_209E:
		move.w	(a1)+,(a6)
		dbf	d3,loc_209E
		add.l	d4,d0
		dbf	d2,loc_209A
		rts

clear_vram_cram_vsram:
		bsr.s	set_initial_vdp_regs
		move.w	#$8F01,(a5)
		jsr	request_z80_bus
		move.l	#$93FF94FF,(a5)
		move.w	#$9780,(a5)
		move.l	#$40000080,(a5)
		move.w	#0,(a6)

loc_20CC:
		btst	#DMA_IN_PROGRESS,1(a5)
		bne.s	loc_20CC
		move.l	#$40000000,(a5)
		move.w	#0,(a6)
		jsr	release_z80_bus
		move.w	#$8F02,(a5)
		bsr.s	clear_cram
		clr.l	(sprites_ram).w
		bsr.s	sub_210A
		bsr.s	sub_2114
		move.l	#$40000010,(a5)
		moveq	#0,d1
		jmp	fill_vram_32_words(pc) ; d1 = word|word

clear_cram:
		move.l	#$C0000000,(a5)
		moveq	#0,d1
		jmp	fill_vram_64_words(pc) ; d1 = word|word

sub_210A:
		moveq	#0,d1
		lea	(word_FF8500).w,a1
		jmp	fill_ram_128_bytes(pc) ; d1 = dword

sub_2114:
		moveq	#0,d1
		lea	(ram_palette_0).w,a1
		jmp	fill_ram_128_bytes(pc) ; d1 = dword

clear_ram_0000_fd00:
		lea	(M68K_RAM).l,a1
		moveq	#0,d1
		move.w	#$1F9,d7

loc_212A:
		jsr	fill_ram_128_bytes ; d1	= dword
		dbf	d7,loc_212A
		rts

sub_2136:
		move.l	#$800000,d4

loc_213C:
		move.l	d0,(a5)
		move.w	d1,d5

loc_2140:
		move.w	d3,(a6)
		dbf	d5,loc_2140
		add.l	d4,d0
		dbf	d2,loc_213C
		rts

sub_214E:
		tst.b	(byte_FFEE5E).w
		beq.s	loc_215A
		move.w	(unk_FF8FA2).w,(word_FF8F2C).w

loc_215A:
		jsr	request_z80_bus
		move.b	#0,(IO_CT1_DATA+1).l
		nop
		nop
		move.b	(IO_CT1_DATA+1).l,d0
		lsl.b	#2,d0
		andi.b	#$C0,d0
		move.b	#$40,(IO_CT1_DATA+1).l
		nop
		nop
		move.b	(IO_CT1_DATA+1).l,d1
		andi.b	#$3F,d1
		or.b	d1,d0
		not.b	d0
		lea	(word_FF8FB0).w,a0
		move.b	d0,d1
		move.b	(a0),d2
		eor.b	d2,d0
		move.b	d1,(a0)+
		and.b	d1,d0
		move.b	d0,(a0)+
		jsr	sub_4FF6(pc)
		jsr	release_z80_bus
		tst.b	(byte_FFEE5E).w
		beq.s	loc_21C0
		move.w	(word_FF8F2C).w,(unk_FF8FA2).w
		move.w	(word_FF8FA0).w,(word_FF8F2C).w
		rts

loc_21C0:
		tst.b	(byte_FFEE50).w
		beq.s	locret_21F8
		movea.l	(dword_FFEF40).w,a0
		move.w	(a0),d0
		cmpi.w	#$FFFF,d0
		beq.s	loc_21FA
		btst	#7,(word_FF8FB0+1).w
		beq.s	loc_21DE
		ori.w	#$8080,d0

loc_21DE:
		move.w	d0,(word_FF8FB0).w
		move.w	d0,(word_FF8F2C).w
		subq.w	#1,(word_FFEF44).w
		bpl.s	locret_21F8
		addq.l	#4,a0
		move.w	2(a0),(word_FFEF44).w
		move.l	a0,(dword_FFEF40).w

locret_21F8:
		rts

loc_21FA:
		st	(byte_FFEE6B).w
		rts

do_copy_4_palettes_to_ram:
		bsr.s	copy_4_palettes_to_ram
		rte

copy_4_palettes_to_ram:
		move.b	#1,(cram_update_needed).w
		lea	(ram_palette_0).w,a2
		bsr.s	copy_1_palette_to_ram ;	d0 = index
		bsr.s	copy_1_palette_to_ram ;	d0 = index
		bsr.s	copy_1_palette_to_ram ;	d0 = index
		bsr.s	copy_1_palette_to_ram ;	d0 = index
		rts
; d0 = index

copy_1_palette_to_ram:
		lea	(palettes_data_1).l,a1
		moveq	#0,d1
		move.b	d0,d1
		ror.l	#8,d0
		lsl.w	#5,d1
		adda.w	d1,a1
		jmp	copy_bytes_to_dest_32(pc) ; a1 = source
; a0 = source

decompress_nemesis_to_vram:
		movem.l	d0-a1/a3-a5,-(sp)
		lea	(nemesis_pcd_write_row_to_vdp).l,a3
		lea	(VDP_DATA).l,a4
		bra.s	nemesis_decomp_main
; a0 = source
; a4 = ram dest

decompress_nemesis_to_ram:
		movem.l	d0-a1/a3-a5,-(sp)
		lea	(nemesis_pcd_write_row_to_ram).l,a3

nemesis_decomp_main:
		move	#$2700,sr
		lea	(unk_FFF000).w,a1
		move.w	(a0)+,d2
		lsl.w	#1,d2
		bcc.s	loc_225A
		adda.w	#$A,a3

loc_225A:
		lsl.w	#2,d2
		movea.w	d2,a5
		moveq	#8,d3
		moveq	#0,d2
		moveq	#0,d4
		bsr.w	nemesis_build_code_table
		move.b	(a0)+,d5
		asl.w	#8,d5
		move.b	(a0)+,d5
		move.w	#$10,d6
		bsr.s	nemesis_process_compressed_data
		move	#$2500,sr
		movem.l	(sp)+,d0-a1/a3-a5
		rts

nemesis_process_compressed_data:
		move.w	d6,d7
		subq.w	#8,d7
		move.w	d5,d1
		lsr.w	d7,d1
		cmpi.b	#$FC,d1
		bcc.s	loc_22CA
		andi.w	#$FF,d1
		add.w	d1,d1
		move.b	(a1,d1.w),d0
		ext.w	d0
		sub.w	d0,d6
		cmpi.w	#9,d6
		bcc.s	loc_22A6
		addq.w	#8,d6
		asl.w	#8,d5
		move.b	(a0)+,d5

loc_22A6:
		move.b	1(a1,d1.w),d1
		move.w	d1,d0
		andi.w	#$F,d1
		andi.w	#$F0,d0

loc_22B4:
		lsr.w	#4,d0

loc_22B6:
		lsl.l	#4,d4
		or.b	d1,d4
		subq.w	#1,d3
		bne.s	loc_22C4
		jmp	(a3)

loc_22C0:
		moveq	#0,d4
		moveq	#8,d3

loc_22C4:
		dbf	d0,loc_22B6
		bra.s	nemesis_process_compressed_data

loc_22CA:
		subq.w	#6,d6
		cmpi.w	#9,d6
		bcc.s	loc_22D8
		addq.w	#8,d6
		asl.w	#8,d5
		move.b	(a0)+,d5

loc_22D8:
		subq.w	#7,d6
		move.w	d5,d1
		lsr.w	d6,d1
		move.w	d1,d0
		andi.w	#$F,d1
		andi.w	#$70,d0
		cmpi.w	#9,d6
		bcc.s	loc_22B4
		addq.w	#8,d6
		asl.w	#8,d5
		move.b	(a0)+,d5
		bra.s	loc_22B4

nemesis_pcd_write_row_to_vdp:
		move.l	d4,(a4)
		subq.w	#1,a5
		move.w	a5,d4
		bne.s	loc_22C0
		rts

nemesis_pcd_write_row_to_vdp_xor:
		eor.l	d4,d2
		move.l	d2,(a4)
		subq.w	#1,a5
		move.w	a5,d4
		bne.s	loc_22C0
		rts

nemesis_pcd_write_row_to_ram:
		move.l	d4,(a4)+
		subq.w	#1,a5
		move.w	a5,d4
		bne.s	loc_22C0
		rts

nemesis_pcd_write_row_to_ram_xor:
		eor.l	d4,d2
		move.l	d2,(a4)+
		subq.w	#1,a5
		move.w	a5,d4
		bne.s	loc_22C0
		rts

nemesis_build_code_table:
		move.b	(a0)+,d0

loc_2324:
		cmpi.b	#$FF,d0
		bne.s	loc_232C
		rts

loc_232C:
		move.w	d0,d7

loc_232E:
		move.b	(a0)+,d0
		cmpi.b	#$80,d0
		bcc.s	loc_2324
		move.b	d0,d1
		andi.w	#$F,d7
		andi.w	#$70,d1
		or.w	d1,d7
		andi.w	#$F,d0
		move.b	d0,d1
		lsl.w	#8,d1
		or.w	d1,d7
		moveq	#8,d1
		sub.w	d0,d1
		bne.s	loc_235C
		move.b	(a0)+,d0
		add.w	d0,d0
		move.w	d7,(a1,d0.w)
		bra.s	loc_232E

loc_235C:
		move.b	(a0)+,d0
		lsl.w	d1,d0
		add.w	d0,d0
		moveq	#1,d5
		lsl.w	d1,d5
		subq.w	#1,d5

loc_2368:
		move.w	d7,(a1,d0.w)
		addq.w	#2,d0
		dbf	d5,loc_2368
		bra.s	loc_232E
; a0 = source
; a1 = dest
; d0 = OR with word

decompress_enigma_to_ram:
		movem.l	d0-d7/a1-a5,-(sp)
		movea.w	d0,a3
		move.b	(a0)+,d0
		ext.w	d0
		movea.w	d0,a5
		move.b	(a0)+,d4
		lsl.b	#3,d4
		movea.w	(a0)+,a2
		adda.w	a3,a2
		movea.w	(a0)+,a4
		adda.w	a3,a4
		move.b	(a0)+,d5
		asl.w	#8,d5
		move.b	(a0)+,d5
		moveq	#$10,d6

loc_2394:
		moveq	#7,d0
		move.w	d6,d7
		sub.w	d0,d7
		move.w	d5,d1
		lsr.w	d7,d1
		andi.w	#$7F,d1
		move.w	d1,d2
		cmpi.w	#$40,d1
		bcc.s	loc_23AE
		moveq	#6,d0
		lsr.w	#1,d2

loc_23AE:
		bsr.w	sub_24E2
		andi.w	#$F,d2
		lsr.w	#4,d1
		add.w	d1,d1
		jmp	loc_240A(pc,d1.w)

loc_23BE:
		move.w	a2,(a1)+
		addq.w	#1,a2
		dbf	d2,loc_23BE
		bra.s	loc_2394

loc_23C8:
		move.w	a4,(a1)+
		dbf	d2,loc_23C8
		bra.s	loc_2394

loc_23D0:
		bsr.w	sub_2432

loc_23D4:
		move.w	d1,(a1)+
		dbf	d2,loc_23D4
		bra.s	loc_2394

loc_23DC:
		bsr.w	sub_2432

loc_23E0:
		move.w	d1,(a1)+
		addq.w	#1,d1
		dbf	d2,loc_23E0
		bra.s	loc_2394

loc_23EA:
		bsr.w	sub_2432

loc_23EE:
		move.w	d1,(a1)+
		subq.w	#1,d1
		dbf	d2,loc_23EE
		bra.s	loc_2394

loc_23F8:
		cmpi.w	#$F,d2
		beq.s	loc_241A

loc_23FE:
		bsr.w	sub_2432
		move.w	d1,(a1)+
		dbf	d2,loc_23FE
		bra.s	loc_2394

loc_240A:
		bra.s	loc_23BE
		bra.s	loc_23BE
		bra.s	loc_23C8
		bra.s	loc_23C8
		bra.s	loc_23D0
		bra.s	loc_23DC
		bra.s	loc_23EA
		bra.s	loc_23F8

loc_241A:
		subq.w	#1,a0
		cmpi.w	#$10,d6
		bne.s	loc_2424
		subq.w	#1,a0

loc_2424:
		move.w	a0,d0
		lsr.w	#1,d0
		bcc.s	loc_242C
		addq.w	#1,a0

loc_242C:
		movem.l	(sp)+,d0-d7/a1-a5
		rts

sub_2432:
		move.w	a3,d3
		move.b	d4,d1
		add.b	d1,d1
		bcc.s	loc_2444
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_2444
		ori.w	#$8000,d3

loc_2444:
		add.b	d1,d1
		bcc.s	loc_2452
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_2452
		addi.w	#$4000,d3

loc_2452:
		add.b	d1,d1
		bcc.s	loc_2460
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_2460
		addi.w	#$2000,d3

loc_2460:
		add.b	d1,d1
		bcc.s	loc_246E
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_246E
		ori.w	#$1000,d3

loc_246E:
		add.b	d1,d1
		bcc.s	loc_247C
		subq.w	#1,d6
		btst	d6,d5
		beq.s	loc_247C
		ori.w	#$800,d3

loc_247C:
		move.w	d5,d1
		move.w	d6,d7
		sub.w	a5,d7
		bcc.s	loc_24AC
		move.w	d7,d6
		addi.w	#$10,d6
		neg.w	d7
		lsl.w	d7,d1
		move.b	(a0),d5
		rol.b	d7,d5
		add.w	d7,d7
		and.w	word_24C2-2(pc,d7.w),d5
		add.w	d5,d1

loc_249A:
		move.w	a5,d0
		add.w	d0,d0
		and.w	word_24C2-2(pc,d0.w),d1
		add.w	d3,d1
		move.b	(a0)+,d5
		lsl.w	#8,d5
		move.b	(a0)+,d5
		rts

loc_24AC:
		beq.s	loc_24BE
		lsr.w	d7,d1
		move.w	a5,d0
		add.w	d0,d0
		and.w	word_24C2-2(pc,d0.w),d1
		add.w	d3,d1
		move.w	a5,d0
		bra.s	sub_24E2

loc_24BE:
		moveq	#$10,d6

loc_24C0:
		bra.s	loc_249A

word_24C2:	dc.w 1
		dc.w 3
		dc.w 7
		dc.w $F
		dc.w $1F
		dc.w $3F
		dc.w $7F
		dc.w $FF
		dc.w $1FF
		dc.w $3FF
		dc.w $7FF
		dc.w $FFF
		dc.w $1FFF
		dc.w $3FFF
		dc.w $7FFF
		dc.w $FFFF
sub_24E2:
		sub.w	d0,d6
		cmpi.w	#9,d6
		bcc.s	locret_24F0
		addq.w	#8,d6
		asl.w	#8,d5
		move.b	(a0)+,d5

locret_24F0:
		rts
; a0 = source
; a1 = dest

decompress_kosinski_to_ram:
		subq.l	#2,sp
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5
		moveq	#$F,d4

loc_24FE:
		lsr.w	#1,d5
		move	sr,d6
		dbf	d4,loc_2510
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5
		moveq	#$F,d4

loc_2510:
		move	d6,ccr
		bcc.s	loc_2518
		move.b	(a0)+,(a1)+
		bra.s	loc_24FE

loc_2518:
		moveq	#0,d3
		lsr.w	#1,d5
		move	sr,d6
		dbf	d4,loc_252C
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5
		moveq	#$F,d4

loc_252C:
		move	d6,ccr
		bcs.s	loc_255C
		lsr.w	#1,d5
		dbf	d4,loc_2540
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5
		moveq	#$F,d4

loc_2540:
		roxl.w	#1,d3
		lsr.w	#1,d5
		dbf	d4,loc_2552
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5
		moveq	#$F,d4

loc_2552:
		roxl.w	#1,d3
		addq.w	#1,d3
		moveq	#-1,d2
		move.b	(a0)+,d2
		bra.s	loc_2572

loc_255C:
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		moveq	#-1,d2
		move.b	d1,d2
		lsl.w	#5,d2
		move.b	d0,d2
		andi.w	#7,d1
		beq.s	loc_257E
		move.b	d1,d3
		addq.w	#1,d3

loc_2572:
		move.b	(a1,d2.w),d0
		move.b	d0,(a1)+
		dbf	d3,loc_2572
		bra.s	loc_24FE

loc_257E:
		move.b	(a0)+,d1
		beq.s	loc_258E
		cmpi.b	#1,d1
		beq.w	loc_24FE
		move.b	d1,d3
		bra.s	loc_2572

loc_258E:
		addq.l	#2,sp
		rts

sub_2592:
		lea	(word_FF8500).w,a1
		lea	(unk_FF8600).w,a3
		lea	(unk_FF8702).w,a4
		move.w	#$C000,d6
		jsr	sub_25E6(pc)
		jsr	sub_26A2(pc)
		jsr	sub_2700(pc)
		jsr	call_level_update_func(pc)
		lea	(unk_FF8540).w,a1
		jsr	sub_262C(pc)
		lea	(unk_FF8784).w,a3
		lea	(unk_FF8886).w,a4
		move.w	#$E000,d6
		jsr	sub_26A2(pc)
		jsr	sub_2700(pc)
		jsr	sub_283A(pc)
		moveq	#0,d0
		move.l	d0,(dword_FF8534).w
		move.l	d0,(dword_FF8530).w
		move.l	d0,(dword_FF8574).w
		move.l	d0,(dword_FF8570).w
		rts

sub_25E6:
		tst.b	(word_FFEE56).w
		bne.s	loc_2608
		move.l	(player_pos_x).w,d0
		sub.l	(planea_start_x).w,d0
		move.l	d0,d1
		sub.l	(planea_size_r).w,d0
		bcc.s	loc_2604
		sub.l	(planea_size_l).w,d1
		bcc.s	loc_2608
		move.l	d1,d0

loc_2604:
		add.l	d0,(dword_FF8534).w

loc_2608:
		tst.b	(word_FFEE56+1).w
		bne.s	locret_262A
		move.l	(player_pos_y).w,d0
		sub.l	(planea_start_y).w,d0
		move.l	d0,d1
		sub.l	(planeb_size_r).w,d0
		bcc.s	loc_2626
		sub.l	(planeb_size_l).w,d1
		bcc.s	locret_262A
		move.l	d1,d0

loc_2626:
		add.l	d0,(dword_FF8530).w

locret_262A:
		rts

sub_262C:
		move.w	(planeb_scroll_type).w,d0
		add.w	d0,d0
		add.w	d0,d0
		jmp	loc_263A(pc,d0.w)
		nop

loc_263A:
		bra.w	locret_26A0
		bra.w	loc_2652
		bra.w	loc_2662
		bra.w	loc_266E
		bra.w	loc_267C
		bra.w	loc_268C

loc_2652:
		move.l	(dword_FF8534).w,d0
		asr.l	#1,d0
		move.l	(dword_FF8530).w,d1
		asr.l	#1,d1
		bra.w	loc_2698

loc_2662:
		move.l	(dword_FF8534).w,d0
		move.l	(dword_FF8530).w,d1
		bra.w	loc_2698

loc_266E:
		move.l	(dword_FF8534).w,d0
		asr.l	#1,d0
		move.l	(dword_FF8530).w,d1
		bra.w	loc_2698

loc_267C:
		move.l	(dword_FF8534).w,d0
		asr.l	#5,d0
		move.l	(dword_FF8530).w,d1
		asr.l	#1,d1
		bra.w	loc_2698

loc_268C:
		move.l	(dword_FF8534).w,d0
		asr.l	#1,d0
		move.l	(dword_FF8530).w,d1
		asr.l	#5,d1

loc_2698:
		add.l	d0,$34(a1)
		add.l	d1,$30(a1)

locret_26A0:
		rts

sub_26A2:
		move.l	$24(a1),$2C(a1)
		move.l	$34(a1),d0
		add.l	d0,$24(a1)
		move.l	4(a1),d1
		cmp.l	$24(a1),d1
		bge.s	loc_26C4
		move.l	0.w(a1),d1
		cmp.l	$24(a1),d1
		bgt.s	loc_26D0

loc_26C4:
		sub.l	d0,$24(a1)
		move.l	#0,$34(a1)

loc_26D0:
		move.l	$20(a1),$28(a1)
		move.l	$30(a1),d0
		add.l	d0,$20(a1)
		move.l	$C(a1),d1
		cmp.l	$20(a1),d1
		bge.s	loc_26F2
		move.l	8(a1),d1
		cmp.l	$20(a1),d1
		bgt.s	locret_26FE

loc_26F2:
		sub.l	d0,$20(a1)
		move.l	#0,$30(a1)

locret_26FE:
		rts

sub_2700:
		move.w	$24(a1),d0
		move.w	$2C(a1),d1
		eor.w	d1,d0
		andi.w	#$FFF0,d0
		beq.s	loc_2734
		cmp.w	$24(a1),d1
		blt.s	loc_2724
		move.w	$24(a1),d0
		move.w	$20(a1),d1
		jsr	sub_27D2(pc)
		bra.s	loc_2734

loc_2724:
		move.w	$2C(a1),d0
		addi.w	#$200,d0
		move.w	$20(a1),d1
		jsr	sub_27D2(pc)

loc_2734:
		move.w	$20(a1),d0
		move.w	$28(a1),d1
		eor.w	d1,d0
		andi.w	#$FFF0,d0
		beq.s	locret_2766
		cmp.w	$20(a1),d1
		blt.s	loc_2756
		move.w	$24(a1),d0
		move.w	$20(a1),d1
		bra.w	sub_2768

loc_2756:
		move.w	$24(a1),d0
		move.w	$28(a1),d1
		addi.w	#$100,d1
		bra.w	sub_2768

locret_2766:
		rts

sub_2768:
		move.w	d0,d2
		move.w	d1,d3
		lsl.w	#4,d3
		andi.w	#$F00,d3
		lsr.w	#2,d2
		andi.w	#$7C,d2
		add.w	d3,d2
		add.w	d6,d2
		andi.w	#$7FFF,d2
		move.w	d2,(a3)+
		moveq	#$10,d2
		moveq	#$1F,d3
		moveq	#8,d7

loc_2788:
		move.w	d0,d4
		move.w	d1,d5
		movea.l	$10(a1),a2
		lsr.w	#8,d4
		lsr.w	#8,d5
		lsl.w	#5,d5
		add.w	d4,d5
		move.b	(a2,d5.w),d4
		movea.l	$14(a1),a2
		lsl.w	d7,d4
		move.w	d0,d5
		lsr.w	#4,d5
		andi.w	#$F,d5
		add.w	d4,d5
		move.w	d1,d4
		andi.w	#$F0,d4
		add.w	d4,d5
		moveq	#0,d4
		move.b	(a2,d5.w),d4
		movea.l	$18(a1),a2
		lsl.w	#3,d4
		move.l	(a2,d4.w),(a3)+
		move.l	4(a2,d4.w),$7C(a3)
		add.w	d2,d0
		dbf	d3,loc_2788
		rts

sub_27D2:
		move.w	d0,d2
		move.w	d1,d3
		lsl.w	#4,d3
		andi.w	#$F00,d3
		lsr.w	#2,d2
		andi.w	#$7C,d2
		add.w	d3,d2
		add.w	d6,d2
		andi.w	#$7FFF,d2
		move.w	d2,(a4)+
		moveq	#$10,d2
		moveq	#$F,d3
		moveq	#8,d7

loc_27F2:
		move.w	d0,d4
		move.w	d1,d5
		movea.l	$10(a1),a2
		lsr.w	#8,d4
		lsr.w	#8,d5
		lsl.w	#5,d5
		add.w	d5,d4
		move.b	(a2,d4.w),d4
		movea.l	$14(a1),a2
		lsl.w	d7,d4
		move.w	d0,d5
		lsr.w	#4,d5
		andi.w	#$F,d5
		add.w	d4,d5
		move.w	d1,d4
		andi.w	#$F0,d4
		add.w	d4,d5
		moveq	#0,d4
		move.b	(a2,d5.w),d4
		movea.l	$18(a1),a2
		lsl.w	#3,d4
		move.l	(a2,d4.w),(a4)+
		move.l	4(a2,d4.w),(a4)+
		add.w	d2,d1
		dbf	d3,loc_27F2
		rts

sub_283A:
		btst	#4,(byte_FFEE01).w
		bne.w	locret_28D6
		move.w	(planea_start_x).w,d1
		neg.w	d1
		swap	d1
		move.w	(planeb_start_x).w,d1
		neg.w	d1
		lea	(word_FFF700).w,a1
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		moveq	#3,d7
		lea	(unk_FF8D00).w,a1

loc_2878:
		tst.w	(a1)
		beq.w	loc_28D0
		lea	(word_FFF700).w,a2
		lea	(word_FF8500).w,a3
		bmi.s	loc_288E
		addq.l	#2,a2
		lea	(unk_FF8540).w,a3

loc_288E:
		movem.w	2(a1),d1-d2/a4
		move.w	$20(a3),d3
		move.w	d3,d4
		addi.w	#$BF,d4
		cmp.w	d3,d2
		bcs.s	loc_28D0
		cmp.w	d4,d1
		bhi.s	loc_28D0
		cmp.w	d3,d1
		bhi.s	loc_28AC
		move.w	d3,d1

loc_28AC:
		cmp.w	d4,d2
		bcs.s	loc_28B2
		move.w	d4,d2

loc_28B2:
		move.w	d1,d4
		sub.w	2(a1),d4
		asl.w	#1,d4
		adda.w	d4,a4
		sub.w	d1,d2
		bmi.s	loc_28D8
		sub.w	d3,d1
		bmi.s	loc_28D8
		asl.w	#2,d1
		adda.w	d1,a2

loc_28C8:
		move.w	(a4)+,(a2)
		addq.w	#4,a2
		dbf	d2,loc_28C8

loc_28D0:
		addq.w	#8,a1
		dbf	d7,loc_2878

locret_28D6:
		rts

loc_28D8:
		divu.w	#0,d7

sub_28DC:
		move.w	(planea_start_y).w,(dword_FF8FB2).w
		move.w	(planea_start_x).w,(dword_FF8FB2+2).w
		move.l	#$40000010,(a5)
		move.w	(planea_start_y).w,d2
		sub.w	(dword_FF8F86+2).w,d2
		move.w	d2,(a6)
		move.w	(planeb_start_y).w,(a6)
		move.l	#$50000003,(a5)
		bsr.w	sub_2966
		lea	(unk_FF8600).w,a3
		lea	(unk_FF8702).w,a4
		move.w	#$80,d2
		move.w	#$EFFF,d3
		moveq	#3,d4
		move.w	#$FF7F,d5
		bsr.s	sub_2926
		lea	(unk_FF8784).w,a3
		lea	(unk_FF8886).w,a4

sub_2926:
		move.w	(a4),d0
		beq.s	loc_293E
		move.w	#0,(a4)+
		moveq	#$1F,d7

loc_2930:
		move.w	d0,(a5)
		move.w	d4,(a5)
		move.l	(a4)+,(a6)
		add.w	d2,d0
		and.w	d3,d0
		dbf	d7,loc_2930

loc_293E:
		move.w	(a3),d0
		beq.s	locret_2964
		move.w	#0,(a3)+
		lea	$80(a3),a4
		moveq	#$1F,d7

loc_294C:
		move.w	d0,(a5)
		move.w	d4,(a5)
		move.l	(a3)+,(a6)
		move.w	d0,d6
		add.w	d2,d6
		move.w	d6,(a5)
		move.w	d4,(a5)
		move.l	(a4)+,(a6)
		addq.w	#4,d0
		and.w	d5,d0
		dbf	d7,loc_294C

locret_2964:
		rts

sub_2966:
		btst	#0,(byte_FFEE01).w
		bne.s	loc_2984
		move.w	(planea_start_x).w,d0
		sub.w	(dword_FF8F86).w,d0
		neg.w	d0
		move.w	d0,(a6)
		move.w	(planeb_start_x).w,d0
		neg.w	d0
		move.w	d0,(a6)
		rts

loc_2984:
		jsr	request_z80_bus
		move.l	#$93C09401,(a5)
		move.l	#$958096FB,(a5)
		move.w	#$977F,(a5)
		move.w	#$5000,(a5)
		move.w	#$83,-(sp)
		move.w	(sp)+,(a5)
		move.l	#$50000003,(a5)
		move.w	(word_FFF700).w,(a6)
		jsr	release_z80_bus
		rts

call_level_update_func:
		lea	(word_FF89E0).w,a2
		moveq	#0,d0
		move.w	(level_update_func).w,d0
		movea.l	d0,a3
		jmp	(a3)

level_update_1_0:
		lea	(word_322E).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_1_1:
		lea	(word_323A).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_1_2:
		lea	(word_3250).l,a1
		jsr	sub_31F8(pc)	; a1 = ?
		lea	(unk_FF8B00).w,a1
		moveq	#0,d2
		move.w	#$97,d7
		bsr.s	sub_29F6
		move.w	(planeb_start_x).w,d2
		asr.w	#2,d2
		moveq	#$17,d7

sub_29F6:
		neg.w	d2

loc_29F8:
		move.w	d2,(a1)+
		dbf	d7,loc_29F8
		rts

level_update_2_0:
		jsr	level_update_7_0(pc)
		bsr.s	sub_2A26
		lea	(word_325C).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_2_1:
		bsr.s	sub_2A26
		lea	(word_3268).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_2_3:
		lea	(word_3280).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

sub_2A26:
		lea	(unk_FF8B00).w,a1
		moveq	#0,d1
		move.w	(planeb_start_x).w,d1
		addq.w	#1,2(a2)
		move.w	2(a2),d3
		move.l	d1,d2
		asr.w	#2,d2
		asr.w	#1,d3
		add.w	d3,d2
		moveq	#$F,d7
		bsr.s	sub_2A62
		asr.w	#1,d3
		move.w	d3,d2
		moveq	#$F,d7
		bsr.s	sub_2A62
		move.l	d1,d2
		asr.w	#8,d2
		moveq	#$3F,d7
		bsr.s	sub_2A62
		move.l	d1,d2
		asr.w	#2,d2
		moveq	#7,d7
		bsr.s	sub_2A62
		move.l	d1,d2
		asr.w	#1,d2
		moveq	#$F,d7

sub_2A62:
		neg.w	d2

loc_2A64:
		move.w	d2,(a1)+
		dbf	d7,loc_2A64
		rts

level_update_2_2:
		bsr.s	sub_2A26
		tst.b	(byte_FFEEEC).w
		beq.s	locret_2A7E
		lea	(word_3274).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

locret_2A7E:
		rts

level_update_3_0:
		tst.b	(byte_FFEEF0).w
		bne.s	loc_2AA0
		move.w	(player_pos_x).w,d0
		cmpi.w	#$F40,d0
		bcs.s	loc_2AA0
		st	(byte_FFEEF0).w
		moveq	#$3C,d1
		jsr	sub_104E(pc)
		moveq	#3,d0
		jsr	sub_92C8(pc)

loc_2AA0:
		subq.w	#1,(a2)
		bpl.s	loc_2AD4
		move.w	#7,(a2)
		lea	(ram_palette_2).w,a3
		move.w	ram_palette_2+$14-ram_palette_2(a3),d0
		move.l	$16(a3),$14(a3)
		move.w	d0,$18(a3)
		move.w	$12(a3),d0
		move.w	$1A(a3),$12(a3)
		move.l	$1C(a3),$1A(a3)
		move.w	d0,$1E(a3)
		move.b	#1,(cram_update_needed).w

loc_2AD4:
		subq.w	#1,2(a2)
		bpl.s	loc_2B00
		move.w	#$14,2(a2)
		subq.w	#1,4(a2)
		bpl.s	loc_2AEC
		move.w	#9,4(a2)

loc_2AEC:
		move.w	4(a2),d0
		add.w	d0,d0
		add.w	d0,d0
		move.l	word_2B0A(pc,d0.w),(ram_palette_3+$1C).w
		move.b	#1,(cram_update_needed).w

loc_2B00:
		lea	(word_328C).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

word_2B0A:	dc.w $864, $EA2, $A66, $E84, $C66, $E66, $E66, $C66, $E84, $A66
		dc.w $EA2, $864, $E84, $A66, $E66, $C66, $C66, $E66, $A66, $E84
level_update_3_1:
		lea	(word_3298).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_3_2:
		lea	(word_32AE).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_3_3:
		lea	(word_32BA).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_3_4:
		lea	(word_32D0).l,a1
		jsr	sub_31F8(pc)	; a1 = ?
		move.w	(planea_start_x).w,d5
		sub.w	(planeb_start_x).w,d5
		tst.b	2(a2)
		bne.s	loc_2BA4
		move.w	#$2E0,d1
		cmp.w	(player_pos_y).w,d1
		bcs.s	loc_2B96
		cmpi.w	#$150,d5
		sge	2(a2)
		subq.b	#1,$F(a2)
		bpl.s	loc_2B8C
		move.b	#$C1,(smps_cmd2).w
		move.b	#7,$F(a2)

loc_2B8C:
		subi.l	#$8000,(dword_FF8574).w
		bra.s	loc_2BBC

loc_2B96:
		move.w	#$10,(a2)
		tst.w	d5
		bmi.s	locret_2BA2
		addq.w	#5,(dword_FF8574).w

locret_2BA2:
		rts

loc_2BA4:
		tst.w	(a2)
		beq.s	loc_2BB0
		bchg	#2,(dword_FF8F86+3).w
		subq.w	#1,(a2)

loc_2BB0:
		move.w	(player_pos_y).w,d1
		cmpi.w	#$C8,d1
		shi	(byte_FFEE58).w

loc_2BBC:
		addi.w	#$650,d5
		cmp.w	(player_pos_x).w,d5
		blt.s	locret_2BA2
		move.w	d5,(player_pos_x).w
		rts

level_update_3_5:
		lea	(word_32DC).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_3_6:
		tst.b	(byte_FFEEF3).w
		beq.s	locret_2BE6
		lea	(word_32F2).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

locret_2BE6:
		rts

level_update_4_0:
		addq.w	#1,(a2)
		move.w	(a2),d1
		moveq	#6,d2
		jsr	sub_B89C
		swap	d3
		swap	d4
		subq.w	#6,d3
		subq.w	#6,d4
		asr.w	#1,d3
		movem.w	d3-d4,(dword_FF8F86).w
		lea	(word_32FE).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_4_1:
		lea	(word_330A).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_4_2:
		tst.b	(byte_FFEEE1).w
		beq.s	locret_2C28
		lea	(word_3320).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

locret_2C28:
		rts

level_update_4_3:
		lea	(word_332C).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_4_4:
		tst.b	(byte_FFEEED).w
		beq.s	locret_2C44
		lea	(word_3338).l,a1
		jsr	sub_31F8(pc)	; a1 = ?

locret_2C44:
		rts

level_update_5_0:
		jsr	sub_2C54(pc)
		lea	(word_3344).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

sub_2C54:
		tst.b	(byte_FF89A8).w
		bne.w	locret_2C8E
		subq.w	#1,$10(a2)
		bpl.s	locret_2C8E
		move.w	#$D,$10(a2)
		subq.w	#1,$12(a2)
		bpl.s	loc_2C74
		move.w	#9,$12(a2)

loc_2C74:
		move.w	$12(a2),d7
		mulu.w	#6,d7
		move.l	word_2C90(pc,d7.w),(ram_palette_3+$E).w
		move.w	word_2C90+4(pc,d7.w),(ram_palette_3+$12).w
		move.b	#1,(cram_update_needed).w

locret_2C8E:
		rts

word_2C90:	dc.w $C68, $A46, $824, $E68, $C46, $A24, $C88, $A66, $844, $E88
		dc.w $C66, $A44, $E8A, $C68, $A46, $EAA, $E68, $A46, $E8A, $C68
		dc.w $A46, $E88, $C66, $A44, $C88, $A66, $844, $E68, $C46, $A24
level_update_5_1:
		jsr	sub_2C54(pc)
		cmpi.b	#2,(byte_FFEE48).w
		beq.s	loc_2CEE
		move.w	(player_pos_x).w,d0
		cmpi.w	#$40,d0
		bcs.s	loc_2CEE
		cmpi.w	#$80,d0
		bhi.s	loc_2CEE
		moveq	#$12,d1
		jsr	sub_104E(pc)

loc_2CEE:
		lea	(word_3350).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_5_2:
		lea	(unk_FF8B00).w,a1
		moveq	#0,d1
		move.w	(planeb_start_x).w,d1
		addq.w	#2,2(a2)
		move.w	2(a2),d3
		move.l	d1,d2
		asr.w	#2,d2
		add.w	d3,d2
		moveq	#$2F,d7
		jsr	sub_2DA8(pc)
		asr.w	#1,d3
		move.w	d3,d2
		moveq	#$2F,d7
		jsr	sub_2DA8(pc)
		asr.w	#1,d3
		move.w	d3,d2
		moveq	#7,d7
		jsr	sub_2DA8(pc)
		asr.w	#1,d3
		move.w	d3,d2
		moveq	#$F,d7
		bsr.s	sub_2DA8
		moveq	#0,d2
		moveq	#$1F,d7
		bsr.s	sub_2DA8
		move.l	d1,d2
		asr.w	#3,d2
		moveq	#7,d7
		bsr.s	sub_2DA8
		move.l	d1,d2
		asr.w	#2,d2
		moveq	#$F,d7
		bsr.s	sub_2DA8
		move.l	d1,d2
		asr.w	#1,d2
		moveq	#$F,d7
		bsr.s	sub_2DA8
		move.w	8(a2),d0
		move.w	(planea_start_x).w,d2
		subq.w	#1,$A(a2)
		bpl.s	loc_2D74
		move.w	#$10,$A(a2)
		addq.w	#1,d0
		cmpi.w	#3,d0
		bne.s	loc_2D70
		move.w	#0,d0

loc_2D70:
		move.w	d0,8(a2)

loc_2D74:
		lsl.w	#5,d0
		add.w	d0,d2
		moveq	#$F,d7
		bsr.s	sub_2DA8
		subq.w	#1,4(a2)
		bpl.s	loc_2D9E
		move.w	#4,4(a2)
		bchg	#2,7(a2)
		move.w	6(a2),d7
		move.l	word_2DB2(pc,d7.w),(ram_palette_3+$1C).w
		move.b	#1,(cram_update_needed).w

loc_2D9E:
		lea	(word_3366).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

sub_2DA8:
		neg.w	d2

loc_2DAA:
		move.w	d2,(a1)+
		dbf	d7,loc_2DAA
		rts

word_2DB2:	dc.w $EEE, $AA6, $AA6, $EEE
level_update_5_3:
		jsr	sub_2C54(pc)
		lea	off_2DDC(pc),a1
		moveq	#0,d0
		move.w	0.w(a2),d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		movea.l	d0,a1
		jsr	(a1)
		lea	(word_337C).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

off_2DDC:	dc.w sub_2DE4
		dc.w sub_2E20
		dc.w sub_2E48
		dc.w locret_2E64
sub_2DE4:
		tst.b	(byte_FFEEE5).w
		beq.s	locret_2E1E
		move.w	(player_pos_y).w,d1
		cmpi.w	#$D0,d1
		bhi.s	locret_2E1E
		move.w	(player_pos_x).w,d1
		cmpi.w	#$100,d1
		bcs.s	locret_2E1E
		cmpi.w	#$1F0,d1
		bcc.s	locret_2E1E
		move.b	#$82,(smps_cmd2).w
		sf	(byte_FFEE64).w
		move.b	#1,(byte_FFEE5E).w
		move.w	#7,(word_FF8D20).w
		addq.w	#1,0.w(a2)

locret_2E1E:
		rts

sub_2E20:
		tst.b	(byte_FFEE6A).w
		bne.s	loc_2E36
		sf	(byte_FFEE64).w
		move.w	#$3C,2(a2)
		addq.w	#1,0.w(a2)
		rts

loc_2E36:
		cmpi.w	#$98,(planeb_size_r).w
		bcc.s	locret_2E46
		addq.w	#1,(planeb_size_r).w
		addq.w	#1,(planeb_size_l).w

locret_2E46:
		rts

sub_2E48:
		tst.b	(byte_FFEE73).w
		beq.s	locret_2E64
		subq.w	#1,2(a2)
		bne.s	locret_2E64
		sf	(byte_FFEEE5).w
		st	(byte_FFEEF9).w
		st	(byte_FFEE5F).w
		addq.w	#1,0.w(a2)

locret_2E64:
		rts

level_update_6_0:
		tst.b	(byte_FFEEF2).w
		bne.s	loc_2E86
		move.w	(player_pos_x).w,d0
		cmpi.w	#$F20,d0
		bcs.s	loc_2E86
		st	(byte_FFEEF2).w
		moveq	#$3D,d1
		jsr	sub_104E(pc)
		moveq	#6,d0
		jsr	sub_92C8(pc)

loc_2E86:
		lea	(word_3388).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_6_2:
		lea	(word_33B6).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_6_3:
		lea	(word_33D6).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_6_4:
		lea	(word_33F6).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_6_5:
		lea	(word_340C).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_6_6:
		lea	(word_3422).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_6_7:
		lea	(word_3442).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_6_1:
		tst.b	(byte_FFEEEE).w
		bne.s	loc_2EDC
		lea	(word_3394).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

loc_2EDC:
		lea	(word_33AA).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_6_8:
		tst.b	(byte_FFEEEE).w
		beq.s	locret_2EF6
		lea	(word_3462).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

locret_2EF6:
		rts

level_update_7_0:
		subq.w	#1,(a2)
		bpl.s	loc_2F18
		move.w	#$C,(a2)
		lea	((ram_palette_2+$1A)).w,a3
		move.w	0.w(a3),d0
		move.l	2(a3),0.w(a3)
		move.w	d0,4(a3)
		move.b	#1,(cram_update_needed).w

loc_2F18:
		tst.b	(byte_FFEEF5).w
		beq.s	locret_2F28
		lea	(word_346E).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

locret_2F28:
		rts

level_update_7_1:
		jsr	sub_2F50(pc)
		lea	(word_347A).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_7_2:
		jsr	sub_2F50(pc)
		lea	(word_3490).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_7_3:
		lea	(word_34A6).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

sub_2F50:
		subq.w	#1,(a2)
		bpl.s	locret_2F7C
		move.w	#$F,(a2)
		lea	((ram_palette_2+$18)).w,a3
		move.w	6(a3),d0
		move.w	4(a3),6(a3)
		move.w	2(a3),4(a3)
		move.w	0.w(a3),2(a3)
		move.w	d0,0.w(a3)
		move.b	#1,(cram_update_needed).w

locret_2F7C:
		rts

level_update_7_4:
		tst.b	(byte_FFEEE3).w
		bne.s	loc_2F98
		lea	off_2FA2(pc),a1
		moveq	#0,d0
		move.w	0.w(a2),d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		movea.l	d0,a1
		jsr	(a1)

loc_2F98:
		lea	(word_34BC).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

off_2FA2:	dc.w sub_2FB2
		dc.w sub_2FC0
		dc.w sub_30A0
		dc.w sub_3014
		dc.w sub_3080
		dc.w sub_30A0
		dc.w sub_309A
		dc.w locret_309E
sub_2FB2:
		cmpi.w	#$C0,(player_pos_x).w
		bcs.s	locret_2FBE
		addq.w	#1,0.w(a2)

locret_2FBE:
		rts

sub_2FC0:
		move.w	2(a2),d1
		lea	(unk_FF0106).l,a3
		asl.w	#4,d1
		lea	(a3,d1.w),a3
		move.l	#$C018,d0
		move.w	2(a2),d1
		asl.w	#8,d1
		add.w	d1,d0
		jsr	get_vram_write_cmd(pc) ; d0 = vram dest
		lea	byte_3012(pc),a1
		moveq	#1,d1
		moveq	#0,d2
		move.l	a2,-(sp)
		movea.l	a3,a2
		jsr	sub_424A(pc)	; d0 = ?
		movea.l	(sp)+,a2
		addq.w	#1,2(a2)
		cmpi.w	#$C,2(a2)
		bne.s	locret_3010
		move.b	#$A,$E(a2)
		addq.w	#1,0.w(a2)
		move.b	#$82,(smps_cmd2).w

locret_3010:
		rts

byte_3012:	dc.b 3,	4
sub_3014:
		move.l	#$10203,d0
		cmp.l	$A(a2),d0
		beq.w	loc_306C
		bchg	#1,(dword_FF8F86+3).w
		subi.l	#$8000,(dword_FF8570).w
		move.w	(planea_start_y).w,d1
		sub.w	(planeb_start_y).w,d1
		subq.b	#1,$F(a2)
		bpl.s	loc_304A
		move.b	#$C1,(smps_cmd2).w
		move.b	#7,$F(a2)

loc_304A:
		cmpi.w	#$100,d1
		blt.s	loc_305C
		move.b	#$A,$E(a2)
		move.w	#5,0.w(a2)

loc_305C:
		addi.w	#$C0,d1
		cmp.w	(player_pos_y).w,d1
		blt.s	locret_306A
		move.w	d1,(player_pos_y).w

locret_306A:
		rts

loc_306C:
		move.b	#0,(dword_FF8F86+3).w
		move.w	#4,0.w(a2)
		move.b	#$8B,(smps_cmd1).w
		rts

sub_3080:
		addi.l	#$8000,(dword_FF8570).w
		move.w	(planea_start_y).w,d1
		sub.w	(planeb_start_y).w,d1
		bne.s	locret_3098
		move.w	#7,0.w(a2)

locret_3098:
		rts

sub_309A:
		st	(byte_FFEE58).w

locret_309E:
		rts

sub_30A0:
		moveq	#2,d4
		bchg	d4,(dword_FF8F86+3).w
		subq.b	#1,$E(a2)
		bne.s	locret_30B6
		move.b	#0,(dword_FF8F86+3).w
		addq.w	#1,0.w(a2)

locret_30B6:
		rts

level_update_7_5:
		move.w	#$1C0,d1
		jsr	sub_30CA(pc)
		lea	(word_34D2).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

sub_30CA:
		move.w	(player_pos_y).w,d0
		cmp.w	d1,d0
		blt.s	locret_30E2
		move.b	(word_FFA2C2+1).w,d0
		cmpi.b	#$1E,d0
		beq.s	locret_30E2
		move.w	#$801E,(word_FFA2C2).w

locret_30E2:
		rts

level_update_8_0:
		lea	(word_34DE).l,a1
		jsr	sub_31F8(pc)	; a1 = ?
		move.w	(player_pos_x).w,d1
		cmpi.w	#$EA0,d1
		bcc.s	loc_3106
		move.w	#$200,(word_FF8F6C).w
		move.w	#$120,(word_FF8508).w
		rts

loc_3106:
		move.w	#$400,(word_FF8F6C).w
		move.w	#$320,(word_FF8508).w
		rts

level_update_8_1:
		subq.w	#1,(a2)
		bpl.s	loc_3138
		move.w	#1,(a2)
		lea	((ram_palette_2+$1A)).w,a3
		move.w	4(a3),d0
		move.w	2(a3),4(a3)
		move.w	0.w(a3),2(a3)
		move.w	d0,(a3)
		move.b	#1,(cram_update_needed).w

loc_3138:
		move.w	#$2D0,d1
		jsr	sub_30CA(pc)
		lea	(word_34EA).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_8_2:
		addq.w	#1,(word_FFA342).w
		lea	(word_34F6).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_8_3:
		subq.w	#1,(a2)
		bpl.s	loc_317A
		move.w	#7,(a2)
		lea	((ram_palette_3+$14)).w,a3
		move.w	6(a3),d0
		move.l	2(a3),4(a3)
		move.w	(a3),2(a3)
		move.w	d0,(a3)
		move.b	#1,(cram_update_needed).w

loc_317A:
		lea	(word_3502).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_8_4:
		tst.b	(byte_FFEEFA).w
		beq.s	locret_319C
		sf	(byte_FFEE64).w
		moveq	#$1C,d1
		jsr	sub_104E(pc)
		jsr	sub_1060(pc)
		st	(byte_FFEE5F).w

locret_319C:
		rts

level_update_9_0:
		lea	(word_350E).l,a1
		jsr	sub_31F8(pc)	; a1 = ?
		move.w	(player_pos_x).w,d1
		cmpi.w	#$C30,d1
		bcc.s	loc_31C6
		cmpi.w	#$550,d1
		bcs.s	loc_31D4
		move.w	#$200,(word_FF8F6C).w
		move.w	#$120,(word_FF8508).w
		rts

loc_31C6:
		move.w	#$400,(word_FF8F6C).w
		move.w	#$320,(word_FF8508).w
		rts

loc_31D4:
		move.w	#$300,(word_FF8F6C).w
		move.w	#$220,(word_FF8508).w
		rts

level_update_9_1:
		lea	(word_351A).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_9_2:
		lea	(word_3526).l,a1
		jmp	sub_31F8(pc)	; a1 = ?

level_update_9_3:
		rts
; a1 = ?

sub_31F8:
		tst.b	(byte_FFEE5E).w
		beq.s	loc_3200
		rts

loc_3200:
		move.w	(a1)+,d7

loc_3202:
		movem.w	(a1)+,d1-d5
		move.w	(player_pos_x).w,d0
		cmp.w	d1,d0
		bcs.s	loc_321E
		cmp.w	d2,d0
		bhi.s	loc_321E
		move.w	(player_pos_y).w,d0
		cmp.w	d3,d0
		bcs.s	loc_321E
		cmp.w	d4,d0
		bls.s	loc_3224

loc_321E:
		dbf	d7,loc_3202
		rts

loc_3224:
		move.w	d5,(level_params1_index).w
		st	(byte_FFEE4F).w
		rts

word_322E:	dc.w 0
		struc_8 $12D0,	$FFFF, 0, $28, 1
word_323A:	dc.w 1
		struc_8 0, $20, $150, $FFFF, 2
		struc_8 $9E0, $FFFF, 0, $FFFF,	3
word_3250:	dc.w 0
		struc_8 0, $18, 0, $FFFF, 4
word_325C:	dc.w 0
		struc_8 $FE0, $FFFF, 0, $FFFF,	1
word_3268:	dc.w 0
		struc_8 $FE8, $FFFF, 0, $FFFF,	2
word_3274:	dc.w 0
		struc_8 $1C0, $1E0, $70, $C0, 3
word_3280:	dc.w 0
		struc_8 0, $18, $240, $FFFF, 5
word_328C:	dc.w 0
		struc_8 $FC0, $FFFF, 0, $FFFF,	1
word_3298:	dc.w 1
		struc_8 0, $18, 0, $FFFF, 8
		struc_8 $F80, $FD0, $D8, $FFFF, 2
word_32AE:	dc.w 0
		struc_8 $9A0, $FFFF, 0, $24, 3
word_32BA:	dc.w 1
		struc_8 $540, $560, $90, $C0, 4
		struc_8 $7F0, $FFFF, 0, $FFFF,	3
word_32D0:	dc.w 0
		struc_8 $9E0, $FFFF, 0, $FFFF,	5
word_32DC:	dc.w 1
		struc_8 $7E0, $FFFF, $150, $FFFF, 5
		struc_8 $6D0, $700, $50, $70, 6
word_32F2:	dc.w 0
		struc_8 $138, $148, $B8, $C0, 8
word_32FE:	dc.w 0
		struc_8 $BA0, $FFFF, 0, $40, 1
word_330A:	dc.w 1
		struc_8 0, $18, $160, $FFFF, 5
		struc_8 $B90, $FFFF, $1B0, $FFFF, 2
word_3320:	dc.w 0
		struc_8 $180, $1A0, $BC, $C0, 3
word_332C:	dc.w 0
		struc_8 $2A0, $2B0, $1B8, $1C0, 4
word_3338:	dc.w 0
		struc_8 $1A8, $1B8, $C8, $D0, 6
word_3344:	dc.w 0
		struc_8 $FE0, $FFFF, 0, $FFFF,	1
word_3350:	dc.w 1
		struc_8 0, $18, 0, $FFFF, 4
		struc_8 $9E0, $FFFF, 0, $FFFF,	2
word_3366:	dc.w 1
		struc_8 0, $18, 0, $FFFF, 5
		struc_8 $13E0,	$FFFF, 0, $FFFF, 3
word_337C:	dc.w 0
		struc_8 0, $18, 0, $FFFF, 6
word_3388:	dc.w 0
		struc_8 $FA0, $FC0, $BE, $C0, 8
word_3394:	dc.w 1
		struc_8 0, $18, 0, $FFFF, 9
		struc_8 $128, $FFFF, 0, $FFFF,	1
word_33AA:	dc.w 0
		struc_8 0, $18, 0, $FFFF, 9
word_33B6:	dc.w 2
		struc_8 $1C0, $1E0, $88, $90, 3
		struc_8 $1C0, $1E0, $1C8, $1D0, 5
		struc_8 $B0, $D0, $1C8, $1D0, 5
word_33D6:	dc.w 2
		struc_8 $90, $B0, $1C8, $1D0, 4
		struc_8 $E0, $100, $C8, $D0, 6
		struc_8 $1B0, $1D0, $B8, $C0, 1
word_33F6:	dc.w 1
		struc_8 $210, $230, $D8, $E0, 5
		struc_8 $B0, $D0, $A8,	$B0, 5
word_340C:	dc.w 1
		struc_8 $C0, $E0, $188, $190, 2
		struc_8 $70, $90, $2B8, $2C0, 1
word_3422:	dc.w 2
		struc_8 $4B0, $4D0, $88, $90, 2
		struc_8 $40, $60, $C8,	$D0, 3
		struc_8 $250, $270, $48, $50, 4
word_3442:	dc.w 2
		struc_8 $220, $240, $128, $130, 1
		struc_8 $470, $490, $118, $120, 7
		struc_8 $4C0, $4E0, $178, $180, 2
word_3462:	dc.w 0
		struc_8 $98, $A8, $B8,	$C0, 8
word_346E:	dc.w 0
		struc_8 $FC0, $FE0, $80, $A0, 1
word_347A:	dc.w 1
		struc_8 0, $18, $320, $3D0, 6
		struc_8 $7E0, $FFFF, 0, $80, 2
word_3490:	dc.w 1
		struc_8 0, $18, 0, $FFFF, 7
		struc_8 $BE8, $FFFF, 0, $FFFF,	3
word_34A6:	dc.w 1
		struc_8 0, $18, 0, $FFFF, 8
		struc_8 $FE0, $FFFF, 0, $FFFF,	4
word_34BC:	dc.w 1
		struc_8 0, $18, 0, $FFFF, 9
		struc_8 $240, $FFFF, $2D0, $FFFF, 5
word_34D2:	dc.w 0
		struc_8 0, $20, 0, $FFFF, 6
word_34DE:	dc.w 0
		struc_8 $FE8, $FFFF, $350, $3C0, 1
word_34EA:	dc.w 0
		struc_8 $BE8, $FFFF, $140, $1B0, 2
word_34F6:	dc.w 0
		struc_8 $BD8, $FFFF, 0, $FFFF,	3
word_3502:	dc.w 0
		struc_8 $9E8, $FFFF, 0, $FFFF,	4
word_350E:	dc.w 0
		struc_8 $FE8, $FFFF, 0, $FFFF,	1
word_351A:	dc.w 0
		struc_8 $540, $FFFF, 0, $80, 2
word_3526:	dc.w 0
		struc_8 $3D0, $FFFF, 0, $FFFF,	3
sub_3532:
		move.l	#$7000000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$2000000,d0
		trap	#RAW_COPY_DATA	; do_raw_copy_data
		move.l	#$5D2E0003,(a5)
		move.w	#$802E,(a6)
		move.b	#1,(byte_FFEE5B).w
		jsr	sub_F36(pc)
		jsr	sub_407C(pc)
		move.l	#make_indexes(KOS_LEVEL_PARAMS,$00,$00,$00),d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		jsr	load_level_params1(pc)
		lea	(level_params2).w,a0
		adda.w	(a0),a0
		move.w	(level_main_index).w,d1
		add.w	d1,d1
		adda.w	(a0,d1.w),a0
		move.w	(level_sub_index).w,d1
		add.w	d1,d1
		adda.w	(a0,d1.w),a0
		move.w	(a0)+,(planeb_scroll_type).w
		move.w	(a0)+,d0
		jsr	copy_mapping_array(pc) ; d0 = index
		clr.l	(planea_size_r).w
		clr.l	(planeb_size_r).w
		move.w	(a0)+,(planea_size_r).w
		move.w	(a0)+,(planea_size_l).w
		move.w	(a0)+,(planeb_size_r).w
		move.w	(a0)+,(planeb_size_l).w
		move.w	(a0)+,d0
		beq.s	loc_35AC
		addi.w	#$8000,(player_mask).w

loc_35AC:
		lea	(word_FF8500).w,a1
		lea	(unk_FFFB00).w,a2
		move.l	#M68K_RAM,$14(a1)
		move.l	#unk_FF5000,$18(a1)
		bsr.s	sub_3602	; a0 = source
		lea	(unk_FF8540).w,a1
		lea	(unk_FFFBC0).w,a2
		move.l	#unk_FF2800,$14(a1)
		move.l	#unk_FF5800,$18(a1)
		bsr.s	sub_3602	; a0 = source
		lea	(tbl_level_funcs).l,a0
		jsr	get_current_level_func(pc) ; a0	= level	funcs table
		jsr	(a0)
		jsr	sub_5086(pc)
		jsr	sub_3FE6(pc)
		btst	#0,(byte_FFEE01).w
		beq.s	locret_3600
		jsr	sub_283A(pc)

locret_3600:
		rts
; a0 = source
; a1 = params dest
; a2 = array dest

sub_3602:
		move.l	a2,$10(a1)
		lea	(level_params3).w,a4
		adda.w	(a4),a4
		move.w	(a0)+,d0
		add.w	d0,d0
		adda.w	(a4,d0.w),a4

loc_3614:
		move.b	(a4)+,(a2)+
		bpl.s	loc_3614
		move.w	(a0)+,0.w(a1)
		move.w	(a0)+,4(a1)
		move.w	(a0)+,8(a1)
		move.w	(a0)+,$C(a1)
		rts

tbl_level_funcs:dc.l tbl_level_funcs_0_1
		dc.l tbl_level_funcs_0_1
		dc.l tbl_level_funcs_2
		dc.l tbl_level_funcs_3
		dc.l tbl_level_funcs_4
		dc.l tbl_level_funcs_5
		dc.l tbl_level_funcs_6
		dc.l tbl_level_funcs_7
		dc.l tbl_level_funcs_8
		dc.l tbl_level_funcs_9
tbl_level_funcs_0_1:dc.w level_func_1_0
		dc.w level_func_1_1
		dc.w level_func_1_2
level_func_1_0:
		move.w	#level_update_1_0,(level_update_func).w
		move.l	#$6050000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$5041E00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$6053A36,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$2010000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_1_1:
		move.w	#level_update_1_1,(level_update_func).w
		move.l	#$6080000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$5062300,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$8070036,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$4030000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_1_2:
		cmpi.w	#6,(level_params1_index).w
		seq	(byte_FFEEF7).w
		move.w	#level_update_1_2,(level_update_func).w
		move.l	#$6080000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$1D1C1E00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$8074137,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$25240000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		moveq	#3,d0
		jsr	sub_4462(pc)
		jsr	sub_3FB8(pc)
		lea	(unk_FF8D00).w,a1
		move.w	#1,(a1)+
		move.w	#0,(a1)+
		move.w	#$AF,(a1)+
		move.w	#$8B00,(a1)
		moveq	#5,d0
		trap	#DECOMP_NEMESIS_RAM ; do_decompress_nemesis_to_ram
		move.l	#$4600,(dword_FFEF28).w
		move.l	#unk_FF6020,(dword_FF6000).l
		moveq	#0,d7
		moveq	#4,d0
		jsr	sub_42E2(pc)
		rts

tbl_level_funcs_2:dc.w level_func_2_0
		dc.w level_func_2_1
		dc.w level_func_2_2
		dc.w level_func_2_3
level_func_2_0:
		move.w	#level_update_2_0,(level_update_func).w
		move.l	#$A090000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$8071F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$A090000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$6050000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		st	(byte_FFEE74).w
		bra.s	loc_379C

level_func_2_1:
		move.w	#level_update_2_1,(level_update_func).w
		move.l	#$A0F0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$F0D2D00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$A100000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$60B0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		bra.s	loc_379C

level_func_2_2:
		move.w	#level_update_2_2,(level_update_func).w
		move.l	#$A090000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$80E1F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$A095539,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$60C0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		st	(byte_FFEE74).w

loc_379C:
		jsr	sub_3FB8(pc)
		lea	(unk_FF8D00).w,a1
		move.w	#1,(a1)+
		move.w	#$30,(a1)+
		move.w	#$A7,(a1)+
		move.w	#$8B00,(a1)
		rts

level_func_2_3:
		move.w	#level_update_2_3,(level_update_func).w
		move.l	#$E0D0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$C0B2000,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$F0E3650,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$A090000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		moveq	#1,d0
		trap	#DECOMP_NEMESIS_RAM ; do_decompress_nemesis_to_ram
		move.l	#$4360,(dword_FFEF28).w
		move.l	#unk_FF6020,(dword_FF6000).l
		moveq	#0,d7
		moveq	#0,d0
		jsr	sub_42E2(pc)
		rts

tbl_level_funcs_3:dc.w level_func_3_0
		dc.w level_func_3_1
		dc.w level_func_3_2
		dc.w level_func_3_3
		dc.w level_func_3_4
		dc.w level_func_3_5
		dc.w level_func_3_6
level_func_3_0:
		move.w	#level_update_3_0,(level_update_func).w
		move.l	#$C0B0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$A092300,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$C0B0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$8070000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_3_1:
		move.w	#level_update_3_1,(level_update_func).w
		move.l	#$13120000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$11102100,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$1E1D0051,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$E0D0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_3_2:
		move.w	#level_update_3_2,(level_update_func).w
		move.l	#$14120000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$13122200,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$1D5B0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$100F0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		lea	(unk_FF5000).l,a1
		move.w	#$3FF,d7

loc_388A:
		bset	#7,(a1)
		adda.w	#2,a1
		dbf	d7,loc_388A
		moveq	#2,d0
		trap	#2		; do_decompress_nemesis_to_ram
		move.l	#$3120,(dword_FFEF28).w
		move.l	#unk_FF6020,(dword_FF6000).l
		moveq	#0,d7
		moveq	#1,d0
		jsr	sub_42E2(pc)
		st	(byte_FFEE6C).w
		st	(byte_FFEE59).w
		rts

level_func_3_3:
		move.w	#level_update_3_3,(level_update_func).w
		move.l	#$13120000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$1B1A2100,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$1E1D4151,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$E110000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_3_4:
		move.w	#level_update_3_4,(level_update_func).w
		move.l	#$15120000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$1B1A2100,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$1D000051,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$13120000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_3_5:
		move.w	#level_update_3_5,(level_update_func).w
		move.l	#$14120000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$1B1A2100,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$1D005141,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$10140000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_3_6:
		move.w	#level_update_3_6,(level_update_func).w
		move.l	#$13120000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$11122C00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$1E1D0041,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$E230000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		st	(byte_FFEE6C).w
		tst.b	(byte_FFEEF3).w
		bne.s	locret_396C
		move.b	#$82,(smps_cmd1).w

locret_396C:
		rts

tbl_level_funcs_4:dc.w level_func_4_0
		dc.w level_func_4_1
		dc.w level_func_4_2
		dc.w level_func_4_3
		dc.w level_func_4_4
level_func_4_0:
		move.w	#level_update_4_0,(level_update_func).w
		move.l	#$1A190000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$29281F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$1C1B0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.l	#$2827003C,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		st	(word_FFEE56+1).w
		rts

level_func_4_1:
		move.w	#level_update_4_1,(level_update_func).w
		move.l	#$1A190000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$29282300,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$1E1D0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.l	#$28273D37,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		st	(byte_FFEE78).w
		rts

level_func_4_2:
		move.w	#level_update_4_2,(level_update_func).w
		move.l	#$1A190000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$29281F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$1C320000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.l	#$2827004D,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		st	(word_FFEE56+1).w
		rts

level_func_4_3:
		move.w	#level_update_4_3,(level_update_func).w
		move.l	#$1C1B0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$2B2A2100,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$201F0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.l	#$413C3600,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$2A290000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		rts

level_func_4_4:
		move.w	#level_update_4_4,(level_update_func).w
		move.l	#$1C1B0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$2B2A3100,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$20210000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.l	#$2A290041,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		st	(byte_FFEE80).w
		tst.b	(byte_FFEEED).w
		bne.s	locret_3A62
		move.b	#$82,(smps_cmd1).w

locret_3A62:
		rts

tbl_level_funcs_5:dc.w level_func_5_0
		dc.w level_func_5_1
		dc.w level_func_5_2
		dc.w level_func_5_3
level_func_5_0:
		move.w	#level_update_5_0,(level_update_func).w
		move.l	#$25240052,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$17160000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$16150000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.l	#$25241F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		st	(byte_FFEE65).w
		rts

level_func_5_1:
		move.w	#level_update_5_1,(level_update_func).w
		move.l	#$25240000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$17160000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$16170000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.l	#$255C1F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		st	(byte_FFEE65).w
		rts

level_func_5_2:
		move.w	#level_update_5_2,(level_update_func).w
		move.l	#$26240000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$18160000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$19180000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.l	#$27265D00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		st	(byte_FFEE65).w
		jsr	sub_3FB8(pc)
		lea	(unk_FF8D00).w,a1
		move.w	#1,(a1)+
		move.w	#$10,(a1)+
		move.w	#$EF,(a1)+
		move.w	#$8B00,(a1)
		rts

level_func_5_3:
		move.w	#level_update_5_3,(level_update_func).w
		move.l	#$3B353400,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$25240057,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$17160000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$161A0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.l	#$25241F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		st	(byte_FFEE65).w
		sf	(byte_FFEE6A).w
		sf	(byte_FFEEF9).w
		sf	(byte_FFEE71).w
		sf	(byte_FFEE72).w
		sf	(byte_FFEE73).w
		rts

tbl_level_funcs_6:dc.w level_func_6_0
		dc.w level_func_6_1
		dc.w level_func_6_2
		dc.w level_func_6_3
		dc.w level_func_6_4
		dc.w level_func_6_5
		dc.w level_func_6_6
		dc.w level_func_6_7
		dc.w level_func_6_8
level_func_6_0:
		move.w	#level_update_6_0,(level_update_func).w
		move.l	#$1E090000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$35345800,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2C090000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$2F2E0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		st	(byte_FFEE74).w
		rts

level_func_6_1:
		move.w	#level_update_6_1,(level_update_func).w
		move.l	#$3D310000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		bra.s	level_func_6_main

level_func_6_2:
		move.w	#level_update_6_2,(level_update_func).w
		move.l	#$3D390000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		bra.s	level_func_6_main

level_func_6_3:
		move.w	#level_update_6_3,(level_update_func).w
		move.l	#$3D3A0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram

level_func_6_main:
		move.l	#$1E260000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$42402F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2C3E0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.w	#8,(level_params1_index).w
		rts

level_func_6_4:
		move.w	#level_update_6_4,(level_update_func).w
		bra.s	level_func_6_main2

level_func_6_5:
		move.w	#level_update_6_5,(level_update_func).w

level_func_6_main2:
		move.l	#$3D3B0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		bra.s	level_func_6_main

level_func_6_6:
		move.w	#level_update_6_6,(level_update_func).w
		bra.s	loc_3C02

level_func_6_7:
		move.w	#level_update_6_7,(level_update_func).w

loc_3C02:
		move.l	#$1E260000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$42412F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2C3E0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$3D3C0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.w	#8,(level_params1_index).w
		rts

level_func_6_8:
		move.w	#level_update_6_8,(level_update_func).w
		move.l	#$1E260000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$56553000,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2C3E0041,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$3D300000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		st	(byte_FFEE6C).w
		rts

tbl_level_funcs_7:dc.w level_func_7_0
		dc.w level_func_7_1
		dc.w level_func_7_2
		dc.w level_func_7_3
		dc.w level_func_7_4
		dc.w level_func_7_5
level_func_7_0:
		move.w	#level_update_7_0,(level_update_func).w
		move.l	#$1D090000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$33325800,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2B090056,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$27260000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		st	(byte_FFEE74).w
		rts

level_func_7_1:
		move.w	#level_update_7_1,(level_update_func).w
		move.l	#$201F0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$37361F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2E2D0036,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$29280000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		bra.s	level_func_7_main

level_func_7_2:
		move.w	#level_update_7_2,(level_update_func).w
		move.l	#$201F0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$37362D00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2E2D0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$2B2A0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		bra.s	level_func_7_main

level_func_7_3:
		move.w	#level_update_7_3,(level_update_func).w
		move.l	#$201F0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$37361F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2E2D0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$2D2C0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram

level_func_7_main:
		moveq	#3,d0
		trap	#DECOMP_NEMESIS_RAM ; do_decompress_nemesis_to_ram
		move.l	#$2500,(dword_FFEF28).w
		move.l	#unk_FF6020,(dword_FF6000).l
		moveq	#0,d7
		moveq	#2,d0
		jsr	sub_42E2(pc)
		rts

level_func_7_4:
		move.w	#level_update_7_4,(level_update_func).w
		move.l	#$25240000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$37361F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2E2D3836,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$48000000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$37360000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.w	#6,(word_FF89E2).w
		move.b	#1,(byte_FF8A2F).w
		sf	(byte_FFEE70).w
		rts

level_func_7_5:
		move.w	#level_update_7_5,(level_update_func).w
		move.l	#$20210000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$37381F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2E330011,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$2D350000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		st	(byte_FFEE5E).w
		move.w	#0,(word_FF8D20).w
		move.b	#0,(byte_FFEE75).w
		rts

tbl_level_funcs_8:dc.w level_func_8_0
		dc.w level_func_8_1
		dc.w level_func_8_2
		dc.w level_func_8_3
		dc.w level_func_8_4
level_func_8_0:
		move.w	#level_update_8_0,(level_update_func).w
		move.l	#$5B5A2E00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$2F2E0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$4A490037,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$45460000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		moveq	#4,d0
		trap	#DECOMP_NEMESIS_RAM ; do_decompress_nemesis_to_ram
		move.l	#$3200,(dword_FFEF28).w
		move.l	#unk_FF6020,(dword_FF6000).l
		moveq	#0,d7
		moveq	#3,d0
		jsr	sub_42E2(pc)
		rts

level_func_8_1:
		move.w	#level_update_8_1,(level_update_func).w
		move.l	#$2C2B0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$49471E00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$47460011,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$42410000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.b	#0,(byte_FFEE75).w
		rts

level_func_8_2:
		move.w	#level_update_8_2,(level_update_func).w
		move.l	#$28270000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$44432000,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$403F0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$3E430000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		move.w	#$F0,(word_FFA342).w
		rts

level_func_8_3:
		move.w	#level_update_8_3,(level_update_func).w
		move.l	#$28270000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$44435700,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$403F0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$3E470000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_8_4:
		move.w	#level_update_8_4,(level_update_func).w
		move.l	#$28270000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$44435F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$403F0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$3E330000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		st	(byte_FFEE6C).w
		rts

tbl_level_funcs_9:dc.w level_func_9_0
		dc.w level_func_9_1
		dc.w level_func_9_2
		dc.w level_func_9_3
level_func_9_0:
		move.w	#level_update_9_0,(level_update_func).w
		move.l	#$2F2E0000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$4B4A1F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$4A490000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$45440000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_9_1:
		move.w	#level_update_9_1,(level_update_func).w
		move.l	#$2A290000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$46451F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$43420037,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$49480000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		st	(byte_FFEE78).w
		rts

level_func_9_2:
		move.w	#level_update_9_2,(level_update_func).w
		move.l	#$31300000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$4D4C1F00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$4C4B0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$4B4A0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

level_func_9_3:
		move.w	#level_update_9_3,(level_update_func).w
		move.l	#$2A290000,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		move.l	#$46455E00,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#$43420000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$403F0000,d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		rts

load_level_params1:
		move.w	(level_main_index).w,d0
		add.w	d0,d0
		moveq	#0,d1
		lea	(level_params1).w,a0
		adda.w	(a0),a0
		adda.w	(a0,d0.w),a0
		move.w	(level_params1_index).w,d0
		add.w	d0,d0
		adda.w	(a0,d0.w),a0
		move.w	(a0)+,(level_sub_index).w
		move.w	(a0)+,(planea_start_y).w
		move.w	(planea_start_y).w,(planea_y).w
		move.w	(a0)+,(planea_start_x).w
		move.w	(planea_start_x).w,(planea_x).w
		move.w	(a0)+,(planeb_start_y).w
		move.w	(planeb_start_y).w,(planeb_y).w
		move.w	(a0)+,(planeb_start_x).w
		move.w	(planeb_start_x).w,(planeb_x).w
		move.w	(a0)+,(player_pos_y).w
		move.w	(a0)+,(player_pos_x).w
		moveq	#0,d0
		move.b	(a0)+,d0
		move.w	d0,(player_start_rotated).w
		move.b	(a0)+,d0
		cmp.b	(smps_cmd1_new).w,d0
		beq.s	locret_3FB6
		jsr	init_sound_type1
		move.b	d0,(smps_cmd1).w
		move.b	d0,(smps_cmd1_new).w

locret_3FB6:
		rts

sub_3FB8:
		bset	#0,(byte_FFEE01).w
		move.w	#$8B03,(a5)
		lea	(word_FFF700).w,a1
		moveq	#0,d1
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		rts

sub_3FE6:
		move	#$2700,sr
		lea	(word_FF8500).w,a1
		lea	(unk_FF8600).w,a3
		move.w	#$C000,d6
		bsr.s	sub_400C
		lea	(unk_FF8540).w,a1
		lea	(unk_FF8784).w,a3
		move.w	#$E000,d6
		bsr.s	sub_400C
		move	#$2500,sr
		rts

sub_400C:
		move.l	$20(a1),-(sp)
		moveq	#$F,d7

loc_4012:
		move.w	$24(a1),d0
		move.w	$20(a1),d1
		movem.l	d0-a4,-(sp)
		jsr	sub_2768(pc)
		jsr	sub_28DC(pc)
		movem.l	(sp)+,d0-a4
		addi.w	#$10,$20(a1)
		dbf	d7,loc_4012
		move.l	(sp)+,$20(a1)
		rts
; a0 = level funcs table
; a0 =>	jump addr

get_current_level_func:
		moveq	#0,d1
		move.w	(level_main_index).w,d1
		add.w	d1,d1
		add.w	d1,d1
		movea.l	(a0,d1.w),a0
		move.w	(level_sub_index).w,d1
		add.w	d1,d1
		move.w	(a0,d1.w),d1
		movea.l	d1,a0
		rts
; d0 = index

copy_mapping_array:
		move.l	a0,-(sp)
		add.w	d0,d0
		beq.s	loc_4078
		lea	(level_params4).w,a1
		adda.w	(a1),a1
		move.w	(a1,d0.w),d0
		adda.w	d0,a1
		lea	(some_mapping_array).w,a2

loc_406C:
		move.b	(a1)+,d0
		cmpi.b	#$FF,d0
		beq.s	loc_4078
		move.b	d0,(a2)+
		bra.s	loc_406C

loc_4078:
		movea.l	(sp)+,a0
		rts

sub_407C:
		moveq	#0,d1
		lea	(some_mapping_array).w,a1
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		lea	(word_FF89E0).w,a1
		jsr	fill_ram_16_bytes(pc) ;	d1 = dword
		jsr	sub_435A(pc)
		jsr	sub_44D0(pc)
		lea	(unk_FF5000).l,a1
		move.w	#$8001,d1
		move.w	#$7FF,d7

loc_40A8:
		move.w	d1,(a1)+
		dbf	d7,loc_40A8
		moveq	#0,d0
		move.b	d0,(byte_FFEE59).w
		move.b	d0,(byte_FFEE65).w
		move.b	d0,(byte_FFEE01).w
		move.b	d0,(byte_FFEE6C).w
		move.b	d0,(byte_FFEE4B).w
		move.b	d0,(byte_FFEE74).w
		move.b	d0,(byte_FFEE76).w
		move.w	d0,(word_FFEE56).w
		move.l	d0,(dword_FF8F86).w
		move.b	d0,(byte_FFEE78).w
		move.b	d0,(byte_FFEE80).w
		cmpi.w	#5,(word_FF8F9A).w
		bcs.s	locret_40E8
		move.w	d0,(word_FF8F9A).w

locret_40E8:
		rts

sub_40EA:
		movem.l	d0-a6,-(sp)
		moveq	#$1F,d7
		move.b	#0,(byte_FFEE4B).w
		lea	(unk_FFFA90).w,a3
		move.l	#$FFFFFFFF,(a3)
		move.l	a3,(dword_FFEF2C).w
		lea	(unk_FF7800).l,a0

loc_410A:
		move.b	(a0),d6
		beq.s	loc_413C
		btst	#0,d6
		beq.s	loc_4116
		bcc.s	loc_4134

loc_4116:
		btst	#1,d6
		beq.s	loc_412A
		subq.b	#1,4(a0)
		bne.s	loc_4134
		move.b	5(a0),4(a0)
		bra.s	loc_4130

loc_412A:
		bclr	#6,d6
		beq.s	loc_4134

loc_4130:
		jsr	sub_414A(pc)

loc_4134:
		move.b	d6,0.w(a0)
		jsr	sub_42C2(pc)

loc_413C:
		lea	$20(a0),a0
		dbf	d7,loc_410A
		movem.l	(sp)+,d0-a6
		rts

sub_414A:
		btst	#1,d6
		bne.s	loc_4178
		jsr	sub_4190(pc)
		btst	#4,d6
		beq.s	loc_4160
		jsr	sub_436E(pc)
		bra.s	locret_4176

loc_4160:
		jsr	sub_417C(pc)
		btst	#2,d6
		beq.s	locret_4176
		bset	#1,d6
		bclr	#2,d6
		bclr	#4,d6

locret_4176:
		rts

loc_4178:
		jsr	sub_4190(pc)

sub_417C:
		move.b	$12(a0),d0
		addq.b	#1,d0
		cmp.b	$13(a0),d0
		bls.s	loc_418A
		moveq	#0,d0

loc_418A:
		move.b	d0,$12(a0)
		rts

sub_4190:
		btst	#0,d6
		bne.w	sub_424A	; d0 = ?
		movea.l	$C(a0),a1
		move.w	$10(a0),d0
		add.w	d0,d0
		add.w	d0,d0
		move.l	(a1,d0.w),d2
		moveq	#0,d0
		move.b	$12(a0),d0
		movea.l	8(a0),a6
		move.b	(a6,d0.w),d0
		move.w	6(a0),d1
		asl.w	#5,d1
		mulu.w	d1,d0
		add.l	d0,d2
		movea.l	(dword_FFEF2C).w,a3
		moveq	#0,d0
		move.w	6(a0),d1
		asl.w	#4,d1
		move.b	#$93,(a3)
		move.b	#$94,2(a3)
		rol.w	#8,d1
		movep.w	d1,1(a3)
		addq.l	#4,a3
		lsr.l	#1,d2
		move.w	#$977F,(a3)+
		move.w	#$9695,d1
		movep.w	d1,0.w(a3)
		movep.w	d2,1(a3)
		addq.l	#4,a3
		moveq	#0,d0
		move.w	$14(a0),d0
		lsl.l	#2,d0
		lsr.w	#2,d0
		swap	d0
		ori.l	#$40000080,d0
		move.l	d0,(a3)+
		move.l	#$FFFFFFFF,(a3)
		move.l	a3,(dword_FFEF2C).w
		move.b	#1,(byte_FFEE4B).w
		rts

sub_4218:
		bclr	#0,(byte_FFEE4B).w
		beq.s	locret_4248
		lea	(unk_FFFA90).w,a3
		move.w	#$100,(IO_Z80BUS).l

loc_422C:
		move.l	(a3)+,d0
		cmpi.l	#$FFFFFFFF,d0
		beq.s	loc_4240
		move.l	d0,(a5)
		move.l	(a3)+,(a5)
		move.l	(a3)+,(a5)
		move.w	(a3)+,(a5)
		bra.s	loc_422C

loc_4240:
		move.w	#0,(IO_Z80BUS).l

locret_4248:
		rts
; d0 = ?
; d1 = width
; d2 = hight
; a1 = ?
; a2 = ?

sub_424A:
		movem.l	d3-d7/a3-a4,-(sp)
		move.l	#$800000,d4

loc_4254:
		move.w	d1,d3
		movea.l	a2,a4
		move.l	d0,-(sp)

loc_425A:
		moveq	#0,d5
		move.b	(a1)+,d5
		move.b	d5,(a4)+
		jsr	sub_4286(pc)
		addi.l	#$40000,d0
		bsr.s	sub_429E
		dbf	d3,loc_425A
		move.l	(sp)+,d0
		add.l	d4,d0
		add.l	d4,d0
		bsr.s	sub_42B0
		lea	$100(a2),a2
		dbf	d2,loc_4254
		movem.l	(sp)+,d3-d7/a3-a4
		rts

sub_4286:
		move.l	d0,d6
		lea	(unk_FF5000).l,a3
		lsl.w	#3,d5
		adda.l	d5,a3
		move.l	d6,(a5)
		move.l	(a3)+,(a6)
		add.l	d4,d6
		move.l	d6,(a5)
		move.l	(a3)+,(a6)
		rts

sub_429E:
		move.l	d0,d6
		andi.l	#$7F0000,d6
		bne.s	locret_42AE
		subi.l	#$800000,d0

locret_42AE:
		rts

sub_42B0:
		move.l	d0,d6
		swap	d6
		cmpi.w	#$5000,d6
		bcs.s	locret_42C0
		subi.l	#$10000000,d0

locret_42C0:
		rts

sub_42C2:
		moveq	#0,d1
		move.b	1(a0),d1
		bne.s	loc_42CC
		rts

loc_42CC:
		add.w	d1,d1
		lea	(off_42DA).l,a3
		adda.w	(a3,d1.w),a3
		jmp	(a3)

off_42DA:	dc.w nullsub_3-off_42DA
		dc.w nullsub_4-off_42DA
nullsub_3:
		rts

nullsub_4:
		rts

sub_42E2:
		lea	(stru_13DA70).l,a1
		mulu.w	#$12,d0
		adda.w	d0,a1
		lea	(unk_FF7800).l,a0
		move.l	(dword_FFEF28).w,d5

loc_42F8:
		move.l	(a1)+,$C(a0)
		move.w	(a1)+,$10(a0)
		move.b	(a1)+,0.w(a0)
		move.b	#1,4(a0)
		move.b	(a1)+,5(a0)
		move.b	(a1)+,1(a0)
		move.b	(a1)+,$13(a0)
		move.w	(a1)+,$1C(a0)
		move.w	(a1)+,$1E(a0)
		move.w	$1C(a0),d0
		mulu.w	$1E(a0),d0
		move.w	d0,6(a0)
		btst	#0,0.w(a0)
		bne.s	loc_433C
		move.w	d5,$14(a0)
		asl.w	#7,d0
		add.w	d0,d5
		bra.s	loc_434C

loc_433C:
		move.w	(a1)+,$18(a0)
		move.w	(a1)+,$1A(a0)
		move.w	(a1)+,d1
		lsr.w	#8,d1
		move.b	d1,3(a0)

loc_434C:
		move.l	(a1)+,8(a0)
		lea	$20(a0),a0
		dbf	d7,loc_42F8
		rts

sub_435A:
		lea	(unk_FF7800).l,a0
		moveq	#$1F,d1

loc_4362:
		bsr.s	sub_436E
		lea	$20(a0),a0
		dbf	d1,loc_4362
		rts

sub_436E:
		moveq	#0,d0
		move.l	d0,0.w(a0)
		move.l	d0,4(a0)
		move.l	d0,8(a0)
		move.l	d0,$C(a0)
		move.l	d0,$10(a0)
		move.l	d0,$14(a0)
		move.l	d0,$18(a0)
		move.l	d0,$1C(a0)
		rts

sub_4392:
		movem.l	d0-a4,-(sp)
		lea	(unk_FF8998).w,a4
		move.w	#$10,d4

loc_439E:
		tst.b	(a4,d4.w)
		beq.w	loc_442A
		subq.b	#1,1(a4,d4.w)
		bmi.w	loc_4412
		bne.w	loc_442A
		move.b	2(a4,d4.w),1(a4,d4.w)
		jsr	sub_4436(pc)
		add.b	d3,d3
		moveq	#0,d0

loc_43C0:
		moveq	#0,d6
		move.w	(a0),d5
		moveq	#0,d1
		move.w	(a3,d0.w),d1
		moveq	#2,d7

loc_43CC:
		move.w	d1,-(sp)
		move.b	d5,d2
		andi.l	#$F,d2
		andi.w	#$F,d1
		cmp.b	d1,d2
		beq.s	loc_43EE
		bhi.s	loc_43E6
		addq.b	#1,d2
		bra.w	loc_43E8

loc_43E6:
		subq.b	#1,d2

loc_43E8:
		move.b	#1,(a4,d4.w)

loc_43EE:
		move.w	(sp)+,d1
		lsr.w	#4,d1
		lsr.l	#4,d6
		swap	d2
		add.l	d2,d6
		lsr.w	#4,d5
		dbf	d7,loc_43CC
		lsr.l	#8,d6
		move.w	d6,(a0)+
		addq.b	#2,d0
		cmp.b	d3,d0
		bne.s	loc_43C0
		tst.b	(a4,d4.w)
		bne.w	loc_442A
		bra.s	loc_4420

loc_4412:
		bsr.s	sub_4436

loc_4414:
		move.w	(a3)+,(a0)+
		dbf	d3,loc_4414
		move.b	#0,(a4,d4.w)

loc_4420:
		moveq	#0,d0
		move.b	5(a4,d4.w),d0
		bmi.s	loc_442A
		bsr.s	sub_4462

loc_442A:
		subq.w	#8,d4
		bpl.w	loc_439E
		movem.l	(sp)+,d0-a4
		rts

sub_4436:
		move.b	#1,(cram_update_needed).w
		move.b	#0,(a4,d4.w)
		moveq	#0,d0
		move.b	4(a4,d4.w),d0
		add.b	d0,d0
		lea	(ram_palette_0).w,a0
		lea	(a0,d0.w),a0
		lea	(unk_FF8918).w,a3
		lea	(a3,d0.w),a3
		moveq	#0,d3
		move.b	3(a4,d4.w),d3
		rts

sub_4462:
		movem.l	d0-d2/a0-a2,-(sp)
		lea	(stru_44E0).l,a0
		lsl.w	#3,d0
		lea	(a0,d0.w),a0
		lea	(unk_FF8998).w,a1
		moveq	#$10,d2

loc_4478:
		tst.b	(a1,d2.w)
		beq.s	loc_4484
		subq.w	#8,d2
		bpl.s	loc_4478
		bra.s	loc_44CA

loc_4484:
		move.b	(a0),1(a1,d2.w)
		move.b	(a0)+,2(a1,d2.w)
		move.b	(a0)+,4(a1,d2.w)
		move.b	(a0)+,d0
		move.b	d0,3(a1,d2.w)
		subq.b	#1,d0
		move.b	(a0)+,5(a1,d2.w)
		movea.l	(a0),a0
		lea	(unk_FF8918).w,a2
		moveq	#0,d1
		move.b	4(a1,d2.w),d1
		add.b	d1,d1
		lea	(a2,d1.w),a2
		move.w	(a0),d1
		bmi.s	loc_44BA

loc_44B2:
		move.w	(a0)+,(a2)+
		dbf	d0,loc_44B2
		bra.s	loc_44C4

loc_44BA:
		move.w	2(a0),d1

loc_44BE:
		move.w	d1,(a2)+
		dbf	d0,loc_44BE

loc_44C4:
		move.b	#1,(a1,d2.w)

loc_44CA:
		movem.l	(sp)+,d0-d2/a0-a2
		rts

sub_44D0:
		lea	(unk_FF8998).w,a1
		moveq	#$B,d0

loc_44D6:
		move.w	#0,(a1)+
		dbf	d0,loc_44D6
		rts

stru_44E0:	struc_9 2, 0, $40, $FF, unk_FFF600
		struc_9 1, 0, $40, 2, unk_FFF600
		struc_9 1, 0, $40, $FF, word_4518
		struc_9 8, $3E, 1, 4, word_451C
		struc_9 3, $3E, 1, 3, word_451C+2
		struc_9 $C, $20, $20, 6, word_451C+4
		struc_9 $C, $20, $20, $FF, word_13CEF0
word_4518:	dc.w $FFFF
		dc.w 0
word_451C:	dc.w $46C, $AEE, 0, $AEE, $AEE,	$8EA, $8E8, $8C4
		dc.w $6A4, $486, $266, $AEC, $8CA, $6C6, $688, $468, $66, $44
		dc.w $A44, $AEE, $AEE, $AEE, $AEE, $AAE, $8CC, $8AC, $68A, $468
		dc.w $8CA, $AEC, $88E, $66C, $468, $AEE
sub_4560:
		bsr.s	sub_459A
		moveq	#0,d1
		lea	(ram_palette_0).w,a1
		jsr	fill_ram_128_bytes ; d1	= dword
		moveq	#0,d0
		bra.s	loc_4584

sub_4572:
		bsr.s	sub_459A
		lea	(unk_FFF600).w,a1
		moveq	#$3F,d7

loc_457A:
		andi.w	#$F00,(a1)+
		dbf	d7,loc_457A
		moveq	#1,d0

loc_4584:
		jsr	sub_4462(pc)
		moveq	#$20,d7

loc_458A:
		jsr	sub_4392(pc)
		jsr	wait_for_vblank
		dbf	d7,loc_458A
		rts

sub_459A:
		sf	(cram_update_needed).w
		lea	(ram_palette_0).w,a1
		lea	(unk_FFF600).w,a2
		jsr	copy_bytes_to_dest_128 ; a1 = source
		rts

show_sega_logo:
		bset	#7,(init_step).w
		beq.s	loc_460C
		jsr	sub_962C
		addq.w	#1,(sega_logo_frames_cnt).w
		move.w	(sega_logo_frames_cnt).w,d0
		andi.w	#3,d0
		bne.s	loc_45CE
		subq.w	#2,(sega_logo_frames).w

loc_45CE:
		move.b	#1,(cram_update_needed).w
		lea	(sega_logo_palette).l,a1
		adda.w	(sega_logo_frames).w,a1
		btst	#7,(pcb_ver).w
		beq.s	loc_45F2
		lea	((ram_palette_0+$18)).w,a2
		move.l	2(a1),(a2)+
		move.l	6(a1),(a2)

loc_45F2:
		lea	((ram_palette_0+4)).w,a2
		jsr	copy_bytes_to_dest_20(pc) ; a1 = source
		tst.w	(sega_logo_frames).w
		bne.s	locret_460A
		jsr	sub_4572(pc)
		move.w	#1,(init_step).w

locret_460A:
		rts

loc_460C:
		move.w	(disable_display).w,(a5)
		clr.b	(byte_FFEE01).w
		jsr	init_joypads(pc)
		jsr	clear_vram_cram_vsram(pc)
		jsr	(clear_ram_0000_fd00).l
		move.b	#$F9,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		move.w	#0,(vblank_sub_index).w
		moveq	#NEM_SEGA_LOGO,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		moveq	#ENI_SEGA_LOGO_MAP,d1
		trap	#DECOMP_ENIGMA_RAM ; do_decompress_enigma_to_ram
		moveq	#COPY_SEGA_LOGO,d0
		trap	#RAW_COPY_DATA	; do_raw_copy_data
		move.w	#$28,(sega_logo_frames).w
		clr.w	(sega_logo_frames_cnt).w
		move.l	#$ECC,(ram_palette_0).w
		move.w	(enable_display).w,(a5)
		rts

sub_4658:
		jsr	sub_50AA(pc)
		move.b	#$92,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		move.w	#2,(init_step).w
		rts

sub_4670:
		move.w	(disable_display).w,(a5)
		move.w	#0,(vblank_sub_index).w
		clr.b	(byte_FFEE01).w
		moveq	#0,d0
		move.b	d0,(byte_FFEE61).w
		jsr	sub_50F6(pc)
		cmpi.w	#$2F,(word_FF8F40).w
		beq.s	loc_4698
		move.w	#4,(init_step).w
		rts

loc_4698:
		move.w	#9,(init_step).w
		rts

sub_46A0:
		move.w	(disable_display).w,(a5)
		move.w	#1,(vblank_sub_index).w
		jsr	clear_vram_cram_vsram(pc)
		jsr	sub_B828(pc)
		moveq	#0,d0
		move.b	d0,(byte_FFEE64).w
		move.b	d0,(byte_FFEE5C).w
		move.b	d0,(byte_FFEE07).w
		move.b	d0,(byte_FFEE5E).w
		move.w	d0,(word_FF8FA0).w
		move.l	d0,(dword_FFEF5C).w
		move.l	d0,(dword_FFEF60).w
		move.w	#$3C,(word_FF8FA6).w
		moveq	#0,d1
		lea	(word_FFA2C0).w,a1
		jsr	fill_ram_64_bytes(pc) ;	d1 = dword
		move.w	#$9298,(a5)
		lea	(unk_FFFA80).w,a3
		move.l	#$93809402,(a3)+
		move.l	#$96009500,(a3)+
		move.w	#$9700,(a3)+
		move.l	#$70000083,(a3)
		move.l	#make_indexes($04,$03,$02,NEM_MAIN_FONT),d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$201F0000,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		moveq	#$22,d0
		move.w	(weapon_index).w,d1
		subq.w	#2,d1
		bpl.s	loc_471A
		moveq	#$21,d0

loc_471A:
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.w	(level_main_index).w,d0
		lea	(unk_FFEEBF).w,a1
		tst.b	(a1,d0.w)
		beq.s	loc_4748
		lea	(byte_47B0).l,a3
		move.b	(a3,d0.w),d1
		cmp.b	(level_params1_index+1).w,d1
		bne.s	loc_4748
		add.w	d0,d0
		lea	(word_47BA).l,a3
		move.w	(a3,d0.w),(level_params1_index).w

loc_4748:
		jsr	sub_3532(pc)
		move.w	#1,(word_FFA2C0).w
		bset	#0,(byte_FFEE61).w
		bne.s	loc_476A
		jsr	sub_5108(pc)
		move.w	#$A1,(word_FFA300).w
		move.w	#$FF,(word_FF8FA6).w

loc_476A:
		jsr	sub_19E62
		jsr	load_enemies_tiles
		jsr	sub_40EA(pc)
		jsr	sub_962C(pc)
		jsr	sub_969E(pc)
		jsr	sub_2592(pc)
		jsr	sub_969E(pc)
		move.l	#make_indexes(KOS_DIALOGS_DATA,$00,$00,$00),d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		tst.b	(is_usa_europe_version).w
		bne.s	loc_47A0
		move.l	#make_indexes($4F,$00,$00,$00),d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram

loc_47A0:
		move.w	(enable_display).w,(a5)
		jsr	sub_4560(pc)
		move.w	#5,(init_step).w
		rts

byte_47B0:	dc.b $FF, 0, 2,	0, 2, 0, 0, 0, $FF, $FF
word_47BA:	dc.w $FFFF, 5, 6, 7, 7,	7, $A, $A, $FFFF, $FFFF
sub_47CE:
		jsr	(sub_1060).l
		jsr	send_smps_cmd	; d0 = cmd
		jsr	sub_48B8(pc)
		jsr	sub_2592(pc)
		jsr	sub_40EA(pc)
		jsr	sub_969E(pc)
		jsr	sub_60A6(pc)
		jsr	sub_19D02
		jsr	sub_92E4(pc)
		jsr	sub_4392(pc)
		jsr	sub_48AC(pc)
		tst.b	(byte_FFEE4F).w
		bne.s	loc_4856
		tst.b	(byte_FFEE58).w
		bne.s	loc_486A
		tst.b	(byte_FFEE5F).w
		bne.s	loc_4838
		tst.w	(word_FF8FA6).w
		beq.s	loc_481E
		subq.w	#1,(word_FF8FA6).w
		bra.s	locret_4824

loc_481E:
		tst.b	(byte_FFEE5A).w
		bne.s	loc_4826

locret_4824:
		rts

loc_4826:
		move.w	(disable_display).w,(a5)
		move.w	#8,(init_step).w
		move.w	#0,(word_FF8FA4).w
		rts

loc_4838:
		sf	(byte_FFEE5F).w
		bra.s	loc_4842
		jsr	sub_968A(pc)

loc_4842:
		jsr	sub_48C4(pc)
		jsr	sub_489A(pc)
		jsr	sub_4572(pc)
		move.w	#2,(init_step).w
		rts

loc_4856:
		clr.b	(byte_FFEE4F).w
		jsr	sub_489A(pc)
		jsr	sub_4572(pc)
		move.w	#4,(init_step).w
		rts

loc_486A:
		sf	(byte_FFEE58).w
		jsr	sub_489A(pc)
		subq.w	#1,(lives_count).w
		beq.s	loc_4892
		clr.b	(byte_FFEE4F).w
		jsr	sub_968A(pc)
		jsr	sub_4572(pc)
		move.w	#5,(word_FF8F96).w
		move.w	#4,(init_step).w
		rts

loc_4892:
		move.w	#$F,(init_step).w
		rts

sub_489A:
		moveq	#0,d0
		move.w	(word_FF8F7A).w,d0
		add.l	d0,(dword_FFEF34).w
		move.w	#0,(word_FF8F7A).w
		rts

sub_48AC:
		moveq	#0,d1
		lea	(byte_FFEED0).w,a1
		move.l	d1,(a1)
		move.w	d1,(a1)
		rts

sub_48B8:
		moveq	#0,d1
		lea	(byte_FFEED6).w,a1
		move.l	d1,(a1)
		move.w	d1,(a1)
		rts

sub_48C4:
		lea	(byte_FFEEE0).w,a1
		lea	(unk_FFFCA0).w,a2
		jsr	copy_bytes_to_dest_32(pc) ; a1 = source
		rts

sub_48D2:
		bset	#7,(init_step).w
		beq.s	loc_48F8
		jsr	sub_40EA(pc)
		jsr	sub_969E(pc)
		jsr	sub_4392(pc)
		subq.w	#1,(word_FF89E0).w
		bne.s	locret_48F6
		jsr	sub_4572(pc)
		move.w	#$10,(init_step).w

locret_48F6:
		rts

loc_48F8:
		move.w	#2,(vblank_sub_index).w
		lea	(word_FFA2C0).w,a0
		movea.l	a0,a1
		moveq	#0,d1
		jsr	fill_ram_64_bytes(pc) ;	d1 = dword
		move.w	#$5D,0.w(a0)
		move.w	#$B4,(word_FF89E0).w
		move.b	#$91,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		rts

sub_4924:
		bset	#7,(init_step).w
		beq.s	sub_4992
		bsr.s	sub_4950
		move.w	#$3B,(a6)
		move.b	(word_FF8FB0+1).w,d0
		btst	#7,d0
		bne.s	sub_4966
		andi.b	#3,d0
		beq.s	loc_4948
		bchg	#0,(word_FF89E0).w

loc_4948:
		bsr.s	sub_4950
		move.w	#$38,(a6)
		rts

sub_4950:
		tst.b	(word_FF89E0).w
		bne.s	loc_495E
		move.l	#$45940003,(a5)
		rts

loc_495E:
		move.l	#$46940003,(a5)
		rts

sub_4966:
		clr.b	(smps_cmd2).w
		jsr	sub_968A(pc)
		jsr	sub_4572(pc)
		tst.b	(word_FF89E0).w
		bne.s	loc_4980
		move.w	#$E,(init_step).w
		rts

loc_4980:
		move.w	#0,(word_FFFF20).w
		move.w	#0,(init_step).w
		jsr	sub_968A(pc)
		rts

sub_4992:
		move.w	(disable_display).w,(a5)
		sf	(byte_FFEE01).w
		jsr	clear_vram_cram_vsram(pc)
		move.l	#$1000000,d0
		trap	#1		; do_decompress_nemesis_to_vram
		move.l	#$1000000,d0
		trap	#5		; do_copy_4_palettes_to_ram
		move.l	#$16000000,d0
		trap	#0		; do_raw_copy_data
		move.w	(enable_display).w,(a5)
		move.b	#$97,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		move.b	#0,(word_FF89E0).w
		rts

sub_49CE:
		move.l	#$38000000,d0
		trap	#4		; do_decompress_kosinski_to_ram
		subq.w	#1,(word_FFFF20).w
		bpl.s	loc_49E2
		move.w	#4,(word_FFFF20).w

loc_49E2:
		move.w	(word_FFFF20).w,d0
		cmpi.w	#4,d0
		sne	(byte_FFEE61).w
		move.b	byte_4A4C(pc,d0.w),(byte_FFEE48).w
		add.w	d0,d0
		move.w	word_4A52(pc,d0.w),(level_main_index).w
		move.w	word_4A5C(pc,d0.w),(level_params1_index).w
		move.w	word_4A66(pc,d0.w),(weapon_index).w
		lea	(unk_FFB000).w,a1
		adda.w	(a1,d0.w),a1
		move.l	a1,(dword_FFEF40).w
		move.w	2(a1),(word_FFEF44).w
		move.w	#5,(word_FF8F96).w
		move.w	#3,(lives_count).w
		move.w	#0,(word_FF8F9A).w
		move.l	#0,(rand_seed).w
		st	(byte_FFEE50).w
		jsr	sub_46A0(pc)
		move.w	#7,(init_step).w
		move.l	#$38000000,d0
		trap	#4		; do_decompress_kosinski_to_ram
		rts

byte_4A4C:	dc.b 1,	1, 1, 0, 0, 0
word_4A52:	dc.w 7,	4, 3, 2, 1
word_4A5C:	dc.w 3,	1, 3, 1, 0
word_4A66:	dc.w 0,	0, 2, 0, 0
sub_4A70:
		jsr	sub_968A(pc)
		clr.w	(init_step).w
		rts

sub_4A7A:
		jsr	send_smps_cmd	; d0 = cmd
		jsr	sub_2592(pc)
		jsr	sub_40EA(pc)
		jsr	sub_969E(pc)
		jsr	sub_60A6(pc)
		jsr	sub_19D02
		jsr	sub_4392(pc)
		btst	#7,(word_FF8FB0).w
		bne.s	loc_4AB2
		tst.b	(byte_FFEE6B).w
		bne.s	loc_4AAA
		rts

loc_4AAA:
		move.w	#0,(init_step).w
		bra.s	loc_4AB8

loc_4AB2:
		move.w	#0,(init_step).w

loc_4AB8:
		clr.b	(byte_FFEE50).w
		clr.b	(byte_FFEE6B).w
		jsr	sub_968A(pc)
		jsr	sub_4572(pc)
		rts

sub_4ACA:
		bset	#7,(init_step).w
		bne.s	loc_4AF0
		move.w	(disable_display).w,(a5)
		jsr	clear_vram_cram_vsram(pc)
		jsr	sub_205E(pc)
		jsr	sub_B828(pc)
		jsr	sub_4F36(pc)
		jsr	init_sound_type1
		move.w	(enable_display).w,(a5)

loc_4AF0:
		jmp	sub_969E(pc)

sub_4AF4:
		lea	off_4AFC(pc),a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_4AFC:	dc.w sub_4B10-off_4AFC
		dc.w sub_4BDE-off_4AFC
		dc.w loc_4B34-off_4AFC
		dc.w sub_4B70-off_4AFC
		dc.w sub_4B88-off_4AFC
		dc.w sub_4BDE-off_4AFC
		dc.w sub_4BE8-off_4AFC
		dc.w sub_4CB2-off_4AFC
		dc.w sub_4DFE-off_4AFC
		dc.w sub_4E1E-off_4AFC
sub_4B10:
		move.l	#off_2BDF0,$20(a0)
		move.w	#$7A8,$A(a0)
		move.w	#$70,$10(a0)
		move.w	#$44,$14(a0)
		jsr	sub_B852(pc)
		move.w	#1,4(a0)

loc_4B34:
		move.b	(word_FF8FB0+1).w,d7
		andi.b	#$F0,d7
		bne.s	loc_4B7A
		move.b	(word_FF8FB0+1).w,d7
		btst	#1,d7
		bne.s	loc_4B5C
		btst	#0,d7
		beq.s	locret_4B6E
		tst.b	$30(a0)
		beq.s	locret_4B6E
		clr.b	$30(a0)
		moveq	#$44,d1
		bra.s	loc_4B6A

loc_4B5C:
		tst.b	$30(a0)
		bne.s	locret_4B6E
		move.b	#1,$30(a0)
		moveq	#$6C,d1

loc_4B6A:
		move.w	d1,$14(a0)

locret_4B6E:
		rts

sub_4B70:
		jsr	sub_4572(pc)
		tst.b	$30(a0)
		beq.s	loc_4B80

loc_4B7A:
		addq.w	#1,2(a0)
		rts

loc_4B80:
		move.w	#$C,(init_step).w
		rts

sub_4B88:
		move.w	(disable_display).w,(a5)
		move.l	#$40000003,(a5)
		moveq	#0,d1
		move.w	#$1F,d7

loc_4B98:
		jsr	fill_vram_64_words(pc) ; d1 = word|word
		dbf	d7,loc_4B98
		move.b	#1,$31(a0)
		move.l	#$F0E0D,d0
		trap	#0		; do_raw_copy_data
		move.w	(word_FFFF1E).w,d0
		jsr	sub_4CFE(pc)
		moveq	#$11,d0
		trap	#0		; do_raw_copy_data
		move.l	#$5900,d0
		trap	#5		; do_copy_4_palettes_to_ram
		move.b	#0,(cram_update_needed).w
		move.w	#$50,$10(a0)
		move.w	#$34,$14(a0)
		move.w	(enable_display).w,(a5)
		addq.w	#1,2(a0)
		rts

sub_4BDE:
		jsr	sub_4560(pc)
		addq.w	#1,2(a0)

locret_4BE6:
		rts

sub_4BE8:
		move.b	(word_FF8FB0+1).w,d7
		btst	#7,d7
		bne.w	loc_4C74
		btst	#0,d7
		bne.w	loc_4C7C
		btst	#1,d7
		bne.w	sub_4C98
		moveq	#$FFFFFFE8,d0
		btst	#2,d7
		bne.s	loc_4C1E
		moveq	#$18,d0
		btst	#3,d7
		beq.s	locret_4BE6
		bclr	#0,$31(a0)
		beq.s	loc_4C1E
		moveq	#0,d0

loc_4C1E:
		clr.b	$31(a0)
		add.w	$32(a0),d0
		bmi.s	loc_4C32
		cmpi.w	#$108,d0
		bcs.s	loc_4C36
		moveq	#0,d0
		bra.s	loc_4C36

loc_4C32:
		move.w	#$F0,d0

loc_4C36:
		move.w	d0,$32(a0)
		move.w	#2,(word_FF8FAE).w
		lea	(tbl_lvl_names).l,a1
		lea	(a1,d0.w),a1
		lea	(M68K_RAM).l,a2
		jsr	copy_bytes_to_dest_32(pc) ; a1 = source
		ext.l	d0
		divu.w	#$18,d0
		move.b	byte_4CA6(pc,d0.w),d0
		cmpi.b	#$88,d0
		seq	(byte_FFEE68).w
		seq	(byte_FFEE69).w
		move.b	d0,(smps_cmd2).w
		jmp	send_smps_cmd	; d0 = cmd

loc_4C74:
		move.w	#9,2(a0)
		rts

loc_4C7C:
		move.w	#$84,$14(a0)
		move.w	#8,2(a0)
		rts

sub_4C8A:
		move.w	#$34,$14(a0)
		move.w	#6,2(a0)
		rts

sub_4C98:
		move.w	#$54,$14(a0)
		move.w	#7,2(a0)
		rts

byte_4CA6:	dc.b $83, $84, $88, $8E, $89, $85, $86,	$96, $8A, $87, $8B
		align 2, 0
sub_4CB2:
		move.b	(word_FF8FB0+1).w,d7
		btst	#7,d7
		bne.w	loc_4C74
		btst	#0,d7
		bne.w	sub_4C8A
		btst	#1,d7
		bne.w	loc_4C7C
		moveq	#$FFFFFFFF,d0
		btst	#2,d7
		bne.s	loc_4CE0
		moveq	#1,d0
		btst	#3,d7
		beq.w	locret_4E1C

loc_4CE0:
		add.w	(word_FFFF1E).w,d0
		bmi.s	loc_4CF0
		cmpi.w	#5,d0
		bcs.s	loc_4CF4
		moveq	#0,d0
		bra.s	loc_4CF4

loc_4CF0:
		move.w	#4,d0

loc_4CF4:
		move.w	d0,(word_FFFF1E).w
		move.w	#4,(word_FF8FAE).w

sub_4CFE:
		muls.w	#42,d0
		lea	word_4D2C(pc,d0.w),a1
		lea	(unk_FFB000).w,a2
		moveq	#2,d7

loc_4D0C:
		jsr	copy_bytes_to_dest_12(pc) ; a1 = source
		move.w	(a1)+,(a2)+
		movea.l	a1,a3
		movea.l	a2,a1
		move.l	#$203B203B,d1
		jsr	fill_ram_12_bytes(pc) ;	d1 = dword
		move.w	(a1)+,(a2)+
		movea.l	a1,a2
		movea.l	a3,a1
		dbf	d7,loc_4D0C
		rts

word_4D2C:	dc.w $200B, $202A, $200E, $200B, $201C,	$2012, $203B
		dc.w $200C, $202A, $201C, $2012, $2001,	$2001, $201D
		dc.w $200D, $202A, $2014, $201E, $2017,	$2019, $203B
		dc.w $200B, $202A, $201C, $2012, $2001,	$2001, $201D
		dc.w $200C, $202A, $2014, $201E, $2017,	$2019, $203B
		dc.w $200D, $202A, $200E, $200B, $201C,	$2012, $203B
		dc.w $200B, $202A, $2014, $201E, $2017,	$2019, $203B
		dc.w $200C, $202A, $201C, $2012, $2001,	$2001, $201D
		dc.w $200D, $202A, $200E, $200B, $201C,	$2012, $203B
		dc.w $200B, $202A, $201C, $2012, $2001,	$2001, $201D
		dc.w $200C, $202A, $200E, $200B, $201C,	$2012, $203B
		dc.w $200D, $202A, $2014, $201E, $2017,	$2019, $203B
		dc.w $200B, $202A, $2014, $201E, $2017,	$2019, $203B
		dc.w $200C, $202A, $200E, $200B, $201C,	$2012, $203B
		dc.w $200D, $202A, $201C, $2012, $2001,	$2001, $201D
sub_4DFE:
		move.b	(word_FF8FB0+1).w,d0
		btst	#0,d0
		bne.w	sub_4C98
		btst	#1,d0
		bne.w	sub_4C8A
		andi.b	#$F0,d0
		beq.s	locret_4E1C
		addq.w	#1,2(a0)

locret_4E1C:
		rts

sub_4E1E:
		jsr	sub_4572(pc)
		clr.w	(word_FF8FAE).w
		bclr	#7,(init_step).w
		rts

tbl_lvl_names:
    binclude "src/levels/01_Duckburg/name.bin"
    align 2, 0

    binclude "src/levels/02_Mexico/name.bin"
    align 2, 0

    binclude "src/levels/03_Transylvania/name.bin"
    align 2, 0

    binclude "src/levels/04_Viking_Ship/name.bin"
    align 2, 0

    binclude "src/levels/05_South_Pole/name.bin"
    align 2, 0

    binclude "src/levels/06_Maharajah/name.bin"
    align 2, 0

    binclude "src/levels/07_Egypt/name.bin"
    align 2, 0

    binclude "src/levels/08_Hideout/name.bin"
    align 2, 0

    binclude "src/levels/09_The_Island/name.bin"
    align 2, 0

    binclude "src/main_menu/room1_name.bin"
    align 2, 0

    binclude "src/main_menu/room2_name.bin"
    align 2, 0
sub_4F36:
		move.w	#5,(vblank_sub_index).w
		move.w	#$9A,(word_FF9000).w
		clr.b	(byte_FFEE01).w
		move.l	#$4F2001,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		lea	(kosinski_129144).l,a0
		lea	(M68K_RAM).l,a1
		jsr	(decompress_kosinski_to_ram).l ; a0 = source
		move.l	#$120C0B,d0
		trap	#RAW_COPY_DATA	; do_raw_copy_data
		move.l	#$5900,d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.b	#0,(cram_update_needed).w
		rts

word_4F78:	dc.w $201C, $201D, $200B, $201B, $201D
word_4F82:	dc.w $2001, $2019, $201D, $2013, $2001,	$2018, $201C
word_4F90:	dc.w $201C, $2001, $201E, $2018, $200E,	$203B, $201D, $200F, $201C, $201D
word_4FA4:	dc.w $200D, $2001, $2018, $201D, $201B,	$2001, $2016
word_4FB2:	dc.w $200F, $2021, $2013, $201D, $203B,	$203B, $203B, $203B, $203B, $203B
		dc.w $203B, $203B, $203B, $203B, $203B,	$203B
sub_4FD2:
		move.w	(word_FF8FAE).w,d0
		beq.s	locret_4FE4
		lea	off_4FE6(pc),a1
		move.w	-2(a1,d0.w),d0
		jmp	(a1,d0.w)

locret_4FE4:
		rts

off_4FE6:	dc.w sub_4FEA-off_4FE6
		dc.w sub_4FF0-off_4FE6
sub_4FEA:
		moveq	#$10,d0
		trap	#0		; do_raw_copy_data
		rts

sub_4FF0:
		moveq	#$11,d0
		trap	#0		; do_raw_copy_data
		rts

sub_4FF6:
		move.w	(word_FF8FB0).w,d3
		move.w	(word_FFFF1E).w,d0
		beq.s	loc_5062
		move.w	d3,d1
		move.w	d3,d2
		andi.w	#$4040,d1
		add.w	d0,d0
		move.w	off_5012-2(pc,d0.w),d0
		jmp	off_5012(pc,d0.w)
off_5012:	dc.w loc_501A-off_5012
		dc.w loc_502C-off_5012
		dc.w loc_503A-off_5012
		dc.w loc_5048-off_5012

loc_501A:
		move.w	d2,d4
		lsr.w	#2,d1
		andi.w	#$2020,d2
		lsl.w	#1,d2
		andi.w	#$1010,d4
		lsl.w	#1,d4
		bra.s	loc_5058

loc_502C:
		lsr.w	#1,d1
		andi.w	#$2020,d2
		lsl.w	#1,d2
		andi.w	#$9F9F,d3
		bra.s	loc_505E

loc_503A:
		lsr.w	#2,d1
		andi.w	#$1010,d2
		lsl.w	#2,d2
		andi.w	#$AFAF,d3
		bra.s	loc_505E

loc_5048:
		move.w	d2,d4
		lsr.w	#1,d1
		andi.w	#$2020,d2
		lsr.w	#1,d2
		andi.w	#$1010,d4
		lsl.w	#2,d4

loc_5058:
		andi.w	#$8F8F,d3
		or.w	d4,d3

loc_505E:
		or.w	d2,d1
		or.w	d1,d3

loc_5062:
		move.w	d3,(word_FF8F2C).w
		rts

sub_5068:
		jsr	sub_AC72
		jsr	sub_968A(pc)
		move.b	#$92,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		move.w	#$E,(init_step).w
		rts

sub_5086:
		moveq	#0,d0
		move.b	(byte_FFEE48).w,d0
		add.w	d0,d0
		move.w	word_50A4(pc,d0.w),d0
		cmp.w	(ram_palette_0+$14).w,d0
		beq.s	locret_50A2
		move.w	d0,(ram_palette_0+$14).w
		move.b	#1,(cram_update_needed).w

locret_50A2:
		rts

word_50A4:	dc.w $2CE, $22E, $2A2
sub_50AA:
		move.w	#3,(lives_count).w
		moveq	#0,d0
		move.l	d0,(dword_FFEF34).w
		move.w	d0,(word_FF8F7A).w
		move.w	d0,(weapon_index).w
		move.w	d0,(word_FF8F9A).w
		move.w	d0,(word_FF8FBC).w
		move.w	d0,(word_FF8F90).w
		move.w	#$63,(word_FF8F8E).w
		lea	(unk_FFFCA0).w,a1
		lea	(byte_FFEEE0).w,a2
		jsr	copy_bytes_to_dest_32(pc) ; a1 = source
		moveq	#0,d0
		tst.b	(byte_FFEEED).w
		beq.s	loc_50E8
		moveq	#2,d0
		bra.s	loc_50F0

loc_50E8:
		tst.b	(byte_FFEEE4).w
		beq.s	loc_50F0
		moveq	#1,d0

loc_50F0:
		move.b	d0,(byte_FFEE48).w
		rts

sub_50F6:
		cmpi.w	#5,(word_FF8F96).w
		bhi.s	locret_5104
		move.w	#5,(word_FF8F96).w

locret_5104:
		rts

nullsub_5:
		rts

sub_5108:
		moveq	#$3B,d0
		tst.b	(byte_FFEE74).w
		beq.s	loc_5112
		moveq	#$5A,d0

loc_5112:
		trap	#1		; do_decompress_nemesis_to_vram
		rts

sub_5116:
		move.b	5(a0),d1
		andi.b	#1,d1
		add.b	d1,d0
		move.w	(weapon_index).w,d7
		add.w	d7,d7
		add.w	d7,d7
		jmp	loc_512C(pc,d7.w)

loc_512C:
		bra.w	loc_513C
		bra.w	loc_5172
		bra.w	loc_51A4
		bra.w	locret_51E4

loc_513C:
		move.b	(byte_FFEE48).w,d7
		subq.b	#1,d7
		bmi.s	loc_5148
		beq.s	loc_514E
		bra.s	loc_5154

loc_5148:
		move.w	#$60,d1
		bra.s	loc_5158

loc_514E:
		move.w	#$61,d1
		bra.s	loc_5158

loc_5154:
		move.w	#$62,d1

loc_5158:
		jsr	(sub_51E6).l
		bmi.s	locret_5170
		move.w	d1,(a1)
		move.b	d0,$3A(a1)
		clr.w	2(a1)
		move.b	#$A1,(smps_cmd2).w

locret_5170:
		rts

loc_5172:
		jsr	(sub_51E6).l
		bmi.s	locret_51A2
		bne.s	loc_51CC
		lea	(unk_FF9D80).w,a1
		move.w	#$64,(a1)
		move.w	#4,$26(a1)
		move.b	d0,$3A(a1)
		clr.w	2(a1)
		subq.w	#5,(word_FF8F90).w
		move.b	#1,(byte_FFEE5B).w
		move.b	#$A4,(smps_cmd2).w

locret_51A2:
		rts

loc_51A4:
		jsr	(sub_51E6).l
		bmi.s	locret_51CA
		bne.s	loc_51CC
		move.w	#$65,(a1)
		move.b	d0,$3A(a1)
		clr.w	2(a1)
		subq.w	#1,(word_FF8F92).w
		move.b	#1,(byte_FFEE5B).w
		move.b	#$A6,(smps_cmd2).w

locret_51CA:
		rts

loc_51CC:
		lea	(unk_FF9D80).w,a1
		move.w	#$66,(a1)
		move.b	d0,$3A(a1)
		clr.w	2(a1)
		move.b	#$A8,(smps_cmd2).w
		rts

locret_51E4:
		rts

sub_51E6:
		move.w	(weapon_index).w,d7
		add.w	d7,d7
		add.w	d7,d7
		jmp	loc_51F2(pc,d7.w)

loc_51F2:
		bra.w	loc_51FE
		bra.w	loc_5216
		bra.w	loc_523E

loc_51FE:
		moveq	#5,d7
		lea	(unk_FF9BC0).w,a1

loc_5204:
		lea	unk_FF9C00-unk_FF9BC0(a1),a1
		tst.w	(a1)
		beq.w	loc_524C
		dbf	d7,loc_5204
		bra.w	loc_5254

loc_5216:
		tst.w	(word_FF8F90).w
		beq.w	loc_5250
		moveq	#4,d7
		moveq	#0,d5
		lea	(unk_FF9D40).w,a1

loc_5226:
		lea	unk_FF9D80-unk_FF9D40(a1),a1
		tst.w	(a1)
		beq.s	loc_5230
		moveq	#$FFFFFFFF,d5

loc_5230:
		dbf	d7,loc_5226
		tst.b	d5
		bne.w	loc_5254
		bra.w	loc_524C

loc_523E:
		tst.w	(word_FF8F92).w
		beq.s	loc_5250
		lea	(unk_FF9D80).w,a1
		tst.w	(a1)
		bne.s	loc_5254

loc_524C:
		moveq	#0,d7
		rts

loc_5250:
		moveq	#1,d7
		rts

loc_5254:
		moveq	#$FFFFFFFF,d7
		rts

sub_5258:
		lea	off_5266(pc),a1
		jsr	jump_by_table2	; a0 = ?
		jmp	sub_5A24(pc)
off_5266:	dc.w sub_5394
		dc.w sub_5444
		dc.w sub_5520
		dc.w sub_5614
		dc.w sub_5650
		dc.w sub_574E

sub_5272:
		lea	off_5280(pc),a1
		jsr	jump_by_table2	; a0 = ?
		jmp	sub_5A24(pc)
off_5280:	dc.w sub_5394
		dc.w sub_5444
		dc.w sub_5520
		dc.w sub_52AA
		dc.w loc_5666
		dc.w sub_574E
		dc.w loc_52DA

sub_528E:
		lea	off_529C(pc),a1
		jsr	jump_by_table2	; a0 = ?
		jmp	sub_5A24(pc)
off_529C:	dc.w sub_5394
		dc.w sub_5444
		dc.w sub_5520
		dc.w sub_52AA
		dc.w sub_56CA
		dc.w sub_574E
		dc.w loc_52DA

sub_52AA:
		move.w	#$1E,$26(a0)
		move.w	#$12C,$28(a0)
		cmpi.b	#8,$3A(a0)
		bcc.s	loc_52CA
		bset	#7,$E(a0)
		bset	#5,$E(a0)

loc_52CA:
		moveq	#0,d0
		move.l	d0,$18(a0)
		move.l	d0,$1C(a0)
		move.w	#6,2(a0)

loc_52DA:
		jsr	sub_5320(pc)
		jsr	sub_5374(pc)
		tst.b	(byte_FFEE60).w
		beq.s	loc_52EE
		move.w	#1,6(a0)

loc_52EE:
		subq.w	#1,$28(a0)
		beq.s	sub_535E
		cmpi.w	#$78,$28(a0)
		bhi.s	loc_5302
		bchg	#2,$D(a0)

loc_5302:
		bclr	#6,$E(a0)
		beq.s	locret_531E
		st	(byte_FFEE43).w
		move.w	#$1E,$26(a0)
		move.w	6(a0),d0
		subq.w	#1,d0
		add.b	d0,(word_FFEE54+1).w

locret_531E:
		rts

sub_5320:
		cmpi.b	#8,$3A(a0)
		bcs.s	locret_535C
		btst	#3,$E(a0)
		bne.s	locret_535C
		btst	#0,(byte_FFEE03).w
		beq.s	locret_535C
		movea.l	a0,a1
		move.w	(player_pos_y).w,d1
		subi.w	#$32,d1
		move.w	(player_pos_x).w,d2
		jsr	sub_BAB4(pc)
		beq.s	locret_535C
		bset	#3,$E(a0)
		move.l	a0,(dword_FFEF3C).w
		move.w	#$8018,(word_FFA2C2).w

locret_535C:
		rts

sub_535E:
		bclr	#3,$E(a0)
		bclr	#7,$E(a0)
		move.w	#1,$26(a0)
		bra.w	sub_5614

sub_5374:
		tst.w	$26(a0)
		beq.s	loc_5386
		subq.w	#1,$26(a0)
		bclr	#1,$D(a0)
		rts

loc_5386:
		move.w	#1,6(a0)
		bset	#1,$D(a0)
		rts

sub_5394:
		move.l	#off_2BDF0,$20(a0)
		move.w	#4,6(a0)
		bset	#1,$D(a0)
		bset	#4,$E(a0)
		bset	#4,$C(a0)
		move.w	#$7A8,$A(a0)
		moveq	#0,d0
		move.b	$3A(a0),d0
		lea	(word_541A).l,a2
		move.b	(a2,d0.w),5(a0)
		move.w	#5,d3
		move.b	$E(a2,d0.w),d2
		ext.w	d2
		move.w	d2,$18(a0)
		bne.s	loc_53E0
		moveq	#0,d3
		bra.s	loc_53E4

loc_53E0:
		bpl.s	loc_53E4
		neg.w	d3

loc_53E4:
		move.w	d3,$36(a0)
		move.w	#$FFFB,d3
		move.b	$1C(a2,d0.w),d2
		ext.w	d2
		move.w	d2,$1C(a0)
		bne.s	loc_53FA
		moveq	#0,d3

loc_53FA:
		move.w	d3,$38(a0)
		jsr	sub_5A5E(pc)
		cmpi.b	#8,$3A(a0)
		bcc.s	loc_5412
		move.w	#1,2(a0)
		rts

loc_5412:
		move.w	#2,2(a0)
		rts

word_541A:	dc.w 1,	1, 1, 1, $203, $203, $203
		dc.w $F808, $F808, $F808, $F808, 0, 0, 0
		dc.w 0,	0, 0, 0, $F8F8,	$F8F8, $F8F8
sub_5444:
		tst.w	$30(a0)
		bne.w	loc_549C
		moveq	#0,d1
		move.w	$36(a0),d1
		swap	d1
		move.l	#$2000,d2
		lea	$18(a0),a1
		jsr	(sub_5EB2).l
		jsr	sub_B88A(pc)
		moveq	#0,d1
		moveq	#0,d2
		jsr	sub_756C(pc)
		beq.s	locret_549A
		cmpi.b	#2,d7
		bhi.s	loc_54CE
		bclr	#1,$D(a0)
		move.w	#$A,$26(a0)
		jsr	sub_550A(pc)
		bclr	#4,$E(a0)
		move.b	#$A2,(smps_cmd2).w
		move.w	#3,2(a0)

locret_549A:
		rts

loc_549C:
		bset	#3,$E(a0)
		tst.b	(byte_FFEE80).w
		bne.s	loc_54CA
		movea.w	$30(a0),a1
		jsr	sub_BB72(pc)
		move.b	2(a4),d1
		tst.w	$18(a0)
		bpl.s	loc_54BE
		add.b	3(a4),d1

loc_54BE:
		ext.w	d1
		move.l	$10(a1),$10(a0)
		add.w	d1,$10(a0)

loc_54CA:
		bra.w	loc_5590

loc_54CE:
		move.l	$18(a0),d0
		asr.l	#2,d0
		move.l	d0,$18(a0)
		subi.w	#$10,$14(a0)
		move.w	#$FFF8,$1C(a0)

loc_54E4:
		move.w	#$14,$26(a0)
		bclr	#4,$E(a0)
		bclr	#1,$D(a0)
		move.w	#0,6(a0)
		move.b	#$A3,(smps_cmd2).w
		move.w	#5,2(a0)
		rts

sub_550A:
		tst.w	$18(a0)
		bpl.s	loc_5516
		addi.w	#$10,$10(a0)

loc_5516:
		andi.l	#$FFF00000,$10(a0)
		rts

sub_5520:
		tst.w	$30(a0)
		bne.w	loc_558A
		moveq	#0,d1
		move.w	$38(a0),d1
		swap	d1
		move.l	#$2000,d2
		lea	$1C(a0),a1
		jsr	(sub_5EB2).l
		jsr	sub_B88A(pc)
		moveq	#0,d1
		moveq	#0,d2
		jsr	sub_75A6(pc)
		beq.s	locret_5556
		cmpi.b	#2,d7
		bhi.s	loc_557C
		bra.s	loc_5558

locret_5556:
		rts

loc_5558:
		bclr	#1,$D(a0)
		move.w	#$A,$26(a0)
		jsr	sub_5604(pc)
		move.w	#3,2(a0)
		bclr	#4,$E(a0)
		move.b	#$A2,(smps_cmd2).w
		rts

loc_557C:
		addq.w	#8,$14(a0)
		move.w	#$FFF8,$1C(a0)
		jmp	loc_54E4(pc)

loc_558A:
		bset	#3,$E(a0)

loc_5590:
		move.b	#$A2,(smps_cmd2).w
		movea.w	$30(a0),a1
		move.w	$10(a0),d1
		sub.w	$10(a1),d1
		move.w	d1,$32(a0)
		move.w	$14(a0),d1
		sub.w	$14(a1),d1
		move.w	d1,$34(a0)
		bclr	#1,$D(a0)
		move.w	#$F0,$26(a0)
		bclr	#4,$E(a0)
		btst	#1,$E(a1)
		bne.s	loc_55DA
		move.b	#$A5,(smps_cmd2).w
		move.w	#4,2(a0)
		rts

loc_55DA:
		move.w	#$1E,$26(a0)
		move.w	#$12C,$28(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		moveq	#0,d0
		move.l	d0,$18(a0)
		move.l	d0,$1C(a0)
		move.w	#4,2(a0)
		rts

sub_5604:
		addi.w	#$F,$14(a0)
		andi.l	#$FFF00000,$14(a0)
		rts

sub_5614:
		subq.w	#1,$26(a0)
		bne.s	locret_564E
		move.b	#$A3,(smps_cmd2).w
		move.w	#5,2(a0)
		move.w	#1,6(a0)
		bset	#1,$D(a0)
		moveq	#2,d0
		tst.w	4(a0)
		beq.s	loc_563C
		moveq	#$FFFFFFFE,d0

loc_563C:
		add.w	d0,$10(a0)
		clr.l	$18(a0)
		clr.l	$1C(a0)
		move.w	#$14,$26(a0)

locret_564E:
		rts

sub_5650:
		movea.w	$30(a0),a1
		cmpi.w	#$11,0.w(a1)
		beq.s	loc_5666
		btst	#7,$E(a1)
		bne.w	loc_56BA

loc_5666:
		movea.w	$30(a0),a1
		tst.w	(a1)
		beq.w	loc_56BA
		move.l	$10(a1),$10(a0)
		move.l	$14(a1),$14(a0)
		move.w	$32(a0),d1
		add.w	d1,$10(a0)
		move.w	$34(a0),d1
		add.w	d1,$14(a0)
		move.b	$2C(a1),$2C(a0)
		btst	#4,$E(a1)
		bne.s	loc_56BA
		btst	#1,$E(a1)
		bne.w	loc_52DA
		subq.w	#1,$26(a0)
		beq.s	loc_56BA
		cmpi.w	#$78,$26(a0)
		bhi.s	locret_56B8
		bchg	#2,$D(a0)

locret_56B8:
		rts

loc_56BA:
		bclr	#3,$E(a0)
		move.w	#1,$26(a0)
		bra.w	sub_5614

sub_56CA:
		movea.w	$30(a0),a1
		move.w	0.w(a1),d0
		cmpi.w	#$48,d0
		beq.s	loc_56E0
		cmpi.w	#$B3,d0
		beq.s	loc_56E0
		bra.s	loc_5666

loc_56E0:
		cmpi.b	#8,$3A(a0)
		bcs.s	loc_56BA
		movea.w	$30(a0),a1
		tst.w	(a1)
		beq.s	loc_56BA
		bclr	#4,$E(a1)
		bne.s	loc_56BA
		move.l	$10(a1),$10(a0)
		move.l	$14(a1),$14(a0)
		move.l	$18(a1),$18(a0)
		move.l	$1C(a1),$1C(a0)
		move.w	$32(a0),d1
		add.w	d1,$10(a0)
		move.w	$34(a0),d1
		add.w	d1,$14(a0)
		move.b	$2C(a1),$2C(a0)
		btst	#3,$E(a0)
		beq.s	locret_574C
		btst	#0,(byte_FFEE03).w
		beq.s	locret_574C
		jsr	sub_B9A8(pc)
		beq.s	locret_574C
		tst.b	(byte_FFEE60).w
		bne.s	locret_574C
		move.l	a0,(dword_FFEF3C).w
		move.w	#$8014,(word_FFA2C2).w

locret_574C:
		rts

sub_574E:
		jsr	sub_B88A(pc)
		bchg	#2,$D(a0)
		subq.w	#1,$26(a0)
		beq.s	locret_5772
		addq.w	#1,$1C(a0)
		moveq	#0,d1
		moveq	#0,d2
		jsr	sub_75E0(pc)
		beq.s	locret_5772
		bset	#0,$C(a0)

locret_5772:
		rts

sub_5774:
		lea	off_5782(pc),a1
		jsr	jump_by_table2	; a0 = ?
		jmp	sub_5A24(pc)
off_5782:	dc.w sub_5788
		dc.w sub_5804
		dc.w sub_5814

sub_5788:
		move.l	#off_2BE88,$20(a0)
		bset	#3,$D(a0)
		bset	#4,$E(a0)
		bset	#4,$C(a0)
		move.w	#$7E1,$A(a0)
		moveq	#0,d0
		move.b	$3A(a0),d0
		jsr	sub_5A5E(pc)
		moveq	#0,d1
		move.b	byte_57F0(pc,d0.w),d1
		move.w	$26(a0),d0
		add.b	byte_57FE(pc,d0.w),d1
		move.w	#8,d2
		jsr	sub_B89C(pc)
		move.l	d3,$18(a0)
		move.l	d4,$1C(a0)
		move.w	$26(a0),d0
		subq.w	#1,d0
		bmi.s	loc_57EA
		lea	$40(a0),a1
		move.w	#$64,(a1)
		move.b	$3A(a0),$3A(a1)
		move.w	d0,$26(a1)

loc_57EA:
		addq.w	#1,2(a0)
		rts

byte_57F0:	dc.b $C0, $40, $C0, $40, $C0, $40, $C0,	$40, 0,	0, 0, 0, 0, 0
byte_57FE:	dc.b $F0, $F8, 0, 8, $10, 0
sub_5804:
		jsr	sub_5954(pc)
		bne.s	loc_580E
		jmp	sub_B88A(pc)

loc_580E:
		addq.w	#1,2(a0)
		rts

sub_5814:
		bset	#0,$C(a0)
		jmp	sub_B88A(pc)

sub_581E:
		lea	off_582C(pc),a1
		jsr	jump_by_table2	; a0 = ?
		jmp	sub_5A24(pc)

off_582C:	dc.w sub_5832
		dc.w sub_58B6
		dc.w sub_5906
sub_5832:
		move.l	#off_2BEB6,$20(a0)
		bset	#4,$E(a0)
		bset	#4,$C(a0)
		move.w	#$7E1,$A(a0)
		move.w	#$7E1,d1
		move.w	#$80,$26(a0)
		moveq	#0,d0
		move.b	$3A(a0),d0
		cmpi.b	#8,d0
		scc	$28(a0)
		jsr	sub_5A5E(pc)
		lea	word_588C(pc),a1
		move.b	(a1,d0.w),5(a0)
		move.b	$E(a1,d0.w),d1
		ext.w	d1
		move.w	d1,$18(a0)
		move.b	$1C(a1,d0.w),d1
		ext.w	d1
		move.w	d1,$1C(a0)
		addq.w	#1,2(a0)
		rts

word_588C:	dc.w 1,	1, 1, 1, $202, $202, $202
		dc.w $FE02, $FE02, $FE02, $FE02, 0, 0, 0
		dc.w 0,	0, 0, 0, $FEFE,	$FEFE, $FEFE
sub_58B6:
		jsr	sub_5954(pc)
		move.w	6(a0),d0
		cmpi.w	#2,d0
		beq.s	loc_58CA
		jsr	sub_B88A(pc)
		rts

loc_58CA:
		tst.b	$28(a0)
		bne.s	loc_58EA
		move.w	#1,$18(a0)
		btst	#0,$3A(a0)
		bne.s	loc_58E2
		neg.l	$18(a0)

loc_58E2:
		move.l	$14(a0),$1C(a0)
		bra.s	loc_58F6

loc_58EA:
		move.l	$10(a0),$18(a0)
		move.w	#$FFFF,$1C(a0)

loc_58F6:
		addq.w	#1,2(a0)
		move.w	#3,4(a0)
		clr.w	6(a0)
		rts

sub_5906:
		jsr	sub_5954(pc)
		bne.w	loc_594C
		addq.w	#4,$26(a0)
		move.w	$26(a0),d1
		moveq	#$10,d2
		jsr	sub_B89C
		tst.b	$28(a0)
		bne.s	loc_5938
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		move.l	$1C(a0),$14(a0)
		add.l	d3,$14(a0)
		rts

loc_5938:
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		move.l	$18(a0),$10(a0)
		add.l	d3,$10(a0)
		rts

loc_594C:
		bset	#0,$C(a0)
		rts

sub_5954:
		tst.w	$30(a0)
		bne.s	locret_5964
		moveq	#0,d1
		moveq	#0,d2
		jsr	sub_756C(pc)
		rts

locret_5964:
		rts

sub_5966:
		lea	off_5974(pc),a1
		jsr	jump_by_table2	; a0 = ?
		jmp	sub_5A24(pc)
off_5974:	dc.w sub_5978
		dc.w sub_59E8

sub_5978:
		move.l	#off_1D66A,$20(a0)
		bset	#4,$C(a0)
		bset	#3,$D(a0)
		move.w	#$6B4,$A(a0)
		move.w	#$10,$26(a0)
		moveq	#0,d0
		move.b	$3A(a0),d0
		jsr	sub_5A5E(pc)
		lea	word_59CC(pc),a1
		move.w	#1,4(a0)
		move.w	#1,6(a0)
		move.b	(a1,d0.w),d1
		ext.w	d1
		move.w	d1,$18(a0)
		move.b	$E(a1,d0.w),d1
		ext.w	d1
		move.w	d1,$1C(a0)
		addq.w	#1,2(a0)
		rts

word_59CC:	dc.w $FE02, $FE02, $FE02, $FE02, 0, 0, 0
		dc.w 0,	0, 0, 0, $FEFE,	$FEFE, $FEFE
sub_59E8:
		subq.w	#1,$26(a0)
		beq.s	loc_5A1C
		bchg	#2,$D(a0)
		subi.l	#$2000,$1C(a0)
		tst.w	$18(a0)
		beq.s	loc_5A16
		bpl.s	loc_5A0E
		addi.l	#$2800,$18(a0)
		bra.s	loc_5A16

loc_5A0E:
		subi.l	#$2800,$18(a0)

loc_5A16:
		jsr	sub_B88A(pc)
		rts

loc_5A1C:
		bset	#0,$C(a0)
		rts

sub_5A24:
		move.w	$14(a0),d0
		move.w	(planea_start_y).w,d1
		subi.w	#$40,d1
		cmp.w	d1,d0
		blt.s	loc_5A56
		addi.w	#$160,d1
		cmp.w	d1,d0
		bge.s	loc_5A56
		move.w	$10(a0),d0
		move.w	(planea_start_x).w,d1
		subi.w	#$40,d1
		cmp.w	d1,d0
		blt.s	loc_5A56
		addi.w	#$1C0,d1
		cmp.w	d1,d0
		bge.s	loc_5A56
		rts

loc_5A56:
		bset	#0,$C(a0)
		rts

sub_5A5E:
		move.w	(player_mask).w,d1
		andi.w	#$E000,d1
		add.w	d1,$A(a0)
		move.b	word_5A88(pc,d0.w),d2
		ext.w	d2
		add.w	(player_pos_x).w,d2
		move.w	d2,$10(a0)
		move.b	byte_5A96(pc,d0.w),d2
		ext.w	d2
		add.w	(player_pos_y).w,d2
		move.w	d2,$14(a0)
		rts

word_5A88:	dc.w $F60A, $FA06, $F010, $F010, $F808,	$FB05, $F808
byte_5A96:	dc.b $E8, $E8, $DD, $DD, $DD, $DD, $F9,	$F9, $D0, $D0, $D5, $D5, $D5, $D5
sub_5AA4:
		tst.b	(byte_FFEE44).w
		bne.s	loc_5AE6
		jsr	sub_5C0C(pc)
		bcs.s	loc_5AD8
		move.b	(word_FFEE54).w,$2C(a0)
		lea	$18(a0),a1
		move.l	$34(a0),d1
		moveq	#0,d2
		move.w	$30(a0),d2
		bsr.w	sub_5B84
		bsr.s	sub_5AF4
		bsr.s	sub_5B32
		bsr.s	sub_5B3C
		cmp.l	(a1),d1
		beq.s	locret_5AD6
		bra.w	sub_5EB2

locret_5AD6:
		rts

loc_5AD8:
		tst.b	(byte_FFEE62).w
		beq.s	loc_5AE6
		move.l	#$FFFE0000,$1C(a0)

loc_5AE6:
		clr.b	(byte_FFEE44).w
		clr.l	$18(a0)
		clr.l	$34(a0)
		rts

sub_5AF4:
		tst.b	(byte_FFEE62).w
		bne.s	locret_5B30
		btst	#2,(byte_FFEE03).w
		beq.s	locret_5B30
		btst	#4,(byte_FFEE03).w
		bne.s	locret_5B30
		move.l	d1,d3
		bmi.s	loc_5B1E
		beq.s	locret_5B30
		cmp.l	$18(a0),d3
		bgt.s	loc_5B2A
		move.l	#$550,d2
		bra.s	loc_5B2A

loc_5B1E:
		cmp.l	$18(a0),d3
		blt.s	loc_5B2A
		move.l	#$550,d2

loc_5B2A:
		move.l	d1,d0
		asr.l	#1,d0
		add.l	d0,d1

locret_5B30:
		rts

sub_5B32:
		tst.b	(byte_FFEE62).w
		beq.s	locret_5B3A
		asl.l	#2,d1

locret_5B3A:
		rts

sub_5B3C:
		tst.b	(byte_FFEE5E).w
		bne.s	loc_5B74
		tst.b	(byte_FFEE65).w
		beq.s	loc_5B74
		tst.b	(byte_FFEE47).w
		bmi.s	loc_5B74
		tst.l	d1
		beq.s	loc_5B68
		smi	d7
		tst.l	(a1)
		beq.s	loc_5B74
		smi	d6
		cmp.b	d7,d6
		beq.s	loc_5B74
		asr.l	#1,d2
		move.b	#3,(word_FF8F48).w
		rts

loc_5B68:
		asr.l	#3,d2
		st	(byte_FFEE66).w
		move.b	#2,(word_FF8F48).w

loc_5B74:
		btst	#2,(byte_FFEE03).w
		bne.s	locret_5B82
		move.b	#4,(word_FF8F48).w

locret_5B82:
		rts

sub_5B84:
		moveq	#0,d7
		move.b	(byte_FFEE47).w,d7
		bpl.s	locret_5BC6
		move.l	(dword_FFEF10).w,d1
		lea	loc_5BC8(pc),a3
		andi.b	#3,d7
		btst	#0,5(a0)
		bne.s	loc_5BB2
		neg.l	d1
		add.w	d7,d7
		btst	#2,(word_FF8F2C).w
		bne.s	loc_5BAE
		addq.w	#8,d7

loc_5BAE:
		jmp	loc_5BC8(pc,d7.w)

loc_5BB2:
		bchg	#0,d7
		add.w	d7,d7
		btst	#3,(word_FF8F2C).w
		bne.s	loc_5BC2
		addq.w	#8,d7

loc_5BC2:
		jmp	loc_5BC8(pc,d7.w)

locret_5BC6:
		rts

loc_5BC8:
		bra.s	loc_5BE0
		bra.s	loc_5BFA
		bra.s	loc_5BD8
		bra.s	loc_5BF0
		bra.s	loc_5BE0
		bra.s	loc_5C08
		bra.s	loc_5BE8
		bra.s	loc_5C04

loc_5BD8:
		move.l	d1,d0
		asr.l	#2,d0
		add.l	d0,d1
		rts

loc_5BE0:
		move.l	d1,d0
		asr.l	#3,d0
		add.l	d0,d1
		rts

loc_5BE8:
		move.l	d1,d0
		asr.l	#4,d0
		add.l	d0,d1
		rts

loc_5BF0:
		move.l	d1,d0
		asr.l	#2,d1
		asr.l	#3,d0
		add.l	d0,d1
		rts

loc_5BFA:
		move.l	d1,d0
		asr.l	#1,d1
		asr.l	#3,d0
		add.l	d0,d1
		rts

loc_5C04:
		neg.l	d1
		bra.s	loc_5BE8

loc_5C08:
		neg.l	d1
		bra.s	loc_5BE0

sub_5C0C:
		jsr	sub_5F48(pc)
		bne.s	loc_5C26
		moveq	#$FFFFFFF2,d2
		move.w	d2,d6
		moveq	#$FFFFFFFE,d1
		jsr	sub_761C(pc)
		bne.s	loc_5C5A
		jsr	sub_5C60(pc)
		bne.s	loc_5C5A
		bra.s	loc_5C38

loc_5C26:
		moveq	#$E,d2
		move.w	d2,d6
		moveq	#$FFFFFFFE,d1
		jsr	sub_7762(pc)
		bne.s	loc_5C5A
		jsr	sub_5C82(pc)
		bne.s	loc_5C5A

loc_5C38:
		moveq	#$FFFFFFEE,d1
		move.w	d6,d2
		jsr	sub_756C(pc)
		bmi.s	loc_5C5A
		move.w	(word_FF8F54).w,d1
		sub.w	$14(a0),d1
		addq.w	#4,d1
		move.w	d6,d2
		jsr	sub_756C(pc)
		bmi.s	loc_5C5A
		move	#0,ccr
		rts

loc_5C5A:
		move	#$FF,ccr
		rts

sub_5C60:
		movem.l	d0-d5/a0/a2-a4,-(sp)
		lea	(word_FF8F54).w,a0
		move.w	(a0)+,d2
		move.w	(a0)+,d3
		subq.w	#1,d3
		move.w	(player_pos_x).w,d4
		subi.w	#$E,d4
		move.w	d4,d5
		jsr	sub_5CC0(pc)
		movem.l	(sp)+,d0-d5/a0/a2-a4
		rts

sub_5C82:
		movem.l	d0-d5/a0/a2-a4,-(sp)
		lea	(word_FF8F54).w,a0
		move.w	(a0)+,d2
		move.w	(a0)+,d3
		subq.w	#1,d3
		move.w	(player_pos_x).w,d4
		addi.w	#$E,d4
		move.w	d4,d5
		bsr.s	sub_5CC0
		movem.l	(sp)+,d0-d5/a0/a2-a4
		rts

sub_5CA2:
		movem.l	d0-d5/a0/a2-a4,-(sp)
		lea	(word_FF8F54).w,a0
		move.w	(a0)+,d2
		move.w	d2,d3
		move.w	(player_pos_x).w,d4
		move.w	d4,d5
		subq.w	#8,d4
		addq.w	#8,d5
		bsr.s	sub_5CC0
		movem.l	(sp)+,d0-d5/a0/a2-a4
		rts

sub_5CC0:
		lea	(word_FF8FC0).w,a0
		moveq	#$4A,d7

loc_5CC6:
		lea	$40(a0),a0
		move.b	$E(a0),d0
		bpl.s	loc_5CEC
		btst	#5,d0
		bne.s	loc_5CEC
		movem.l	d2-d7,-(sp)
		jsr	sub_BB60
		jsr	sub_BC10
		movem.l	(sp)+,d2-d7
		bne.s	locret_5CF2

loc_5CEC:
		dbf	d7,loc_5CC6
		moveq	#0,d7

locret_5CF2:
		rts

sub_5CF4:
		movem.l	d0-d5/a0/a2-a4,-(sp)
		lea	(word_FF8F56).w,a0
		move.w	(a0)+,d2
		move.w	d2,d3
		move.w	(a0)+,d4
		move.w	(a0)+,d5
		bra.s	loc_5D4A

sub_5D06:
		movem.l	d0-d5/a0/a2-a4,-(sp)
		move.w	$14(a0),d2
		addq.w	#1,d2
		move.w	d2,d3
		move.w	(player_pos_x).w,d4
		move.w	d4,d5
		subq.w	#8,d4
		addq.w	#8,d5
		bra.s	loc_5D4A

sub_5D1E:
		movem.l	d0-d5/a0/a2-a4,-(sp)
		jsr	sub_BB60(pc)
		move.w	$14(a0),d2
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d2
		move.w	d2,d3
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d3
		move.w	$10(a0),d4
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d4
		move.w	d4,d5
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d5

loc_5D4A:
		lea	(word_FF8FC0).w,a0
		moveq	#$4A,d7

loc_5D50:
		lea	$40(a0),a0
		move.b	$E(a0),d0
		bpl.s	loc_5D70
		movem.l	d2-d7,-(sp)
		jsr	sub_BB60
		jsr	sub_BC10
		movem.l	(sp)+,d2-d7
		bne.s	loc_5D7C

loc_5D70:
		dbf	d7,loc_5D50
		moveq	#0,d7
		movem.l	(sp)+,d0-d5/a0/a2-a4
		rts

loc_5D7C:
		movea.l	a0,a1
		btst	#5,$E(a0)
		bne.s	loc_5D8E
		moveq	#$FFFFFFFF,d7
		movem.l	(sp)+,d0-d5/a0/a2-a4
		rts

loc_5D8E:
		moveq	#1,d7
		movem.l	(sp)+,d0-d5/a0/a2-a4
		rts

sub_5D96:
		move.b	(word_FFEE54+1).w,$2D(a0)
		move.b	#0,(byte_FFEE47).w
		jsr	sub_7218(pc)
		tst.b	(byte_FFEE45).w
		beq.s	loc_5DBA
		clr.b	(byte_FFEE45).w
		clr.l	$1C(a0)
		clr.l	$38(a0)
		rts

loc_5DBA:
		lea	$1C(a0),a1
		move.l	$38(a0),d1
		moveq	#0,d2
		move.w	$32(a0),d2
		bsr.s	sub_5DD4
		cmp.l	(a1),d1
		beq.s	locret_5DD2
		bra.w	sub_5EB2

locret_5DD2:
		rts

sub_5DD4:
		tst.b	(byte_FFEE4A).w
		beq.s	locret_5DE8
		move.l	#$E000,d1
		sf	(byte_FFEE4A).w
		nop
		nop

locret_5DE8:
		rts

sub_5DEA:
		move.l	$18(a0),d0
		btst	#7,(byte_FFEE03).w
		beq.s	loc_5DF8
		moveq	#0,d0

loc_5DF8:
		tst.b	(byte_FFEE59).w
		beq.s	loc_5E00
		asr.l	#1,d0

loc_5E00:
		add.l	(dword_FFEF5C).w,d0
		move.l	#0,(dword_FFEF5C).w
		move.l	$10(a0),d1
		add.l	d0,d1
		swap	d1
		cmp.w	(word_FF8F68).w,d1
		bgt.s	loc_5E28
		cmp.w	(word_FF8F6A).w,d1
		blt.s	loc_5E34
		swap	d1
		move.l	d1,$10(a0)
		bra.s	loc_5E3E

loc_5E28:
		move.w	(word_FF8F68).w,$10(a0)
		clr.w	$12(a0)
		bra.s	loc_5E3E

loc_5E34:
		move.w	(word_FF8F6A).w,$10(a0)
		clr.w	$12(a0)

loc_5E3E:
		move.l	$1C(a0),d0
		btst	#7,(byte_FFEE03).w
		beq.s	loc_5E4C
		moveq	#0,d0

loc_5E4C:
		add.l	(dword_FFEF60).w,d0
		move.l	#0,(dword_FFEF60).w
		move.l	$14(a0),d1
		add.l	d0,d1
		swap	d1
		cmp.w	(word_FF8F6C).w,d1
		bgt.s	loc_5E74
		cmp.w	(word_FF8F6E).w,d1
		blt.s	loc_5E80
		swap	d1
		move.l	d1,$14(a0)
		bra.s	locret_5E8A

loc_5E74:
		move.w	(word_FF8F6C).w,$14(a0)
		clr.w	$16(a0)
		bra.s	locret_5E8A

loc_5E80:
		move.w	(word_FF8F6E).w,$14(a0)
		clr.w	$16(a0)

locret_5E8A:
		rts

sub_5E8C:
		btst	#0,(byte_FFEE03).w
		beq.s	loc_5EA8
		tst.w	(dword_FFEF70).w
		bne.s	locret_5EA6
		tst.w	$1C(a0)
		bmi.s	locret_5EA6
		move.w	$14(a0),(dword_FFEF70).w

locret_5EA6:
		rts

loc_5EA8:
		move.l	#0,(dword_FFEF70).w
		rts

sub_5EB2:
		move.l	(a1),d0
		cmp.l	d1,d0
		bgt.s	loc_5EC0
		add.l	d2,d0
		cmp.l	d1,d0
		bge.s	loc_5ECA
		bra.s	loc_5EC6

loc_5EC0:
		sub.l	d2,d0
		cmp.l	d1,d0
		ble.s	loc_5ECA

loc_5EC6:
		move.l	d0,(a1)
		rts

loc_5ECA:
		move.l	d1,(a1)
		rts

sub_5ECE:
		tst.b	(byte_FFEE08).w
		bne.s	locret_5F0C
		tst.b	(byte_FFEE09).w
		beq.s	locret_5F0C
		move.w	(word_FF8FAA).w,d7
		move.w	#0,(word_FF8FAA).w
		sub.w	d7,(word_FF8F96).w
		subq.w	#1,(word_FF8F96).w
		bge.s	loc_5EF2
		clr.w	(word_FF8F96).w

loc_5EF2:
		lea	(word_FFA2C0).w,a1
		lea	(unk_FF7C00).l,a2
		jsr	copy_bytes_to_dest_64(pc) ; a1 = source
		move.b	#$AE,(smps_cmd2).w
		move.w	#$801A,2(a0)

locret_5F0C:
		rts

sub_5F0E:
		btst	#0,d0
		beq.s	loc_5F1A
		bset	#2,$D(a0)

loc_5F1A:
		subq.b	#1,(byte_FFEE0A).w
		bne.s	locret_5F28
		sf	(byte_FFEE08).w
		sf	(byte_FFEE09).w

locret_5F28:
		rts

sub_5F2A:
		move.b	3(a0),d0
		bclr	#0,d0
		bclr	#0,d1
		cmp.b	d0,d1
		beq.s	locret_5F46
		add.w	(player_start_rotated).w,d1
		bset	#$F,d1
		move.w	d1,2(a0)

locret_5F46:
		rts

sub_5F48:
		tst.l	$18(a0)
		beq.s	loc_5F58
		bmi.s	loc_5F54
		moveq	#1,d0
		rts

loc_5F54:
		moveq	#0,d0
		rts

loc_5F58:
		move.w	(player_start_rotated).w,d0
		rts

sub_5F5E:
		tst.b	(byte_FFEE06).w
		beq.s	locret_5F76
		subq.b	#1,(byte_FFEE06).w
		btst	#5,(word_FF8F2C).w
		beq.s	locret_5F76
		move.w	#0,$32(a0)

locret_5F76:
		rts

sub_5F78:
		addi.w	#$100,d0
		move.w	d0,(word_FF8F3C).w
		move.b	#0,d0
		move.w	d0,(word_FF8F3E).w
		move.b	d0,8(a0)
		rts

sub_5F8E:
		tst.b	(byte_FFEE62).w
		bne.w	loc_5FC2
		bclr	#0,(word_FF8F3C).w
		beq.s	loc_5FA4
		move.b	(word_FF8F3C+1).w,5(a0)

loc_5FA4:
		move.w	(player_start_rotated).w,d0
		bclr	#0,5(a0)
		add.w	d0,4(a0)
		bclr	#0,(word_FF8F3E).w
		beq.s	locret_5FC0
		move.b	(word_FF8F3E+1).w,7(a0)

locret_5FC0:
		rts

loc_5FC2:
		moveq	#$C,d0
		add.w	(player_start_rotated).w,d0
		move.w	d0,4(a0)
		cmpi.w	#5,6(a0)
		bls.s	locret_5FDA
		move.w	#0,6(a0)

locret_5FDA:
		rts

sub_5FDC:
		movea.l	$20(a0),a1
		move.w	4(a0),d0
		add.w	d0,d0
		adda.w	(a1,d0.w),a1
		moveq	#0,d1
		move.b	(a1)+,d1
		move.b	(a1)+,d2
		bmi.s	loc_5FF6
		move.b	d2,9(a0)

loc_5FF6:
		move.b	9(a0),d2
		btst	#0,$E(a0)
		bne.w	loc_6042
		addq.b	#1,8(a0)
		cmp.b	8(a0),d2
		bhi.s	loc_6042
		clr.b	8(a0)
		tst.b	(byte_FFEE66).w
		bne.s	loc_6032
		cmp.w	6(a0),d1
		bhi.s	loc_602C
		btst	#3,$D(a0)
		bne.s	loc_6042
		clr.w	6(a0)
		bra.s	loc_6042

loc_602C:
		addq.w	#1,6(a0)
		bra.s	loc_6042

loc_6032:
		tst.w	6(a0)
		bne.s	loc_603E
		move.w	d1,6(a0)
		bra.s	loc_6042

loc_603E:
		subq.w	#1,6(a0)

loc_6042:
		move.w	6(a0),d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		subq.w	#2,d0
		bclr	#$F,d0
		lea	5(a1,d0.w),a1
		moveq	#0,d0
		move.b	(a1),d0
		beq.w	locret_6082
		add.w	d0,d0
		add.w	d0,d0
		lea	(off_21D2C).l,a1
		move.l	dword_21D28-off_21D2C(a1,d0.w),d0
		lea	(unk_FFFA80).w,a3
		lsr.l	#1,d0
		movep.w	d0,5(a3)
		swap	d0
		move.b	d0,9(a3)
		move.b	#1,(byte_FFEE04).w

locret_6082:
		rts

sub_6084:
		bclr	#0,(byte_FFEE04).w
		beq.s	locret_60A4
		lea	(unk_FFFA80).w,a3
		jsr	request_z80_bus
		move.l	(a3)+,(a5)
		move.l	(a3)+,(a5)
		move.l	(a3)+,(a5)
		move.w	(a3),(a5)
		jsr	release_z80_bus

locret_60A4:
		rts

sub_60A6:
		tst.b	(byte_FFEE62).w
		beq.s	locret_60D2
		subq.w	#1,(word_FF8FA8).w
		bne.s	locret_60D2
		sf	(byte_FFEE62).w
		move.w	#0,(word_FF8F9A).w
		move.b	#$FB,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd
		move.b	#$78,(byte_FFEE0A).w
		st	(byte_FFEE08).w

locret_60D2:
		rts

sub_60D4:
		btst	#6,(word_FF8FB0).w
		beq.s	loc_6118
		btst	#7,(word_FF8FB0+1).w
		beq.s	loc_6118
		sf	(byte_FFEE07).w
		sf	(byte_FFEE03).w
		sf	(byte_FFEE44).w
		sf	(byte_FFEE45).w
		sf	(byte_FFEE41).w
		sf	(byte_FFEE42).w
		move.w	#$8002,2(a0)
		move.w	#0,4(a0)
		move.w	#0,6(a0)
		moveq	#0,d0
		jsr	sub_5F78(pc)
		bra.w	loc_6156

loc_6118:
		moveq	#0,d0
		move.l	d0,$18(a0)
		move.l	d0,$1C(a0)
		move.l	d0,$34(a0)
		move.l	d0,$38(a0)
		move.b	(word_FF8F2C).w,d0
		btst	#3,d0
		beq.s	loc_6138
		addq.w	#4,$18(a0)

loc_6138:
		btst	#2,d0
		beq.s	loc_6142
		subq.w	#4,$18(a0)

loc_6142:
		btst	#1,d0
		beq.s	loc_614C
		addq.w	#4,$1C(a0)

loc_614C:
		btst	#0,d0
		beq.s	loc_6156
		subq.w	#4,$1C(a0)

loc_6156:
		jsr	sub_5DEA(pc)
		rts

sub_615C:
		tst.b	(byte_FFEE07).w
		bne.w	sub_60D4
		move.w	#$3200,(word_FF8F8C).w
		move.l	#$32000,(dword_FFEF4C).w
		move.l	#$32000,(dword_FFEF50).w
		move.l	#$3E000,(dword_FFEF54).w
		move.l	#$3E000,(dword_FFEF58).w
		move.l	#$58000,(dword_FFEF14).w
		tst.b	(byte_FFEE59).w
		beq.s	loc_61C6
		move.w	#$640,(word_FF8F8C).w
		move.l	#$18000,(dword_FFEF4C).w
		move.l	#$19000,(dword_FFEF50).w
		move.l	#$1E000,(dword_FFEF54).w
		move.l	#$1F000,(dword_FFEF58).w
		move.l	#$2C000,(dword_FFEF14).w

loc_61C6:
		move.b	#2,$D(a0)
		bclr	#0,$E(a0)
		move.b	#0,(byte_FFEE66).w
		move.w	2(a0),d0
		bclr	#$F,d0
		add.w	d0,d0
		add.w	d0,d0
		jsr	loc_6248(pc,d0.w)
		jsr	sub_5F8E(pc)
		jsr	sub_5FDC(pc)
		jsr	sub_BC48
		btst	#7,(byte_FFEE03).w
		bne.s	loc_6228
		tst.b	(byte_FFEE42).w
		bne.s	loc_620C
		jsr	sub_5D96(pc)
		jsr	sub_5AA4(pc)

loc_620C:
		jsr	sub_5DEA(pc)
		jsr	sub_5E8C(pc)
		tst.b	(byte_FFEE68).w
		bne.s	loc_621E
		jsr	sub_5ECE(pc)

loc_621E:
		move.b	(byte_FFEE0A).w,d0
		beq.s	loc_6228
		jsr	sub_5F0E(pc)

loc_6228:
		moveq	#0,d0
		move.b	d0,(byte_FFEE41).w
		move.b	d0,(byte_FFEE43).w
		move.w	d0,(word_FFEE54).w
		move.w	d0,(word_FF8FAA).w
		move.w	#$2800,$30(a0)
		move.w	(word_FF8F8C).w,$32(a0)
		rts

loc_6248:
		bra.w	loc_6372
		bra.w	sub_6ED4
		bra.w	loc_6404
		bra.w	loc_6404
		bra.w	loc_6444
		bra.w	loc_6444
		bra.w	loc_64A8
		bra.w	loc_64FE
		bra.w	loc_64A2
		bra.w	loc_64F8
		bra.w	sub_659E
		bra.w	sub_659E
		bra.w	sub_6628
		bra.w	loc_6646
		bra.w	sub_677E
		bra.w	sub_677E
		bra.w	loc_6404
		bra.w	loc_6404
		bra.w	sub_682A
		bra.w	sub_682A
		bra.w	sub_68F4
		bra.w	sub_68F4
		bra.w	sub_6678
		bra.w	sub_6678
		bra.w	loc_69E0
		bra.w	loc_69E0
		bra.w	sub_6AE8
		bra.w	sub_6AE8
		bra.w	sub_6B50
		bra.w	sub_6B50
		bra.w	sub_6C06
		bra.w	sub_6C06
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6CA6
		bra.w	sub_6CA6
		bra.w	sub_6CA6
		bra.w	sub_6CA6
		bra.w	sub_6DD2
		bra.w	sub_6DD2
		bra.w	sub_6DD2
		bra.w	sub_6DD2
		bra.w	sub_6CA6
		bra.w	sub_6CA6
		bra.w	sub_6628
		bra.w	loc_6646
		bra.w	loc_6D0A
		bra.w	loc_6D0A
		bra.w	loc_6D78
		bra.w	loc_6D78
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		bra.w	sub_6B50
		bra.w	sub_6B50
		bra.w	sub_6ED4
		bra.w	sub_6ED4
		lea	(objects_memory).w,a1
		move.w	(word_FF8F54).w,$14(a1)
		move.w	(word_FF8F58).w,$10(a1)
		lea	(unk_FF9F00).w,a1
		move.w	(word_FF8F56).w,$14(a1)
		subq.w	#8,$14(a1)
		move.w	(word_FF8F5A).w,$10(a1)
		subq.w	#8,$10(a1)
		rts

loc_6372:
		move.l	#off_21532,$20(a0)
		move.w	#$2800,$30(a0)
		move.w	(word_FF8F8C).w,$32(a0)
		move.w	#$600,(word_FF8F48).w
		addi.w	#$780,$A(a0)
		move.l	#$1A000,(dword_FFEF10).w
		lea	(word_FF8500).w,a1
		lea	(word_FF8F68).w,a2
		move.w	0.w(a1),(a2)+
		addi.w	#$130,-2(a2)
		move.w	4(a1),(a2)+
		addi.w	#$10,-2(a2)
		move.w	8(a1),(a2)+
		addi.w	#$E0,-2(a2)
		move.w	$C(a1),(a2)+
		addi.w	#$10,-2(a2)
		sf	(byte_FFEE03).w
		sf	(byte_FFEE44).w
		sf	(byte_FFEE45).w
		sf	(byte_FFEE42).w
		sf	(byte_FFEE08).w
		sf	(byte_FFEE62).w
		sf	(byte_FFEE09).w
		move.b	#0,(byte_FFEE0A).w
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		move.w	#$8002,2(a0)
		jsr	sub_6F22(pc)
		rts

loc_6404:
		bclr	#7,2(a0)
		beq.s	loc_6424
		moveq	#0,d0
		jsr	sub_5F78(pc)
		move.b	#$B4,(byte_FFEE0B).w
		move.w	#$1C20,(word_FF8F80).w
		move.b	#4,9(a0)

loc_6424:
		jsr	sub_6F22(pc)
		jsr	sub_6EDA(pc)
		tst.b	(byte_FFEE0B).w
		beq.s	loc_643A
		subq.b	#1,(byte_FFEE0B).w
		jmp	loc_646C(pc)

loc_643A:
		move.w	#$11A,(word_FF8F3C).w
		jmp	loc_646C(pc)

loc_6444:
		bclr	#7,2(a0)
		beq.s	loc_6458
		moveq	#2,d0
		jsr	sub_5F78(pc)
		move.w	#$101,(word_FF8F3E).w

loc_6458:
		move.b	(word_FF8F48).w,9(a0)
		jsr	sub_6F22(pc)
		jsr	sub_6EDA(pc)
		jsr	loc_646C(pc)
		rts

loc_646C:
		tst.b	(byte_FFEE47).w
		bmi.s	locret_6486
		move.w	$1C(a0),d0
		moveq	#4,d1
		tst.b	(byte_FFEE59).w
		beq.s	loc_6480
		moveq	#1,d1

loc_6480:
		cmp.w	d1,d0
		blt.s	locret_6486
		bsr.s	loc_6488

locret_6486:
		rts

loc_6488:
		bset	#1,(byte_FFEE03).w
		move.b	#0,(byte_FFEE06).w
		move.w	#$80,(word_FF8F84).w
		move.w	#$8008,d1
		jmp	sub_5F2A(pc)

loc_64A2:
		bset	#5,(byte_FFEE03).w

loc_64A8:
		bclr	#7,2(a0)
		beq.s	loc_64B6
		move.w	#$104,(word_FF8F3C).w

loc_64B6:
		bset	#0,$E(a0)
		jsr	sub_5F5E(pc)
		jsr	sub_6F22(pc)
		jsr	sub_6EDA(pc)
		jsr	loc_6548(pc)
		btst	#0,(byte_FFEE03).w
		bne.s	locret_64F6
		move.b	#0,(byte_FFEE06).w
		bclr	#0,(byte_FFEE03).w
		bclr	#5,(byte_FFEE03).w
		move.w	#$800A,2(a0)
		jsr	sub_6F22(pc)
		bclr	#1,(byte_FFEE03).w

locret_64F6:
		rts

loc_64F8:
		bset	#5,(byte_FFEE03).w

loc_64FE:
		bclr	#7,2(a0)
		beq.s	loc_650C
		move.w	#$105,(word_FF8F3C).w

loc_650C:
		bset	#0,$E(a0)
		jsr	sub_5F5E(pc)
		jsr	sub_6F22(pc)
		jsr	sub_6EDA(pc)
		jsr	loc_6548(pc)
		btst	#0,(byte_FFEE03).w
		bne.s	locret_6546
		move.b	#0,(byte_FFEE06).w
		bclr	#5,(byte_FFEE03).w
		move.w	#$800B,2(a0)
		jsr	sub_6F22(pc)
		bclr	#1,(byte_FFEE03).w

locret_6546:
		rts

loc_6548:
		jsr	(sub_6E68).l
		move.w	(word_FF8F84).w,d0
		lsr.w	#2,d0
		lea	stru_6576-4(pc),a1
		btst	#5,(byte_FFEE03).w
		beq.s	loc_6564
		lea	stru_658A-4(pc),a1

loc_6564:
		moveq	#4,d3

loc_6566:
		addq.l	#4,a1
		cmp.w	(a1),d0
		dblt	d3,loc_6566
		move.w	2(a1),(word_FF8F3E).w
		rts

stru_6576:	struc_11 8, $100
		struc_11 $18, $101
		struc_11 $20, $102
		struc_11 $28, $101
stru_6586:	struc_11 $64, $100
stru_658A:	struc_11 $A, $104
		struc_11 $1A, $105
		struc_11 $20, $106
		struc_11 $C8, $107
		struc_11 $C8, $107
sub_659E:
		bclr	#7,2(a0)
		beq.s	loc_65C8
		move.w	#$104,(word_FF8F3C).w
		move.w	#$108,(word_FF8F3E).w
		move.w	#$10,$26(a0)
		move.w	#4,$28(a0)
		clr.l	$34(a0)
		move.b	#$BC,(smps_cmd2).w

loc_65C8:
		bset	#0,$E(a0)
		subq.w	#1,$28(a0)
		bne.s	loc_65DA
		move.w	#$103,(word_FF8F3E).w

loc_65DA:
		move.w	2(a0),-(sp)
		jsr	sub_6F22(pc)
		jsr	sub_6EDA(pc)
		move.w	(sp)+,d7
		move.b	3(a0),d0
		cmpi.b	#4,d0
		bcs.w	loc_660A
		cmpi.b	#6,d0
		bcs.w	loc_661A
		cmpi.b	#$B,d0
		bhi.w	loc_661A
		cmpi.b	#$A,d0
		bcs.s	locret_6626

loc_660A:
		move.w	d7,2(a0)
		subq.w	#1,$26(a0)
		bne.s	locret_6626
		moveq	#2,d1
		jsr	sub_5F2A(pc)

loc_661A:
		bclr	#1,(byte_FFEE03).w
		move.b	#0,8(a0)

locret_6626:
		rts

sub_6628:
		bclr	#7,2(a0)
		bne.s	loc_6664
		move.w	#$FFFC,$18(a0)
		move.l	#$FFFD0000,$34(a0)
		move.w	#$16,2(a0)
		rts

loc_6646:
		bclr	#7,2(a0)
		bne.s	loc_6664
		move.w	#4,$18(a0)
		move.l	#$30000,$34(a0)
		move.w	#$17,2(a0)
		rts

loc_6664:
		moveq	#8,d0
		jsr	sub_5F78(pc)
		move.w	#$20,$26(a0)
		move.b	#$A9,(smps_cmd2).w
		rts

sub_6678:
		jsr	sub_6EDA(pc)
		btst	#7,(word_FF8F2C+1).w
		sne	(byte_FFEE5A).w
		btst	#2,(word_FF8F2C+1).w
		beq.s	loc_66B8
		tst.w	$18(a0)
		bmi.s	loc_66B8
		move.w	#0,(player_start_rotated).w
		move.w	#$108,(word_FF8F3C).w
		move.w	#$C,2(a0)
		neg.l	$18(a0)
		subq.w	#1,$18(a0)
		move.l	#$FFFD0000,$34(a0)
		bra.s	loc_66E8

loc_66B8:
		btst	#3,(word_FF8F2C+1).w
		beq.s	loc_66E8
		tst.w	$18(a0)
		bgt.s	loc_66E8
		move.w	#1,(player_start_rotated).w
		move.w	#$109,(word_FF8F3C).w
		move.w	#$D,2(a0)
		neg.l	$18(a0)
		addq.w	#1,$18(a0)

loc_66E0:
		move.l	#$30000,$34(a0)

loc_66E8:
		jsr	sub_6742(pc)
		bcs.s	loc_6714
		btst	#5,(word_FF8F2C+1).w
		beq.s	loc_6706
		btst	#0,(byte_FFEE03).w
		beq.s	loc_6722
		subq.w	#1,$26(a0)
		beq.s	loc_6722
		rts

loc_6706:
		subq.w	#1,$26(a0)
		beq.s	loc_6722
		tst.l	$18(a0)
		beq.s	loc_6722
		rts

loc_6714:
		subq.w	#1,$26(a0)
		beq.s	loc_6734
		tst.l	$18(a0)
		beq.s	loc_6734
		rts

loc_6722:
		move.w	#$8002,2(a0)
		bclr	#4,(byte_FFEE03).w
		jsr	sub_6F22(pc)
		rts

loc_6734:
		move.w	#$800E,2(a0)

loc_673A:
		bclr	#4,(byte_FFEE03).w
		rts

sub_6742:
		moveq	#$FFFFFFD8,d1
		moveq	#8,d2
		jsr	sub_75A6(pc)
		bne.s	loc_6778
		moveq	#$FFFFFFD8,d1
		moveq	#$FFFFFFF8,d2
		jsr	sub_75A6(pc)
		bne.s	loc_6778
		moveq	#$FFFFFFD8,d2
		add.w	(player_pos_y).w,d2
		move.w	d2,d3
		move.w	(player_pos_x).w,d4
		move.w	d4,d5
		subq.w	#8,d4
		addq.w	#8,d5
		move.l	a0,-(sp)
		jsr	sub_5CC0(pc)
		movea.l	(sp)+,a0
		bne.s	loc_6778
		move	#0,ccr
		rts

loc_6778:
		move	#$FFFF,ccr
		rts

sub_677E:
		bclr	#7,2(a0)
		beq.s	loc_6792
		moveq	#6,d0
		jsr	sub_5F78(pc)
		bclr	#2,(byte_FFEE03).w

loc_6792:
		btst	#7,(word_FF8F2C+1).w
		sne	(byte_FFEE5A).w
		jsr	sub_6742(pc)
		bcs.s	loc_67D2
		btst	#1,(word_FF8F2C).w
		bne.s	loc_67C8
		jsr	sub_6F22(pc)
		jsr	sub_6EDA(pc)
		bclr	#0,(byte_FFEE03).w

loc_67B8:
		bclr	#1,(byte_FFEE03).w
		move.w	#$8002,2(a0)
		jmp	sub_6F22(pc)

loc_67C8:
		jsr	sub_6F22(pc)
		jsr	sub_6EDA(pc)
		rts

loc_67D2:
		btst	#2,(word_FF8F2C+1).w
		beq.s	loc_67E2

loc_67DA:
		move.w	#0,(player_start_rotated).w
		beq.s	loc_67F0

loc_67E2:
		btst	#3,(word_FF8F2C+1).w
		beq.s	loc_67F0
		move.w	#1,(player_start_rotated).w

loc_67F0:
		move.w	#$E,(word_FF8F64).w
		btst	#5,(word_FF8F2C+1).w
		beq.s	loc_6804
		jsr	sub_71C0(pc)
		bra.s	loc_6808

loc_6804:
		jsr	sub_70C6(pc)

loc_6808:
		move.w	(word_FF8F64).w,d1
		btst	#5,3(a0)
		bne.s	locret_6828
		btst	#4,(word_FF8F2C+1).w
		beq.s	loc_6824
		addi.w	#$20,d1
		ori.w	#$8000,d1

loc_6824:
		jsr	sub_5F2A(pc)

locret_6828:
		rts

sub_682A:
		movea.l	(dword_FFEF3C).w,a1
		bclr	#7,2(a0)
		beq.s	loc_6858
		tst.b	(byte_FFEE78).w
		beq.s	loc_684C
		move.l	$14(a0),(dword_FFEF6C).w
		move.w	(word_FFEE56).w,(word_FF8FC0).w
		st	(word_FFEE56+1).w

loc_684C:
		jsr	sub_6A80(pc)
		addi.w	#$26,$14(a0)
		bra.s	loc_6866

loc_6858:
		tst.b	$28(a1)
		bne.s	loc_6866
		btst	#5,(word_FF8F2C+1).w
		bne.s	loc_689C

loc_6866:
		btst	#7,(word_FF8F2C+1).w
		sne	(byte_FFEE5A).w
		jsr	sub_6AAE(pc)
		btst	#3,$E(a1)
		beq.s	loc_689C
		tst.b	(byte_FFEE09).w
		bne.s	loc_689C
		bset	#6,$E(a1)
		move.l	$18(a1),$18(a0)
		move.l	$1C(a1),$1C(a0)
		move.w	$2C(a1),$2C(a0)
		rts

loc_689C:
		tst.b	(byte_FFEE78).w
		beq.s	loc_68AE
		move.l	(dword_FFEF6C).w,$14(a0)
		move.w	(word_FF8FC0).w,(word_FFEE56).w

loc_68AE:
		sf	(byte_FFEE60).w

loc_68B2:
		sf	(byte_FFEE42).w
		move.w	(word_FF8F8C).w,$32(a0)

loc_68BC:
		bset	#1,(byte_FFEE03).w
		bset	#0,(byte_FFEE03).w

loc_68C8:
		move.b	#0,(byte_FFEE06).w
		move.w	#0,(word_FF8F84).w
		move.b	#$A0,(smps_cmd2).w
		move.w	#$8008,d1

loc_68DE:
		jsr	sub_5F2A(pc)
		move.w	#$FFFA,$1C(a0)
		move.l	$18(a0),d0
		asr.l	#1,d0
		move.l	d0,$18(a0)
		rts

sub_68F4:
		movea.l	(dword_FFEF3C).w,a1
		bclr	#7,2(a0)
		beq.s	loc_6930
		move.w	(word_FFEE56).w,(word_FF8FC0).w
		st	(word_FFEE56+1).w
		move.l	$14(a0),(dword_FFEF6C).w
		move.l	$10(a0),d0
		sub.l	$10(a1),d0
		add.l	d0,$10(a1)
		movea.w	$30(a1),a2
		add.l	d0,$10(a2)
		jsr	sub_6A80(pc)
		addi.w	#$2E,$14(a0)
		bra.s	loc_6956

loc_6930:
		btst	#5,(word_FF8F2C+1).w
		bne.w	loc_69C6
		cmpi.w	#8,(level_main_index).w
		bne.s	loc_694E
		cmpi.w	#$810,$10(a0)
		bcc.w	loc_69C6
		bra.s	loc_6956

loc_694E:
		cmpi.w	#$9B0,$10(a0)
		bcc.s	loc_69C6

loc_6956:
		btst	#7,(word_FF8F2C+1).w
		sne	(byte_FFEE5A).w
		jsr	sub_6AAE(pc)
		btst	#3,$E(a1)
		beq.s	loc_69C6
		tst.b	(byte_FFEE09).w
		bne.s	loc_69C6
		movea.w	$30(a1),a2
		move.b	(word_FF8FB0).w,d0
		move.w	(word_FF8FB6).w,d5
		moveq	#0,d3
		btst	#0,d0
		beq.s	loc_6990
		cmpi.w	#$FFC0,d5
		ble.s	loc_6990
		subq.w	#1,d5
		moveq	#$FFFFFFFF,d3

loc_6990:
		btst	#1,d0
		beq.s	loc_69A0
		cmpi.w	#$40,d5
		bge.s	loc_69A0
		addq.w	#1,d5
		moveq	#1,d3

loc_69A0:
		move.w	d3,$1C(a2)
		add.w	d3,$14(a2)
		move.w	d5,(word_FF8FB6).w
		bset	#6,$E(a1)
		move.l	$18(a1),$18(a0)
		move.l	$1C(a1),$1C(a0)
		move.w	$2C(a1),$2C(a0)
		rts

loc_69C6:
		move.l	(dword_FFEF6C).w,$14(a0)
		move.w	(word_FF8FC0).w,(word_FFEE56).w
		movea.w	$30(a1),a2
		bset	#4,$E(a2)
		bra.w	loc_6A62

loc_69E0:
		movea.l	(dword_FFEF3C).w,a1
		bclr	#7,2(a0)
		beq.s	loc_6A12
		move.w	(word_FFEE56).w,(word_FF8FC0).w
		st	(word_FFEE56+1).w
		st	(word_FFEE56).w
		move.l	$10(a0),(dword_FFEF68).w
		move.l	$14(a0),(dword_FFEF6C).w
		jsr	sub_6A80(pc)
		addi.w	#$2E,$14(a0)
		bra.s	loc_6A20

loc_6A12:
		btst	#0,$E(a0)
		btst	#5,(word_FF8F2C+1).w
		bne.s	loc_6A44

loc_6A20:
		btst	#7,(word_FF8F2C+1).w
		sne	(byte_FFEE5A).w
		jsr	sub_6AAE(pc)
		btst	#3,$E(a1)
		beq.s	loc_6A44
		tst.b	(byte_FFEE09).w
		bne.s	loc_6A44
		move.w	$2C(a1),$2C(a0)
		rts

loc_6A44:
		bclr	#3,$E(a1)
		move.w	#1,$28(a1)
		move.l	(dword_FFEF68).w,$10(a0)
		move.l	(dword_FFEF6C).w,$14(a0)
		move.w	(word_FF8FC0).w,(word_FFEE56).w

loc_6A62:
		sf	(byte_FFEE60).w
		sf	(byte_FFEE42).w
		move.w	(word_FF8F8C).w,$32(a0)
		bset	#0,(byte_FFEE03).w
		move.b	#$A0,(smps_cmd2).w
		jmp	loc_6488(pc)

sub_6A80:
		moveq	#$20,d0
		jsr	sub_5F78(pc)
		clr.b	(byte_FFEE03).w
		st	(byte_FFEE42).w
		move.l	$10(a1),$10(a0)
		move.l	$14(a1),$14(a0)
		clr.l	$18(a0)
		clr.l	$1C(a0)
		st	(byte_FFEE60).w
		move.w	#0,(word_FF8FB6).w
		rts

sub_6AAE:
		btst	#2,(word_FF8F2C+1).w
		bne.s	loc_6AC0
		btst	#3,(word_FF8F2C+1).w
		bne.s	loc_6AD4
		rts

loc_6AC0:
		move.w	#$120,(word_FF8F3C).w
		move.w	#0,(player_start_rotated).w
		bclr	#0,3(a0)
		rts

loc_6AD4:
		move.w	#$121,(word_FF8F3C).w
		move.w	#1,(player_start_rotated).w
		bset	#0,3(a0)
		rts

sub_6AE8:
		bclr	#7,2(a0)
		beq.s	loc_6B0C
		moveq	#$10,d0
		jsr	sub_5F78(pc)
		move.w	#$1E,$26(a0)
		bclr	#0,$E(a0)
		st	(byte_FFEE08).w
		sf	(byte_FFEE09).w
		rts

loc_6B0C:
		bset	#7,(byte_FFEE03).w
		subq.w	#1,$26(a0)
		bne.s	loc_6B4C
		tst.w	(word_FF8F96).w
		bne.s	loc_6B32
		st	(byte_FFEE58).w
		cmpi.w	#1,(lives_count).w
		bne.s	locret_6B30
		bset	#0,$C(a0)

locret_6B30:
		rts

loc_6B32:
		move.b	#$78,(byte_FFEE0A).w
		bclr	#7,(byte_FFEE03).w
		lea	(unk_FF7C00).l,a1
		lea	(word_FFA2C0).w,a2
		jmp	copy_bytes_to_dest_64(pc) ; a1 = source

loc_6B4C:
		jmp	sub_5FDC(pc)

sub_6B50:
		bclr	#7,2(a0)
		beq.s	loc_6B72
		moveq	#$A,d0
		jsr	sub_5F78(pc)
		st	(byte_FFEE44).w
		st	(byte_FFEE45).w
		st	(byte_FFEE42).w
		move.w	#0,$26(a0)
		rts

loc_6B72:
		bclr	#0,$E(a0)
		tst.b	(byte_FFEE41).w
		beq.s	loc_6BFA
		moveq	#0,d0
		move.l	d0,$18(a0)
		move.l	d0,$1C(a0)
		move.l	d0,$34(a0)
		move.l	d0,$38(a0)
		btst	#7,(word_FF8F2C+1).w
		sne	(byte_FFEE5A).w
		move.b	(word_FF8F2C).w,d0
		btst	#1,d0
		beq.s	loc_6BAA
		addq.w	#1,$1C(a0)
		bra.s	loc_6BD6

loc_6BAA:
		btst	#0,d0
		beq.s	loc_6BB6
		subq.w	#1,$1C(a0)
		bra.s	loc_6BD6

loc_6BB6:
		btst	#3,d0
		beq.s	loc_6BC2
		addq.w	#1,$18(a0)
		bra.s	loc_6BD6

loc_6BC2:
		btst	#2,d0
		beq.s	loc_6BCE
		subq.w	#1,$18(a0)
		bra.s	loc_6BD6

loc_6BCE:
		bset	#0,$E(a0)
		rts

loc_6BD6:
		subq.w	#1,$26(a0)
		bpl.s	loc_6BE8
		move.w	#$F,$26(a0)
		move.b	#$AA,(smps_cmd2).w

loc_6BE8:
		jsr	sub_5C0C(pc)
		bcs.s	loc_6BF0
		rts

loc_6BF0:
		move.l	#0,$18(a0)
		rts

loc_6BFA:
		sf	(byte_FFEE42).w
		moveq	#2,d1
		jsr	sub_5F2A(pc)
		rts

sub_6C06:
		bclr	#7,2(a0)
		beq.s	loc_6C4A
		clr.l	$18(a0)
		move.w	#$FFFE,$1C(a0)
		moveq	#4,d0
		jsr	sub_5F78(pc)
		move.b	#$10,$28(a0)
		move.w	#$102,(word_FF8F3E).w
		btst	#1,(byte_FFEE03).w
		beq.s	loc_6C44
		clr.b	$28(a0)
		btst	#5,(byte_FFEE03).w
		beq.s	loc_6C44
		move.w	#$106,(word_FF8F3E).w

loc_6C44:
		bset	#7,(byte_FFEE03).w

loc_6C4A:
		move.b	$28(a0),d1
		add.b	d1,(word_FFEE54+1).w
		bset	#0,$E(a0)
		moveq	#0,d0
		move.w	(word_FF8F8C).w,d0
		asr.l	#1,d0
		add.l	d0,$1C(a0)
		cmpi.w	#$1E,2(a0)
		beq.s	loc_6C72
		tst.w	$1C(a0)
		bpl.s	loc_6C80

loc_6C72:
		move.w	$14(a0),d0
		sub.w	(planea_start_y).w,d0
		cmpi.w	#$100,d0
		bcs.s	loc_6C98

loc_6C80:
		st	(byte_FFEE58).w
		move.w	#0,(word_FF8F96).w
		cmpi.w	#1,(lives_count).w
		bne.s	loc_6C98
		bset	#0,$C(a0)

loc_6C98:
		jsr	sub_B88A(pc)
		jsr	sub_5F8E(pc)
		jsr	sub_5FDC(pc)
		rts

sub_6CA6:
		btst	#6,(byte_FFEE03).w
		bne.w	loc_6D78
		bclr	#7,2(a0)
		beq.s	loc_6CD0
		moveq	#$12,d0
		jsr	sub_5F78(pc)
		move.w	#$14,$26(a0)
		move.b	#0,$2A(a0)
		moveq	#0,d0
		jsr	sub_5116(pc)

loc_6CD0:
		bset	#3,$D(a0)
		st	(byte_FFEE44).w
		cmpi.w	#4,6(a0)
		bne.s	loc_6CFC
		subq.b	#1,$28(a0)
		bpl.s	loc_6CFC
		move.b	#1,$28(a0)
		bchg	#1,$2A(a0)
		move.b	$2A(a0),d1
		add.b	d1,(word_FFEE54).w

loc_6CFC:
		subq.w	#1,$26(a0)
		bne.s	locret_6D08
		moveq	#2,d1
		jsr	sub_5F2A(pc)

locret_6D08:
		rts

loc_6D0A:
		bclr	#7,2(a0)
		beq.s	loc_6D2A
		moveq	#$14,d0
		jsr	sub_5F78(pc)
		move.w	#$14,$26(a0)
		move.b	#0,$2A(a0)
		moveq	#6,d0
		jsr	sub_5116(pc)

loc_6D2A:
		bset	#3,$D(a0)
		st	(byte_FFEE44).w
		cmpi.w	#3,6(a0)
		bne.s	loc_6D56
		subq.b	#1,$28(a0)
		bpl.s	loc_6D56
		move.b	#1,$28(a0)
		bchg	#1,$2A(a0)
		move.b	$2A(a0),d1
		add.b	d1,(word_FFEE54).w

loc_6D56:
		subq.w	#1,$26(a0)
		bne.s	locret_6D76
		jsr	sub_6742(pc)
		bcs.s	loc_6D70
		btst	#1,(word_FF8F2C).w
		bne.s	loc_6D70
		moveq	#2,d1
		jmp	sub_5F2A(pc)

loc_6D70:
		moveq	#$E,d1
		jmp	sub_5F2A(pc)

locret_6D76:
		rts

loc_6D78:
		bclr	#7,2(a0)
		beq.s	loc_6D98
		moveq	#$1C,d0
		jsr	sub_5F78(pc)
		move.w	#$14,$26(a0)
		move.b	#0,$2A(a0)
		moveq	#8,d0
		jsr	sub_5116(pc)

loc_6D98:
		bset	#3,$D(a0)
		st	(byte_FFEE44).w
		cmpi.w	#3,6(a0)
		bne.s	loc_6DC4
		subq.b	#1,$28(a0)
		bpl.s	loc_6DC4
		move.b	#1,$28(a0)
		bchg	#1,$2A(a0)
		move.b	$2A(a0),d1
		add.b	d1,(word_FFEE54).w

loc_6DC4:
		subq.w	#1,$26(a0)
		bne.s	locret_6DD0
		moveq	#2,d1
		jsr	sub_5F2A(pc)

locret_6DD0:
		rts

sub_6DD2:
		bclr	#7,2(a0)
		beq.s	loc_6E14
		move.b	(word_FF8F2C).w,d0
		btst	#0,d0
		beq.s	loc_6DEC
		andi.b	#$C,d0
		beq.w	sub_6E7A

loc_6DEC:
		moveq	#$1E,d0
		move.b	3(a0),d1
		cmpi.b	#$28,d1
		bcs.s	loc_6DFA
		moveq	#$22,d0

loc_6DFA:
		jsr	sub_5F78(pc)
		move.w	#$14,$26(a0)
		moveq	#2,d0
		btst	#5,(byte_FFEE03).w
		beq.s	loc_6E10
		moveq	#4,d0

loc_6E10:
		jsr	sub_5116(pc)

loc_6E14:
		jsr	sub_6E68(pc)
		jsr	sub_5F5E(pc)
		jsr	sub_6F22(pc)
		btst	#6,(byte_FFEE03).w
		bne.w	loc_6EA8
		bset	#3,$D(a0)
		btst	#0,(byte_FFEE03).w
		beq.s	loc_6E46
		subq.w	#1,$26(a0)
		bne.s	locret_6E44
		addi.w	#$7FE0,2(a0)

locret_6E44:
		rts

loc_6E46:
		bclr	#1,(byte_FFEE03).w
		moveq	#$12,d0
		jsr	sub_5F78(pc)
		moveq	#$2A,d1
		jsr	sub_5F2A(pc)
		move.w	#$104,(word_FF8F3E).w
		clr.b	2(a0)
		st	(byte_FFEE44).w
		rts

sub_6E68:
		tst.b	(byte_FFEE59).w
		bne.s	loc_6E74
		addq.w	#4,(word_FF8F84).w
		rts

loc_6E74:
		addq.w	#1,(word_FF8F84).w
		rts

sub_6E7A:
		moveq	#$18,d0
		move.b	3(a0),d1
		cmpi.b	#$28,d1
		bcs.s	loc_6E88
		moveq	#$24,d0

loc_6E88:
		jsr	sub_5F78(pc)
		bset	#6,(byte_FFEE03).w
		move.w	#$14,$26(a0)
		moveq	#$A,d0
		btst	#5,(byte_FFEE03).w
		beq.s	loc_6EA4
		moveq	#$C,d0

loc_6EA4:
		jsr	sub_5116(pc)

loc_6EA8:
		bset	#3,$D(a0)
		btst	#0,(byte_FFEE03).w
		beq.s	loc_6ECA
		subq.w	#1,$26(a0)
		bne.s	locret_6EC8
		addi.w	#$7FE0,2(a0)
		bclr	#6,(byte_FFEE03).w

locret_6EC8:
		rts

loc_6ECA:
		bclr	#6,(byte_FFEE03).w
		bra.w	loc_6E46

sub_6ED4:
		divu.w	#0,d7
		rts

sub_6EDA:
		cmpi.w	#$E,2(a0)
		beq.s	locret_6F20
		btst	#2,(byte_FFEE03).w
		bne.s	loc_6EFE
		btst	#6,(word_FF8F2C).w
		beq.s	locret_6F20
		bset	#2,(byte_FFEE03).w
		clr.w	(word_FF8F48).w
		bra.s	locret_6F20

loc_6EFE:
		moveq	#3,d0
		cmp.b	(word_FF8F48).w,d0
		beq.s	loc_6F0C
		addi.w	#$10,(word_FF8F48).w

loc_6F0C:
		btst	#6,(word_FF8F2C).w
		bne.s	locret_6F20
		bclr	#2,(byte_FFEE03).w
		move.b	#6,(word_FF8F48).w

locret_6F20:
		rts

sub_6F22:
		tst.b	(byte_FFEE5E).w
		bne.s	loc_6F32
		btst	#7,(word_FF8F2C+1).w
		sne	(byte_FFEE5A).w

loc_6F32:
		move.w	2(a0),(word_FF8F64).w
		move.b	(word_FF8F2C).w,d1
		andi.w	#$F,d1
		tst.b	(byte_FFEE62).w
		beq.s	loc_6F54
		andi.b	#$C,d1
		bne.s	loc_6F50
		move.b	(byte_FFEE63).w,d1

loc_6F50:
		move.b	d1,(byte_FFEE63).w

loc_6F54:
		btst	#5,(word_FF8F2C+1).w
		beq.s	loc_6F60
		addi.w	#$10,d1

loc_6F60:
		add.w	d1,d1
		lea	off_6FA2(pc),a1
		tst.b	(byte_FFEE6C).w
		beq.s	loc_6F70
		lea	off_6FE2(pc),a1

loc_6F70:
		move.w	(a1,d1.w),d1
		jsr	(a1,d1.w)
		move.w	(word_FF8F64).w,d1
		btst	#5,3(a0)
		bne.s	locret_6FA0
		btst	#4,(word_FF8F2C+1).w
		beq.s	loc_6F9C
		jsr	(sub_51E6).l
		bmi.s	loc_6F9C
		addi.w	#$20,d1
		ori.w	#$8000,d1

loc_6F9C:
		jsr	sub_5F2A(pc)

locret_6FA0:
		rts

off_6FA2:	dc.w sub_7022-off_6FA2
		dc.w sub_7058-off_6FA2
		dc.w sub_70C6-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7088-off_6FA2
		dc.w sub_7088-off_6FA2
		dc.w sub_7088-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_70A8-off_6FA2
		dc.w sub_70A8-off_6FA2
		dc.w sub_70A8-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_70E8-off_6FA2
		dc.w sub_70E8-off_6FA2
		dc.w sub_71C0-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7124-off_6FA2
		dc.w sub_7124-off_6FA2
		dc.w sub_7124-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_712A-off_6FA2
		dc.w sub_712A-off_6FA2
		dc.w sub_712A-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7022-off_6FA2
		dc.w sub_7022-off_6FA2
off_6FE2:	dc.w sub_7022-off_6FE2
		dc.w sub_7058-off_6FE2
		dc.w sub_70C6-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7088-off_6FE2
		dc.w sub_7088-off_6FE2
		dc.w sub_70C6-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_70A8-off_6FE2
		dc.w sub_70A8-off_6FE2
		dc.w sub_70C6-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_70E8-off_6FE2
		dc.w sub_70E8-off_6FE2
		dc.w sub_71C0-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7124-off_6FE2
		dc.w sub_7124-off_6FE2
		dc.w loc_71C8-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_712A-off_6FE2
		dc.w sub_712A-off_6FE2
		dc.w loc_71F0-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7022-off_6FE2
		dc.w sub_7022-off_6FE2
sub_7022:
		btst	#7,(byte_FFEE47).w
		bne.s	loc_7046
		btst	#0,(byte_FFEE03).w
		bne.s	loc_704C
		btst	#1,(byte_FFEE03).w
		bne.s	loc_7046
		tst.l	$18(a0)
		bne.s	loc_7046
		move.w	#2,(word_FF8F64).w

loc_7046:
		clr.l	$34(a0)
		rts

loc_704C:
		move.w	#$600,$30(a0)
		clr.l	$34(a0)
		rts

sub_7058:
		btst	#0,(byte_FFEE03).w
		bne.s	locret_7086
		tst.b	(byte_FFEE41).w
		beq.s	loc_7076
		btst	#0,(word_FF8F2C+1).w
		beq.s	loc_7076
		move.w	#$1C,(word_FF8F64).w
		rts

loc_7076:
		clr.l	$34(a0)
		tst.l	$18(a0)
		bne.s	locret_7086
		move.w	#$10,(word_FF8F64).w

locret_7086:
		rts

sub_7088:
		move.w	#0,(player_start_rotated).w
		move.l	(dword_FFEF10).w,d1
		neg.l	d1
		move.l	d1,$34(a0)
		btst	#0,(byte_FFEE03).w
		bne.s	locret_70A6
		move.w	#4,(word_FF8F64).w

locret_70A6:
		rts

sub_70A8:
		move.w	#1,(player_start_rotated).w
		move.l	(dword_FFEF10).w,d1
		move.l	d1,$34(a0)
		btst	#0,(byte_FFEE03).w
		bne.s	locret_70C4
		move.w	#5,(word_FF8F64).w

locret_70C4:
		rts

sub_70C6:
		btst	#0,(byte_FFEE03).w
		bne.s	locret_70E6
		tst.b	(byte_FFEE41).w
		beq.s	loc_70DC
		move.w	#$1C,(word_FF8F64).w
		rts

loc_70DC:
		clr.l	$34(a0)
		move.w	#$E,(word_FF8F64).w

locret_70E6:
		rts

sub_70E8:
		btst	#1,(byte_FFEE03).w
		bne.s	locret_7122
		btst	#0,(byte_FFEE03).w
		beq.s	loc_70FE
		tst.b	(byte_FFEE47).w
		bpl.s	locret_7122

loc_70FE:
		st	(byte_FFEE44).w
		move.l	(dword_FFEF4C).w,d0
		neg.l	d0
		tst.b	(byte_FFEE43).w
		beq.s	loc_7114
		move.l	(dword_FFEF54).w,d0
		neg.l	d0

loc_7114:
		move.l	d0,$1C(a0)
		jsr	sub_7178(pc)
		move.w	#6,(word_FF8F64).w

locret_7122:
		rts

sub_7124:
		clr.w	(player_start_rotated).w
		bra.s	loc_7130

sub_712A:
		move.w	#1,(player_start_rotated).w

loc_7130:
		btst	#1,(byte_FFEE03).w
		bne.s	locret_7176
		btst	#0,(byte_FFEE03).w
		beq.s	loc_7146
		tst.b	(byte_FFEE47).w
		bpl.s	locret_7176

loc_7146:
		tst.b	(byte_FFEE62).w
		bne.s	loc_7156
		move.l	$18(a0),d0
		asr.l	#2,d0
		move.l	d0,$18(a0)

loc_7156:
		move.l	(dword_FFEF50).w,d0
		neg.l	d0
		tst.b	(byte_FFEE43).w
		beq.s	loc_7168
		move.l	(dword_FFEF58).w,d0
		neg.l	d0

loc_7168:
		move.l	d0,$1C(a0)
		jsr	sub_7178(pc)
		move.w	#8,(word_FF8F64).w

locret_7176:
		rts

sub_7178:
		bset	#0,(byte_FFEE03).w
		bset	#1,(byte_FFEE03).w
		move.b	#$E,(byte_FFEE06).w
		move.b	(byte_FFEE43).w,(byte_FFEE4C).w
		move.w	#0,(word_FF8F84).w
		jsr	sub_719C(pc)
		rts

sub_719C:
		move.b	#$A0,d0
		tst.b	(byte_FFEE59).w
		beq.s	loc_71AC
		move.b	#$C7,d0
		bra.s	loc_71BA

loc_71AC:
		tst.b	(byte_FFEE4C).w
		beq.s	loc_71BA
		sf	(byte_FFEE4C).w
		move.b	#$AD,d0

loc_71BA:
		move.b	d0,(smps_cmd2).w
		rts

sub_71C0:
		tst.w	(player_start_rotated).w
		bne.w	loc_71F0

loc_71C8:
		tst.b	(byte_FFEE47).w
		bmi.s	locret_71EE
		btst	#1,(byte_FFEE03).w
		bne.s	locret_71EE
		tst.b	(byte_FFEE4A).w
		bne.s	locret_71EE
		move.w	#0,(player_start_rotated).w
		bset	#4,(byte_FFEE03).w
		move.w	#$C,(word_FF8F64).w

locret_71EE:
		rts

loc_71F0:
		tst.b	(byte_FFEE47).w
		bmi.s	locret_7216
		btst	#1,(byte_FFEE03).w
		bne.s	locret_7216
		tst.b	(byte_FFEE4A).w
		bne.s	locret_7216
		move.w	#1,(player_start_rotated).w
		bset	#4,(byte_FFEE03).w
		move.w	#$D,(word_FF8F64).w

locret_7216:
		rts

sub_7218:
		tst.w	$1C(a0)
		bmi.w	sub_74BC
		move.w	#0,d1
		moveq	#0,d2
		jsr	sub_BAF6(pc)
		lea	off_7274(pc),a1
		add.w	d7,d7
		move.w	(a1,d7.w),d7
		jsr	(a1,d7.w)
		moveq	#0,d1
		moveq	#8,d2
		jsr	sub_75E0(pc)
		swap	d7
		cmpi.b	#$21,d7
		beq.w	sub_74A4
		swap	d7
		tst.b	d7
		bmi.w	sub_72D0
		moveq	#0,d1
		moveq	#$FFFFFFF8,d2
		jsr	sub_75E0(pc)
		swap	d7
		cmpi.b	#$21,d7
		beq.w	sub_74A4
		swap	d7
		tst.b	d7
		bmi.s	sub_72D0
		jsr	sub_5D06(pc)
		bne.w	sub_746C
		rts

off_7274:	dc.w sub_72FC-off_7274
		dc.w sub_72D0-off_7274
		dc.w sub_72D0-off_7274
		dc.w sub_72D0-off_7274
		dc.w sub_72D0-off_7274
		dc.w sub_7344-off_7274
		dc.w sub_7360-off_7274
		dc.w sub_737E-off_7274
		dc.w sub_7344-off_7274
		dc.w sub_7360-off_7274
		dc.w sub_737E-off_7274
		dc.w sub_739C-off_7274
		dc.w sub_73AE-off_7274
		dc.w sub_73D2-off_7274
		dc.w sub_739C-off_7274
		dc.w sub_73AE-off_7274
		dc.w sub_73D2-off_7274
		dc.w sub_72FC-off_7274
		dc.w sub_749C-off_7274
		dc.w sub_732E-off_7274
		dc.w sub_7494-off_7274
		dc.w sub_7344-off_7274
		dc.w sub_7360-off_7274
		dc.w sub_737E-off_7274
		dc.w sub_7344-off_7274
		dc.w sub_7360-off_7274
		dc.w sub_737E-off_7274
		dc.w sub_739C-off_7274
		dc.w sub_73AE-off_7274
		dc.w sub_73D2-off_7274
		dc.w sub_739C-off_7274
		dc.w sub_73AE-off_7274
		dc.w sub_73D2-off_7274
		dc.w sub_74A4-off_7274
		dc.w sub_72D0-off_7274
		dc.w sub_72D0-off_7274
		dc.w sub_72D0-off_7274
		dc.w sub_7430-off_7274
		dc.w sub_7438-off_7274
		dc.w sub_7440-off_7274
		dc.w sub_7448-off_7274
		dc.w sub_7430-off_7274
		dc.w sub_7438-off_7274
		dc.w sub_7440-off_7274
		dc.w sub_7448-off_7274
		dc.w sub_72FC-off_7274
sub_72D0:
		bclr	#0,(byte_FFEE03).w
		st	(byte_FFEE45).w
		move.l	$14(a0),d0
		add.l	$1C(a0),d0
		andi.l	#$FFF00000,d0
		cmp.l	$14(a0),d0
		beq.s	locret_72FA
		nop
		nop
		move.l	d0,$14(a0)
		nop
		nop

locret_72FA:
		rts

sub_72FC:
		bset	#0,(byte_FFEE03).w
		move.w	#0,d1
		moveq	#$FFFFFFF8,d2
		jsr	sub_BAF6(pc)
		beq.s	loc_7314
		cmpi.w	#4,d7
		bls.s	sub_72D0

loc_7314:
		move.w	#0,d1
		moveq	#8,d2
		jsr	sub_BAF6(pc)
		beq.s	loc_7326
		cmpi.w	#4,d7
		bls.s	sub_72D0

loc_7326:
		move.l	(dword_FFEF14).w,$38(a0)
		rts

sub_732E:
		bclr	#0,(byte_FFEE03).w
		move.l	$1C(a0),d0
		asr.l	#2,d0
		move.l	d0,$1C(a0)
		st	(byte_FFEE4A).w
		rts

sub_7344:
		move.b	#$82,(byte_FFEE47).w
		move.l	$10(a0),d1
		andi.l	#$FFFFF,d1
		neg.l	d1
		addi.l	#$100000,d1
		bra.w	sub_73F4

sub_7360:
		move.b	#$80,(byte_FFEE47).w
		move.l	$10(a0),d1
		andi.l	#$FFFFF,d1
		asr.l	#1,d1
		neg.l	d1
		addi.l	#$100000,d1
		bra.w	sub_73F4

sub_737E:
		move.b	#$80,(byte_FFEE47).w
		move.l	$10(a0),d1
		andi.l	#$FFFFF,d1
		asr.l	#1,d1
		neg.l	d1
		addi.l	#$80000,d1
		bra.w	sub_73F4

sub_739C:
		move.b	#$83,(byte_FFEE47).w
		move.l	$10(a0),d1
		andi.l	#$FFFFF,d1
		bra.s	sub_73F4

sub_73AE:
		move.b	#$81,(byte_FFEE47).w
		move.l	$10(a0),d1
		andi.l	#$FFFFF,d1
		neg.l	d1
		addi.l	#$100000,d1
		asr.l	#1,d1
		neg.l	d1
		addi.l	#$100000,d1
		bra.s	sub_73F4

sub_73D2:
		move.b	#$81,(byte_FFEE47).w
		move.l	$10(a0),d1
		andi.l	#$FFFFF,d1
		neg.l	d1
		addi.l	#$100000,d1
		asr.l	#1,d1
		neg.l	d1
		addi.l	#$80000,d1

sub_73F4:
		move.l	$14(a0),d0
		andi.l	#$FFFFF,d0
		cmp.l	d1,d0
		bcs.w	loc_7420
		move.l	$14(a0),d0
		andi.l	#$FFF00000,d0
		add.l	d0,d1
		move.l	d1,$14(a0)
		st	(byte_FFEE45).w
		bclr	#0,(byte_FFEE03).w
		rts

loc_7420:
		bset	#0,(byte_FFEE03).w
		bne.s	locret_742E
		move.l	(dword_FFEF14).w,$38(a0)

locret_742E:
		rts

sub_7430:
		move.b	#$82,(byte_FFEE47).w
		bra.s	sub_744E

sub_7438:
		move.b	#$80,(byte_FFEE47).w
		bra.s	sub_744E

sub_7440:
		move.b	#$83,(byte_FFEE47).w
		bra.s	sub_744E

sub_7448:
		move.b	#$81,(byte_FFEE47).w

sub_744E:
		st	(byte_FFEE45).w
		bclr	#0,(byte_FFEE03).w
		move.l	$14(a0),d0
		add.l	$1C(a0),d0
		andi.l	#$FFF00000,d0
		move.l	d0,$14(a0)
		rts

sub_746C:
		jsr	sub_BB72(pc)
		moveq	#0,d0
		move.w	$14(a1),d0
		move.b	(a4),d1
		ext.w	d1
		add.w	d1,d0
		swap	d0
		move.l	d0,$14(a0)
		bclr	#0,(byte_FFEE03).w
		st	(byte_FFEE45).w
		bset	#6,$E(a1)
		rts

sub_7494:
		move.w	#$801E,2(a0)
		rts

sub_749C:
		move.w	#$801F,2(a0)
		rts

sub_74A4:
		bsr.s	sub_74AA
		bra.w	sub_72D0

sub_74AA:
		tst.b	(byte_FFEE08).w
		bne.s	locret_74BA
		tst.b	(byte_FFEE62).w
		bne.s	locret_74BA
		st	(byte_FFEE09).w

locret_74BA:
		rts

sub_74BC:
		move.w	(word_FF8F54).w,d1
		sub.w	$14(a0),d1
		moveq	#0,d2
		jsr	sub_BAF6(pc)
		lea	off_7502(pc),a1
		add.w	d7,d7
		move.w	(a1,d7.w),d7
		jsr	(a1,d7.w)
		jsr	sub_5CA2(pc)
		bne.w	sub_755E
		move.w	(word_FF8F54).w,d1
		sub.w	$14(a0),d1
		moveq	#8,d2
		jsr	sub_75A6(pc)
		bne.s	sub_755E
		move.w	(word_FF8F54).w,d1
		sub.w	$14(a0),d1
		moveq	#$FFFFFFF8,d2
		jsr	sub_75A6(pc)
		bne.s	sub_755E
		rts

off_7502:	dc.w nullsub_6-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_7564-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w sub_755E-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
		dc.w nullsub_6-off_7502
sub_755E:
		st	(byte_FFEE45).w

nullsub_6:
		rts

sub_7564:
		jsr	sub_74AA(pc)
		st	(byte_FFEE45).w

sub_756C:
		jsr	sub_BAF6(pc)
		lea	byte_7578(pc,d7.w),a2
		tst.b	(a2)
		rts

byte_7578:	dc.b 0,	$FF, $FF, 0, 0,	1, 1, 1, 0, 0, 0, 1, 1,	1, 0, 0, 0, $FF, $FF, $FF
		dc.b 0,	1, 1, 1, 0, 0, 0, 1, 1,	1, 0, 0, 0, $FF, $FF, $FF, $FF,	1, 1, 1
		dc.b 1,	0, 0, 0, 0, 0
sub_75A6:
		jsr	sub_BAF6(pc)
		lea	byte_75B2(pc,d7.w),a2
		tst.b	(a2)
		rts

byte_75B2:	dc.b 0,	$FF, $FF, 0, 0,	1, 1, 1, 0, 0, 0, 1, 1,	1, 0, 0, 0, 0, 0, 0
		dc.b 0,	1, 1, 1, 0, 0, 0, 1, 1,	1, 0, 0, 0, $FF, $FF, $FF, $FF,	1, 1, 1
		dc.b 1,	0, 0, 0, 0, 0
sub_75E0:
		jsr	sub_BAF6(pc)
		lea	byte_75EE(pc,d7.w),a2
		swap	d7
		move.b	(a2),d7
		rts

byte_75EE:	dc.b 0,	$FF, $FF, $FF, $FF, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1, 1,	0, 0, 0
		dc.b 0,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, $FF, $FF, $FF, $FF,	1, 1, 1
		dc.b 1,	1, 1, 1, 1, 0
sub_761C:
		jsr	sub_BAF6(pc)
		lea	off_762E(pc),a1
		add.w	d7,d7
		move.w	(a1,d7.w),d7
		jmp	(a1,d7.w)

off_762E:	dc.w sub_7696-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_769E-off_762E
		dc.w sub_76B8-off_762E
		dc.w sub_76B8-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_76D4-off_762E
		dc.w sub_76EE-off_762E
		dc.w sub_76EE-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7730-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_7696-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_7734-off_762E
		dc.w sub_768A-off_762E
		dc.w sub_770A-off_762E
		dc.w sub_7714-off_762E
		dc.w sub_771E-off_762E
		dc.w sub_7726-off_762E
		dc.w sub_770A-off_762E
		dc.w sub_7714-off_762E
		dc.w sub_771E-off_762E
		dc.w sub_7726-off_762E
		dc.w sub_7696-off_762E
sub_768A:
		jsr	sub_773C(pc)
		st	(byte_FFEE44).w
		moveq	#1,d7
		rts

sub_7696:
		jsr	sub_773C(pc)
		bra.w	sub_772C

sub_769E:
		btst	#0,(byte_FFEE03).w
		bne.w	sub_772C
		move.l	$18(a0),d0
		bpl.s	loc_76B0
		neg.l	d0

loc_76B0:
		move.l	d0,$1C(a0)
		bra.w	sub_772C

sub_76B8:
		btst	#0,(byte_FFEE03).w
		bne.w	sub_772C
		move.l	$18(a0),d0
		bpl.s	loc_76CA
		neg.l	d0

loc_76CA:
		asr.l	#1,d0
		move.l	d0,$1C(a0)
		bra.w	sub_772C

sub_76D4:
		btst	#0,(byte_FFEE03).w
		bne.w	sub_772C
		move.l	$18(a0),d0
		bpl.s	loc_76E6
		neg.l	d0

loc_76E6:
		sub.l	d0,$14(a0)
		bra.w	sub_772C

sub_76EE:
		btst	#0,(byte_FFEE03).w
		bne.w	sub_772C
		move.l	$18(a0),d0
		bpl.s	loc_7700
		neg.l	d0

loc_7700:
		asr.l	#1,d0
		sub.l	d0,$14(a0)
		bra.w	sub_772C

sub_770A:
		tst.b	(byte_FFEE47).w
		bmi.s	sub_769E
		bra.w	sub_772C

sub_7714:
		tst.b	(byte_FFEE47).w
		bmi.s	sub_76B8
		bra.w	sub_772C

sub_771E:
		tst.b	(byte_FFEE47).w
		bmi.s	sub_76D4
		bra.s	sub_772C

sub_7726:
		tst.b	(byte_FFEE47).w
		bmi.s	sub_76EE

sub_772C:
		moveq	#0,d7
		rts
sub_7730:
		bra.w	sub_7696

sub_7734:
		jsr	sub_74AA(pc)
		bra.w	sub_768A

sub_773C:
		moveq	#0,d0
		move.b	(byte_FFEE47).w,d0
		bpl.s	locret_7750
		bclr	#7,d0
		add.w	d0,d0
		add.w	d0,d0
		move.l	off_7752(pc,d0.w),(sp)

locret_7750:
		rts

off_7752:	dc.l sub_76B8
		dc.l sub_76EE
		dc.l sub_769E
		dc.l sub_76D4
sub_7762:
		jsr	sub_BAF6(pc)
		lea	off_7774(pc),a1
		add.w	d7,d7
		move.w	(a1,d7.w),d7
		jmp	(a1,d7.w)

off_7774:	dc.w sub_77DC-off_7774
		dc.w sub_77D0-off_7774
		dc.w sub_77D0-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77EA-off_7774
		dc.w sub_7804-off_7774
		dc.w sub_7804-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_7820-off_7774
		dc.w sub_783A-off_7774
		dc.w sub_783A-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77D0-off_7774
		dc.w sub_77EA-off_7774
		dc.w sub_7804-off_7774
		dc.w sub_7804-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_7820-off_7774
		dc.w sub_783A-off_7774
		dc.w sub_783A-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77DC-off_7774
		dc.w sub_77D0-off_7774
		dc.w sub_77D0-off_7774
		dc.w sub_77D0-off_7774
		dc.w sub_77E4-off_7774
		dc.w sub_7856-off_7774
		dc.w sub_7860-off_7774
		dc.w sub_786A-off_7774
		dc.w sub_7874-off_7774
		dc.w sub_7856-off_7774
		dc.w sub_7860-off_7774
		dc.w sub_786A-off_7774
		dc.w sub_7874-off_7774
		dc.w sub_77DC-off_7774
sub_77D0:
		jsr	sub_787E(pc)
		st	(byte_FFEE44).w
		moveq	#1,d7
		rts

sub_77DC:
		jsr	sub_787E(pc)
		bra.w	sub_787A

sub_77E4:
		jsr	sub_74AA(pc)
		bra.s	sub_77D0

sub_77EA:
		btst	#0,(byte_FFEE03).w
		bne.w	sub_787A
		move.l	$18(a0),d0
		bpl.s	loc_77FC
		neg.l	d0

loc_77FC:
		sub.l	d0,$14(a0)
		bra.w	sub_787A

sub_7804:
		btst	#0,(byte_FFEE03).w
		bne.w	sub_787A
		move.l	$18(a0),d0
		bpl.s	loc_7816
		neg.l	d0

loc_7816:
		asr.l	#1,d0
		sub.l	d0,$14(a0)
		bra.w	sub_787A

sub_7820:
		btst	#0,(byte_FFEE03).w
		bne.w	sub_787A
		move.l	$18(a0),d0
		bpl.s	loc_7832
		neg.l	d0

loc_7832:
		move.l	d0,$1C(a0)
		bra.w	sub_787A

sub_783A:
		btst	#0,(byte_FFEE03).w
		bne.w	sub_787A
		move.l	$18(a0),d0
		bpl.s	loc_784C
		neg.l	d0

loc_784C:
		asr.l	#1,d0
		move.l	d0,$1C(a0)
		bra.w	sub_787A

sub_7856:
		tst.b	(byte_FFEE47).w
		bmi.s	sub_77EA
		bra.w	sub_787A

sub_7860:
		tst.b	(byte_FFEE47).w
		bmi.s	sub_7804
		bra.w	sub_787A

sub_786A:
		tst.b	(byte_FFEE47).w
		bmi.s	sub_7820
		bra.w	sub_787A

sub_7874:
		tst.b	(byte_FFEE47).w
		bmi.s	sub_783A

sub_787A:
		moveq	#0,d7
		rts

sub_787E:
		moveq	#0,d0
		move.b	(byte_FFEE47).w,d0
		bpl.s	locret_7892
		bclr	#7,d0
		add.w	d0,d0
		add.w	d0,d0
		move.l	off_7894(pc,d0.w),(sp)

locret_7892:
		rts

off_7894:	dc.l sub_7804
		dc.l sub_783A
		dc.l sub_77EA
		dc.l sub_7820
sub_78A4:
		move.w	2(a0),d0
		add.w	d0,d0
		move.w	off_78B2(pc,d0.w),d0
		jmp	off_78B2(pc,d0.w)

off_78B2:	dc.w sub_78B6-off_78B2
		dc.w locret_78E0-off_78B2
sub_78B6:
		move.l	#off_791A,$20(a0)
		move.w	#$8035,$A(a0)
		bset	#1,$D(a0)
		bset	#7,$C(a0)
		bset	#4,$C(a0)
		move.w	#0,$26(a0)
		addq.w	#1,2(a0)

locret_78E0:
		rts

sub_78E2:
		move.w	2(a0),d0
		add.w	d0,d0
		move.w	off_78F0(pc,d0.w),d0
		jmp	off_78F0(pc,d0.w)

off_78F0:	dc.w sub_78F4-off_78F0
		dc.w locret_7918-off_78F0
sub_78F4:
		move.l	#off_791A,$20(a0)
		move.w	#$9835,$A(a0)
		bset	#1,$D(a0)
		bset	#7,$C(a0)
		bset	#4,$C(a0)
		addq.w	#1,2(a0)

locret_7918:
		rts

off_791A:	dc.w byte_791E-off_791A
		dc.w byte_791E-off_791A
byte_791E:	dc.b 0,	0, 0, 6, 0, 6, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0
sub_7930:
		lea	off_793A(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_793A:	dc.w loc_7986
		dc.w sub_7942
		dc.w sub_7960
		dc.w loc_7970
sub_7942:
		tst.b	(byte_FFEE70).w
		bne.s	loc_7952
		jsr	sub_B9A8(pc)
		sne	(byte_FFEE70).w
		bra.s	loc_795C

loc_7952:
		move.w	#$3C,$26(a0)
		addq.w	#1,2(a0)

loc_795C:
		bra.w	loc_79A6

sub_7960:
		subq.w	#1,$26(a0)
		bne.s	loc_79A6
		bclr	#4,$C(a0)
		addq.w	#1,2(a0)

loc_7970:
		addi.l	#$6000,$1C(a0)
		jmp	sub_B88A(pc)

sub_797C:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_7986
		beq.s	loc_79A6

loc_7986:
		jsr	sub_BC72(pc)
		move.l	#off_1E2A4,$20(a0)
		jsr	sub_B852
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		rts

loc_79A6:
		tst.b	(byte_FFEE41).w
		bne.s	locret_79CA
		move.w	(player_pos_y).w,d1
		move.w	(player_pos_x).w,d2
		btst	#0,(word_FF8F2C).w
		beq.s	loc_79C0
		subi.w	#$20,d1

loc_79C0:
		movea.l	a0,a1
		jsr	sub_BAB4(pc)
		sne	(byte_FFEE41).w

locret_79CA:
		rts

sub_79CC:
		lea	off_79D6(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_79D6:	dc.w sub_79FC
		dc.w sub_79DE
		dc.w sub_7A82
		dc.w sub_7AF0
sub_79DE:
		tst.b	(byte_FFEEF7).w
		beq.s	locret_79E8
		bra.w	loc_7A56

locret_79E8:
		rts

sub_79EA:
		lea	off_79F4(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_79F4:	dc.w sub_79FC
		dc.w sub_7A42
		dc.w sub_7A82
		dc.w sub_7AF0
sub_79FC:
		move.w	#$300,$A(a0)
		move.l	#off_1E20A,$20(a0)
		jsr	sub_B852
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		bset	#3,$E(a0)
		lea	(off_7AFC).l,a1
		moveq	#0,d0
		move.b	$36(a0),d0
		bclr	#7,d0
		sne	$28(a0)
		add.w	d0,d0
		add.w	d0,d0
		move.l	(a1,d0.w),$30(a0)
		rts

sub_7A42:
		cmpi.w	#1,(level_main_index).w
		bne.s	loc_7A56
		tst.b	(byte_FFEEF7).w
		beq.s	loc_7A56
		bset	#0,$C(a0)

loc_7A56:
		movea.l	a0,a1
		move.w	(player_pos_y).w,d1
		subi.w	#$24,d1
		move.w	(player_pos_x).w,d2
		jsr	sub_BAB4
		beq.s	locret_7A80
		addq.w	#1,2(a0)
		move.l	a0,(dword_FFEF3C).w
		bclr	#1,$D(a0)
		move.w	#$8012,(word_FFA2C2).w

locret_7A80:
		rts

sub_7A82:
		bclr	#6,$E(a0)
		beq.s	loc_7ADE
		subq.w	#1,$34(a0)
		bhi.s	loc_7ACE
		movea.l	$30(a0),a1
		move.w	#$2F6,d1
		cmp.w	(a1),d1
		beq.s	loc_7ADE
		move.w	#0,4(a0)
		move.w	(a1)+,d0
		move.w	d0,$18(a0)
		bmi.s	loc_7AB2
		move.w	#1,4(a0)
		neg.w	d0

loc_7AB2:
		addq.w	#8,d0
		move.b	d0,9(a0)
		move.w	(a1)+,$1C(a0)
		move.w	(a1)+,d0
		bclr	#$F,d0
		sne	$36(a0)
		move.w	d0,$34(a0)
		move.l	a1,$30(a0)

loc_7ACE:
		tst.b	$36(a0)
		beq.s	loc_7ADA
		bchg	#1,$2D(a0)

loc_7ADA:
		jmp	sub_B88A(pc)

loc_7ADE:
		bclr	#3,$E(a0)
		addq.w	#1,2(a0)
		bclr	#4,$C(a0)
		rts

sub_7AF0:
		addi.l	#$4000,$1C(a0)
		jmp	sub_B88A(pc)

off_7AFC:	dc.l word_7B38
		dc.l word_7B62
		dc.l word_7B8C
		dc.l word_7B92
		dc.l word_7BF2
		dc.l word_7C16
		dc.l word_7C22
		dc.l word_7C22
		dc.l word_7C3A
		dc.l word_7C3A
		dc.l word_7C4C
		dc.l word_7C58
		dc.l word_7C64
		dc.l word_7C7C
		dc.l word_7C88
word_7B38:	dc.w 2,	0, $48,	1, $FFFF, $100,	2
		dc.w 0,	$30, 4,	2, $68,	4, 0
		dc.w $8018, 4, 0, $14, $2F6, $2F6, $2F6
word_7B62:	dc.w 4,	0, $1C,	4, 0, $8018, $FFFC
		dc.w $FFFC, $40, $FFFC,	0, $8018, $FFFC, 4
		dc.w $1C, 4, 0,	$8018, 4, 0, $60
word_7B8C:	dc.w $2F6, $2F6, $2F6
word_7B92:	dc.w 4,	0, $2C,	4, 0, $8018, 4
		dc.w $FFFC, $24, 4, 0, $8018, 4, 4
		dc.w $54, 4, 0,	$8018, 4, 0, $B0
		dc.w 4,	0, $8018, $FFFC, $FFFC,	$20, $FFFC
		dc.w 0,	$8018, $FFFC, 0, $68, $FFFC, 0
		dc.w $8018, 4, $FFFC, $28, 4, 0, $8018
		dc.w 4,	0, $30,	$2F6, $2F6, $2F6
word_7BF2:	dc.w 4,	4, $24,	4, 0, $8018, 4
		dc.w $FFFC, $54, 4, 0, $8018, 4, 0
		dc.w $5C, $2F6,	$2F6, $2F6
word_7C16:	dc.w 4,	0, $50,	$2F6, $2F6, $2F6
word_7C22:	dc.w 4,	0, $18,	4, 0, $8018, 4
		dc.w 4,	$40, $2F6, $2F6, $2F6
word_7C3A:	dc.w 4,	4, $1C,	4, 0, $8040, $2F6
		dc.w $2F6, $2F6
word_7C4C:	dc.w 4,	0, $58,	$2F6, $2F6, $2F6
word_7C58:	dc.w 4,	0, $3C,	$2F6, $2F6, $2F6
word_7C64:	dc.w 4,	4, $3C,	$FFFC, 4, $40, 4
		dc.w 4,	$40, $2F6, $2F6, $2F6
word_7C7C:	dc.w 4,	0, $D4,	$2F6, $2F6, $2F6
word_7C88:	dc.w $FFFC, 0, $3C, $FFFC, $FFFC, $4C, $FFFC
		dc.w 0,	$E0, $FFFC, 4, $54, $FFFC, 0
		dc.w $18, $FFFC, $FFFC,	$24, $FFFC, 0, $B4
		dc.w 4,	$FFFC, $1C, 4, 0, $18, 4
		dc.w 4,	$40, $FFFC, 0, $58, $FFFC, $FFFE
		dc.w $68, $FFFC, 0, $18, $FFFC,	4, $40
		dc.w $FFFC, 0, $2C, $2F6, $2F6,	$2F6
sub_7CE8:
		lea	off_7CF0(pc),a1
		jmp	jump_by_table2(pc) ; a0	= ?

off_7CF0:	dc.w sub_7D0C
		dc.w sub_7D6C
		dc.w sub_7DC0
		dc.w sub_7DD2
		dc.w sub_7DF0
		dc.w sub_7D8A
		dc.w sub_7E0E
		dc.w sub_7E3A
		dc.w sub_7E3A
		dc.w sub_7E3A
		dc.w sub_7E3A
		dc.w sub_7E3A
		dc.w sub_7F00
		dc.w loc_7F10
sub_7D0C:
		move.w	#$6B4,d0
		btst	#7,(player_mask).w
		beq.s	loc_7D1C
		move.w	#$86B4,d0

loc_7D1C:
		move.w	d0,$A(a0)
		move.l	#off_1D66A,$20(a0)
		jsr	sub_B852
		bset	#1,$D(a0)
		btst	#7,$36(a0)
		beq.s	loc_7D42
		bset	#4,$C(a0)

loc_7D42:
		moveq	#0,d0
		move.b	$36(a0),d0
		bclr	#7,d0
		bne.s	loc_7D54
		move.w	#$FFFA,$1C(a0)

loc_7D54:
		bclr	#6,d0
		beq.s	loc_7D60
		move.w	#$B4,$26(a0)

loc_7D60:
		move.w	d0,6(a0)
		addq.w	#1,d0
		move.w	d0,2(a0)
		rts

sub_7D6C:
		jsr	sub_7E62(pc)
		bne.s	loc_7D74
		rts

loc_7D74:
		addq.w	#1,(lives_count).w
		cmpi.w	#$63,(lives_count).w
		bcs.s	loc_7D86
		move.w	#$63,(lives_count).w

loc_7D86:
		bra.w	loc_7E54

sub_7D8A:
		jsr	sub_7E62(pc)
		bne.s	loc_7D92
		rts

loc_7D92:
		addq.w	#1,(word_FF8F9A).w
		cmpi.w	#5,(word_FF8F9A).w
		bcs.w	loc_7E54
		move.w	#5,(word_FF8F9A).w
		st	(byte_FFEE62).w
		move.b	#$F0,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd
		move.w	#$168,(word_FF8FA8).w
		bra.w	loc_7E54

sub_7DC0:
		jsr	sub_7E62(pc)
		bne.s	loc_7DC8
		rts

loc_7DC8:
		addi.w	#$64,(word_FF8F7A).w
		bra.w	loc_7E54

sub_7DD2:
		jsr	sub_7E62(pc)
		bne.s	loc_7DDA
		rts

loc_7DDA:
		cmpi.w	#8,(word_FF8F96).w
		bne.s	loc_7DE8
		addi.w	#$C8,(word_FF8F7A).w

loc_7DE8:
		move.w	#8,(word_FF8F96).w
		bra.s	loc_7E5A

sub_7DF0:
		jsr	sub_7E62(pc)
		bne.s	loc_7DF8
		rts

loc_7DF8:
		cmpi.w	#8,(word_FF8F96).w
		beq.s	loc_7E06
		addq.w	#1,(word_FF8F96).w
		bra.s	loc_7E5A

loc_7E06:
		addi.w	#$64,(word_FF8F7A).w
		bra.s	loc_7E5A

sub_7E0E:
		jsr	sub_7E62(pc)
		bne.s	loc_7E16
		rts

loc_7E16:
		cmpi.w	#$5F,(word_FF8F90).w
		bcc.s	loc_7E32
		addq.w	#5,(word_FF8F90).w
		cmpi.w	#$5F,(word_FF8F90).w
		bcs.s	loc_7E30
		move.w	#$5F,(word_FF8F90).w

loc_7E30:
		bra.s	loc_7E54

loc_7E32:
		addi.w	#$64,(word_FF8F7A).w
		bra.s	loc_7E5A

sub_7E3A:
		jsr	sub_7E62(pc)
		bne.s	loc_7E42
		rts

loc_7E42:
		addq.w	#5,(word_FF8F92).w
		cmpi.w	#$32,(word_FF8F92).w
		bcs.s	loc_7E54
		move.w	#$32,(word_FF8F92).w

loc_7E54:
		bset	#0,(byte_FFEE5B).w

loc_7E5A:
		move.w	#$C,2(a0)
		rts

sub_7E62:
		btst	#6,$36(a0)
		beq.s	loc_7E80
		subq.w	#1,$26(a0)
		beq.w	loc_7EF8
		cmpi.w	#$3C,$26(a0)
		bcc.s	loc_7E80
		bchg	#2,$D(a0)

loc_7E80:
		btst	#7,$36(a0)
		bne.s	loc_7EEA
		tst.w	$1C(a0)
		bmi.s	loc_7EC6
		move.w	#0,d1
		moveq	#0,d2
		jsr	sub_75E0(pc)
		bne.s	loc_7EE6
		jsr	sub_5D1E(pc)
		beq.s	loc_7EC6
		move.l	$18(a1),$18(a0)
		jsr	sub_B88A(pc)
		jsr	sub_BB72(pc)
		moveq	#0,d0
		move.w	$14(a1),d0
		move.b	(a4),d1
		ext.w	d1
		add.w	d1,d0
		swap	d0
		move.l	d0,$14(a0)
		addq.w	#6,$14(a0)
		bra.s	loc_7EE6

loc_7EC6:
		cmpi.w	#1,$1C(a0)
		bgt.s	loc_7ED6
		addi.l	#$4000,$1C(a0)

loc_7ED6:
		jsr	sub_B88A(pc)
		tst.w	$14(a0)
		bpl.s	loc_7EEA
		addq.w	#1,$14(a0)
		bra.s	loc_7EEA

loc_7EE6:
		clr.l	$1C(a0)

loc_7EEA:
		jsr	sub_B9A8(pc)
		beq.s	locret_7EF6
		move.b	#$B0,(smps_cmd2).w

locret_7EF6:
		rts

loc_7EF8:
		bset	#0,$C(a0)
		rts

sub_7F00:
		move.w	#$14,$26(a0)
		move.w	#$FFF9,$1C(a0)
		addq.w	#1,2(a0)

loc_7F10:
		bchg	#2,$D(a0)
		subq.w	#1,$26(a0)
		bne.s	loc_7F22
		bset	#0,$C(a0)

loc_7F22:
		addi.l	#$4000,$1C(a0)
		jmp	sub_B88A(pc)

sub_7F2E:
		lea	off_7F38(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_7F38:	dc.w sub_7F40
		dc.w sub_7F6E
		dc.w sub_7FBC
		dc.w nullsub_7
sub_7F40:
		move.w	#$4310,$A(a0)
		move.l	#off_1E078,$20(a0)
		jsr	sub_B852
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		bset	#7,$E(a0)
		move.b	$36(a0),7(a0)
		rts

sub_7F6E:
		tst.b	(byte_FFEEE3).w
		bne.s	locret_7FBA
		bclr	#6,$E(a0)
		beq.s	locret_7FBA
		btst	#5,(word_FF8F2C+1).w
		beq.s	locret_7FBA
		btst	#2,(word_FF8F2C).w
		bne.s	loc_7F9C
		btst	#3,(word_FF8F2C).w
		bne.s	loc_7F9C
		btst	#1,(word_FF8F2C).w
		bne.s	locret_7FBA

loc_7F9C:
		move.w	#1,$1C(a0)
		lea	(unk_FF89EA).w,a1
		move.l	(a1),d0
		asl.l	#8,d0
		move.l	d0,(a1)
		move.b	7(a0),d0
		addq.b	#1,d0
		move.b	d0,3(a1)
		addq.w	#1,2(a0)

locret_7FBA:
		rts

sub_7FBC:
		jsr	sub_B88A(pc)
		cmpi.w	#$1D0,$14(a0)
		bne.s	locret_7FCC
		addq.w	#1,2(a0)

locret_7FCC:
		rts

nullsub_7:
		rts

sub_7FD0:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_7FDC
		beq.s	loc_8010
		bra.s	loc_8028

loc_7FDC:
		tst.b	(byte_FFEEE3).w
		bne.s	loc_802C
		move.w	#$4310,$A(a0)
		move.l	#off_1E078,$20(a0)
		jsr	sub_B852
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		bset	#7,$E(a0)
		move.b	#3,7(a0)
		rts

loc_8010:
		tst.b	(byte_FFEEE3).w
		beq.s	locret_8026
		bclr	#4,$C(a0)
		move.w	#4,$1C(a0)
		addq.w	#1,2(a0)

locret_8026:
		rts

loc_8028:
		jmp	sub_B88A(pc)

loc_802C:
		bset	#0,$C(a0)
		rts

sub_8034:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_803E
		bra.s	loc_8070

loc_803E:
		move.w	(level_main_index).w,d0
		lea	(unk_FFEEBF).w,a1
		tst.b	(a1,d0.w)
		beq.s	loc_807A
		move.w	$10(a0),(word_FF8FB8).w
		move.w	$14(a0),(word_FF8FBA).w
		move.w	#$E0,$A(a0)
		move.l	#off_1E42E,$20(a0)
		jsr	sub_B852(pc)
		bset	#4,$C(a0)

loc_8070:
		jsr	sub_B9A8(pc)
		sne	(byte_FFEE5C).w
		rts

loc_807A:
		bset	#0,$C(a0)
		rts

sub_8082:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_808E
		beq.s	loc_80C2
		bra.s	loc_80D8

loc_808E:
		jsr	sub_81B0(pc)
		move.w	(player_pos_x).w,$10(a0)
		move.w	(player_pos_y).w,$14(a0)
		subq.w	#8,$14(a0)
		move.w	#$6000,$1A(a0)
		move.w	#$3C,$26(a0)
		move.b	#$B4,(smps_cmd2).w
		moveq	#9,d0
		jsr	sub_B83E(pc)
		bset	#7,$C(a0)
		rts

loc_80C2:
		jsr	sub_B88A(pc)
		subq.w	#1,$26(a0)
		bne.s	locret_80D6
		move.w	#$78,$26(a0)
		addq.w	#1,2(a0)

locret_80D6:
		rts

loc_80D8:
		addi.l	#$1000,$18(a0)
		subi.l	#$800,$1C(a0)
		jsr	sub_B88A(pc)
		subq.w	#1,$26(a0)
		bne.s	locret_80FE
		bset	#0,$C(a0)
		move.w	#0,(word_FF8FA6).w

locret_80FE:
		rts

sub_8100:
		lea	off_810A(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_810A:	dc.w sub_8112
		dc.w sub_816A
		dc.w sub_8182
		dc.w sub_81A2
sub_8112:
		jsr	sub_81B0(pc)
		move.w	(word_FF8FB8).w,d0
		addi.w	#$140,d0
		move.w	d0,$10(a0)
		move.w	(word_FF8FBA).w,d0
		subi.w	#$88,d0
		move.w	d0,$14(a0)
		move.w	#$FFFC,$18(a0)
		move.w	#2,$1C(a0)
		move.w	#$40,$26(a0)
		move.b	#$92,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		jsr	wait_for_vblank(pc)
		move.b	#$B1,(smps_cmd2).w
		moveq	#6,d0
		jsr	sub_B83E(pc)
		move.b	#1,(byte_FFEE5E).w
		move.w	#0,(word_FF8D20).w
		rts

sub_816A:
		jsr	sub_B88A(pc)
		subq.w	#1,$26(a0)
		bne.s	locret_8180
		addq.w	#1,2(a0)
		move.l	#0,$1C(a0)

locret_8180:
		rts

sub_8182:
		jsr	sub_B88A(pc)
		addi.l	#$1000,$18(a0)
		bmi.s	locret_81A0
		addq.w	#1,2(a0)
		move.w	#$3C,$26(a0)
		move.w	#4,(word_FF8D20).w

locret_81A0:
		rts

sub_81A2:
		subq.w	#1,$26(a0)
		bne.s	locret_81AE
		move.b	#1,(byte_FFEE5F).w

locret_81AE:
		rts

sub_81B0:
		move.w	(player_mask).w,d0
		andi.w	#$8000,d0
		addi.w	#$260,d0
		move.w	d0,$A(a0)
		tst.b	(byte_FFEE74).w
		beq.s	loc_81CC
		move.w	#$82A0,$A(a0)

loc_81CC:
		move.l	#off_12E272,$20(a0)
		bset	#4,$C(a0)
		rts

sub_81DC:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_81EA
		beq.s	sub_822A
		bra.w	sub_828A

loc_81EA:
		move.w	#$C350,$A(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		add.w	d0,d0
		add.w	d0,d0
		move.l	off_821E(pc,d0.w),$20(a0)
		jsr	sub_B852(pc)
		bset	#1,$D(a0)
		bset	#1,$E(a0)
		bset	#7,$E(a0)
		bset	#7,$C(a0)
		rts

off_821E:	dc.l off_1E60E
		dc.l off_1F1B4
		dc.l off_1F44C
sub_822A:
		jsr	sub_B9B8(pc)
		beq.s	loc_823C
		move.w	a0,$30(a1)
		cmpi.w	#$65,(a1)
		beq.w	loc_8260

loc_823C:
		tst.b	$36(a0)
		bne.s	locret_8288
		lea	(word_FF9000).w,a1
		move.w	#$3F,d3
		moveq	#$2F,d6

loc_824C:
		cmp.w	(a1),d3
		bne.s	loc_8256
		jsr	sub_B954(pc)
		bne.s	loc_8260

loc_8256:
		lea	$40(a1),a1
		dbf	d6,loc_824C
		rts

loc_8260:
		move.b	#$A6,(smps_cmd2).w
		move.w	#$A,$26(a0)
		bclr	#1,$D(a0)
		bset	#3,$D(a0)
		bclr	#7,$E(a0)
		addq.w	#1,2(a0)
		move.b	#$D4,(smps_cmd2).w

locret_8288:
		rts

sub_828A:
		subi.l	#$8000,$14(a0)
		bchg	#2,$D(a0)
		subq.w	#1,$26(a0)
		bne.s	locret_82A8
		bset	#0,$C(a0)
		st	(byte_FFEEF1).w

locret_82A8:
		rts

sub_82AA:
		movem.l	d0-a3,-(sp)
		lea	(objects_memory).w,a3
		moveq	#$E,d7
		jsr	get_available_object_slot ; d6 = max look forward
		movea.l	a3,a1
		moveq	#0,d1
		jsr	fill_ram_64_bytes(pc) ;	d1 = dword
		move.w	#$AC,(a3)
		move.b	d0,$36(a3)
		movem.l	(sp)+,d0-a3
		rts

sub_82D0:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_82DC
		bra.w	loc_8314

loc_82DC:
		jsr	sub_836E(pc)
		move.w	#$40,$26(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		add.w	d0,d0
		move.w	word_8302(pc,d0.w),$10(a0)
		move.w	word_8308(pc,d0.w),$14(a0)
		move.w	word_830E(pc,d0.w),$28(a0)
		rts
word_8302:	dc.w $1A0, $130, $90
word_8308:	dc.w $E0, $D0, $D0
word_830E:	dc.w $EEED, $EEF3, $EEEE

loc_8314:
		bchg	#2,$D(a0)
		subq.w	#1,$14(a0)
		subq.w	#1,$26(a0)
		bne.s	locret_8342
		move.w	#$A5,0.w(a0)
		move.w	#0,2(a0)
		bclr	#2,$D(a0)
		movea.w	$28(a0),a1
		st	(a1)
		move.b	#$C2,(smps_cmd2).w

locret_8342:
		rts

sub_8344:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	sub_836E
		beq.s	loc_8350
		bra.s	locret_836C

loc_8350:
		move.w	#0,6(a0)
		jsr	sub_B9A8(pc)
		beq.s	locret_836C
		move.w	#1,6(a0)
		addq.w	#1,2(a0)
		move.b	#$C2,(smps_cmd2).w

locret_836C:
		rts

sub_836E:
		move.w	#$8320,$A(a0)
		move.l	#off_1E864,$20(a0)
		jsr	sub_B852(pc)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		rts

sub_838E:
		lea	off_8398(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_8398:	dc.w sub_83A2
		dc.w sub_83D8
		dc.w sub_83EE
		dc.w loc_840A
		dc.w loc_8424
sub_83A2:
		move.w	#$4360,$A(a0)
		move.l	#off_1F8D6,$20(a0)
		jsr	sub_B852(pc)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		bset	#4,$D(a0)
		tst.b	(byte_FFEEEC).w
		beq.s	locret_83D6
		move.w	#4,2(a0)
		bra.w	loc_8424

locret_83D6:
		rts

sub_83D8:
		jsr	sub_B9A8(pc)
		beq.s	locret_83EC
		st	(byte_FFEED6).w
		tst.b	(byte_FFEED0).w
		beq.s	locret_83EC
		addq.w	#1,2(a0)

locret_83EC:
		rts

sub_83EE:
		cmpi.b	#8,(init_step+1).w
		beq.s	locret_842A
		move.w	#$37,$28(a0)
		move.b	#$C1,(smps_cmd2).w
		st	(byte_FFEEEC).w
		addq.w	#1,2(a0)

loc_840A:
		bchg	#0,$2C(a0)
		addq.w	#1,$10(a0)
		subq.w	#1,$28(a0)
		bne.s	locret_842A
		addq.w	#1,2(a0)
		move.b	#0,$2C(a0)

loc_8424:
		move.w	#$1F8,$10(a0)

locret_842A:
		rts

sub_842C:
		lea	off_8436(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_8436:	dc.w sub_8440
		dc.w sub_846C
		dc.w sub_848C
		dc.w loc_84A4
		dc.w locret_84C0
sub_8440:
		move.w	#$4360,$A(a0)
		move.l	#off_1FB80,$20(a0)
		jsr	sub_B852(pc)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		bset	#4,$D(a0)
		tst.b	(byte_FFEEF5).w
		bne.s	loc_84C2
		rts

sub_846C:
		jsr	sub_B9A8(pc)
		beq.s	locret_84C0
		moveq	#$18,d1
		jsr	sub_104E(pc)
		st	(byte_FFEED8).w
		tst.b	(byte_FFEED2).w
		beq.s	loc_8486
		addq.w	#1,2(a0)

loc_8486:
		moveq	#7,d0
		jmp	sub_92C8(pc)

sub_848C:
		cmpi.b	#8,(init_step+1).w
		beq.s	locret_84C0
		move.w	#$37,$28(a0)
		move.b	#$C1,(smps_cmd2).w
		addq.w	#1,2(a0)

loc_84A4:
		bchg	#0,$2C(a0)
		addq.w	#1,$10(a0)
		subq.w	#1,$28(a0)
		bne.s	locret_84C0
		st	(byte_FFEEF5).w
		move.b	#0,$2C(a0)
		bra.s	loc_84C2

locret_84C0:
		rts

loc_84C2:
		move.w	#$FF8,$10(a0)
		move.w	#4,2(a0)
		rts

sub_84D0:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_84DA
		bra.s	loc_84F2

loc_84DA:
		jsr	sub_8520(pc)
		move.w	#3,4(a0)
		tst.b	$36(a0)
		beq.s	loc_84F2
		move.w	#4,4(a0)
		rts

loc_84F2:
		lea	-$40(a0),a1
		tst.b	$36(a0)
		beq.s	loc_8506
		bset	#2,$D(a0)
		lea	-$80(a0),a1

loc_8506:
		tst.w	(a1)
		beq.s	loc_8518
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		rts

loc_8518:
		bset	#0,$C(a0)
		rts

sub_8520:
		move.w	#$320,$A(a0)
		btst	#7,(player_mask).w
		beq.s	loc_8534
		move.w	#$8320,$A(a0)

loc_8534:
		move.l	#off_1EFD2,$20(a0)
		jsr	sub_B852
		bset	#1,$D(a0)
		bset	#7,$E(a0)
		bset	#4,$C(a0)
		bset	#7,$C(a0)
		rts

sub_855C:
		lea	off_8566(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_8566:	dc.w sub_856E
		dc.w loc_8588
		dc.w sub_85B6
		dc.w sub_862A
sub_856E:
		jsr	sub_8520(pc)
		lea	(off_863C).l,a1
		moveq	#0,d0
		move.b	$36(a0),d0
		add.w	d0,d0
		add.w	d0,d0
		move.l	(a1,d0.w),$30(a0)

loc_8588:
		btst	#6,$E(a0)
		bne.s	loc_8592
		rts

loc_8592:
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)
		sf	(byte_FFEE5E).w
		bset	#0,(byte_FFEE75).w
		bne.s	locret_85B4
		move.b	#$8F,(smps_cmd1).w
		move.b	#$8F,(smps_cmd1_new).w

locret_85B4:
		rts

sub_85B6:
		subq.w	#1,$34(a0)
		bhi.s	loc_85FC
		movea.l	$30(a0),a1
		move.w	#$2F6,d1
		cmp.w	(a1),d1
		beq.s	loc_8624
		move.w	(a1)+,4(a0)
		moveq	#0,d0
		move.w	(a1)+,d0
		swap	d0
		asr.l	#4,d0
		add.l	d0,d0
		move.l	d0,$18(a0)
		moveq	#0,d0
		move.w	(a1)+,d0
		swap	d0
		asr.l	#4,d0
		add.l	d0,d0
		move.l	d0,$1C(a0)
		move.w	(a1)+,d0
		bclr	#$F,d0
		sne	$36(a0)
		asr.w	#1,d0
		move.w	d0,$34(a0)
		move.l	a1,$30(a0)

loc_85FC:
		tst.b	$36(a0)
		beq.s	loc_8608
		bchg	#1,$2D(a0)

loc_8608:
		btst	#6,$E(a0)
		beq.s	loc_8620
		move.l	$18(a0),d0
		add.l	d0,(dword_FFEF5C).w
		move.l	$1C(a0),d0
		add.l	d0,(dword_FFEF60).w

loc_8620:
		jmp	sub_B88A(pc)

loc_8624:
		addq.w	#1,2(a0)
		rts

sub_862A:
		bclr	#4,$C(a0)
		addi.l	#$4000,$1C(a0)
		jmp	sub_B88A(pc)

off_863C:	dc.l word_8654
		dc.l word_8736
		dc.l word_8778
		dc.l word_8792
		dc.l word_87AC
		dc.l word_87C6
word_8654:	dc.w 0,	$FFF0, 0, $10, 0, $FFE8, 0, $10, 0, $FFE0
		dc.w 0,	$BA, 1,	$FFF8, $FFF0, $10, 1, $FFF0, $FFF8, $10
		dc.w 1,	$FFF0, $FFF0, $140, 1, $FFF0, 0, 4, 1, $FFF0
		dc.w 8,	4, 1, $FFF0, $10, 4, 0,	$FFF0, 0, $A2
		dc.w 1,	$FFEE, 8, $10, 1, $FFEC, $10, $10, 0, $FFEA
		dc.w $14, 8, 2,	$FFE8, $18, $10, 2, $FFE4, $1C,	$9F
		dc.w 2,	$FFE0, 0, $10, 0, $FFE0, 0, $3E, 1, $FFE4
		dc.w $FFD0, 6, 1, $FFE8, $FFF4,	$C, 1, $FFE8, $FFE8, $98
		dc.w 1,	$FFE8, $FFF4, $10, 1, $FFE6, $C, $10, 1, $FFE4
		dc.w 0,	$10, 1,	$FFE2, 0, $10, 0, $FFE0, 0, $40
		dc.w 0,	$FFDC, 0, $40, 0, $FFD8, 0, $54, 1, $FFD8
		dc.w $10, $10, $2F6
word_8736:	dc.w 0,	$FFF0, 0, $10, 0, $FFE8, 0, $10, 0, $FFE0
		dc.w 0,	$108, 1, $FFE0,	$10, $10, 1, $FFE0, $18, $10
		dc.w 1,	$FFE0, $20, $6C, 1, $FFE0, 0, $10, 0, $FFE0
		dc.w 0,	$B0, $2F6
word_8778:	dc.w 0,	$FFF0, 0, $10, 0, $FFE8, 0, $10, 0, $FFE0
		dc.w 0,	$A0, $2F6
word_8792:	dc.w 0,	$20, 0,	$78, 1,	$20, $20, $50, 1, $20
		dc.w 0,	$20, $2F6
word_87AC:	dc.w 0,	$20, 0,	$30, 1,	$20, $20, $38, 1, $20
		dc.w 0,	$20, $2F6
word_87C6:	dc.w 0,	$20, 0,	$38, 1,	$20, $20, $38, 0, $20
		dc.w 0,	$68, 2,	$20, $FFE0, $B0, 0, $20, 0, $60
		dc.w 2,	$20, 0,	$20, 2,	$20, $10, $70, 0, $20
		dc.w 0,	$140, 2, 0, $FFF0, $10,	$2F6
sub_8810:
		lea	off_881A(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_881A:	dc.w sub_8822
		dc.w sub_8848
		dc.w sub_8856
		dc.w sub_887A
sub_8822:
		move.w	#$C350,$A(a0)
		move.l	#off_1F44C,$20(a0)
		jsr	sub_B852(pc)
		bset	#1,$D(a0)
		move.b	#$A0,$E(a0)
		move.b	#$90,$C(a0)
		rts

sub_8848:
		bclr	#6,$E(a0)
		beq.s	locret_8854
		addq.w	#1,2(a0)

locret_8854:
		rts

sub_8856:
		addq.w	#1,$26(a0)
		subq.w	#1,$14(a0)
		bclr	#6,$E(a0)
		beq.s	loc_886A
		subq.w	#1,(dword_FFEF60).w

loc_886A:
		moveq	#$FFFFFFD8,d1
		moveq	#0,d2
		jsr	sub_75A6(pc)
		beq.s	locret_8878
		addq.w	#1,2(a0)

locret_8878:
		rts

sub_887A:
		addq.w	#1,$14(a0)
		bclr	#6,$E(a0)
		beq.s	loc_888A
		addq.w	#1,(dword_FFEF60).w

loc_888A:
		subq.w	#1,$26(a0)
		bne.s	locret_8896
		move.w	#1,2(a0)

locret_8896:
		rts

sub_8898:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_88A2
		bra.s	loc_88EC

loc_88A2:
		move.w	#$8780,$A(a0)
		move.l	#off_1FD76,$20(a0)
		jsr	sub_B852
		bset	#4,$C(a0)
		bset	#3,$C(a0)
		bset	#1,$D(a0)
		move.w	#$120,$10(a0)
		move.w	#$160,$14(a0)
		move.w	#$40,$26(a0)
		jsr	wait_for_vblank
		move.l	a0,-(sp)
		move.l	#$59000000,d0
		trap	#1		; do_decompress_nemesis_to_vram
		movea.l	(sp)+,a0

loc_88EC:
		tst.w	$26(a0)
		beq.s	locret_88FE
		subq.w	#1,$26(a0)
		subq.w	#2,$14(a0)
		jsr	sub_B88A(pc)

locret_88FE:
		rts

sub_8900:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_890E
		beq.s	loc_893A
		bra.w	loc_895A

loc_890E:
		move.w	#$4320,$A(a0)
		move.l	#off_1FECC,$20(a0)
		jsr	sub_B852(pc)
		bset	#7,$E(a0)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		tst.b	(byte_FFEEFC).w
		bne.s	loc_895A
		rts

loc_893A:
		jsr	sub_B9B0(pc)
		beq.s	locret_8958
		tst.b	(byte_FFEEE1).w
		beq.s	locret_8958
		st	(byte_FFEED7).w
		tst.b	(byte_FFEED1).w
		beq.s	locret_8958
		addq.w	#1,2(a0)
		st	(byte_FFEEFC).w

locret_8958:
		rts

loc_895A:
		move.w	#1,6(a0)
		rts

sub_8962:
		move.w	2(a0),d0
		subq.w	#1,d0
		bmi.s	loc_896E
		beq.s	loc_89AE
		bra.s	loc_89DA

loc_896E:
		move.w	#$360,$A(a0)
		move.l	#off_1FF3C,$20(a0)
		jsr	sub_B852(pc)
		bset	#7,$C(a0)
		bset	#4,$C(a0)
		move.l	#$FFFF4000,$1C(a0)
		tst.b	$36(a0)
		beq.s	loc_89AE
		move.l	#$FFFEC000,$1C(a0)
		move.w	#1,4(a0)
		move.w	#$40,$26(a0)

loc_89AE:
		addq.w	#8,$26(a0)
		move.w	$26(a0),d1
		moveq	#6,d2
		jsr	sub_B89C(pc)
		swap	d3
		move.b	d3,$2C(a0)
		jsr	sub_B88A(pc)
		move.w	(planea_start_y).w,d0
		subi.w	#$10,d0
		cmp.w	$14(a0),d0
		blt.s	locret_89D8
		addq.w	#1,2(a0)

locret_89D8:
		rts

loc_89DA:
		move.w	(planea_start_y).w,d0
		addi.w	#$E0,d0
		move.w	d0,$14(a0)
		jsr	rand(pc)
		andi.l	#$FF,d0
		addi.w	#$20,d0
		add.w	(planea_start_x).w,d0
		move.w	d0,$10(a0)
		subq.w	#1,2(a0)
		rts

sub_8A02:
		lea	off_8A0A(pc),a1
		jmp	jump_by_table2(pc) ; a0	= ?

off_8A0A:	dc.w sub_8A12
		dc.w sub_8A3E
		dc.w sub_8A72
		dc.w sub_8AAA
sub_8A12:
		move.w	#$A48E,$A(a0)
		move.l	#off_1221C8,$20(a0)
		tst.b	(byte_FFEEF1).w
		beq.s	loc_8A2C
		bset	#0,$C(a0)

loc_8A2C:
		bset	#2,$D(a0)
		bset	#1,$D(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

sub_8A3E:
		move.w	(planea_start_x).w,d0
		addi.w	#$120,d0
		move.w	d0,$10(a0)
		move.w	(planea_start_y).w,d0
		addi.w	#$50,d0
		move.w	d0,$14(a0)
		move.w	(player_pos_x).w,d0
		cmpi.w	#$130,d0
		bcs.s	locret_8A70
		bclr	#2,$D(a0)
		bclr	#1,$D(a0)
		addq.w	#1,2(a0)

locret_8A70:
		rts

sub_8A72:
		andi.w	#$8080,(word_FF8F2C).w
		cmpi.w	#2,6(a0)
		blt.s	locret_8AA8
		cmpi.b	#7,8(a0)
		blt.s	locret_8AA8
		moveq	#3,d0
		jsr	loc_B842(pc)
		move.w	#$BD,(word_FF8F72).w
		tst.b	(byte_FFEEE7).w
		beq.s	loc_8A9E
		moveq	#$C,d1
		bra.s	loc_8AA0

loc_8A9E:
		moveq	#$B,d1

loc_8AA0:
		addq.w	#1,2(a0)
		jmp	sub_104E(pc)

locret_8AA8:
		rts

sub_8AAA:
		tst.b	$26(a0)
		bne.s	loc_8ABA
		st	$26(a0)
		moveq	#5,d0
		jmp	loc_B842(pc)

loc_8ABA:
		cmpi.w	#2,6(a0)
		blt.s	locret_8AD0
		cmpi.b	#7,8(a0)
		blt.s	locret_8AD0
		bset	#0,$C(a0)

locret_8AD0:
		rts

sub_8AD2:
		cmpi.w	#1,2(a0)
		beq.s	loc_8AEE
		bgt.w	loc_8BB4
		jsr	sub_BC72(pc)
		move.l	#off_119FAA,$20(a0)
		jmp	sub_B852(pc)

loc_8AEE:
		tst.b	$26(a0)
		bne.w	loc_8B80
		jsr	sub_B9A8(pc)
		beq.w	locret_8BB2
		tst.b	(byte_FFEEFD).w
		bne.s	loc_8B2E
		tst.b	(byte_FFEEE1).w
		bne.s	loc_8B2E
		bclr	#1,$D(a0)
		move.w	#$44,(word_FF8F72).w
		moveq	#$E,d1
		jsr	sub_104E(pc)
		st	(byte_FFEEFD).w
		moveq	#4,d0
		jsr	sub_92C8(pc)
		addq.w	#1,2(a0)
		bra.w	locret_8BB2

loc_8B2E:
		tst.b	(byte_FFEEED).w
		bne.s	loc_8B5E
		bclr	#1,$D(a0)
		move.w	#$44,(word_FF8F72).w
		moveq	#$F,d1
		tst.b	(byte_FFEEFD).w
		bne.s	loc_8B4A
		moveq	#$29,d1

loc_8B4A:
		jsr	sub_104E(pc)
		st	(byte_FFEEFD).w
		moveq	#4,d0
		jsr	sub_92C8(pc)
		addq.w	#1,2(a0)
		bra.s	locret_8BB2

loc_8B5E:
		bset	#3,$D(a0)
		move.w	#1,4(a0)
		move.w	#$44,(word_FF8F72).w
		cmpi.b	#2,(byte_FFEE48).w
		beq.s	loc_8BA2
		moveq	#$10,d1
		st	$26(a0)
		bra.s	loc_8BA8

loc_8B80:
		clr.b	$26(a0)
		sf	(byte_FFEE64).w
		move.w	#1,6(a0)
		move.b	#$95,(byte_FFEE76).w
		move.b	#2,(byte_FFEE48).w
		jsr	sub_5086(pc)
		moveq	#$27,d1
		bra.s	loc_8BA4

loc_8BA2:
		moveq	#$24,d1

loc_8BA4:
		addq.w	#1,2(a0)

loc_8BA8:
		jsr	sub_104E(pc)
		moveq	#4,d0
		jsr	sub_92C8(pc)

locret_8BB2:
		rts

loc_8BB4:
		bset	#1,$D(a0)
		rts

sub_8BBC:
		cmpi.w	#1,2(a0)
		beq.s	loc_8BD8
		move.w	#$A3C0,$A(a0)
		move.l	#off_11A018,$20(a0)
		moveq	#1,d0
		jsr	sub_B83E(pc)

loc_8BD8:
		tst.b	(byte_FFEEE2).w
		beq.s	locret_8BE4
		bset	#0,$C(a0)

locret_8BE4:
		rts

sub_8BE6:
		cmpi.w	#1,2(a0)
		beq.s	loc_8C06
		bgt.s	loc_8C6A
		jsr	sub_BC72(pc)
		move.l	#off_11A018,$20(a0)
		bset	#1,$D(a0)
		jmp	sub_B852(pc)

loc_8C06:
		tst.b	$26(a0)
		bne.s	loc_8C3E
		jsr	sub_B9A8(pc)
		beq.s	locret_8C68
		tst.b	(byte_FFEEE2).w
		bne.s	loc_8C64
		tst.b	(byte_FFEEEE).w
		bne.s	loc_8C22
		moveq	#$16,d1
		bra.s	loc_8C4E

loc_8C22:
		moveq	#$17,d1
		bclr	#1,$D(a0)
		move.w	#$43,(word_FF8F72).w
		jsr	sub_104E(pc)
		st	(byte_FFEEE2).w
		st	$26(a0)
		rts

loc_8C3E:
		clr.b	$26(a0)
		sf	(byte_FFEE64).w
		move.b	#$95,(byte_FFEE76).w
		moveq	#$26,d1

loc_8C4E:
		bclr	#1,$D(a0)
		move.w	#$43,(word_FF8F72).w
		jsr	sub_104E(pc)
		addq.w	#1,2(a0)
		rts

loc_8C64:
		addq.w	#1,2(a0)

locret_8C68:
		rts

loc_8C6A:
		clr.w	6(a0)
		bset	#1,$D(a0)
		rts

sub_8C76:
		cmpi.w	#1,2(a0)
		beq.s	loc_8C9E
		bgt.w	loc_8D12
		jsr	sub_BC72(pc)
		move.l	#off_11A488,$20(a0)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		jmp	sub_B852(pc)

loc_8C9E:
		tst.b	$26(a0)
		bne.s	loc_8CC4
		jsr	sub_B9A8(pc)
		beq.s	locret_8D10
		tst.b	(byte_FFEEE7).w
		bne.s	loc_8CD6
		st	(byte_FFEEE7).w
		moveq	#4,d1
		st	$26(a0)
		move.w	#$40,(word_FF8F72).w
		jmp	sub_104E(pc)

loc_8CC4:
		sf	(byte_FFEE64).w
		clr.b	$26(a0)
		move.b	#$95,(byte_FFEE76).w
		moveq	#$28,d1
		bra.s	loc_8CE2

loc_8CD6:
		moveq	#$23,d1
		cmpi.w	#$32,(word_FF8F92).w
		beq.s	loc_8CE2
		moveq	#5,d1

loc_8CE2:
		jsr	sub_104E(pc)
		bclr	#1,$D(a0)
		move.w	#$32,(word_FF8F92).w
		bset	#0,(byte_FFEE5B).w
		st	(byte_FFEEE7).w
		move.w	#$40,(word_FF8F72).w
		st	(byte_FFEEF7).w
		move.w	#6,(level_params1_index).w
		addq.w	#1,2(a0)

locret_8D10:
		rts

loc_8D12:
		clr.w	6(a0)
		bset	#1,$D(a0)
		rts

sub_8D1E:
		lea	off_8D26(pc),a1
		jmp	jump_by_table2(pc) ; a0	= ?

off_8D26:	dc.w sub_8D2C
		dc.w sub_8D72
		dc.w sub_8D94
sub_8D2C:
		st	(byte_FFEEEF).w
		move.w	#$A340,$A(a0)
		move.l	#off_2019C,$20(a0)
		jsr	sub_B852
		bset	#4,$C(a0)
		bset	#4,$D(a0)
		move.b	$36(a0),5(a0)
		beq.s	loc_8D62
		bset	#1,$D(a0)
		addq.w	#1,2(a0)

loc_8D62:
		tst.b	(byte_FFEEEC).w
		bne.s	loc_8D6A
		rts

loc_8D6A:
		bset	#0,$C(a0)
		rts

sub_8D72:
		jsr	sub_B9A8(pc)
		beq.s	locret_8D9A
		tst.b	(byte_FFEEE0).w
		bne.s	loc_8D82
		moveq	#6,d1
		bra.s	loc_8D84

loc_8D82:
		moveq	#7,d1

loc_8D84:
		move.w	#$41,(word_FF8F72).w
		jsr	sub_104E(pc)
		moveq	#2,d0
		jmp	sub_92C8(pc)

sub_8D94:
		bset	#1,$D(a0)

locret_8D9A:
		rts

sub_8D9C:
		lea	off_8DA4(pc),a1
		jmp	jump_by_table2(pc) ; a0	= ?

off_8DA4:	dc.w sub_8DAA
		dc.w sub_8DDC
		dc.w sub_8E24
sub_8DAA:
		move.w	#$2320,$A(a0)
		move.l	#off_207EE,$20(a0)
		jsr	sub_B852(pc)
		bset	#4,$C(a0)
		bset	#1,$D(a0)
		move.b	$36(a0),5(a0)
		beq.s	locret_8DDA
		move.w	#1,6(a0)
		addq.w	#1,2(a0)

locret_8DDA:
		rts

sub_8DDC:
		jsr	sub_B9A8(pc)
		beq.s	locret_8DDA
		tst.b	(byte_FFEEE4).w
		beq.s	loc_8DEC
		moveq	#9,d1
		bra.s	sub_8E12

loc_8DEC:
		moveq	#8,d1
		bsr.s	sub_8E12
		jsr	sub_1060(pc)
		sf	(byte_FFEE64).w
		move.b	#$95,(byte_FFEE76).w
		moveq	#$3E,d1
		jsr	sub_104E(pc)
		st	(byte_FFEEE4).w
		move.b	#1,(byte_FFEE48).w
		jmp	sub_5086(pc)

sub_8E12:
		move.w	#$A9,(word_FF8F72).w
		jsr	sub_104E(pc)
		move.w	#7,(level_params1_index).w
		rts

sub_8E24:
		move.w	#1,6(a0)
		bset	#1,$D(a0)
		rts

sub_8E32:
		lea	off_8E3C(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_8E3C:	dc.w sub_8E42
		dc.w sub_8E7E
		dc.w locret_8ED6
sub_8E42:
		move.w	#$A310,$A(a0)
		move.l	#off_204C2,$20(a0)
		jsr	sub_B852(pc)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		move.b	$36(a0),5(a0)
		beq.s	loc_8E6C
		addq.w	#1,2(a0)

loc_8E6C:
		tst.b	(byte_FFEE48).w
		bne.w	loc_8E76
		rts

loc_8E76:
		bset	#0,$C(a0)
		rts

sub_8E7E:
		tst.b	$26(a0)
		bne.s	loc_8EAA
		jsr	sub_B9A8(pc)
		beq.s	locret_8ED6
		tst.b	(byte_FFEEE0).w
		beq.s	loc_8E94
		moveq	#3,d1
		bra.s	loc_8EBA

loc_8E94:
		tst.b	(byte_FFEEEF).w
		bne.s	loc_8E9E
		moveq	#2,d1
		bra.s	loc_8EBA

loc_8E9E:
		st	(byte_FFEEE0).w
		st	$26(a0)
		moveq	#1,d1
		bra.s	loc_8EBA

loc_8EAA:
		clr.b	$26(a0)
		sf	(byte_FFEE64).w
		move.b	#$95,(byte_FFEE76).w
		moveq	#$25,d1

loc_8EBA:
		bclr	#1,$D(a0)
		move.w	#$42,(word_FF8F72).w
		jsr	sub_104E(pc)
		bset	#1,$D(a0)
		moveq	#1,d0
		jsr	sub_92C8(pc)

locret_8ED6:
		rts

sub_8ED8:
		lea	off_8EE0(pc),a1
		jmp	jump_by_table2(pc) ; a0	= ?

off_8EE0:	dc.w sub_8EEC
		dc.w sub_8F44
		dc.w sub_8F70
		dc.w sub_8F8E
		dc.w sub_8FB4
		dc.w locret_8FD2
sub_8EEC:
		move.l	#off_20D36,$20(a0)
		move.w	#$8320,$A(a0)
		jsr	sub_B852(pc)
		bset	#4,$C(a0)
		bset	#1,$D(a0)
		move.b	$36(a0),5(a0)
		beq.s	loc_8F36
		move.w	#$C320,$A(a0)
		bset	#7,$E(a0)
		addq.w	#2,2(a0)
		tst.b	(byte_FFEEE1).w
		beq.s	locret_8F42
		move.w	#3,6(a0)
		move.w	#5,2(a0)
		rts

loc_8F36:
		tst.b	(byte_FFEEE1).w
		beq.s	locret_8F42
		bset	#0,$C(a0)

locret_8F42:
		rts

sub_8F44:
		jsr	sub_B9A8(pc)
		beq.s	locret_8F6E
		move.w	#$14,$26(a0)
		move.w	#$FFF9,$1C(a0)
		addq.w	#1,2(a0)
		st	(byte_FFEEE1).w
		sf	(byte_FFEE64).w
		move.b	#$95,(byte_FFEE76).w
		moveq	#$22,d1
		jsr	sub_104E(pc)

locret_8F6E:
		rts

sub_8F70:
		bchg	#2,$D(a0)
		subq.w	#1,$26(a0)
		bne.s	loc_8F82
		bset	#0,$C(a0)

loc_8F82:
		addi.l	#$4000,$1C(a0)
		jmp	sub_B88A(pc)

sub_8F8E:
		jsr	sub_B9B0(pc)
		beq.s	locret_8FD2
		st	(byte_FFEED9).w
		tst.b	(byte_FFEED3).w
		beq.s	loc_8FA8
		addq.w	#1,2(a0)
		move.b	#$D5,(smps_cmd2).w

loc_8FA8:
		moveq	#$11,d1
		jsr	sub_104E(pc)
		moveq	#5,d0
		jmp	sub_92C8(pc)

sub_8FB4:
		cmpi.b	#8,(init_step+1).w
		beq.s	locret_8FD2
		moveq	#5,d0
		jsr	sub_4462(pc)
		bset	#3,$D(a0)
		bclr	#1,$D(a0)
		addq.w	#1,2(a0)

locret_8FD2:
		rts

sub_8FD4:
		lea	off_8FDE(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_8FDE:	dc.w sub_8FE2
		dc.w sub_900A
sub_8FE2:
		tst.b	(byte_FFEEE3).w
		bne.s	loc_9002
		move.w	#$A350,$A(a0)
		move.l	#off_1F54A,$20(a0)
		jsr	sub_B852(pc)
		bset	#4,$C(a0)
		rts

loc_9002:
		bset	#0,$C(a0)
		rts

sub_900A:
		jsr	sub_B9A8(pc)
		beq.s	locret_9028
		st	(byte_FFEEE3).w
		bset	#0,$C(a0)
		move.b	#$95,(byte_FFEE76).w
		moveq	#$19,d1
		jsr	(sub_104E).l

locret_9028:
		rts

sub_902A:
		lea	off_9034(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_9034:	dc.w sub_9038
		dc.w sub_9060
sub_9038:
		tst.b	(byte_FFEEE5).w
		bne.s	loc_9058
		move.w	#$A0F8,$A(a0)
		move.l	#off_20E88,$20(a0)
		jsr	sub_B852(pc)
		bset	#4,$C(a0)
		rts

loc_9058:
		bset	#0,$C(a0)
		rts

sub_9060:
		jsr	sub_B9A8(pc)
		beq.s	locret_9084
		st	(byte_FFEEE5).w
		bset	#0,$C(a0)
		move.b	#$95,(byte_FFEE76).w
		moveq	#$13,d1
		jsr	(sub_104E).l
		move.w	#8,(level_params1_index).w

locret_9084:
		rts

sub_9086:
		lea	off_9090(pc),a1
		jmp	jump_by_table2	; a0 = ?

off_9090:	dc.w sub_90A2
		dc.w sub_9104
		dc.w sub_9138
		dc.w sub_9156
		dc.w sub_917E
		dc.w sub_91A8
		dc.w sub_91C2
		dc.w sub_9138
		dc.w sub_91E4
sub_90A2:
		move.w	#$83E0,$A(a0)
		move.l	#off_125880,$20(a0)
		jsr	sub_B852(pc)
		move.w	#4,4(a0)
		bset	#4,$C(a0)
		bset	#7,$C(a0)
		bset	#2,$D(a0)
		move.w	#$60,$10(a0)
		move.w	#$30,$14(a0)
		move.w	#4,$18(a0)
		move.w	#2,$1C(a0)
		move.w	#$30,$26(a0)
		tst.b	$36(a0)
		beq.s	locret_9102
		move.w	#$8260,$A(a0)
		move.w	#5,4(a0)
		move.w	#8,2(a0)

locret_9102:
		rts

sub_9104:
		tst.b	(byte_FFEE6A).w
		beq.s	locret_9132
		bclr	#2,$D(a0)
		addq.w	#1,2(a0)
		lea	(objects_memory).w,a3
		jsr	get_available_object_slot ; d6 = max look forward
		bcs.s	loc_9134
		moveq	#0,d1
		movea.l	a3,a1
		jsr	fill_ram_64_bytes(pc) ;	d1 = dword
		move.w	#$C7,0.w(a3)
		move.w	a0,$30(a3)

locret_9132:
		rts

loc_9134:
		jmp	Reserv3F

sub_9138:
		jsr	sub_B88A(pc)
		subq.w	#1,$26(a0)
		bne.s	locret_9154
		addq.w	#1,2(a0)
		move.l	#0,$1C(a0)
		move.w	#$40,$26(a0)

locret_9154:
		rts

sub_9156:
		tst.w	$26(a0)
		beq.s	loc_916E
		jsr	sub_B88A(pc)
		subq.w	#1,$26(a0)
		subi.l	#$1000,$18(a0)
		bra.s	locret_917C

loc_916E:
		st	(byte_FFEE72).w
		tst.b	(byte_FFEE71).w
		beq.s	locret_917C
		addq.w	#1,2(a0)

locret_917C:
		rts

sub_917E:
		move.b	#1,(byte_FFEE76).w
		move.w	#$C7,(word_FF8F72).w
		moveq	#$15,d1
		jsr	(sub_104E).l
		sf	(byte_FFEE72).w
		move.w	#$6000,$1A(a0)
		move.w	#$3C,$26(a0)
		addq.w	#1,2(a0)
		rts

sub_91A8:
		jsr	sub_B88A(pc)
		subq.w	#1,$26(a0)
		bne.s	locret_91C0
		move.w	#$78,$26(a0)
		sf	(byte_FFEE6A).w
		addq.w	#1,2(a0)

locret_91C0:
		rts

sub_91C2:
		addi.l	#$1000,$18(a0)
		subi.l	#$800,$1C(a0)
		jsr	sub_B88A(pc)
		subq.w	#1,$26(a0)
		bne.s	locret_91E2
		bset	#0,$C(a0)

locret_91E2:
		rts

sub_91E4:
		lea	-$40(a0),a1
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		move.b	$D(a1),$D(a0)
		rts

sub_91FC:
		lea	off_9204(pc),a1
		jmp	jump_by_table2(pc) ; a0	= ?

off_9204:	dc.w sub_9212
		dc.w loc_922A
		dc.w sub_9252
		dc.w sub_9268
		dc.w sub_928A
		dc.w sub_92A6
		dc.w locret_92C6
sub_9212:
		move.w	#$300,$A(a0)
		move.l	#off_214CA,$20(a0)
		jsr	sub_B852(pc)
		bset	#4,$C(a0)

loc_922A:
		movea.w	$30(a0),a1
		move.w	$10(a1),d1
		move.w	d1,$10(a0)
		move.w	$14(a1),d1
		addq.w	#8,d1
		move.w	d1,$14(a0)
		tst.b	(byte_FFEE72).w
		beq.s	locret_9250
		move.w	#$2A,$26(a0)
		addq.w	#1,2(a0)

locret_9250:
		rts

sub_9252:
		subq.w	#1,$26(a0)
		beq.s	loc_925E
		addq.w	#1,$14(a0)
		rts

loc_925E:
		st	(byte_FFEE71).w
		addq.w	#1,2(a0)
		rts

sub_9268:
		tst.b	(byte_FFEE72).w
		bne.s	locret_9288
		move.w	#8,$26(a0)
		addq.w	#1,4(a0)
		move.w	#0,6(a0)
		bset	#1,$D(a0)
		addq.w	#1,2(a0)

locret_9288:
		rts

sub_928A:
		subq.w	#1,$26(a0)
		beq.s	loc_9296
		addq.w	#2,$14(a0)
		rts

loc_9296:
		addq.w	#1,2(a0)
		addq.w	#1,4(a0)
		move.w	#$B4,$26(a0)
		rts

sub_92A6:
		subq.w	#1,$26(a0)
		bne.s	locret_92C6
		move.b	#$92,(byte_FFEE76).w
		st	(byte_FFEE77).w
		moveq	#$21,d1
		jsr	(sub_104E).l
		st	(byte_FFEE73).w
		addq.w	#1,2(a0)

locret_92C6:
		rts

sub_92C8:
		lea	(unk_FFEEBF).w,a1
		tst.b	(a1,d0.w)
		bne.s	locret_92E2
		move.b	d0,(byte_FFEEC8).w
		move.b	#1,(byte_FFEE5E).w
		move.w	#1,(word_FF8D20).w

locret_92E2:
		rts

sub_92E4:
		tst.b	(byte_FFEE5E).w
		beq.s	sub_9330
		bclr	#4,(byte_FFEE03).w
		beq.s	loc_92F8
		move.w	#$8002,(word_FFA2C2).w

loc_92F8:
		st	(byte_FFEE68).w
		lea	(word_FF8D20).w,a0
		lea	off_9314(pc),a1
		moveq	#0,d0
		move.w	(word_FF8D20).w,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		movea.l	d0,a1
		jmp	(a1)
off_9314:	dc.w sub_9328
		dc.w sub_9338
		dc.w sub_937A
		dc.w sub_93AC
		dc.w sub_93E0
		dc.w sub_93E8
		dc.w sub_9426
		dc.w sub_9484
		dc.w sub_94B6
		dc.w sub_94CE

sub_9328:
		move.w	#0,(word_FF8FA0).w
		rts

sub_9330:
		move.b	(byte_FFEE69).w,(byte_FFEE68).w
		rts

sub_9338:
		moveq	#0,d0
		move.b	(byte_FFEEC8).w,d0
		subq.w	#1,d0
		lea	(unk_FFEEC0).w,a1
		st	(a1,d0.w)
		add.w	d0,d0
		add.w	d0,d0
		lea	stru_935E(pc,d0.w),a1
		move.w	(a1)+,2(a0)
		move.w	(a1),4(a0)
		addq.w	#1,(word_FF8D20).w
		rts

stru_935E:	struc_12 $B0, $1200
		struc_12 $C0, $E0
		struc_12 $A0, $F60
		struc_12 $B0, $100
		struc_12 $2C0,	$F50
		struc_12 $C0, $ED0
		struc_12 $A0, $F20
sub_937A:
		move.w	(player_pos_x).w,d3
		andi.w	#$FFF0,d3
		move.w	4(a0),d2
		subi.w	#$10,d2
		cmp.w	d2,d3
		beq.s	loc_93A0
		bhi.s	loc_9398
		move.b	#8,(word_FF8FA0).w
		rts

loc_9398:
		move.b	#4,(word_FF8FA0).w
		rts

loc_93A0:
		move.b	#8,(word_FF8FA0).w
		addq.w	#1,(word_FF8D20).w
		rts

sub_93AC:
		lea	(objects_memory).w,a3
		moveq	#$E,d6
		jsr	get_available_object_slot ; d6 = max look forward
		moveq	#0,d1
		movea.l	a3,a1
		jsr	fill_ram_64_bytes(pc) ;	d1 = dword
		move.w	#$A0,0.w(a3)
		move.w	2(a0),$14(a3)
		move.w	4(a0),$10(a3)
		move.b	#0,(byte_FFEEC8).w
		move.b	#0,(byte_FFEE5E).w
		rts

sub_93E0:
		move.b	#4,(word_FF8FA0).w
		rts

sub_93E8:
		move.w	(player_pos_y).w,d0
		cmpi.w	#$D0,d0
		bne.s	loc_93F8
		addq.w	#1,(word_FF8D20).w
		rts

loc_93F8:
		move.w	(player_pos_x).w,d0
		cmpi.w	#$100,d0
		bgt.s	loc_9414
		move.b	#4,(word_FF8FA0).w
		cmpi.w	#$50,d0
		bgt.s	locret_9424
		addq.w	#1,(word_FF8D20).w
		rts

loc_9414:
		move.b	#8,(word_FF8FA0).w
		cmpi.w	#$1B0,d0
		blt.s	locret_9424
		addq.w	#1,(word_FF8D20).w

locret_9424:
		rts

sub_9426:
		tst.b	(byte_FF9F36).l
		bne.s	locret_9482
		move.w	(player_pos_x).w,d0
		cmpi.w	#$100,d0
		bgt.s	loc_9446
		move.b	#8,(word_FF8FA0).w
		cmpi.w	#$D0,d0
		blt.s	locret_9482
		bra.s	loc_9452

loc_9446:
		move.b	#4,(word_FF8FA0).w
		cmpi.w	#$130,d0
		bgt.s	locret_9482

loc_9452:
		clr.w	(word_FF8D20).w
		st	(byte_FF9F36).l
		st	(byte_FF9F76).l
		move.b	#1,(byte_FFEE76).w
		move.b	#1,(byte_FFEE77).w
		bset	#4,(byte_FFA2CD).w
		jsr	sub_17A3E
		moveq	#$1E,d1
		jsr	(sub_104E).l

locret_9482:
		rts

sub_9484:
		move.w	(player_pos_x).w,d3
		andi.w	#$FFF0,d3
		move.w	#$1E0,d2
		cmp.w	d2,d3
		beq.s	loc_94A6
		bhi.s	loc_949E
		move.b	#8,(word_FF8FA0).w
		rts

loc_949E:
		move.b	#4,(word_FF8FA0).w
		rts

loc_94A6:
		move.b	#4,(word_FF8FA0).w
		st	(byte_FFEE6A).w
		addq.w	#1,(word_FF8D20).w
		rts

sub_94B6:
		move.b	#0,(word_FF8FA0).w
		tst.b	(byte_FFEE73).w
		beq.s	locret_94CC
		move.b	#4,(word_FF8FA0).w
		addq.w	#1,(word_FF8D20).w

locret_94CC:
		rts

sub_94CE:
		move.b	#0,(word_FF8FA0).w
		move.b	#1,(word_FF8FA0+1).w
		rts
; d0 = vram dest

get_vram_write_cmd:
		lsl.l	#2,d0
		lsr.w	#2,d0
		ori.w	#$4000,d0
		swap	d0
		rts
; d1 = dword
; a1 = dest

fill_ram_128_bytes:
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
; d1 = dword
; a1 = dest

fill_ram_64_bytes:
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
; d1 = dword
; a1 = dest

fill_ram_16_bytes:
		move.l	d1,(a1)+
; d1 = dword
; a1 = dest

fill_ram_12_bytes:
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		move.l	d1,(a1)+
		rts
; d1 = word|word

fill_vram_64_words:
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
; d1 = word|word

fill_vram_32_words:
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
; d1 = word|word

fill_vram_16_words:
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
; d1 = word|word

fill_vram_8_words:
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		move.l	d1,(a6)
		rts
; a1 = source
; a2 = dest

copy_bytes_to_dest_128:
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+

copy_bytes_to_dest_64:
		move.l	(a1)+,(a2)+	; a1 = source
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+

copy_bytes_to_dest_32:
		move.l	(a1)+,(a2)+	; a1 = source
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
; a1 = source
; a2 = dest

copy_bytes_to_dest_20:
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+

copy_bytes_to_dest_12:
		move.l	(a1)+,(a2)+	; a1 = source
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		rts
; a1 = source
; a6 = VDP_DATA

copy_words_64:
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)

copy_words_16:
		move.l	(a1)+,(a6)	; a1 = source
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		move.l	(a1)+,(a6)
		rts

rand:
		move.l	d1,-(sp)
		move.l	(rand_seed).w,d1
		bne.s	loc_95FE
		move.l	#$2A6D365A,d1

loc_95FE:
		move.l	d1,d0
		asl.l	#2,d1
		add.l	d0,d1
		asl.l	#3,d1
		add.l	d0,d1
		move.w	d1,d0
		swap	d1
		add.w	d1,d0
		move.w	d0,d1
		swap	d1
		move.l	d1,(rand_seed).w
		move.l	(sp)+,d1
		rts

wait_for_vblank:
		move.b	#1,(vblank_active_flag).w
		move	#$2500,sr

loc_9624:
		tst.b	(vblank_active_flag).w
		bne.s	loc_9624
		rts

sub_962C:
		move.w	#$FF00,(word_FF8F2C).w
		rts
; d0 = value
; d2 = ?
; a6 = VDP_DATA

print_value:
		movem.l	d0-d2,-(sp)
		addq.w	#1,d2
		ext.l	d0
		divu.w	#1000,d0
		move.w	d0,d1
		add.w	d2,d1
		move.w	d1,(a6)
		swap	d0
		ext.l	d0
		divu.w	#100,d0
		move.w	d0,d1
		add.w	d2,d1
		move.w	d1,(a6)
		swap	d0
		ext.l	d0
		divu.w	#10,d0
		move.w	d0,d1
		add.w	d2,d1
		move.w	d1,(a6)
		swap	d0
		add.w	d2,d0
		move.w	d0,(a6)
		movem.l	(sp)+,d0-d2
		rts
; d0 = value
; d2 = mask

draw_xx_value:
		movem.l	d0-d2,-(sp)
		addq.w	#1,d2
		divu.w	#10,d0
		move.w	d0,d1
		add.w	d2,d1
		move.w	d1,(a6)
		swap	d0
		add.w	d2,d0
		move.w	d0,(a6)
		movem.l	(sp)+,d0-d2
		rts

sub_968A:
		move.b	#$F8,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		move.b	#0,(smps_cmd1_new).w
		rts

sub_969E:
		move.w	#$F200,(word_FF8F50).w
		move.w	#$F282,(word_FF8F52).w
		clr.w	(word_FFF280).w
		lea	(word_FFA300).w,a0
		moveq	#0,d7
		bsr.s	sub_96EC
		lea	(unk_FF9C00).w,a0
		moveq	#$A,d7
		bsr.s	sub_96EC
		lea	(objects_memory).w,a0
		moveq	#$F,d7
		bsr.s	sub_96EC
		lea	(word_FF9000).w,a0
		moveq	#$2F,d7
		bsr.s	sub_96EC
		lea	(word_FFA2C0).w,a0
		move.w	(a0),d0
		beq.s	loc_96E8
		move.w	(word_FF8F52).w,-(sp)
		move.w	#$F280,(word_FF8F52).w
		jsr	sub_9704(pc)
		move.w	(sp)+,(word_FF8F52).w

loc_96E8:
		jmp	sub_9A6A(pc)

sub_96EC:
		move.w	(a0),d0
		beq.s	loc_96FA
		movem.l	d7-a0,-(sp)
		bsr.s	sub_9704
		movem.l	(sp)+,d7-a0

loc_96FA:
		lea	$40(a0),a0
		dbf	d7,sub_96EC
		rts

sub_9704:
		add.w	d0,d0
		add.w	d0,d0
		movea.l	off_9740-4(pc,d0.w),a1
		jsr	(a1)
		btst	#0,$C(a0)
		bne.w	loc_B7FC
		btst	#2,$D(a0)
		bne.s	locret_973E
		btst	#7,$C(a0)
		bne.s	loc_9734
		movea.w	(word_FF8F52).w,a1
		move.w	a0,(a1)+
		move.w	a1,(word_FF8F52).w
		rts

loc_9734:
		movea.w	(word_FF8F50).w,a1
		move.w	a0,(a1)+
		move.w	a1,(word_FF8F50).w

locret_973E:
		rts

off_9740:	dc.l sub_615C
		dc.l sub_12648
		dc.l sub_DF52
		dc.l sub_E5A0
		dc.l sub_E73C
		dc.l sub_E4BC
		dc.l sub_E872
		dc.l sub_E93A
		dc.l sub_E842
		dc.l sub_E792
		dc.l sub_1561C
		dc.l sub_153E6
		dc.l sub_D932
		dc.l sub_DBE6
		dc.l sub_1598A
		dc.l sub_D1FE
		dc.l sub_14102
		dc.l sub_13E2A
		dc.l sub_13FDC
		dc.l sub_D720
		dc.l sub_D198
		dc.l sub_D16E
		dc.l sub_D864
		dc.l sub_D12C
		dc.l sub_CD66
		dc.l sub_DD70
		dc.l sub_14E02
		dc.l sub_14908
		dc.l sub_1467A
		dc.l sub_13CB4
		dc.l sub_13D50
		dc.l sub_13DF0
		dc.l sub_13990
		dc.l nullsub_8
		dc.l sub_13144
		dc.l sub_136D4
		dc.l sub_12EA8
		dc.l sub_12BA6
		dc.l sub_12D56
		dc.l sub_12AA8
		dc.l sub_12958
		dc.l sub_13894
		dc.l sub_1309C
		dc.l sub_12750
		dc.l sub_DF52
		dc.l sub_12580
		dc.l sub_12CBC
		dc.l sub_AEDC
		dc.l sub_AFF8
		dc.l sub_B08E
		dc.l sub_B21C
		dc.l sub_B2D0
		dc.l nullsub_9
		dc.l sub_B470
		dc.l sub_B4FE
		dc.l sub_B5A0
		dc.l sub_B5F2
		dc.l sub_B6F8
		dc.l sub_13990
		dc.l sub_138B2
		dc.l sub_1101A
		dc.l sub_10FA6
		dc.l sub_10DF4
		dc.l sub_8C76
		dc.l sub_8D1E
		dc.l sub_8E32
		dc.l sub_8BE6
		dc.l sub_8AD2
		dc.l sub_DF52
		dc.l sub_10CAE
		dc.l sub_10DC2
		dc.l sub_1101A
		dc.l sub_F962
		dc.l sub_1128C
		dc.l sub_113CE
		dc.l sub_D932
		dc.l sub_DF52
		dc.l sub_1235C
		dc.l sub_120CE
		dc.l sub_109A4
		dc.l sub_15CF0
		dc.l sub_100D4
		dc.l sub_103A0
		dc.l sub_1059A
		dc.l sub_10A20
		dc.l sub_1094C
		dc.l sub_10774
		dc.l sub_129F96
		dc.l sub_12A0AA
		dc.l sub_12A130
		dc.l sub_12A1B0
		dc.l sub_12A170
		dc.l sub_8898
		dc.l sub_78A4
		dc.l sub_78E2
		dc.l sub_5258
		dc.l sub_5272
		dc.l sub_528E
		dc.l sub_797C
		dc.l sub_5774
		dc.l sub_581E
		dc.l sub_5966
		dc.l sub_79EA
		dc.l sub_7CE8
		dc.l sub_7F2E
		dc.l sub_7FD0
		dc.l sub_129D00
		dc.l sub_129D34
		dc.l sub_129DF6
		dc.l sub_129E74
		dc.l sub_129F02
		dc.l sub_15CF0
		dc.l sub_1614C
		dc.l sub_10046
		dc.l sub_FE60
		dc.l sub_11826
		dc.l sub_FC4A
		dc.l sub_FBB4
		dc.l sub_FD60
		dc.l sub_FC4A
		dc.l sub_14908
		dc.l sub_F756
		dc.l sub_F878
		dc.l sub_D932
		dc.l sub_D932
		dc.l sub_DF52
		dc.l sub_DF52
		dc.l sub_16E36
		dc.l sub_172E8
		dc.l sub_17612
		dc.l sub_17D0C
		dc.l sub_1776E
		dc.l sub_1845E
		dc.l sub_FC4A
		dc.l sub_11CA2
		dc.l sub_11C72
		dc.l sub_11F22
		dc.l sub_11E28
		dc.l sub_F12A
		dc.l sub_F298
		dc.l sub_F458
		dc.l sub_FC4A
		dc.l sub_F580
		dc.l sub_18F04
		dc.l sub_19242
		dc.l sub_190F0
		dc.l sub_18B9A
		dc.l sub_18E2C
		dc.l sub_18E90
		dc.l sub_18D14
		dc.l sub_18D64
		dc.l sub_18DC8
		dc.l sub_18A6A
		dc.l sub_4AF4
		dc.l sub_165A2
		dc.l sub_16D50
		dc.l sub_F458
		dc.l sub_11AB0
		dc.l sub_11B7E
		dc.l sub_8034
		dc.l sub_8082
		dc.l sub_8100
		dc.l sub_81DC
		dc.l sub_838E
		dc.l sub_8344
		dc.l sub_84D0
		dc.l sub_855C
		dc.l sub_8810
		dc.l sub_8D9C
		dc.l sub_8ED8
		dc.l sub_8FD4
		dc.l sub_82D0
		dc.l sub_842C
		dc.l sub_902A
		dc.l sub_9086
		dc.l sub_ED1E
		dc.l sub_11A80
		dc.l sub_11A64
		dc.l sub_1101A
		dc.l sub_CCDA
		dc.l sub_187DC
		dc.l sub_187DC
		dc.l sub_18898
		dc.l sub_1890E
		dc.l sub_1894E
		dc.l sub_18A36
		dc.l sub_11962
		dc.l sub_18700
		dc.l sub_8A02
		dc.l sub_8BBC
		dc.l sub_186AC
		dc.l nullsub_10
		dc.l nullsub_10
		dc.l nullsub_10
		dc.l nullsub_10
		dc.l nullsub_10
		dc.l nullsub_10
		dc.l sub_8962
		dc.l sub_91FC
		dc.l sub_8900
		dc.l sub_79CC
		dc.l sub_7930
nullsub_10:
		rts

sub_9A6A:
		lea	(sprites_ram).w,a2
		move.l	#$1400301,(a2)+
		move.l	#1,(a2)+
		move.l	#$1400302,(a2)+
		move.l	#0,(a2)+
		move.l	#$1600303,(a2)+
		move.l	#1,(a2)+
		move.l	#$1600304,(a2)+
		move.l	#0,(a2)+
		move.b	#4,(byte_FFEE40).w
		move.b	#$4C,(byte_FF8F2E).w
		move.l	a2,(sprites_after_00_ptr).w
		movea.w	(word_FF8F50).w,a1
		clr.w	(a1)
		movea.w	(word_FF8F52).w,a1
		clr.w	(a1)
		lea	(unk_FFF200).w,a1
		moveq	#$3F,d7
		bsr.s	sub_9AD0
		lea	(word_FFF280).w,a1
		moveq	#0,d7
		bsr.s	sub_9AD0
		lea	(unk_FFF282).w,a1
		moveq	#$3E,d7

sub_9AD0:
		move.w	(a1)+,d0
		beq.s	loc_9AE4
		movea.w	d0,a0
		movem.l	d7/a1,-(sp)
		bsr.s	sub_9AF0
		movem.l	(sp)+,d7/a1
		dbf	d7,sub_9AD0

loc_9AE4:
		movea.l	(sprites_after_00_ptr).w,a1
		move.l	#0,(a1)
		rts

sub_9AF0:
		movea.l	$20(a0),a1
		move.w	4(a0),d0
		add.w	d0,d0
		adda.w	(a1,d0.w),a1
		moveq	#0,d1
		move.b	(a1)+,d1
		move.b	(a1)+,d2
		bmi.s	loc_9B0A
		move.b	d2,9(a0)

loc_9B0A:
		move.b	9(a0),d2
		btst	#1,$D(a0)
		bne.s	loc_9B3C
		addq.b	#1,8(a0)
		cmp.b	8(a0),d2
		bhi.s	loc_9B3C
		clr.b	8(a0)
		cmp.w	6(a0),d1
		bhi.s	loc_9B38
		btst	#3,$D(a0)
		bne.s	loc_9B3C
		clr.w	6(a0)
		bra.s	loc_9B3C

loc_9B38:
		addq.w	#1,6(a0)

loc_9B3C:
		move.w	$10(a0),d4
		move.w	$14(a0),d3
		btst	#3,$C(a0)
		bne.s	loc_9B5C
		addi.w	#$80,d4
		addi.w	#$80,d3
		sub.w	(planea_start_x).w,d4
		sub.w	(planea_start_y).w,d3

loc_9B5C:
		btst	#4,$C(a0)
		bne.s	loc_9B80
		cmpi.w	#$280,d4
		bcc.w	sub_B7F6
		tst.w	d4
		bmi.w	sub_B7F6
		cmpi.w	#$280,d3
		bcc.w	sub_B7F6
		tst.w	d3
		bmi.w	sub_B7F6

loc_9B80:
		movea.l	(sprites_after_00_ptr).w,a2
		moveq	#0,d1
		move.w	6(a0),d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		subq.w	#2,d0
		bclr	#$F,d0
		adda.w	d0,a1
		bne.s	loc_9C06
		move.b	(a1)+,d1
		bmi.w	loc_9C7C
		move.b	(a1)+,$24(a0)
		move.b	(a1)+,$25(a0)
		addq.w	#3,a1

loc_9BAA:
		tst.b	(byte_FF8F2E).w
		beq.w	loc_9C7C
		move.b	(a1)+,d0
		ext.w	d0
		add.w	d3,d0
		move.b	$2D(a0),d2
		ext.w	d2
		add.w	(dword_FF8F86+2).w,d2
		add.w	d2,d0
		jsr	sub_9C82(pc)
		bne.s	loc_9C00
		move.w	d0,(a2)+
		move.b	(a1)+,(a2)+
		addq.b	#1,(byte_FFEE40).w
		move.b	(byte_FFEE40).w,(a2)+
		move.b	(a1)+,d0
		lsl.w	#8,d0
		move.b	(a1)+,d0
		add.w	$A(a0),d0
		move.w	d0,(a2)+
		move.b	(a1)+,d0
		ext.w	d0
		add.w	d4,d0
		move.b	$2C(a0),d2
		ext.w	d2
		add.w	(dword_FF8F86).w,d2
		add.w	d2,d0
		jsr	sub_9C98(pc)
		bne.s	loc_9C00
		move.w	d0,(a2)+
		subq.b	#1,(byte_FF8F2E).w

loc_9C00:
		dbf	d1,loc_9BAA
		bra.s	loc_9C7C

loc_9C06:
		move.b	(a1)+,d1
		bmi.s	loc_9C7C
		addq.w	#2,a1
		move.b	(a1)+,$24(a0)
		move.b	(a1)+,$25(a0)
		addq.w	#1,a1

loc_9C16:
		tst.b	(byte_FF8F2E).w
		beq.s	loc_9C7C
		move.b	(a1)+,d0
		ext.w	d0
		add.w	d3,d0
		move.b	$2D(a0),d2
		ext.w	d2
		add.w	(dword_FF8F86+2).w,d2
		add.w	d2,d0
		bsr.s	sub_9C82
		bne.s	loc_9C78
		move.w	d0,(a2)+
		move.b	(a1),d2
		move.b	(a1)+,(a2)+
		addq.b	#1,(byte_FFEE40).w
		move.b	(byte_FFEE40).w,(a2)+
		move.b	(a1)+,d0
		eori.b	#8,d0
		lsl.w	#8,d0
		move.b	(a1)+,d0
		add.w	$A(a0),d0
		move.w	d0,(a2)+
		move.b	(a1)+,d0
		add.b	d2,d2
		addq.b	#8,d2
		andi.b	#$F8,d2
		add.b	d2,d0
		neg.b	d0
		ext.w	d0
		add.w	d4,d0
		move.b	$2C(a0),d2
		ext.w	d2
		add.w	(dword_FF8F86).w,d2
		add.w	d2,d0
		bsr.s	sub_9C98
		bne.s	loc_9C78
		move.w	d0,(a2)+
		subq.b	#1,(byte_FF8F2E).w

loc_9C78:
		dbf	d1,loc_9C16

loc_9C7C:
		move.l	a2,(sprites_after_00_ptr).w
		rts

sub_9C82:
		cmpi.w	#96,d0
		bcs.s	loc_9C92
		cmpi.w	#352,d0
		bcc.s	loc_9C92
		moveq	#0,d5
		rts

loc_9C92:
		addq.w	#4,a1
		moveq	#1,d5
		rts

sub_9C98:
		cmpi.w	#96,d0
		bcs.s	loc_9CA8
		cmpi.w	#448,d0
		bcc.s	loc_9CA8
		moveq	#0,d5
		rts

loc_9CA8:
		subq.b	#1,(byte_FFEE40).w
		subq.w	#6,a2
		moveq	#1,d5
		rts

sub_9CB2:
		cmpi.w	#1,(word_FFA344).w
		beq.w	loc_9DC4
		bgt.w	sub_9F2A
		move.w	(disable_display).w,(a5)
		move.w	#0,(vblank_sub_index).w
		clr.b	(byte_FFEE01).w
		jsr	sub_B828(pc)
		jsr	sub_205E(pc)
		jsr	init_joypads(pc)
		jsr	clear_vram_cram_vsram(pc)
		move.l	#make_indexes($17,$16,$15,$00),d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#make_indexes($3B,$45,$44,$01),d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#make_indexes($53,$58,$00,$00),d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.w	#$BB,(word_FF9080).l
		move.w	#$B2,(word_FF9040).l
		bsr.w	sub_962C
		move.b	#0,(byte_FFEE5E).w
		move.w	#0,(word_FF8FA0).w
		jsr	sub_9F54(pc)
		addq.w	#1,(word_FFA344).w
		move.w	#$6340,d0
		lea	(enigma_030598).l,a0
		lea	(M68K_RAM).l,a1
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		lea	(enigma_030620).l,a0
		lea	(unk_FF1000).l,a1
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		move.l	#make_indexes($00,$00,$09,$08),d0
		trap	#RAW_COPY_DATA	; do_raw_copy_data
		tst.b	(byte_FFEEF3).w
		beq.s	loc_9D70
		move.w	#$8100,d0
		lea	(enigma_127F88).l,a0
		lea	(unk_FF2000).l,a1
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		moveq	#make_indexes($00,$00,$00,$0A),d0
		trap	#RAW_COPY_DATA	; do_raw_copy_data
		bra.s	loc_9D8A

loc_9D70:
		move.w	#$8100,d0
		lea	(enigma_128004).l,a0
		lea	(unk_FF2000).l,a1
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		moveq	#make_indexes($00,$00,$00,$14),d0
		trap	#RAW_COPY_DATA	; do_raw_copy_data

loc_9D8A:
		move.w	(enable_display).w,(a5)
		lea	(unk_FFA360).w,a1
		move.w	#$420A,(a1)
		move.w	#$D,2(a1)
		move.w	#2,4(a1)
		btst	#7,(pcb_ver).w
		bne.s	loc_9DB6
		move.w	#9,2(a1)
		move.w	#3,4(a1)

loc_9DB6:
		move.w	#0,(dialog_border_mask).w
		jsr	(sub_12AA).l
		rts

loc_9DC4:
		jsr	send_smps_cmd	; d0 = cmd
		tst.b	(byte_FFEEFA).w
		beq.s	loc_9DFE
		move.w	#0,(vblank_sub_index).w
		jsr	sub_969E(pc)
		tst.b	(byte_FFEEFB).w
		beq.w	locret_9E60
		move.w	#9,(level_main_index).w
		clr.w	(level_params1_index).w
		move.w	#$2B,(word_FF8F40).w
		jsr	(sub_1060).l
		bsr.w	sub_9FD6
		bra.s	loc_9E2C

loc_9DFE:
		tst.b	(byte_FFEEF9).w
		beq.s	loc_9E16
		move.w	#8,(level_main_index).w
		clr.w	(level_params1_index).w
		move.w	#$26,(word_FF8F40).w
		bra.s	loc_9E2C

loc_9E16:
		move.w	#0,(vblank_sub_index).w
		jsr	sub_9FA4(pc)
		jsr	sub_969E(pc)
		andi.b	#$F0,(word_FF8F2C+1).w
		beq.s	locret_9E60

loc_9E2C:
		addq.w	#1,(word_FFA344).w
		move.w	#$B4,(word_FFA346).w
		move.w	#$B1,(word_FF9000).w
		move.w	(level_main_index).w,d0
		cmpi.w	#7,d0
		bhi.s	loc_9E5C
		clr.w	(level_params1_index).w
		lea	(unk_FFEEBF).w,a3
		tst.b	(a3,d0.w)
		beq.s	loc_9E5C
		add.w	d0,d0
		move.w	word_9E62-2(pc,d0.w),(level_params1_index).w

loc_9E5C:
		bra.w	sub_9FD6

locret_9E60:
		rts

word_9E62:	dc.w 5,	6, 7, 7, 7, $A,	$A, $101, $102,	$202
		dc.w $203, $303, $303, $303, $404, $404, $405, $505, $506, $606
		dc.w $606, $606, $606, $707, $707, $707, $808, $808, $809, $909
		dc.w $900, 1, $300, $102, $300,	$102, $304, $506, 1, $203
		dc.w $400, $102, $300, $801, $203, $405, $607, 1, $203,	$405
		dc.w 1,	$203, $400, $102, $300
sub_9ED0:
		move.b	(word_FF8F2C+1).w,d5
		move.w	(word_FF8F40).w,d0
		btst	#0,d5
		beq.s	loc_9EE8
		subq.w	#1,d0
		bpl.s	loc_9EF8
		move.w	#$2F,d0
		bra.s	loc_9EF8

loc_9EE8:
		btst	#1,d5
		beq.s	loc_9EF8
		addq.w	#1,d0
		cmpi.w	#$2F,d0
		ble.s	loc_9EF8
		moveq	#0,d0

loc_9EF8:
		move.w	d0,(word_FF8F40).w
		lea	(VDP_DATA).l,a2
		move.l	#$4B0C0003,(a5)
		mulu.w	#3,d0
		lea	stru_A136(pc),a1
		adda.w	d0,a1
		moveq	#0,d1
		move.b	(a1)+,d1
		move.w	d1,(a2)
		move.w	#$3A,(a2)
		move.b	(a1)+,d1
		move.w	d1,(a2)
		move.w	#$3A,(a2)
		move.b	(a1)+,d1
		move.w	d1,(a2)
		rts

sub_9F2A:
		move.w	#0,(vblank_sub_index).w
		subq.w	#1,(word_FFA346).w
		beq.s	loc_9F42
		jsr	sub_969E(pc)
		andi.b	#$F0,(word_FF8F2C+1).w
		beq.s	locret_9F52

loc_9F42:
		move.w	#3,(init_step).w
		clr.w	(word_FFA344).w
		jmp	sub_968A

locret_9F52:
		rts

sub_9F54:
		move.w	#599,d7
		moveq	#0,d0
		move.w	#$C00,d0

loc_9F5E:
		move.w	d0,(a5)
		move.w	#1,(a5)
		move.l	(a6),d1
		andi.l	#$F0F0F0F,d1
		bset	#$E,d0
		move.w	d0,(a5)
		move.w	#1,(a5)
		move.l	d1,(a6)
		bclr	#$E,d0
		addq.w	#4,d0
		move.w	d0,(a5)
		move.w	#1,(a5)
		move.l	(a6),d1
		andi.l	#$F0F0F0F0,d1
		bset	#$E,d0
		move.w	d0,(a5)
		move.w	#1,(a5)
		move.l	d1,(a6)
		bclr	#$E,d0
		addq.w	#4,d0
		dbf	d7,loc_9F5E
		rts

sub_9FA4:
		jsr	sub_9FD6
		move.b	(word_FF8F2C+1).w,d5
		andi.b	#$F,d5
		addq.w	#4,d0
		moveq	#5,d7

loc_9FB6:
		move.b	(a1,d0.w),d4
		beq.s	loc_9FC0
		cmp.b	d4,d5
		beq.s	loc_9FCA

loc_9FC0:
		addq.w	#2,d0
		dbf	d7,loc_9FB6
		bra.w	sub_9FD6

loc_9FCA:
		move.b	1(a1,d0.w),d0
		move.w	d0,(level_main_index).w
		clr.w	(level_params1_index).w

sub_9FD6:
		move.w	(level_main_index).w,d0
		bne.s	loc_9FE2
		move.w	#1,(level_main_index).w

loc_9FE2:
		subq.w	#1,d0
		lsl.w	#4,d0
		lea	(stru_A106).l,a1
		tst.b	(byte_FFEEF3).w
		beq.s	loc_9FF8
		lea	(stru_A076).l,a1

loc_9FF8:
		move.w	(a1,d0.w),(word_FF9050).l
		move.w	2(a1,d0.w),(word_FF9054).l
		btst	#7,(pcb_ver).w
		bne.s	loc_A04A
		lea	(byte_127CD8).l,a2
		moveq	#0,d1
		move.w	(level_main_index).w,d1
		subq.w	#1,d1
		asl.w	#4,d1
		lea	(a2,d1.w),a2
		move.l	#$428C0003,(a5)
		moveq	#7,d7

loc_A02C:
		moveq	#0,d2
		move.b	(a2)+,d2
		move.w	d2,(a6)
		dbf	d7,loc_A02C
		move.l	#$430C0003,(a5)
		moveq	#7,d7

loc_A03E:
		moveq	#0,d2
		move.b	(a2)+,d2
		move.w	d2,(a6)
		dbf	d7,loc_A03E
		rts

loc_A04A:
		lea	(tbl_lvl_names).l,a2
		moveq	#0,d1
		move.w	(level_main_index).w,d1
		subq.w	#1,d1
		mulu.w	#$18,d1
		lea	(a2,d1.w),a2
		move.l	#$428C0003,(a5)
		moveq	#$B,d7

loc_A068:
		move.w	(a2)+,d2
		andi.w	#$FF,d2
		move.w	d2,(a6)
		dbf	d7,loc_A068
		rts

stru_A076:	struc_14 $42, $4C
		struc_14 $104,	$804
		struc_14 $A02,	$202
		struc_14 0, 0
		struc_14 $72, $5C
		struc_14 $401,	$501
		struc_14 $803,	$903
		struc_14 $A05,	$205
		struc_14 $DA, $4C
		struc_14 $402,	$602
		struc_14 $104,	$504
		struc_14 $207,	$607
		struc_14 $CA, $24
		struc_14 $601,	$401
		struc_14 $A03,	$203
		struc_14 0, 0
		struc_14 $DA, $A4
		struc_14 $402,	$502
		struc_14 $107,	$907
		struc_14 0, 0
		struc_14 $10A,	$5C
		struc_14 $407,	$507
		struc_14 0, 0
		struc_14 0, 0
		struc_14 $E2, $5C
		struc_14 $103,	$503
		struc_14 $205,	$605
		struc_14 $806,	$906
		struc_14 $42, $6C
		struc_14 0, 0
		struc_14 0, 0
		struc_14 0, 0
		struc_14 $C2, $8C
		struc_14 0, 0
		struc_14 0, 0
		struc_14 0, 0
stru_A106:	struc_14 $42, $4C
		struc_14 $802,	0
		struc_14 $A02,	$202
		struc_14 0, 0
		struc_14 $72, $5C
		struc_14 $401,	$501
		struc_14 $803,	$903
		struc_14 0, 0
		struc_14 $DA, $4C
		struc_14 $402,	$602
		struc_14 $202,	0
		struc_14 0, 0
stru_A136:	struc_13 2, $2A, 2
		struc_13 2, $2A, 3
		struc_13 2, $2A, 4
		struc_13 3, $2A, 2
		struc_13 3, $2A, 3
		struc_13 3, $2A, $D
		struc_13 3, $2A, 4
		struc_13 4, $2A, 2
		struc_13 4, $2A, 3
		struc_13 4, $2A, 4
		struc_13 4, 5,	2
		struc_13 4, 5,	3
		struc_13 4, 5,	4
		struc_13 4, $2A, $C
		struc_13 5, $2A, 2
		struc_13 5, $2A, 3
		struc_13 5, $2A, $D
		struc_13 5, $2A, 4
		struc_13 5, $2A, $C
		struc_13 6, $2A, 2
		struc_13 6, $2A, 3
		struc_13 6, $2A, 4
		struc_13 6, $2A, 5
		struc_13 7, $2A, 2
		struc_13 7, $2A, $D
		struc_13 7, 3,	2
		struc_13 7, 3,	3
		struc_13 7, 3,	4
		struc_13 7, 3,	5
		struc_13 7, 3,	6
		struc_13 7, 3,	7
		struc_13 7, $2A, $C
		struc_13 8, $2A, 2
		struc_13 8, $2A, 3
		struc_13 8, $2A, 4
		struc_13 8, $2A, 5
		struc_13 8, $2A, $D
		struc_13 8, $2A, 6
		struc_13 9, $2A, 2
		struc_13 9, $2A, 3
		struc_13 9, $2A, 4
		struc_13 9, $2A, 5
		struc_13 9, $2A, $C
		struc_13 $A, $2A, 2
		struc_13 $A, $2A, 3
		struc_13 $A, $2A, 4
		struc_13 $A, $2A, $C
		struc_13 $F, $18, $E
sub_A1C6:
		jsr	(init_joypads).l
		jsr	init_sound_type1
		move.w	(disable_display).w,(a5)
		jsr	clear_vram(pc)
		jsr	clear_ram_0000_fd00_0(pc)
		moveq	#1,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#$3231302F,d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		lea	(nemesis_main_font).l,a0
		lea	(dword_FF6000).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		move.w	#1,(level_main_index).w
		jsr	sub_A2D4(pc)
		jsr	sub_A2A4(pc)
		move.l	#$48000000,(a5)
		moveq	#$FFFFFFFF,d1
		jsr	fill_vram_16_words(pc) ; d1 = word|word
		move.b	#1,(byte_FFFC06).w
		move.w	#$3C,(word_FFFC10).w
		move.w	#4,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		move.w	#$FFE0,(planeb_start_y).w
		jsr	sub_A6B0(pc)
		move.b	#$8D,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd
		move.w	(enable_display).w,(a5)

loc_A246:
		jsr	sub_969E(pc)
		jsr	sub_A7E2(pc)
		jsr	sub_AB26(pc)
		jsr	send_smps_cmd	; d0 = cmd
		jsr	sub_A6CC(pc)
		jsr	sub_A6F4(pc)
		tst.b	(byte_FFFC07).w
		bne.s	loc_A26A
		subq.w	#2,(planeb_start_x).w

loc_A26A:
		move.w	#3,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		tst.b	(byte_FFFC14).w
		beq.s	loc_A246
		jsr	sub_A6BE(pc)
		moveq	#9,d7

loc_A280:
		move.w	d7,-(sp)
		jsr	sub_A6FA(pc)
		move.w	(sp)+,d7
		move.w	#4,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		dbf	d7,loc_A280
		move.w	#0,(word_FFFF20).w
		move.w	#0,(init_step).w
		rts

sub_A2A4:
		move.l	#$40000003,(a5)
		move.l	#$3B103B1,d1
		lea	(VDP_DATA).l,a6
		bsr.s	sub_A2C4
		move.l	#$49000003,(a5)
		bsr.s	sub_A2C4
		bsr.s	sub_A2CC
		bsr.s	sub_A2CC

sub_A2C4:
		jsr	fill_vram_64_words(pc) ; d1 = word|word
		jsr	fill_vram_64_words(pc) ; d1 = word|word

sub_A2CC:
		jsr	fill_vram_64_words(pc) ; d1 = word|word
		jmp	fill_vram_64_words(pc) ; d1 = word|word

sub_A2D4:
		move.w	(level_main_index).w,d1
		move.w	(level_sub_index).w,d2
		lea	(tbl_level_funcs).l,a0
		add.w	d1,d1
		add.w	d1,d1
		movea.l	(a0,d1.w),a0
		add.w	d2,d2
		move.w	(a0,d2.w),d2
		movea.l	d2,a0
		jsr	(a0)
		lea	(palettes_data_1).l,a1
		lea	word_13D1F0-palettes_data_1(a1),a1
		lea	(ram_palette_0).w,a2
		jsr	copy_bytes_to_dest_64 ;	a1 = source
		lea	$20(a1),a1
		jsr	copy_bytes_to_dest_32 ;	a1 = source
		jsr	sub_A71C(pc)
		lea	(palettes_data_1).l,a1
		lea	word_13CD70-palettes_data_1(a1),a1
		lea	(ram_palette_2).w,a2
		jsr	copy_bytes_to_dest_32 ;	a1 = source
		lea	word_13CD50-word_13CD70(a1),a1
		jsr	copy_bytes_to_dest_32 ;	a1 = source
		lea	(unk_FF2800).l,a1
		lea	(unk_FF5800).l,a2
		move.l	#$60000003,(a5)
		moveq	#$F,d6

loc_A348:
		moveq	#0,d5
		bsr.s	sub_A35A
		moveq	#4,d5
		bsr.s	sub_A35A
		adda.w	#$10,a1
		dbf	d6,loc_A348
		rts

sub_A35A:
		cmpi.w	#5,(level_main_index).w
		beq.s	loc_A386
		cmpi.w	#7,(level_main_index).w
		beq.s	loc_A378
		lea	$100(a1),a0
		bsr.s	sub_A394
		lea	$200(a1),a0
		bsr.s	sub_A394
		rts

loc_A378:
		lea	0.w(a1),a0
		bsr.s	sub_A394
		lea	$100(a1),a0
		bsr.s	sub_A394
		rts

loc_A386:
		lea	$200(a1),a0
		bsr.s	sub_A394
		lea	$300(a1),a0
		bsr.s	sub_A394
		rts

sub_A394:
		moveq	#$F,d7

loc_A396:
		moveq	#0,d0
		move.b	(a0)+,d0
		lsl.w	#3,d0
		add.w	d5,d0
		move.l	(a2,d0.w),(a6)
		dbf	d7,loc_A396
		rts

sub_A3A8:
		jsr	(init_joypads).l
		jsr	init_sound_type2
		move.w	(disable_display).w,(a5)
		jsr	clear_vram(pc)
		jsr	clear_ram_0000_fd00_0(pc)
		move.l	#$3C3E3D3C,d0
		trap	#5		; do_copy_4_palettes_to_ram
		jsr	sub_A71C(pc)
		move.l	#$18181818,d0
		trap	#5		; do_copy_4_palettes_to_ram
		moveq	#1,d0
		trap	#1		; do_decompress_nemesis_to_vram
		move.l	#$32313000,d0
		trap	#1		; do_decompress_nemesis_to_vram
		jsr	wait_for_vblank(pc)
		move.b	#$8C,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd
		lea	(enigma_12C192).l,a0
		lea	(unk_FF1000).l,a1
		move.w	#$100,d0
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		move.l	#$504,d0
		trap	#RAW_COPY_DATA	; do_raw_copy_data
		lea	(nemesis_main_font).l,a0
		lea	(dword_FF6000).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		move.w	#$6C,(word_FF9100).w
		move.w	#$6D,(word_FF9140).w
		move.w	#$6E,(word_FF9180).w
		bset	#2,(byte_FF918D).w
		move.w	#$2D0,(word_FF91B8).w
		move.w	#$6B,(word_FF91C0).w
		move.w	#$78,(word_FFFC10).w
		move.w	#4,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		jsr	sub_A6B0(pc)
		move.w	#5,(word_FFFC16).w
		move.w	(enable_display).w,(a5)

loc_A462:
		btst	#6,(pcb_ver).w
		beq.s	loc_A482
		subq.w	#1,(word_FFFC16).w
		bne.s	loc_A482
		move.w	#5,(word_FFFC16).w
		jsr	sub_969E(pc)
		jsr	sub_A7EC(pc)
		jsr	sub_AB26(pc)

loc_A482:
		jsr	sub_969E(pc)
		jsr	sub_A7EC(pc)
		jsr	sub_AB26(pc)
		jsr	sub_A6D2(pc)
		move.w	#3,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		cmpi.w	#7,(word_FF9002).w
		bne.s	loc_A462
		jsr	sub_A71C(pc)
		jsr	sub_A6BE(pc)
		moveq	#9,d7

loc_A4AE:
		move.w	d7,-(sp)
		jsr	sub_A6FA(pc)
		move.w	(sp)+,d7
		move.w	#4,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		dbf	d7,loc_A4AE
		move.w	#$A,(init_step).w
		rts

sub_A4CC:
		lea	initial_vdp_regs_0(pc),a0
		jsr	(init_vdp_regs).l ; a0 = vdp regs array	(19)
		jsr	init_sound_type1
		move.w	(disable_display).w,(a5)
		jsr	clear_vram(pc)
		jsr	clear_ram_0000_fd00_0(pc)
		move.l	#make_indexes($18,$16,$18,$18),d0
		trap	#COPY_PAL_TO_RAM ; do_copy_4_palettes_to_ram
		move.l	#make_indexes($15,$14,$13,$12),d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		move.l	#make_indexes($19,$18,$17,$16),d0
		trap	#DECOMP_NEMESIS_VRAM ; do_decompress_nemesis_to_vram
		lea	(enigma_02C3B8).l,a0
		lea	(M68K_RAM).l,a1
		move.w	#$8000,d0
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		lea	(enigma_02C470).l,a0
		lea	(unk_FF0800).l,a1
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		lea	(enigma_02C572).l,a0
		lea	(unk_FF1000).l,a1
		moveq	#0,d0
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		move.l	#$4030201,d0
		jsr	send_ram_data_to_vram(pc) ; d0 = indexes
		move.l	#$8070605,d0
		jsr	send_ram_data_to_vram(pc) ; d0 = indexes
		jsr	sub_A78A(pc)
		move.w	#$30,(word_FF9000).w
		move.w	#$31,(word_FF9040).w
		move.w	#$32,(word_FF9080).w
		jsr	sub_962C
		jsr	wait_for_vblank(pc)
		bclr	#0,(byte_FFFF16).w
		bne.s	loc_A5DA
		move.w	#5,(word_FFFC16).w
		move.w	(enable_display).w,(a5)

loc_A582:
		btst	#6,(pcb_ver).w
		beq.s	loc_A5A2
		subq.w	#1,(word_FFFC16).w
		bne.s	loc_A5A2
		move.w	#5,(word_FFFC16).w
		jsr	sub_969E(pc)
		jsr	sub_A9C4(pc)
		jsr	sub_AB26(pc)

loc_A5A2:
		jsr	sub_969E(pc)
		jsr	sub_A9C4(pc)
		jsr	sub_AB26(pc)
		jsr	send_smps_cmd	; d0 = cmd
		move.w	#3,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		tst.b	(byte_FFFC05).w
		bne.w	loc_A642
		btst	#7,(word_FF8FB0+1).w
		beq.s	loc_A582
		move.b	#$F9,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd

loc_A5DA:
		move.w	(disable_display).w,(a5)
		jsr	clear_vram(pc)
		jsr	clear_ram_0000_fd00_0(pc)
		move.l	#$17161519,d0
		trap	#5		; do_copy_4_palettes_to_ram
		jsr	sub_A7A6(pc)
		move.l	#$1C1A1915,d0
		trap	#1		; do_decompress_nemesis_to_vram
		jsr	sub_AB72(pc)
		jsr	sub_ABEA(pc)
		lea	(nemesis_12BBA6).l,a0
		lea	(word_FF9080).w,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		move.w	#$140,(planeb_start_x).w
		jsr	sub_A78A(pc)
		move.l	#off_21532,(dword_FF90A0).w
		move.l	#off_12E272,(dword_FF9120).w
		move.l	#off_12E272,(dword_FF9160).w
		jsr	sub_962C
		jsr	wait_for_vblank(pc)
		move.w	(enable_display).w,(a5)

loc_A642:
		move.w	#$168,(word_FF8F7E).w

loc_A648:
		jsr	sub_969E(pc)
		move.w	#3,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		btst	#7,(word_FF8FB0+1).w
		bne.s	loc_A684
		subq.w	#1,(word_FF8F7E).w
		bne.s	loc_A648
		move.b	#$F8,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd
		move.w	#6,(init_step).w
		move.b	#$F8,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd
		bra.s	loc_A696

loc_A684:
		move.w	#$B,(init_step).w
		move.b	#$F8,(smps_cmd2).w
		jsr	send_smps_cmd	; d0 = cmd

loc_A696:
		move.w	(disable_display).w,(a5)
		move.l	#$C0000000,(a5)
		moveq	#0,d0
		moveq	#$1F,d7

loc_A6A4:
		move.l	d0,(a6)
		dbf	d7,loc_A6A4
		move.w	(enable_display).w,(a5)
		rts

sub_A6B0:
		move.w	#$10,(word_FFFC08).w
		move.w	#$F,(word_FFFC0A).w
		rts

sub_A6BE:
		move.w	#$10,(word_FFFC0C).w
		move.w	#0,(word_FFFC0E).w
		rts

sub_A6CC:
		lea	sub_B780(pc),a3
		bra.s	loc_A6D6

sub_A6D2:
		lea	sub_B78A(pc),a3

loc_A6D6:
		move.w	(word_FFFC08).w,d6
		beq.s	locret_A6F2
		subq.w	#1,(word_FFFC08).w
		move.w	(word_FFFC0A).w,d0
		moveq	#$F,d4
		jsr	sub_A72A(pc)
		jsr	(a3)
		subq.w	#1,d0
		move.w	d0,(word_FFFC0A).w

locret_A6F2:
		rts

sub_A6F4:
		lea	sub_B780(pc),a3
		bra.s	loc_A6FE

sub_A6FA:
		lea	sub_B78A(pc),a3

loc_A6FE:
		move.w	(word_FFFC0C).w,d6
		beq.s	locret_A71A
		subq.w	#1,(word_FFFC0C).w
		move.w	(word_FFFC0E).w,d0
		moveq	#$F,d4
		jsr	sub_A72A(pc)
		jsr	(a3)
		addq.w	#1,d0
		move.w	d0,(word_FFFC0E).w

locret_A71A:
		rts

sub_A71C:
		lea	(ram_palette_0).w,a1
		lea	(unk_FFF600).w,a2
		jmp	copy_bytes_to_dest_128 ; a1 = source

sub_A72A:
		lea	(unk_FFF600).w,a1
		lea	(ram_palette_0).w,a2
		jmp	copy_bytes_to_dest_128 ; a1 = source

clear_vram:
		move.w	#$8F01,(a5)
		jsr	request_z80_bus
		move.l	#$93FF94FF,(a5)
		move.w	#$9780,(a5)
		move.l	#$40000080,(a5)
		move.w	#0,(a6)

loc_A756:
		btst	#DMA_IN_PROGRESS,1(a5)
		bne.s	loc_A756
		move.l	#$40000000,(a5)
		move.w	#0,(a6)
		jsr	release_z80_bus
		move.w	#$8F02,(a5)
		rts

clear_ram_0000_fd00_0:
		lea	(M68K_RAM).l,a1
		moveq	#0,d1
		move.w	#$1F9,d7

loc_A780:
		jsr	fill_ram_128_bytes(pc) ; d1 = dword
		dbf	d7,loc_A780
		rts

sub_A78A:
		lea	(unk_FFFA80).w,a3
		move.l	#$93809402,(a3)+
		move.l	#$96009500,(a3)+
		move.w	#$9700,(a3)+
		move.l	#$78000082,(a3)
		rts

sub_A7A6:
		move.l	#$22E0EEE,(ram_palette_2+$10).w
		move.l	#$460022A,(ram_palette_2+$14).w
		move.l	#$4AE048E,(ram_palette_2+$18).w
		move.l	#$26E0000,(ram_palette_2+$1C).w
		move.b	#1,(cram_update_needed).w
		rts

initial_vdp_regs_0:dc.b	4, $14,	$30, $2C, 7, $5A, 0, 0,	0, 0, 0, 2, $81, $2C, 0, 2, 3, 0, 0
		align 2, 0
sub_A7E2:
		st	(byte_FFEE7A).w
		lea	stru_A84C(pc),a1
		bra.s	loc_A7FC

sub_A7EC:
		lea	stru_A8CC(pc),a1
		btst	#7,(pcb_ver).w
		bne.s	loc_A7FC
		lea	stru_A8EC(pc),a1

loc_A7FC:
		tst.w	(word_FFFC02).w
		bmi.w	locret_A84A
		addq.w	#1,(word_FFFC02).w
		move.w	(word_FFFC10).w,d7
		cmp.w	(word_FFFC02).w,d7
		bne.s	locret_A84A
		move.w	#$A000,d0
		move.w	(word_FFFC12).w,d7
		addq.w	#1,(word_FFFC12).w
		add.w	d7,d7
		add.w	d7,d7
		moveq	#0,d6
		move.w	2(a1,d7.w),d6
		tst.b	(byte_FFEE7A).w
		beq.s	loc_A83E
		btst	#6,(pcb_ver).w
		beq.s	loc_A83E
		divu.w	#6,d6
		mulu.w	#5,d6

loc_A83E:
		move.w	d6,(word_FFFC10).w
		move.w	(a1,d7.w),d7
		jmp	(a1,d7.w)

locret_A84A:
		rts

stru_A84C:	struc_A84C sub_A90C-stru_A84C,	$B4
		struc_A84C sub_A920-stru_A84C,	$258
		struc_A84C sub_A924-stru_A84C,	$294
		struc_A84C sub_A928-stru_A84C,	$438
		struc_A84C sub_A924-stru_A84C,	$447
		struc_A84C sub_A96C-stru_A84C,	$456
		struc_A84C sub_A974-stru_A84C,	$465
		struc_A84C sub_A970-stru_A84C,	$474
		struc_A84C sub_A92C-stru_A84C,	$618
		struc_A84C sub_A924-stru_A84C,	$654
		struc_A84C sub_A930-stru_A84C,	$7F8
		struc_A84C sub_A924-stru_A84C,	$807
		struc_A84C sub_A96C-stru_A84C,	$816
		struc_A84C sub_A980-stru_A84C,	$825
		struc_A84C sub_A970-stru_A84C,	$834
		struc_A84C sub_A934-stru_A84C,	$9D8
		struc_A84C sub_A924-stru_A84C,	$A14
		struc_A84C sub_A938-stru_A84C,	$BB8
		struc_A84C sub_A924-stru_A84C,	$BC7
		struc_A84C sub_A96C-stru_A84C,	$BD6
		struc_A84C sub_A98C-stru_A84C,	$BE5
		struc_A84C sub_A970-stru_A84C,	$BF4
		struc_A84C sub_A93C-stru_A84C,	$D98
		struc_A84C sub_A924-stru_A84C,	$DD4
		struc_A84C sub_A940-stru_A84C,	$F78
		struc_A84C sub_A924-stru_A84C,	$F87
		struc_A84C sub_A96C-stru_A84C,	$F96
		struc_A84C sub_A998-stru_A84C,	$FA5
		struc_A84C sub_A970-stru_A84C,	$1388
		struc_A84C sub_A9B4-stru_A84C,	$13EC
		struc_A84C sub_AAB4-stru_A84C,	$1996
		struc_A84C sub_A9BC-stru_A84C,	$FFFF
stru_A8CC:	struc_A8CC sub_A954-stru_A8CC,	$1A4
		struc_A8CC sub_A944-stru_A8CC,	$1C2
		struc_A8CC sub_A958-stru_A8CC,	$2EE
		struc_A8CC sub_A944-stru_A8CC,	$316
		struc_A8CC sub_A95C-stru_A8CC,	$564
		struc_A8CC sub_A944-stru_A8CC,	$58C
		struc_A8CC sub_A960-stru_A8CC,	$708
		struc_A8CC sub_A944-stru_A8CC,	$FFFF
stru_A8EC:	struc_A8EC sub_A948-stru_A8EC,	$1A4
		struc_A8EC sub_A944-stru_A8EC,	$1C2
		struc_A8EC sub_A94C-stru_A8EC,	$2EE
		struc_A8EC sub_A944-stru_A8EC,	$316
		struc_A8EC sub_A950-stru_A8EC,	$564
		struc_A8EC sub_A944-stru_A8EC,	$58C
		struc_A8EC sub_A964-stru_A8EC,	$708
		struc_A8EC sub_A944-stru_A8EC,	$FFFF
sub_A90C:
		move.w	#$5A,(word_FF9000).w
		move.w	#$59,(word_FF9040).w
		move.w	#$5C,(word_FF9080).w
		rts

sub_A920:
		moveq	#9,d1
		bra.s	sub_A966

sub_A924:
		moveq	#$12,d1
		bra.s	sub_A966

sub_A928:
		moveq	#$A,d1
		bra.s	sub_A966

sub_A92C:
		moveq	#$B,d1
		bra.s	sub_A966

sub_A930:
		moveq	#$C,d1
		bra.s	sub_A966

sub_A934:
		moveq	#$D,d1
		bra.s	sub_A966

sub_A938:
		moveq	#$E,d1
		bra.s	sub_A966

sub_A93C:
		moveq	#$F,d1
		bra.s	sub_A966

sub_A940:
		moveq	#$10,d1
		bra.s	sub_A966

sub_A944:
		moveq	#$11,d1
		bra.s	sub_A966

sub_A948:
		moveq	#$2B,d1
		bra.s	sub_A966

sub_A94C:
		moveq	#$2C,d1
		bra.s	sub_A966

sub_A950:
		moveq	#$2D,d1
		bra.s	sub_A966

sub_A954:
		moveq	#6,d1
		bra.s	sub_A966

sub_A958:
		moveq	#7,d1
		bra.s	sub_A966

sub_A95C:
		moveq	#8,d1
		bra.s	sub_A966

sub_A960:
		moveq	#$2E,d1
		bra.s	sub_A966

sub_A964:
		moveq	#$2F,d1
sub_A966:
		jmp	sub_12A964
sub_A96C:
		jmp	sub_A6BE(pc)
sub_A970:
		jmp	sub_A6B0(pc)

sub_A974:
		move.w	#2,d0
		move.w	#0,(planeb_start_y).w
		bra.s	sub_A9A2

sub_A980:
		move.w	#5,d0
		move.w	#$FFE0,(planeb_start_y).w
		bra.s	sub_A9A2

sub_A98C:
		move.w	#6,d0
		move.w	#$FFE0,(planeb_start_y).w
		bra.s	sub_A9A2

sub_A998:
		move.w	#7,d0
		move.w	#$10,(planeb_start_y).w

sub_A9A2:
		move.w	d0,(level_main_index).w
		jsr	sub_A2D4(pc)
		move.w	#$8B00,(VDP_CTRL).l
		rts

sub_A9B4:
		move.w	#3,(word_FF9042).w
		rts

sub_A9BC:
		move.b	#1,(byte_FFFC14).w
		rts

sub_A9C4:
		tst.w	(word_FFFC02).w
		beq.w	locret_AA30
		subq.w	#1,(word_FFFC02).w
		moveq	#0,d2
		cmpi.w	#$460,(word_FFFC02).w
		beq.s	loc_AA32
		cmpi.w	#$3AC,(word_FFFC02).w
		beq.w	loc_AA3C
		moveq	#1,d2
		cmpi.w	#$38E,(word_FFFC02).w
		beq.s	loc_AA32
		cmpi.w	#$2DA,(word_FFFC02).w
		beq.w	loc_AA3C
		moveq	#2,d2
		cmpi.w	#$2BC,(word_FFFC02).w
		beq.s	loc_AA32
		cmpi.w	#$208,(word_FFFC02).w
		beq.s	loc_AA3C
		moveq	#3,d2
		cmpi.w	#$1EA,(word_FFFC02).w
		beq.s	loc_AA32
		cmpi.w	#$136,(word_FFFC02).w
		beq.s	loc_AA3C
		cmpi.w	#$5A,(word_FFFC02).w
		bne.s	locret_AA30
		moveq	#5,d1
		move.w	#$A000,d0
		jsr	sub_12A964

locret_AA30:
		rts

loc_AA32:
		move.l	#byte_12BC5C,(dword_FFFC40).w
		bra.s	loc_AA44

loc_AA3C:
		move.l	#byte_12BC9C,(dword_FFFC40).w

loc_AA44:
		move.w	#$A000,d0
		moveq	#5,d1
		jsr	sub_12A964
		move.w	d2,d1
		move.w	#$A500,d0
		jsr	sub_12A964
		move.w	#7,(word_FFFC4A).w
		move.l	#$60200002,(dword_FFFC44).w
		move.w	#$39,(word_FFFC48).w
		rts

sub_AA72:
		movem.l	a0-a6,-(sp)
		jsr	sub_AB72(pc)
		move.w	#7,(word_FFFC4A).w
		move.l	#word_12BC1C,(dword_FFFC40).w
		move.l	#$4C000002,(dword_FFFC44).w
		lea	(nemesis_030946).l,a0
		move.w	(a0),d0
		andi.w	#$FFF,d0
		subq.w	#1,d0
		move.w	d0,(word_FFFC48).w
		lea	(dword_FF6000).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		movem.l	(sp)+,a0-a6
		rts

sub_AAB4:
		movem.l	a0-a6,-(sp)
		moveq	#6,d0
		trap	#0		; do_raw_copy_data
		move.l	#$EEE0EEA,(ram_palette_1+2).w
		move.l	#$ECA0EC4,(ram_palette_1+6).w
		move.b	#1,(cram_update_needed).w
		move.w	#7,(word_FFFC4A).w
		move.l	#word_12BC1C,(dword_FFFC40).w
		move.l	#$60000001,(a5)
		lea	(VDP_DATA).l,a6
		moveq	#0,d1
		move.w	#$B,d7

loc_AAF2:
		jsr	fill_vram_64_words(pc) ; d1 = word|word
		dbf	d7,loc_AAF2
		move.l	#$60000001,(dword_FFFC44).w
		lea	(nemesis_12A5FA).l,a0
		move.w	(a0),d0
		andi.w	#$FFF,d0
		subq.w	#1,d0
		move.w	d0,(word_FFFC48).w
		lea	(dword_FF6000).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		movem.l	(sp)+,a0-a6
		rts

sub_AB26:
		move.w	(word_FFFC4A).w,d4
		beq.s	locret_AB70
		subq.w	#1,(word_FFFC4A).w
		move.w	(word_FFFC48).w,d7
		movea.l	(dword_FFFC40).w,a1
		addq.l	#8,(dword_FFFC40).w
		lea	(dword_FF6000).l,a2
		move.l	(dword_FFFC44).w,(VDP_CTRL).l

loc_AB4A:
		movea.l	(dword_FFFC40).w,a3
		moveq	#7,d6

loc_AB50:
		moveq	#0,d0
		move.b	(a3)+,d1
		moveq	#$F,d2
		moveq	#7,d3

loc_AB58:
		rol.b	#1,d1
		bcc.s	loc_AB5E
		or.b	d2,d0

loc_AB5E:
		rol.l	#4,d0
		dbf	d3,loc_AB58
		and.l	(a2)+,d0
		move.l	d0,(a6)
		dbf	d6,loc_AB50
		dbf	d7,loc_AB4A

locret_AB70:
		rts

sub_AB72:
		lea	(enigma_031608).l,a0
		lea	(unk_FF2000).l,a1
		move.w	#$2460,d0
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		btst	#7,(pcb_ver).w
		bne.s	loc_ABC8
		lea	(enigma_0315A2).l,a0
		lea	(M68K_RAM).l,a1
		move.w	#$6460,d0
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		lea	(enigma_031616).l,a0
		lea	(unk_FF4000).l,a1
		move.w	#$6460,d0
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		move.l	#$D0C0B,d0
		jsr	send_ram_data_to_vram(pc) ; d0 = indexes
		rts

loc_ABC8:
		lea	(enigma_0315D4).l,a0
		lea	(M68K_RAM).l,a1
		move.w	#$6460,d0
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		move.l	#$C0B,d0
		jsr	send_ram_data_to_vram(pc) ; d0 = indexes
		rts

sub_ABEA:
		move.l	a0,-(sp)
		move.w	#$6180,d0
		lea	(enigma_030598).l,a0
		lea	(M68K_RAM).l,a1
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		lea	(enigma_030620).l,a0
		lea	(unk_FF1000).l,a1
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		movea.l	(sp)+,a0
		move.l	#$A09,d0
		jsr	send_ram_data_to_vram(pc) ; d0 = indexes
		rts
; d0 = indexes

send_ram_data_to_vram:
		moveq	#3,d2

loc_AC24:
		moveq	#0,d1
		move.b	d0,d1
		beq.s	loc_AC4A
		mulu.w	#$C,d1
		movem.l	d0-d2,-(sp)
		lea	(tbl_ram_vram_send).l,a1
		lea	(a1,d1.w),a1
		move.w	-(a1),d2
		move.w	-(a1),d1
		move.l	-(a1),d0
		movea.l	-(a1),a1
		bsr.s	write_data_to_vram ; d0	= vdp cmd
		movem.l	(sp)+,d0-d2

loc_AC4A:
		ror.l	#8,d0
		dbf	d2,loc_AC24
		rts
; d0 = vdp cmd
; d1 = width
; d2 = height
; a1 = source

write_data_to_vram:
		move.l	#$1000000,d4

loc_AC58:
		move.l	d0,(VDP_CTRL).l
		move.w	d1,d3

loc_AC60:
		move.w	(a1)+,(VDP_DATA).l
		dbf	d3,loc_AC60
		add.l	d4,d0
		dbf	d2,loc_AC58
		rts

sub_AC72:
		jsr	(init_joypads).l
		move.w	(disable_display).w,(a5)
		jsr	clear_vram(pc)
		jsr	clear_ram_0000_fd00_0(pc)
		jsr	(sub_205E).l
		move.l	#$5401,d0
		trap	#1		; do_decompress_nemesis_to_vram
		lea	(nemesis_main_font).l,a0
		lea	(dword_FF6000).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		lea	(nemesis_main_font).l,a0
		jsr	sub_AE56(pc)
		jsr	sub_AB26(pc)
		move.b	#0,(byte_FFFC85).w
		lea	(enigma_12FF1E).l,a0
		lea	(unk_FF1000).l,a1
		move.w	#$100,d0
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		moveq	#$15,d0
		jsr	(raw_data_copy_to_vdp).l ; d0 =	indexes
		move.w	#$13,(word_FFFC80).w
		btst	#7,(pcb_ver).w
		bne.s	loc_ACEA
		move.w	#$21,(word_FFFC80).w

loc_ACEA:
		move.b	#$90,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		move.w	#0,(word_FFFC82).w

loc_ACFC:
		move.w	(word_FFFC82).w,d7
		move.w	d7,d0
		add.w	d0,d0
		add.w	d0,d0
		lea	(tbl_enigma_data_0).l,a1
		movea.l	(a1,d0.w),a0
		lea	(unk_FF1000).l,a1
		move.w	#0,d0
		jsr	(decompress_enigma_to_ram).l ; a0 = source
		jsr	sub_AE88(pc)
		move.w	d7,d1
		add.w	d1,d1
		moveq	#0,d0
		lea	(word_AED2).l,a0
		move.w	(a0,d1.w),d0
		swap	d0
		jsr	(copy_4_palettes_to_ram).l
		move.w	#0,(ram_palette_0+$1E).w
		moveq	#$13,d0
		jsr	(raw_data_copy_to_vdp).l ; d0 =	indexes
		move.w	#3,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		move.w	(enable_display).w,(a5)
		move.w	d7,d1
		add.w	d1,d1
		moveq	#0,d7
		lea	stru_AEAA(pc),a0
		btst	#7,(pcb_ver).w
		bne.s	loc_AD6E
		lea	$A(a0),a0

loc_AD6E:
		move.b	(a0,d1.w),d7
		move.b	1(a0,d1.w),d0
		bsr.s	sub_AD92
		move.w	(disable_display).w,(a5)
		tst.b	(byte_FFFC85).w
		bne.s	locret_AD90
		addq.w	#1,(word_FFFC82).w
		cmpi.w	#5,(word_FFFC82).w
		bne.w	loc_ACFC

locret_AD90:
		rts

sub_AD92:
		move.b	d0,(byte_FFFC84).w

loc_AD96:
		move.w	d7,-(sp)
		moveq	#0,d0
		move.w	(word_FFFC80).w,d1
		move.w	#$8000,d0
		jsr	sub_12A964
		lea	(nemesis_main_font).l,a0
		jsr	sub_AE56(pc)
		addq.w	#1,(word_FFFC80).w

loc_ADB6:
		jsr	sub_AB26(pc)
		move.w	#3,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		move.b	(word_FF8FB0+1).w,d0
		btst	#7,d0
		bne.w	loc_AE32
		andi.b	#$F0,d0
		beq.s	loc_ADB6
		lea	(nemesis_main_font).l,a0
		jsr	sub_AE60(pc)
		moveq	#7,d7

loc_ADE2:
		move.w	d7,-(sp)
		jsr	sub_AB26(pc)
		move.w	#3,(vblank_sub_index).w
		jsr	wait_for_vblank(pc)
		move.w	(sp)+,d7
		dbf	d7,loc_ADE2
		move.b	(byte_FFFC84).w,d0
		tst.b	d0
		bne.s	loc_AE12
		move.l	#$68800003,(a5)
		lea	(VDP_DATA).l,a1
		moveq	#0,d1
		moveq	#$B,d0
		bra.s	loc_AE22

loc_AE12:
		move.l	#$68800003,(a5)
		lea	(VDP_DATA).l,a1
		moveq	#0,d1
		moveq	#$B,d0

loc_AE22:
		jsr	fill_vram_64_words(pc) ; d1 = word|word
		dbf	d0,loc_AE22
		move.w	(sp)+,d7
		dbf	d7,loc_AD96
		rts

loc_AE32:
		move.l	#$68800003,(a5)
		lea	(VDP_DATA).l,a1
		moveq	#0,d1
		moveq	#$B,d0

loc_AE42:
		jsr	fill_vram_64_words(pc) ; d1 = word|word
		dbf	d0,loc_AE42
		move.w	(sp)+,d7
		add.w	d7,(word_FFFC80).w
		st	(byte_FFFC85).w
		rts

sub_AE56:
		move.l	#byte_12BC5C,(dword_FFFC40).w
		bra.s	loc_AE68

sub_AE60:
		move.l	#byte_12BC9C,(dword_FFFC40).w

loc_AE68:
		move.w	#7,(word_FFFC4A).w
		move.l	#$40200000,(dword_FFFC44).w
		move.w	(nemesis_main_font).l,d0
		andi.w	#$FFF,d0
		subq.w	#1,d0
		move.w	d0,(word_FFFC48).w
		rts

sub_AE88:
		move.w	#$A7,d6
		lea	(unk_FF1000).l,a1

loc_AE92:
		move.w	(a1),d0
		moveq	#$A,d1
		btst	d1,d0
		beq.s	loc_AE9E
		addi.w	#$1C00,d0

loc_AE9E:
		addi.w	#$4100,d0
		move.w	d0,(a1)+
		dbf	d6,loc_AE92
		rts

stru_AEAA:	struc_18 4, 0
		struc_18 1, 0
		struc_18 0, 0
		struc_18 3, 1
		struc_18 1, 1
		struc_18 2, 1
		struc_18 1, 1
		struc_18 0, 1
		struc_18 2, 1
		struc_18 0, 1
tbl_enigma_data_0:dc.l enigma_12FE5C
		dc.l enigma_12FE7A
		dc.l enigma_12FEAE
		dc.l enigma_12FEE8
		dc.l enigma_12FF02
word_AED2:	dc.w $4E4E, $504F, $5251, $5353, $5454
sub_AEDC:
		lea	off_AEE4(pc),a1
		jmp	j_jump_by_table1(pc) ; a0 = ?
off_AEE4:	dc.w sub_AEF2-off_AEE4
		dc.w sub_AF1E-off_AEE4
		dc.w sub_AF56-off_AEE4
		dc.w sub_AF6E-off_AEE4
		dc.w sub_AF8E-off_AEE4
		dc.w sub_AFA6-off_AEE4
		dc.w sub_AFB2-off_AEE4

sub_AEF2:
		bset	#3,$C(a0)
		bset	#1,$D(a0)
		move.w	#$E8,$10(a0)
		move.w	#$108,$14(a0)
		move.w	#$25C0,$A(a0)
		move.l	#off_21532,$20(a0)
		moveq	#$26,d0
		jsr	sub_B7CE(pc)

sub_AF1E:
		jsr	(sub_5FDC).l
		cmpi.w	#3,6(a0)
		beq.s	loc_AF44
		cmpi.w	#4,6(a0)
		beq.s	loc_AF44
		cmpi.w	#8,6(a0)
		beq.s	loc_AF44
		cmpi.w	#9,6(a0)
		bne.s	locret_AF54

loc_AF44:
		addi.l	#$10000,(planea_start_x).w
		addi.l	#$8000,(planeb_start_x).w

locret_AF54:
		rts

sub_AF56:
		moveq	#5,d0
		jsr	sub_B7CE(pc)
		bset	#0,(byte_FF904C).w
		move.w	#5,(word_FF9082).w
		move.w	#$1E,$38(a0)

sub_AF6E:
		jsr	(sub_5FDC).l
		addi.l	#$10000,(planea_start_x).w
		addi.l	#$8000,(planeb_start_x).w
		jsr	sub_B740(pc)
		moveq	#$27,d0
		jsr	sub_B7CE(pc)

sub_AF8E:
		jsr	(sub_5FDC).l
		addi.l	#$10000,(planea_start_x).w
		addi.l	#$8000,(planeb_start_x).w
		rts

sub_AFA6:
		moveq	#$28,d0
		jsr	sub_B7CE(pc)
		addi.w	#$14,$14(a0)

sub_AFB2:
		jsr	(sub_5FDC).l
		addi.l	#$4000,$10(a0)
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		addi.l	#$4000,$1C(a0)
		cmpi.w	#$160,$14(a0)
		bcs.s	locret_AFF6
		bset	#0,$C(a0)
		bset	#0,(byte_FF908C).w
		bset	#0,(byte_FF910C).w
		move.w	#$33,(word_FF90C0).w
		move.b	#1,(byte_FFFC04).w

locret_AFF6:
		rts

sub_AFF8:
		lea	off_B000(pc),a1
		jmp	j_jump_by_table1(pc) ; a0 = ?
off_B000:	dc.w sub_B004-off_B000
		dc.w sub_B024-off_B000

sub_B004:
		bset	#3,$C(a0)
		bset	#1,$D(a0)
		move.w	#$2061,$A(a0)
		move.l	#off_12E272,$20(a0)
		moveq	#0,d0
		jsr	sub_B7CE(pc)

sub_B024:
		lea	(word_FF9000).w,a1
		lea	stru_B04E(pc),a2

sub_B02C:
		move.w	6(a1),d0
		add.w	d0,d0
		add.w	d0,d0
		move.w	$10(a1),d1
		add.w	(a2,d0.w),d1
		move.w	d1,$10(a0)
		move.w	$14(a1),d1
		add.w	2(a2,d0.w),d1
		move.w	d1,$14(a0)
		rts

stru_B04E:	struc_19 $FFF7, $FFF2
		struc_19 $FFF7, $FFF2
		struc_19 $FFF7, $FFF2
		struc_19 6, $FFF0
		struc_19 0, $FFF0
		struc_19 $FFF7, $FFF1
		struc_19 $FFF7, $FFF1
		struc_19 $FFF7, $FFF1
		struc_19 8, $FFF1
		struc_19 1, $FFF0
stru_B076:	struc_19 $C, $FFE8
		struc_19 $C, $FFE8
		struc_19 $D, $FFEA
		struc_19 $D, $FFE5
		struc_19 $C, $FFEB
		struc_19 8, $FFEC
sub_B08E:
		lea	off_B0C4(pc),a1
		jsr	j_jump_by_table1(pc) ; a0 = ?
		cmpi.w	#5,2(a0)
		bcc.s	loc_B0B8
		move.w	(word_FF9050).w,$10(a0)
		move.w	(word_FF9054).w,$14(a0)
		addi.w	#$E,$10(a0)
		addi.w	#-$12,$14(a0)
		rts

loc_B0B8:
		lea	(word_FF9000).w,a1
		lea	stru_B076(pc),a2
		bra.w	sub_B02C

off_B0C4:	dc.w sub_B0D2-off_B0C4
		dc.w sub_B114-off_B0C4
		dc.w sub_B188-off_B0C4
		dc.w sub_B1A0-off_B0C4
		dc.w sub_B1C8-off_B0C4
		dc.w sub_B1F0-off_B0C4
		dc.w locret_B21A-off_B0C4
sub_B0D2:
		bset	#3,$C(a0)
		move.w	#$4061,$A(a0)
		move.l	#off_12E272,$20(a0)
		moveq	#2,d0
		jsr	sub_B7CE(pc)
		move.w	#$3C,$38(a0)
		move.b	#3,$30(a0)
		move.l	#$ACE04AE,(ram_palette_2+$14).w
		move.l	#$48E026E,(ram_palette_2+$18).w
		move.w	#$24E,(ram_palette_2+$1C).w
		move.b	#1,(cram_update_needed).w

sub_B114:
		jsr	sub_B740(pc)
		cmpi.b	#3,$30(a0)
		bne.s	loc_B126
		move.b	#$81,(smps_cmd2).w

loc_B126:
		subq.b	#1,$30(a0)
		beq.s	loc_B140
		bset	#2,$D(a0)
		move.w	#$3C,$38(a0)
		move.w	#2,2(a0)
		rts

loc_B140:
		moveq	#1,d0
		jsr	sub_B7CE(pc)
		move.w	#3,2(a0)
		move.w	#$4B0,(word_FFFC02).w
		move.l	a0,-(sp)
		lea	(nemesis_main_font).l,a0
		lea	(dword_FF6000).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		movea.l	(sp)+,a0
		move.w	#$1E0,$38(a0)
		move.l	#$17161514,d0
		trap	#5		; do_copy_4_palettes_to_ram
		lea	(ram_palette_0).w,a1
		lea	(unk_FFF600).w,a2
		jsr	copy_bytes_to_dest_128 ; a1 = source
		jmp	sub_B74A(pc)

sub_B188:
		jsr	sub_B740(pc)
		bclr	#2,$D(a0)
		move.w	#$A,$38(a0)
		move.w	#1,2(a0)
		rts

sub_B1A0:
		jsr	sub_B740(pc)
		move.w	#$1AE,$38(a0)
		move.w	#4,2(a0)
		move.l	#$2480228,(ram_palette_0+2).w
		move.l	#$2260224,(ram_palette_0+6).w
		move.b	#1,(cram_update_needed).w
		rts

sub_B1C8:
		jsr	sub_B740(pc)
		move.w	#$F0,$38(a0)
		move.l	#$46A0248,(ram_palette_0+2).w
		move.l	#$2260224,(ram_palette_0+6).w
		move.b	#1,(cram_update_needed).w
		move.w	#2,(word_FF9002).w
		rts

sub_B1F0:
		cmpi.w	#$60,$38(a0)
		bcc.s	loc_B1FC
		addq.w	#1,(word_FF9010).w

loc_B1FC:
		cmpi.w	#$40,$38(a0)
		bne.s	loc_B20A
		move.w	#$3A,(word_FF9100).w

loc_B20A:
		jsr	sub_B740(pc)
		move.w	#5,(word_FF9002).w
		move.w	#6,2(a0)

locret_B21A:
		rts

sub_B21C:
		lea	off_B224(pc),a1
		jmp	j_jump_by_table1(pc) ; a0 = ?

off_B224:	dc.w sub_B22C-off_B224
		dc.w sub_B274-off_B224
		dc.w sub_B2A6-off_B224
		dc.w sub_B2BE-off_B224
sub_B22C:
		bset	#3,$C(a0)
		bset	#1,$D(a0)
		move.w	#$A5C0,$A(a0)
		move.w	#$120,$10(a0)
		move.w	#$E8,$14(a0)
		move.w	#8,$38(a0)
		move.l	#off_21532,$20(a0)
		moveq	#$29,d0
		jsr	sub_B7CE(pc)
		lea	((ram_palette_0+2)).w,a1
		moveq	#6,d7

loc_B264:
		move.l	#0,(a1)+
		dbf	d7,loc_B264
		move.b	#1,(cram_update_needed).w

sub_B274:
		jsr	(sub_5FDC).l
		jsr	sub_B740(pc)
		move.b	#8,$D(a0)
		move.w	#$A061,$A(a0)
		move.l	#off_12E272,$20(a0)
		moveq	#3,d0
		jsr	sub_B7CE(pc)
		move.b	#$A,8(a0)
		move.w	#$3C,$38(a0)
		rts

sub_B2A6:
		jsr	sub_B740(pc)
		move.w	#$3C,$38(a0)
		move.w	#3,2(a0)
		bset	#2,$D(a0)
		rts

sub_B2BE:
		jsr	sub_B740(pc)
		bset	#0,$C(a0)
		move.w	#$34,(word_FF9000).w
		rts

sub_B2D0:
		lea	off_B2D8(pc),a1
		jmp	j_jump_by_table1(pc) ; a0 = ?

off_B2D8:	dc.w sub_B2EA-off_B2D8
		dc.w sub_B326-off_B2D8
		dc.w sub_B34E-off_B2D8
		dc.w sub_B376-off_B2D8
		dc.w sub_B39E-off_B2D8
		dc.w sub_B3C6-off_B2D8
		dc.w sub_B408-off_B2D8
		dc.w sub_B440-off_B2D8
		dc.w sub_B456-off_B2D8
sub_B2EA:
		move.b	#$18,$C(a0)
		move.w	#$E120,$A(a0)
		move.w	#$120,$10(a0)
		move.w	#$E8,$14(a0)
		move.l	#$8000,$1C(a0)
		move.l	#$18000,$18(a0)
		move.w	#$14,$38(a0)
		move.l	#off_12E272,$20(a0)
		moveq	#4,d0
		jsr	sub_B7CE(pc)

sub_B326:
		subq.w	#1,$38(a0)
		bhi.s	loc_B338
		addq.w	#1,2(a0)
		move.w	#$1E,$38(a0)
		rts

loc_B338:
		subi.l	#$CCC,$1C(a0)
		subi.l	#$AAA,$18(a0)
		jmp	sub_B88A

sub_B34E:
		subq.w	#1,$38(a0)
		bhi.s	loc_B360
		addq.w	#1,2(a0)
		move.w	#$14,$38(a0)
		rts

loc_B360:
		addi.l	#$CCC,$1C(a0)
		subi.l	#$CCC,$18(a0)
		jmp	sub_B88A

sub_B376:
		subq.w	#1,$38(a0)
		bhi.s	loc_B388
		addq.w	#1,2(a0)
		move.w	#$14,$38(a0)
		rts

loc_B388:
		subi.l	#$CCC,$1C(a0)
		subi.l	#$AAA,$18(a0)
		jmp	sub_B88A

sub_B39E:
		subq.w	#1,$38(a0)
		bhi.s	loc_B3B0
		move.w	#$32,$38(a0)
		addq.w	#1,2(a0)
		rts

loc_B3B0:
		subi.l	#$CCC,$1C(a0)
		addi.l	#$EEE,$18(a0)
		jmp	sub_B88A

sub_B3C6:
		subq.w	#1,$38(a0)
		cmpi.w	#$14,$38(a0)
		beq.s	loc_B3EA
		tst.w	$38(a0)
		bhi.s	loc_B3F2
		move.w	#$50,$38(a0)
		move.w	#0,(planeb_start_x).w
		addq.w	#1,2(a0)
		rts

loc_B3EA:
		moveq	#5,d0
		jmp	loc_B842

loc_B3F2:
		addi.l	#$AAA,$1C(a0)
		addi.l	#$CCC,$18(a0)
		jmp	sub_B88A

sub_B408:
		subq.w	#1,$38(a0)
		bhi.s	loc_B42A
		addq.w	#1,2(a0)
		bset	#2,$D(a0)
		move.w	#$14,$38(a0)
		jsr	sub_ABEA(pc)
		move.b	#1,(byte_FFFC00).w
		rts

loc_B42A:
		subi.l	#$AAA,$1C(a0)
		addi.l	#$CCC,$18(a0)
		jmp	sub_B88A

sub_B440:
		addi.w	#$10,(planeb_start_x).w
		jsr	sub_B740(pc)
		addq.w	#1,2(a0)
		move.w	#$3C,$38(a0)
		rts

sub_B456:
		jsr	sub_B740(pc)
		move.w	#$64,$38(a0)
		move.w	#$36,(word_FF9080).w
		bset	#0,$C(a0)
		rts

nullsub_9:
		rts

sub_B470:
		lea	off_B47E(pc),a1
		jsr	j_jump_by_table1(pc) ; a0 = ?
		jmp	(sub_5FDC).l

off_B47E:	dc.w sub_B486-off_B47E
		dc.w sub_B4CA-off_B47E
		dc.w sub_B4EC-off_B47E
		dc.w locret_B4FC-off_B47E
sub_B486:
		move.b	#$18,$C(a0)
		bset	#1,$D(a0)
		move.w	#$40,$10(a0)
		move.w	#$140,$14(a0)
		move.w	#$25C0,$A(a0)
		move.l	#off_21532,$20(a0)
		moveq	#3,d0
		jsr	sub_B7CE(pc)
		move.w	#$3C,$38(a0)
		move.b	#1,(byte_FFFC00).w
		move.w	#0,(planea_start_x).w
		move.w	#0,(planea_start_y).w

sub_B4CA:
		addq.w	#2,$10(a0)
		jsr	sub_B740(pc)
		move.b	#8,$D(a0)
		moveq	#$13,d0
		jsr	sub_B7CE(pc)
		move.w	#$1E,$38(a0)
		move.w	#$37,(word_FF90C0).w
		rts

sub_B4EC:
		jsr	sub_B740(pc)
		move.b	#2,$D(a0)
		moveq	#$1B,d0
		jsr	sub_B7CE(pc)

locret_B4FC:
		rts

sub_B4FE:
		lea	off_B506(pc),a1
		jmp	j_jump_by_table1(pc) ; a0 = ?

off_B506:	dc.w sub_B50C-off_B506
		dc.w sub_B560-off_B506
		dc.w sub_B580-off_B506
sub_B50C:
		move.b	#$18,$C(a0)
		bset	#1,$D(a0)
		move.w	#$C0,$10(a0)
		move.w	#$118,$14(a0)
		move.l	#$3CCCC,$18(a0)
		move.l	#$26666,$1C(a0)
		neg.l	$1C(a0)
		move.w	#$410,$A(a0)
		move.l	#off_2BDF0,$20(a0)
		moveq	#1,d0
		jsr	sub_B7CE(pc)
		move.w	#4,6(a0)
		move.w	#$1E,$38(a0)
		move.l	#$17161519,d0
		trap	#5		; do_copy_4_palettes_to_ram

sub_B560:
		jsr	sub_B88A
		jsr	sub_B740(pc)
		move.b	#0,$D(a0)
		moveq	#1,d0
		jsr	sub_B7CE(pc)
		move.w	#$78,$38(a0)
		jmp	sub_AA72(pc)

sub_B580:
		jsr	sub_B740(pc)
		bset	#0,$C(a0)
		move.w	#$38,(word_FF9100).w
		move.w	#$39,(word_FF9140).w
		move.l	a0,-(sp)
		moveq	#$1A,d0
		trap	#1		; do_decompress_nemesis_to_vram
		movea.l	(sp)+,a0
		rts

sub_B5A0:
		lea	off_B5A8(pc),a1
		jmp	j_jump_by_table1(pc) ; a0 = ?

off_B5A8:	dc.w sub_B5AE-off_B5A8
		dc.w sub_B5E0-off_B5A8
		dc.w locret_B5F0-off_B5A8
sub_B5AE:
		move.b	#$18,$C(a0)
		move.w	#$200,$10(a0)
		move.w	#$118,$14(a0)
		move.w	#$FFFE,$18(a0)
		move.w	#$2000,$A(a0)
		move.l	#off_12E272,$20(a0)
		moveq	#6,d0
		jsr	sub_B7CE(pc)
		move.w	#$90,$38(a0)

sub_B5E0:
		jsr	sub_B88A
		jsr	sub_B740(pc)
		move.w	#2,2(a0)

locret_B5F0:
		rts

sub_B5F2:
		lea	off_B5FE(pc),a1
		jsr	j_jump_by_table1(pc) ; a0 = ?
		bra.w	sub_B6DE
off_B5FE:	dc.w sub_B606-off_B5FE
		dc.w sub_B62A-off_B5FE
		dc.w load_press_start_button_mapping-off_B5FE
		dc.w sub_B6BE-off_B5FE

sub_B606:
		move.b	#$18,$C(a0)
		move.w	#$FFFE,$18(a0)
		move.w	#$40AA,$A(a0)
		move.l	#off_12E272,$20(a0)
		moveq	#7,d0
		jsr	sub_B7CE(pc)
		jsr	sub_A7A6(pc)

sub_B62A:
		cmpi.w	#2,(word_FF9102).w
		bne.s	locret_B676
		move.l	a0,-(sp)
		lea	(nemesis_main_font).l,a0
		lea	(M68K_RAM).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		move.l	#$40200002,(a5)
		lea	(M68K_RAM).l,a1
		lea	(VDP_DATA).l,a2
		move.w	#$1C7,d7

loc_B65C:
		move.l	(a1)+,(a2)
		dbf	d7,loc_B65C
		movea.l	(sp)+,a0
		move.w	#2,2(a0)
		move.w	#1,$38(a0)
		move.b	#1,(byte_FFFC05).w

locret_B676:
		rts

load_press_start_button_mapping:
		jsr	sub_B740(pc)
		move.w	#$1E,$38(a0)
		move.w	#3,2(a0)
		move.l	#$54160003,(a5)
		lea	press_start_button_mapping(pc),a1
		move.l	(a1)+,(a6)
		jmp	copy_words_16	; a1 = source

press_start_button_mapping:dc.w	$A53A, $A53B, $A53C, $A53D, $A53D, 0, $A53D, $A53E, $A53F
		dc.w $A53B, $A53E, 0, $A540, $A541, $A53E, $A53E, $A542, $A543
sub_B6BE:
		jsr	sub_B740(pc)
		move.w	#$1E,$38(a0)
		move.w	#2,2(a0)
		move.l	#$54160003,(a5)
		moveq	#0,d1
		move.l	d1,(a6)
		jmp	fill_vram_16_words ; d1	= word|word

sub_B6DE:
		move.w	(word_FF9110).w,$10(a0)
		addi.w	#$76,$10(a0)
		move.w	(word_FF9114).w,$14(a0)
		addi.w	#-$A,$14(a0)
		rts

sub_B6F8:
		lea	off_B700(pc),a1
		jmp	j_jump_by_table1(pc) ; a0 = ?

off_B700:	dc.w sub_B706-off_B700
		dc.w sub_B732-off_B700
		dc.w locret_B73E-off_B700
sub_B706:
		move.b	#$18,$C(a0)
		move.w	#$40F0,$A(a0)
		move.w	#$1E0,$10(a0)
		move.w	#$108,$14(a0)
		move.l	#off_12E272,$20(a0)
		move.w	#$40,$38(a0)
		moveq	#8,d0
		jsr	sub_B7CE(pc)

sub_B732:
		subq.w	#1,$10(a0)
		bsr.s	sub_B740
		move.w	#2,2(a0)

locret_B73E:
		rts

sub_B740:
		subq.w	#1,$38(a0)
		beq.s	locret_B748
		move.l	(sp)+,d0

locret_B748:
		rts

sub_B74A:
		move.b	#1,(byte_FFFC01).w
		moveq	#$F,d4
		moveq	#$F,d6
		moveq	#$F,d0

loc_B756:
		lea	(unk_FFF600).w,a1
		lea	(ram_palette_0).w,a2
		jsr	copy_bytes_to_dest_128 ; a1 = source
		bsr.s	sub_B78A
		moveq	#2,d5

loc_B768:
		jsr	wait_for_vblank
		dbf	d5,loc_B768
		subq.w	#1,d0
		dbf	d6,loc_B756
		move.b	#0,(byte_FFFC01).w
		rts

sub_B780:
		lea	(ram_palette_3).w,a1
		moveq	#4,d5
		moveq	#$F,d7
		bra.s	loc_B792

sub_B78A:
		lea	(ram_palette_0).w,a1
		moveq	#4,d5
		moveq	#$3F,d7

loc_B792:
		move.w	(a1),d1
		move.w	d1,d2
		lsr.w	d5,d2
		move.w	d2,d3
		lsr.w	d5,d3
		and.w	d4,d1
		and.w	d4,d2
		and.w	d4,d3
		sub.w	d0,d1
		bcc.s	loc_B7A8
		moveq	#0,d1

loc_B7A8:
		sub.w	d0,d2
		bcc.s	loc_B7AE
		moveq	#0,d2

loc_B7AE:
		sub.w	d0,d3
		bcc.s	loc_B7B4
		moveq	#0,d3

loc_B7B4:
		lsl.w	d5,d3
		or.w	d2,d3
		lsl.w	d5,d3
		or.w	d1,d3
		andi.w	#$EEE,d3
		move.w	d3,(a1)+
		dbf	d7,loc_B792
		move.b	#1,(cram_update_needed).w
		rts
sub_B7CE:
		jmp	sub_B83E
; a0 = ?
; a1 = funcs table
j_jump_by_table1:
		jmp	jump_by_table1	; a0 = ?
; a0 = ?
; a1 = funcs table

jump_by_table2:
		moveq	#0,d0
		move.w	2(a0),d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		movea.l	d0,a1
		jmp	(a1)
; a0 = ?
; a1 = funcs table

jump_by_table1:
		move.w	2(a0),d0
		add.w	d0,d0
		adda.w	(a1,d0.w),a1
		jmp	(a1)

sub_B7F6:
		bset	#6,$C(a0)

loc_B7FC:
		tst.w	$2E(a0)
		beq.s	loc_B820
		moveq	#$FFFFFFFF,d0
		move.w	$2E(a0),d0
		movea.l	d0,a1
		clr.b	(a1)
		btst	#5,-3(a1)
		beq.s	loc_B820
		bclr	#6,$C(a0)
		bne.s	loc_B820
		subq.b	#1,1(a1)

loc_B820:
		movea.l	a0,a1
		moveq	#0,d1
		bra.w	fill_ram_64_bytes ; d1 = dword

sub_B828:
		moveq	#$4A,d7
		lea	(word_FF9000).w,a1

loc_B82E:
		bsr.s	sub_B838
		dbf	d7,loc_B82E
		lea	(word_FFA300).w,a1

sub_B838:
		moveq	#0,d1
		jmp	fill_ram_128_bytes(pc) ; d1 = dword

sub_B83E:
		addq.w	#1,2(a0)

loc_B842:
		move.w	d0,4(a0)
		moveq	#0,d0
		move.w	d0,6(a0)
		move.b	d0,8(a0)
		rts

sub_B852:
		moveq	#0,d0
		bra.s	sub_B83E

sub_B856:
		moveq	#2,d0
		bra.s	sub_B83E

sub_B85A:
		moveq	#4,d0
		bra.s	sub_B83E

sub_B85E:
		moveq	#6,d0
		bra.s	sub_B83E

sub_B862:
		moveq	#8,d0
		bra.s	sub_B83E

sub_B866:
		moveq	#$A,d0
		bra.s	sub_B83E

sub_B86A:
		moveq	#$C,d0
		bra.s	sub_B83E

sub_B86E:
		moveq	#0,d0
		bra.s	loc_B842

sub_B872:
		moveq	#2,d0
		bra.s	loc_B842

sub_B876:
		moveq	#4,d0
		bra.s	loc_B842

sub_B87A:
		moveq	#6,d0
		bra.s	loc_B842

sub_B87E:
		moveq	#8,d0
		bra.s	loc_B842

sub_B882:
		moveq	#$A,d0
		bra.s	loc_B842

sub_B886:
		moveq	#$C,d0
		bra.s	loc_B842

sub_B88A:
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		rts

sub_B89C:
		bsr.s	sub_B8A4
		move.l	d4,d3
		addi.w	#$C0,d1

sub_B8A4:
		move.w	d1,d7
		andi.w	#$7F,d7
		bclr	#6,d7
		beq.s	loc_B8B6
		neg.w	d7
		addi.w	#$40,d7

loc_B8B6:
		add.w	d7,d7
		move.w	word_B8C6(pc,d7.w),d4
		mulu.w	d2,d4
		tst.b	d1
		bpl.s	locret_B8C4
		neg.l	d4

locret_B8C4:
		rts

word_B8C6:	dc.w 0,	$648, $C90, $12D5, $1918, $1F56, $2590,	$2BC4, $31F1, $3817
		dc.w $3E34, $4447, $4A50, $504D, $563E,	$5C22, $61F8, $67BE, $6D74, $731A
		dc.w $78AD, $7E2F, $839C, $88F6, $8E3A,	$9368, $9880, $9D80, $A268, $A736
		dc.w $ABEB, $B086, $B505, $B968, $BDAF,	$C1D8, $C5E4, $C9D1, $CD9F, $D14D
		dc.w $D4DB, $D848, $DB94, $DEBE, $E1C6,	$E4AA, $E76C, $EA0A, $EC83, $EED9
		dc.w $F109, $F314, $F4FA, $F6BA, $F854,	$F9C8, $FB15, $FC3B, $FD3B, $FE13
		dc.w $FEC4, $FF4E, $FFB1, $FFEC, $FFFF
sub_B948:
		jsr	sub_BB60(pc)
		jsr	sub_BB72(pc)
		jmp	sub_BBA8(pc)

sub_B954:
		jsr	sub_BB84(pc)
		jsr	sub_BB96(pc)
		jmp	sub_BBA8(pc)

sub_B960:
		moveq	#0,d7
		tst.b	(byte_FFEE09).w
		bne.s	locret_B978
		tst.b	(byte_FFEE08).w
		bne.s	locret_B978
		jsr	sub_BB60(pc)
		jsr	sub_BC04(pc)
		bne.s	loc_B994

locret_B978:
		rts

loc_B97A:
		moveq	#0,d7
		tst.b	(byte_FFEE09).w
		bne.s	locret_B992
		tst.b	(byte_FFEE08).w
		bne.s	locret_B992
		jsr	sub_BB84(pc)
		jsr	sub_BC04(pc)
		bne.s	loc_B994

locret_B992:
		rts

loc_B994:
		tst.b	(byte_FFEE62).w
		bne.s	loc_B9A0
		st	(byte_FFEE09).w
		rts

loc_B9A0:
		move.b	#$FF,$F(a0)
		rts

sub_B9A8:
		jsr	sub_BB60(pc)
		jmp	sub_BC04(pc)

sub_B9B0:
		jsr	sub_BB84(pc)
		jmp	sub_BC04(pc)

sub_B9B8:
		tst.b	(byte_FFEE62).w
		beq.s	loc_B9D2
		jsr	sub_B960(pc)
		tst.b	$F(a0)
		beq.w	loc_B9D2
		lea	(unk_FFA360).w,a1
		bra.w	loc_BA62

loc_B9D2:
		jsr	sub_BB60(pc)
		lea	(unk_FF9C00).w,a1
		moveq	#$A,d6

loc_B9DC:
		tst.w	(a1)
		beq.s	loc_B9F6
		btst	#4,$E(a1)
		beq.s	loc_B9F6
		move.l	a3,-(sp)
		jsr	sub_BB72(pc)
		jsr	sub_BBA8(pc)
		bne.s	loc_BA4C
		movea.l	(sp)+,a3

loc_B9F6:
		lea	$40(a1),a1
		dbf	d6,loc_B9DC
		moveq	#0,d7
		rts

loc_BA02:
		tst.b	(byte_FFEE62).w
		beq.s	loc_BA1C
		jsr	loc_B97A(pc)
		tst.b	$F(a0)
		beq.w	loc_BA1C
		lea	(unk_FFA360).w,a1
		bra.w	loc_BA62

loc_BA1C:
		jsr	sub_BB84(pc)
		lea	(unk_FF9C00).w,a1
		moveq	#$A,d6

loc_BA26:
		tst.w	(a1)
		beq.s	loc_BA40
		btst	#4,$E(a1)
		beq.s	loc_BA40
		move.l	a3,-(sp)
		jsr	sub_BB96(pc)
		jsr	sub_BBA8(pc)
		bne.s	loc_BA4C
		movea.l	(sp)+,a3

loc_BA40:
		lea	$40(a1),a1
		dbf	d6,loc_BA26
		moveq	#0,d7
		rts

loc_BA4C:
		movea.l	(sp)+,a3
		move.w	0.w(a1),d7
		cmpi.w	#$62,d7
		bhi.s	loc_BA62
		move.b	#1,$F(a0)
		moveq	#1,d7
		rts

loc_BA62:
		move.b	#$FF,$F(a0)
		moveq	#1,d7
		rts

sub_BA6C:
		lea	(word_FF8FC0).w,a1
		moveq	#$3E,d7

loc_BA72:
		lea	$40(a1),a1
		tst.b	$E(a1)
		bpl.s	loc_BA8A
		movem.l	d1-d2/d7-a1,-(sp)
		jsr	sub_BAAC(pc)
		movem.l	(sp)+,d1-d2/d7-a1
		bne.s	loc_BA92

loc_BA8A:
		dbf	d7,loc_BA72
		moveq	#0,d7
		rts

loc_BA92:
		btst	#5,$E(a1)
		bne.s	loc_BA9E
		moveq	#$FFFFFFFF,d7
		rts

loc_BA9E:
		moveq	#1,d7
		rts

sub_BAA2:
		add.w	$14(a0),d1
		add.w	$10(a0),d2
		bra.s	loc_BABA

sub_BAAC:
		add.w	$14(a0),d1
		add.w	$10(a0),d2

sub_BAB4:
		jsr	sub_BB72(pc)
		bra.s	loc_BABE

loc_BABA:
		jsr	sub_BB96(pc)

loc_BABE:
		move.w	$14(a1),d5
		move.b	(a4)+,d7
		ext.w	d7
		add.w	d7,d5
		cmp.w	d5,d1
		bcs.s	loc_BAF2
		move.b	(a4)+,d7
		ext.w	d7
		add.w	d7,d5
		cmp.w	d1,d5
		bcs.s	loc_BAF2
		move.w	$10(a1),d5
		move.b	(a4)+,d7
		ext.w	d7
		add.w	d7,d5
		cmp.w	d5,d2
		bcs.s	loc_BAF2
		move.b	(a4)+,d7
		ext.w	d7
		add.w	d7,d5
		cmp.w	d2,d5
		bcs.s	loc_BAF2
		moveq	#1,d7
		rts

loc_BAF2:
		moveq	#0,d7
		rts

sub_BAF6:
		add.w	$14(a0),d1
		ble.s	loc_BB28
		move.w	(word_FF8508).w,d4
		addi.w	#$D0,d4
		cmp.w	d4,d1
		bcc.s	loc_BB28
		add.w	$10(a0),d2
		bmi.s	loc_BB28
		move.w	(word_FF8500).w,d4
		addi.w	#$140,d4
		cmp.w	d4,d2
		bcc.s	loc_BB28
		bsr.s	sub_BB2C
		moveq	#0,d7
		lea	(some_mapping_array).w,a2
		move.b	(a2,d4.w),d7
		rts

loc_BB28:
		moveq	#0,d7
		rts

sub_BB2C:
		move.w	d2,d4
		move.w	d1,d5
		movea.l	(dword_FF8510).w,a2
		asr.w	#8,d4
		asr.w	#8,d5
		asl.w	#5,d5
		add.w	d5,d4
		move.b	(a2,d4.w),d4
		movea.l	(dword_FF8514).w,a2
		lsl.w	#8,d4
		move.w	d2,d5
		lsr.w	#4,d5
		andi.w	#$F,d5
		add.w	d4,d5
		move.w	d1,d4
		andi.w	#$F0,d4
		add.w	d4,d5
		moveq	#0,d4
		move.b	(a2,d5.w),d4
		rts

sub_BB60:
		moveq	#0,d0
		move.b	$24(a0),d0
		lsl.w	#2,d0
		lea	(stru_13D670).l,a3
		adda.w	d0,a3
		rts

sub_BB72:
		moveq	#0,d0
		move.b	$24(a1),d0
		lsl.w	#2,d0
		lea	(stru_13D670).l,a4
		adda.w	d0,a4
		rts

sub_BB84:
		moveq	#0,d0
		move.b	$25(a0),d0
		lsl.w	#2,d0
		lea	(stru_13D670).l,a3
		adda.w	d0,a3
		rts

sub_BB96:
		moveq	#0,d0
		move.b	$25(a1),d0
		lsl.w	#2,d0
		lea	(stru_13D670).l,a4
		adda.w	d0,a4
		rts

sub_BBA8:
		move.w	$14(a0),d0
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		move.w	$14(a1),d1
		move.b	(a4)+,d7
		ext.w	d7
		add.w	d7,d1
		move.w	d1,d2
		move.b	(a4)+,d7
		ext.w	d7
		add.w	d7,d2
		cmp.w	d2,d0
		bhi.s	loc_BC00
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		cmp.w	d1,d0
		bcs.s	loc_BC00
		move.w	$10(a0),d0
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		move.w	$10(a1),d1
		move.b	(a4)+,d7
		ext.w	d7
		add.w	d7,d1
		move.w	d1,d2
		move.b	(a4)+,d7
		ext.w	d7
		add.w	d7,d2
		cmp.w	d2,d0
		bhi.s	loc_BC00
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		cmp.w	d1,d0
		bcs.s	loc_BC00
		moveq	#1,d7
		rts

loc_BC00:
		moveq	#0,d7
		rts

sub_BC04:
		lea	(word_FF8F54).w,a1
		move.w	(a1)+,d2
		move.w	(a1)+,d3
		move.w	(a1)+,d4
		move.w	(a1)+,d5

sub_BC10:
		move.w	$14(a0),d0
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		cmp.w	d3,d0
		bhi.s	loc_BC44
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		cmp.w	d2,d0
		bcs.s	loc_BC44
		move.w	$10(a0),d0
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		cmp.w	d5,d0
		bhi.s	loc_BC44
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		cmp.w	d4,d0
		bcs.s	loc_BC44
		moveq	#1,d7
		rts

loc_BC44:
		moveq	#0,d7
		rts

sub_BC48:
		lea	(word_FF8F54).w,a1
		jsr	sub_BB60(pc)
		bsr.s	sub_BC56
		jsr	sub_BB84(pc)

sub_BC56:
		move.w	$14(a0),d0
		bsr.s	sub_BC60
		move.w	$10(a0),d0

sub_BC60:
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		move.w	d0,(a1)+
		move.b	(a3)+,d7
		ext.w	d7
		add.w	d7,d0
		move.w	d0,(a1)+
		rts

sub_BC72:
		move.w	(level_main_index).w,d0
		add.w	d0,d0
		move.w	off_BCAC(pc,d0.w),d0
		lea	off_BCAC(pc,d0.w),a1
		move.w	(level_sub_index).w,d0
		add.w	d0,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d7
		move.w	2(a1,d0.w),d0
		adda.w	d0,a1

loc_BC92:
		move.w	(a1)+,d0
		cmp.w	0.w(a0),d0
		beq.s	loc_BCA2
		addq.w	#4,a1
		dbf	d7,loc_BC92
		rts

loc_BCA2:
		move.w	(a1)+,$A(a0)
		move.w	(a1)+,$34(a0)
		rts

off_BCAC:	dc.w stru_BCC0-off_BCAC
		dc.w stru_BCC0-off_BCAC
		dc.w stru_BD98-off_BCAC
		dc.w stru_BE44-off_BCAC
		dc.w stru_BF0E-off_BCAC
		dc.w stru_C04E-off_BCAC
		dc.w stru_C154-off_BCAC
		dc.w stru_C1D8-off_BCAC
		dc.w stru_C2AA-off_BCAC
		dc.w stru_C396-off_BCAC
stru_BCC0:	struc_BCC0 14,	stru_BCCC-stru_BCC0
		struc_BCC0 12,	stru_BD26-stru_BCC0
		struc_BCC0 5, stru_BD74-stru_BCC0
stru_BCCC:	struc_30 2, $83C0, 0
		struc_30 3, $8400, $C8
		struc_30 6, $8400, 0
		struc_30 4, $247F, 0
		struc_30 5, $847F, 0
		struc_30 $D, $84AB, $C8
		struc_30 $E, $84AB, 0
		struc_30 $1A, $84AB, 0
		struc_30 $10, $A4F1, $C8
		struc_30 $14, $A4F1, 0
		struc_30 $15, $C505, 0
		struc_30 $17, $50D, 0
		struc_30 $16, $C522, 0
		struc_30 $19, $8532, $12C
		struc_30 $63, $8300, 0
stru_BD26:	struc_30 2, $83C0, 0
		struc_30 3, $A400, $C8
		struc_30 6, $8400, 0
		struc_30 $D, $847F, $C8
		struc_30 $E, $847F, 0
		struc_30 $1A, $847F, 0
		struc_30 7, $A4C5, 0
		struc_30 9, $A4C5, 0
		struc_30 $A, $A4C5, 0
		struc_30 8, $84E6, 0
		struc_30 $19, $8510, $12C
		struc_30 $17, $552, 0
		struc_30 $63, $8300, 0
stru_BD74:	struc_30 7, $A400, 0
		struc_30 9, $A400, 0
		struc_30 $A, $A400, 0
		struc_30 8, $A458, 0
		struc_30 $18, $647E, 0
		struc_30 $40, $492, 0
stru_BD98:	struc_BD98 10,	stru_BDA8-stru_BD98
		struc_BD98 9, stru_BDEA-stru_BD98
		struc_BD98 9, stru_BDEA-stru_BD98
		struc_BD98 4, stru_BE26-stru_BD98
stru_BDA8:	struc_30 2, $83C0, 0
		struc_30 $C, $400, $C8
		struc_30 $12, $2420, $C8
		struc_30 $13, $2420, 0
		struc_30 $B, $442, $C8
		struc_30 $F, $442, 0
		struc_30 $D, $844F, $C8
		struc_30 $E, $844F, 0
		struc_30 $1A, $844F, 0
		struc_30 3, $2495, $C8
		struc_30 6, $495, 0
stru_BDEA:	struc_30 2, $83C0, 0
		struc_30 3, $2400, $C8
		struc_30 6, $400, 0
		struc_30 $D, $A47F, $C8
		struc_30 $E, $847F, 0
		struc_30 $1A, $847F, 0
		struc_30 $19, $84C5, $12C
		struc_30 $1E, $507, 0
		struc_30 $1F, $507, 0
		struc_30 $21, $451C, 0
stru_BE26:	struc_30 $11, $400, $64
		struc_30 $1B, $40F, 0
		struc_30 $1C, $240F, $190
		struc_30 $1D, $40F, 0
		struc_30 $63, $300, 0
stru_BE44:	struc_BE44 4, stru_BE60-stru_BE44
		struc_BE44 6, stru_BE7E-stru_BE44
		struc_BE44 5, stru_BEA8-stru_BE44
		struc_BE44 8, stru_BECC-stru_BE44
		struc_BE44 8, stru_BECC-stru_BE44
		struc_BE44 8, stru_BECC-stru_BE44
		struc_BE44 1, stru_BF02-stru_BE44
stru_BE60:	struc_30 2, $83C0, 0
		struc_30 $2D, $A400, $C8
		struc_30 $2E, $47F, 0
		struc_30 $2C, $848B, $C8
		struc_30 $20, $C4B7, 0
stru_BE7E:	struc_30 $2C, $8400, $C8
		struc_30 $23, $842C, $12C
		struc_30 $24, $842C, 0
		struc_30 $2B, $C473, 0
		struc_30 $25, $A48E, 0
		struc_30 $29, $4BB, 0
		struc_30 $2A, $C4C7, 0
stru_BEA8:	struc_30 $23, $400, $C8
		struc_30 $24, $400, 0
		struc_30 $2B, $4447, 0
		struc_30 $26, $2462, 0
		struc_30 $27, $2462, 0
		struc_30 $28, $2473, 0
stru_BECC:	struc_30 $2C, $8400, $C8
		struc_30 $23, $42C, $12C
		struc_30 $24, $42C, 0
		struc_30 $2B, $C473, 0
		struc_30 $4F, $A48E, 0
		struc_30 $4E, $A4CB, 0
		struc_30 $25, $A4CB, 0
		struc_30 $29, $4F7, 0
		struc_30 $2A, $C503, 0
stru_BF02:	struc_30 $70, $242C, 0
		struc_30 $71, $400, $C8
stru_BF0E:	struc_BF0E 13,	stru_BF22-stru_BF0E
		struc_BF0E 13,	stru_BF76-stru_BF0E
		struc_BF0E 0, stru_BFCA-stru_BF0E
		struc_BF0E 10,	stru_BFD0-stru_BF0E
		struc_BF0E 9, stru_C012-stru_BF0E
stru_BF22:	struc_30 2, $83C0, 0
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 3, $400, $C8
		struc_30 $7E, $400, $C8
		struc_30 6, $400, 0
		struc_30 $D, $847F, $C8
		struc_30 $7C, $847F, $C8
		struc_30 $E, $847F, 0
		struc_30 $1A, $847F, 0
		struc_30 $55, $24C5, $C8
		struc_30 $56, $4C5, 0
		struc_30 $3E, $4505, 0
		struc_30 $3D, $4505, 0
stru_BF76:	struc_30 2, $83C0, 0
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 3, $400, $C8
		struc_30 $7E, $A400, $C8
		struc_30 6, $400, 0
		struc_30 $D, $847F, $C8
		struc_30 $7C, $847F, $C8
		struc_30 $E, $847F, 0
		struc_30 $1A, $847F, 0
		struc_30 $46, $24C5, 0
		struc_30 $47, $24C5, 0
		struc_30 $78, $44DD, 0
		struc_30 $63, $350, 0
stru_BFCA:	struc_30 $44, $3C0, 0
stru_BFD0:	struc_30 2, $83C0, 0
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 3, $400, $C8
		struc_30 $7E, $A400, $C8
		struc_30 6, $400, 0
		struc_30 $57, $47F, $1F4
		struc_30 $55, $525, $C8
		struc_30 $56, $525, 0
		struc_30 $25, $A565, 0
		struc_30 $63, $8300, 0
stru_C012:	struc_30 $90, $3C0, 0
		struc_30 $91, $3C0, 0
		struc_30 $92, $3C0, 0
		struc_30 $93, $3C0, 0
		struc_30 $94, $3C0, 0
		struc_30 $95, $3C0, 0
		struc_30 $96, $3C0, 0
		struc_30 $97, $3C0, 0
		struc_30 $98, $3C0, 0
		struc_30 $99, $3C0, 0
stru_C04E:	struc_C04E 11,	stru_C05E-stru_C04E
		struc_C04E 13,	stru_C100-stru_C04E
		struc_C04E 14,	stru_C0A6-stru_C04E
		struc_C04E 13,	stru_C100-stru_C04E
stru_C05E:	struc_30 2, $83C0, 0
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 $4D, $2400, $C8
		struc_30 $7F, $A400, $C8
		struc_30 6, $400, 0
		struc_30 $4C, $A47F, $C8
		struc_30 $7D, $A47F, $C8
		struc_30 $E, $847F, 0
		struc_30 $1A, $847F, 0
		struc_30 $4B, $4C5, $12C
		struc_30 $74, $4504, 0
stru_C0A6:	struc_30 2, $83C0, 0
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 $4D, $2400, $C8
		struc_30 $7F, $A400, $C8
		struc_30 6, $400, 0
		struc_30 $4C, $847F, $C8
		struc_30 $7D, $847F, $C8
		struc_30 $48, $47F, $C8
		struc_30 $E, $847F, 0
		struc_30 $1A, $847F, 0
		struc_30 $4B, $4C5, $12C
		struc_30 $4A, $2504, $190
		struc_30 $3B, $454C, 0
		struc_30 $3C, $454C, 0
stru_C100:	struc_30 2, $83C0, 0
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 $4D, $2400, $C8
		struc_30 $7F, $A400, $C8
		struc_30 6, $400, 0
		struc_30 $4C, $A47F, $C8
		struc_30 $7D, $A47F, $C8
		struc_30 $E, $847F, 0
		struc_30 $1A, $847F, 0
		struc_30 $48, $847F, $C8
		struc_30 $57, $4C5, $1F4
		struc_30 $3F, $856B, $12C
		struc_30 $4B, $5B4, $12C
stru_C154:	struc_C154 6, stru_C17E-stru_C154
		struc_C154 0, stru_C178-stru_C154
		struc_C154 6, stru_C1A8-stru_C154
		struc_C154 6, stru_C1A8-stru_C154
		struc_C154 6, stru_C1A8-stru_C154
		struc_C154 6, stru_C1A8-stru_C154
		struc_C154 6, stru_C1A8-stru_C154
		struc_C154 6, stru_C1A8-stru_C154
		struc_C154 0, stru_C1D2-stru_C154
stru_C178:	struc_30 $43, $83C0, 0
stru_C17E:	struc_30 2, $83C0, 0
		struc_30 $45, $2400, $C8
		struc_30 6, $8400, 0
		struc_30 $52, $847F, $12C
		struc_30 $53, $847F, 0
		struc_30 $54, $847F, 0
		struc_30 $19, $84D3, $12C
stru_C1A8:	struc_30 2, $83C0, 0
		struc_30 $45, $2400, $C8
		struc_30 6, $400, 0
		struc_30 $52, $47F, $12C
		struc_30 $53, $47F, 0
		struc_30 $54, $47F, 0
		struc_30 $19, $4D3, $12C
stru_C1D2:	struc_30 2, $83C0, 0
stru_C1D8:	struc_C1D8 14,	stru_C1F0-stru_C1D8
		struc_C1D8 6, stru_C256-stru_C1D8
		struc_C1D8 2, stru_C280-stru_C1D8
		struc_C1D8 2, stru_C292-stru_C1D8
		struc_C1D8 1, stru_C24A-stru_C1D8
		struc_C1D8 1, stru_C29E-stru_C1D8
stru_C1F0:	struc_30 2, $83C0, 0
		struc_30 $45, $2400, $C8
		struc_30 6, $400, 0
		struc_30 $D, $847F, $C8
		struc_30 $E, $847F, 0
		struc_30 $1A, $847F, 0
		struc_30 $19, $84C5, $12C
		struc_30 $C, $507, $C8
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 $7C, $847F, $C8
		struc_30 $7D, $847F, $C8
		struc_30 $7E, $8400, $C8
		struc_30 $7F, $8400, $C8
		struc_30 $8F, $527, 0
stru_C24A:	struc_30 $63, $8300, 0
		struc_30 $CA, $8300, 0
stru_C256:	struc_30 $1B, $400, 0
		struc_30 $79, $2400, $12C
		struc_30 $1D, $400, 0
		struc_30 $8F, $44A, 0
		struc_30 $8D, $C45A, $C8
		struc_30 $75, $C48A, 0
		struc_30 $63, $300, 0
stru_C280:	struc_30 $1B, $8400, 0
		struc_30 $75, $C44A, 0
		struc_30 $76, $8400, 0
stru_C292:	struc_30 $73, $464, 0
		struc_30 $77, $464, 0
stru_C29E:	struc_30 $8E, $C400, 0
		struc_30 $76, $840C, 0
stru_C2AA:	struc_C2AA 12,	stru_C2BE-stru_C2AA
		struc_C2AA 12,	stru_C2BE-stru_C2AA
		struc_C2AA 4, stru_C30C-stru_C2AA
		struc_C2AA 12,	stru_C32A-stru_C2AA
		struc_C2AA 4, stru_C378-stru_C2AA
stru_C2BE:	struc_30 2, $83C0, 0
		struc_30 $D, $A400, $C8
		struc_30 $E, $8400, 0
		struc_30 $1A, $8400, 0
		struc_30 $7C, $8400, $C8
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 $B3, $8400, $C8
		struc_30 $72, $8446, 0
		struc_30 $8B, $8455, $C8
		struc_30 $8C, $248B, $C8
		struc_30 $88, $44AB, 0
		struc_30 $86, $44C0, 0
stru_C30C:	struc_30 2, $83C0, 0
		struc_30 $7E, $8400, $C8
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 $89, $47F, 0
stru_C32A:	struc_30 2, $83C0, 0
		struc_30 3, $8400, $C8
		struc_30 6, $8400, 0
		struc_30 $7E, $8400, $C8
		struc_30 $7C, $847F, $C8
		struc_30 $7A, $83E0, 0
		struc_30 $7B, $83E0, 0
		struc_30 $19, $84C5, $12C
		struc_30 $57, $2507, $1F4
		struc_30 7, $A5AD, 0
		struc_30 9, $A5AD, 0
		struc_30 $A, $A5AD, 0
		struc_30 $8A, $5CE, 0
stru_C378:	struc_30 $80, $8500, 0
		struc_30 $81, $500, 0
		struc_30 $82, $8500, 0
		struc_30 $49, $8480, 0
		struc_30 6, $480, 0
stru_C396:	struc_C396 5, stru_C3DC-stru_C396
		struc_C396 8, stru_C3A6-stru_C396
		struc_C396 0, stru_C400-stru_C396
		struc_C396 2, stru_C406-stru_C396
stru_C3A6:	struc_30 $B0, $83C0, $190
		struc_30 $23, $847B, $12C
		struc_30 $24, $847B, 0
		struc_30 $8F, $4C2, 0
		struc_30 $72, $84D2, 0
		struc_30 $2B, $C4E1, 0
		struc_30 $9D, $C4FC, 0
		struc_30 $1B, $55C, 0
		struc_30 $76, $855C, 0
stru_C3DC:	struc_30 $72, $8400, 0
		struc_30 $8B, $840F, $C8
		struc_30 $87, $C445, 0
		struc_30 $9F, $C451, 0
		struc_30 $3E, $6471, 0
		struc_30 $3D, $6471, 0
stru_C400:	struc_30 $9E, $C400, 0
stru_C406:	struc_30 $83, $8400, 0
		struc_30 $84, $8500, 0
		struc_30 $85, $C500, 0
load_enemies_tiles:
		move.w	(level_main_index).w,d0
		add.w	d0,d0
		move.w	tbl_lvl_enemies_tiles(pc,d0.w),d0
		lea	tbl_lvl_enemies_tiles(pc,d0.w),a1
		move.w	(level_sub_index).w,d0
		add.w	d0,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d2
		move.w	2(a1,d0.w),d0
		adda.w	d0,a1

loc_C438:
		move.l	(a1)+,(a5)
		movea.l	(a1)+,a0
		jsr	(decompress_nemesis_to_vram).l ; a0 = source
		dbf	d2,loc_C438
		rts

tbl_lvl_enemies_tiles:dc.w tbl_enemies_lvl_0__1-tbl_lvl_enemies_tiles
		dc.w tbl_enemies_lvl_0__1-tbl_lvl_enemies_tiles
		dc.w tbl_enemies_lvl_2-tbl_lvl_enemies_tiles
		dc.w tbl_enemies_lvl_3-tbl_lvl_enemies_tiles
		dc.w tbl_enemies_lvl_4-tbl_lvl_enemies_tiles
		dc.w tbl_enemies_lvl_5-tbl_lvl_enemies_tiles
		dc.w tbl_enemies_lvl_6-tbl_lvl_enemies_tiles
		dc.w tbl_enemies_lvl_7-tbl_lvl_enemies_tiles
		dc.w tbl_enemies_lvl_8-tbl_lvl_enemies_tiles
		dc.w tbl_enemies_lvl_9-tbl_lvl_enemies_tiles
tbl_enemies_lvl_0__1:enemies_lvl_1 8, tbl_enemies_lvl_1_0-tbl_enemies_lvl_0__1
		enemies_lvl_1 6, tbl_enemies_lvl_1_1-tbl_enemies_lvl_0__1
		enemies_lvl_1 3, tbl_enemies_lvl_1_2-tbl_enemies_lvl_0__1
tbl_enemies_lvl_1_0:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_2
		nemesis_to_vram1 $55600002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $5E200002, nemesis_enemy_tiles_4
		nemesis_to_vram1 $60A00002, nemesis_enemy_tiles_5
		nemesis_to_vram1 $61A00002, nemesis_enemy_tiles_6
		nemesis_to_vram1 $64400002, nemesis_enemy_tiles_7
		nemesis_to_vram1 $66400002, nemesis_enemy_tiles_8
tbl_enemies_lvl_1_1:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $58A00002, nemesis_enemy_tiles_9
		nemesis_to_vram1 $5CC00002, nemesis_enemy_tiles_10
		nemesis_to_vram1 $62000002, nemesis_enemy_tiles_8
		nemesis_to_vram1 $6A400002, nemesis_enemy_tiles_6
tbl_enemies_lvl_1_2:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_9
		nemesis_to_vram1 $4B000002, nemesis_enemy_tiles_10
		nemesis_to_vram1 $4FC00002, nemesis_enemy_tiles_11
		nemesis_to_vram1 $52400002, nemesis_enemy_tiles_12
tbl_enemies_lvl_2:enemies_lvl_2 5, tbl_enemies_lvl_2_0-tbl_enemies_lvl_2
		enemies_lvl_2 5, tbl_enemies_lvl_2_1__2-tbl_enemies_lvl_2
		enemies_lvl_2 5, tbl_enemies_lvl_2_1__2-tbl_enemies_lvl_2
		enemies_lvl_2 1, tbl_enemies_lvl_2_3-tbl_enemies_lvl_2
tbl_enemies_lvl_2_0:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_13
		nemesis_to_vram1 $44000002, nemesis_enemy_tiles_14
		nemesis_to_vram1 $48400002, nemesis_enemy_tiles_15
		nemesis_to_vram1 $49E00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $52A00002, nemesis_enemy_tiles_1
tbl_enemies_lvl_2_1__2:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $58A00002, nemesis_enemy_tiles_8
		nemesis_to_vram1 $60E00002, nemesis_enemy_tiles_16
		nemesis_to_vram1 $63800002, nemesis_enemy_tiles_17
tbl_enemies_lvl_2_3:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_18
		nemesis_to_vram1 $41E00002, nemesis_enemy_tiles_19
tbl_enemies_lvl_3:enemies_lvl_3 4, tbl_enemies_lvl_3_0-tbl_enemies_lvl_3
		enemies_lvl_3 5, tbl_enemies_lvl_3_1-tbl_enemies_lvl_3
		enemies_lvl_3 4, tbl_enemies_lvl_3_2-tbl_enemies_lvl_3
		enemies_lvl_3 6, tbl_enemies_lvl_3_3__5-tbl_enemies_lvl_3
		enemies_lvl_3 6, tbl_enemies_lvl_3_3__5-tbl_enemies_lvl_3
		enemies_lvl_3 6, tbl_enemies_lvl_3_3__5-tbl_enemies_lvl_3
		enemies_lvl_3 1, tbl_enemies_lvl_3_6-tbl_enemies_lvl_3
tbl_enemies_lvl_3_0:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_20
		nemesis_to_vram1 $51600002, nemesis_enemy_tiles_21
		nemesis_to_vram1 $56E00002, nemesis_enemy_tiles_22
tbl_enemies_lvl_3_1:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_21
		nemesis_to_vram1 $45800002, nemesis_enemy_tiles_23
		nemesis_to_vram1 $4E600002, nemesis_enemy_tiles_24
		nemesis_to_vram1 $51C00002, nemesis_enemy_tiles_25
		nemesis_to_vram1 $57600002, nemesis_enemy_tiles_20
		nemesis_to_vram1 $58E00002, nemesis_enemy_tiles_26
tbl_enemies_lvl_3_2:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_23
		nemesis_to_vram1 $48E00002, nemesis_enemy_tiles_24
		nemesis_to_vram1 $4C400002, nemesis_enemy_tiles_27
		nemesis_to_vram1 $4E600002, nemesis_enemy_tiles_28
		nemesis_to_vram1 $64000001, nemesis_enemy_tiles_29
tbl_enemies_lvl_3_3__5:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_21
		nemesis_to_vram1 $45800002, nemesis_enemy_tiles_23
		nemesis_to_vram1 $4E600002, nemesis_enemy_tiles_24
		nemesis_to_vram1 $51C00002, nemesis_enemy_tiles_30
		nemesis_to_vram1 $59600002, nemesis_enemy_tiles_25
		nemesis_to_vram1 $5EE00002, nemesis_enemy_tiles_20
		nemesis_to_vram1 $60600002, nemesis_enemy_tiles_26
tbl_enemies_lvl_3_6:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_21
		nemesis_to_vram1 $45800002, nemesis_enemy_tiles_31
tbl_enemies_lvl_4:enemies_lvl_4 6, tbl_enemies_lvl_4_0-tbl_enemies_lvl_4
		enemies_lvl_4 5, tbl_enemies_lvl_4_1-tbl_enemies_lvl_4
		enemies_lvl_4 0, tbl_enemies_lvl_4_2-tbl_enemies_lvl_4
		enemies_lvl_4 6, tbl_enemies_lvl_4_3-tbl_enemies_lvl_4
		enemies_lvl_4 0, tbl_enemies_lvl_4_4-tbl_enemies_lvl_4
tbl_enemies_lvl_4_0:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $58A00002, nemesis_enemy_tiles_33
		nemesis_to_vram1 $5EA00002, nemesis_enemy_tiles_34
		nemesis_to_vram1 $60A00002, nemesis_enemy_tiles_35
tbl_enemies_lvl_4_1:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $58A00002, nemesis_enemy_tiles_36
		nemesis_to_vram1 $5BA00002, nemesis_enemy_tiles_37
tbl_enemies_lvl_4_2:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_38
tbl_enemies_lvl_4_3:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_39
		nemesis_to_vram1 $64A00002, nemesis_enemy_tiles_33
		nemesis_to_vram1 $6AA00002, nemesis_enemy_tiles_34
		nemesis_to_vram1 $6CA00002, nemesis_enemy_tiles_25
tbl_enemies_lvl_4_4:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_40
tbl_enemies_lvl_5:enemies_lvl_5 5, tbl_enemies_lvl_5_0-tbl_enemies_lvl_5
		enemies_lvl_5 7, tbl_enemies_lvl_5_1-tbl_enemies_lvl_5
		enemies_lvl_5 6, tbl_enemies_lvl_5_2-tbl_enemies_lvl_5
		enemies_lvl_5 5, tbl_enemies_lvl_5_3-tbl_enemies_lvl_5
tbl_enemies_lvl_5_0:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $58A00002, nemesis_enemy_tiles_41
		nemesis_to_vram1 $60800002, nemesis_enemy_tiles_42
tbl_enemies_lvl_5_2:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $58A00002, nemesis_enemy_tiles_41
		nemesis_to_vram1 $60800002, nemesis_enemy_tiles_43
		nemesis_to_vram1 $69800002, nemesis_enemy_tiles_44
tbl_enemies_lvl_5_1:nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
tbl_enemies_lvl_5_3:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $58A00002, nemesis_enemy_tiles_39
		nemesis_to_vram1 $6D600002, nemesis_enemy_tiles_45
		nemesis_to_vram1 $76800002, nemesis_enemy_tiles_41
		nemesis_to_vram1 $6A000001, nemesis_enemy_tiles_46
tbl_enemies_lvl_6:enemies_lvl_6 3, tbl_enemies_lvl_6_0__7-tbl_enemies_lvl_6
		enemies_lvl_6 0, tbl_enemies_lvl_6_1-tbl_enemies_lvl_6
		enemies_lvl_6 3, tbl_enemies_lvl_6_0__7-tbl_enemies_lvl_6
		enemies_lvl_6 3, tbl_enemies_lvl_6_0__7-tbl_enemies_lvl_6
		enemies_lvl_6 3, tbl_enemies_lvl_6_0__7-tbl_enemies_lvl_6
		enemies_lvl_6 3, tbl_enemies_lvl_6_0__7-tbl_enemies_lvl_6
		enemies_lvl_6 3, tbl_enemies_lvl_6_0__7-tbl_enemies_lvl_6
		enemies_lvl_6 3, tbl_enemies_lvl_6_0__7-tbl_enemies_lvl_6
		enemies_lvl_6 0, tbl_enemies_lvl_6_8-tbl_enemies_lvl_6
tbl_enemies_lvl_6_1:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_47
tbl_enemies_lvl_6_0__7:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_48
		nemesis_to_vram1 $5A600002, nemesis_enemy_tiles_8
tbl_enemies_lvl_6_8:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_49
tbl_enemies_lvl_7:enemies_lvl_7 6, tbl_enemies_lvl_7_0_4-tbl_enemies_lvl_7
		enemies_lvl_7 3, tbl_enemies_lvl_7_1-tbl_enemies_lvl_7
		enemies_lvl_7 2, tbl_enemies_lvl_7_2-tbl_enemies_lvl_7
		enemies_lvl_7 1, tbl_enemies_lvl_7_3-tbl_enemies_lvl_7
		enemies_lvl_7 6, tbl_enemies_lvl_7_0_4-tbl_enemies_lvl_7
		enemies_lvl_7 1, tbl_enemies_lvl_7_5-tbl_enemies_lvl_7
tbl_enemies_lvl_7_0_4:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $58A00002, nemesis_enemy_tiles_8
		nemesis_to_vram1 $60E00002, nemesis_enemy_tiles_13
		nemesis_to_vram1 $64E00002, nemesis_enemy_tiles_50
tbl_enemies_lvl_7_1:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_51
		nemesis_to_vram1 $49400002, nemesis_enemy_tiles_50
		nemesis_to_vram1 $4B400002, nemesis_enemy_tiles_52
		nemesis_to_vram1 $51400002, nemesis_enemy_tiles_53
tbl_enemies_lvl_7_2:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_51
		nemesis_to_vram1 $49400002, nemesis_enemy_tiles_53
		nemesis_to_vram1 $4C000002, nemesis_enemy_tiles_54
tbl_enemies_lvl_7_3:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_52
		nemesis_to_vram1 $4C800002, nemesis_enemy_tiles_49
tbl_enemies_lvl_7_5:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_55
		nemesis_to_vram1 $41800002, nemesis_enemy_tiles_51
tbl_enemies_lvl_8:enemies_lvl_8 7, tbl_enemies_lvl_8_0__1-tbl_enemies_lvl_8
		enemies_lvl_8 7, tbl_enemies_lvl_8_0__1-tbl_enemies_lvl_8
		enemies_lvl_8 3, tbl_enemies_lvl_8_2-tbl_enemies_lvl_8
		enemies_lvl_8 7, tbl_enemies_lvl_8_3-tbl_enemies_lvl_8
		enemies_lvl_8 2, tbl_enemies_lvl_8_4-tbl_enemies_lvl_8
tbl_enemies_lvl_8_0__1:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $48C00002, nemesis_enemy_tiles_18
		nemesis_to_vram1 $4AA00002, nemesis_enemy_tiles_56
		nemesis_to_vram1 $51600002, nemesis_enemy_tiles_57
		nemesis_to_vram1 $55600002, nemesis_enemy_tiles_58
		nemesis_to_vram1 $58000002, nemesis_enemy_tiles_59
tbl_enemies_lvl_8_2:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_60
tbl_enemies_lvl_8_3:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_0
		nemesis_to_vram1 $7C000001, nemesis_enemy_tiles_32
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $4FE00002, nemesis_enemy_tiles_3
		nemesis_to_vram1 $58A00002, nemesis_enemy_tiles_8
		nemesis_to_vram1 $60E00002, nemesis_enemy_tiles_39
		nemesis_to_vram1 $75A00002, nemesis_enemy_tiles_9
		nemesis_to_vram1 $79C00002, nemesis_enemy_tiles_61
tbl_enemies_lvl_8_4:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_62
		nemesis_to_vram1 $50000002, nemesis_enemy_tiles_1
		nemesis_to_vram1 $60000002, nemesis_enemy_tiles_63
tbl_enemies_lvl_9:enemies_lvl_9 4, tbl_enemies_lvl_9_0-tbl_enemies_lvl_9
		enemies_lvl_9 6, tbl_enemies_lvl_9_1-tbl_enemies_lvl_9
		enemies_lvl_9 0, tbl_enemies_lvl_9_2-tbl_enemies_lvl_9
		enemies_lvl_9 5, tbl_enemies_lvl_9_3-tbl_enemies_lvl_9
tbl_enemies_lvl_9_1:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_64
		nemesis_to_vram1 $4F600002, nemesis_enemy_tiles_23
		nemesis_to_vram1 $58400002, nemesis_enemy_tiles_50
		nemesis_to_vram1 $5A400002, nemesis_enemy_tiles_18
		nemesis_to_vram1 $5C200002, nemesis_enemy_tiles_24
		nemesis_to_vram1 $5F800002, nemesis_enemy_tiles_65
		nemesis_to_vram1 $6B800002, nemesis_enemy_tiles_19
tbl_enemies_lvl_9_0:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_18
		nemesis_to_vram1 $41E00002, nemesis_enemy_tiles_56
		nemesis_to_vram1 $48A00002, nemesis_enemy_tiles_66
		nemesis_to_vram1 $4A200002, nemesis_enemy_tiles_67
		nemesis_to_vram1 $4E200002, nemesis_enemy_tiles_35
tbl_enemies_lvl_9_2:nemesis_to_vram1 $40000002, nemesis_enemy_tiles_54
tbl_enemies_lvl_9_3:nemesis_to_vram1 $78000001, nemesis_enemy_tiles_68
		nemesis_to_vram1 $7A800001, nemesis_enemy_tiles_69
		nemesis_to_vram1 $40000002, nemesis_enemy_tiles_70
		nemesis_to_vram1 $4E200002, nemesis_enemy_tiles_71
		nemesis_to_vram1 $60000002, nemesis_enemy_tiles_72
		nemesis_to_vram1 $6C800002, nemesis_enemy_tiles_73
sub_CA58:
		move.w	$32(a0),d1
		lea	(off_CAA6).l,a1
		lea	(a1,d1.w),a1
		lsl.w	#2,d0
		adda.w	d0,a1
		moveq	#0,d1
		moveq	#0,d2
		move.b	(a1)+,d1
		move.b	(a1)+,d2
		ext.w	d1
		ext.w	d2
		jsr	sub_BAF6(pc)
		bne.s	locret_CA8C
		moveq	#0,d1
		moveq	#0,d2
		move.b	(a1)+,d1
		move.b	(a1)+,d2
		ext.w	d1
		ext.w	d2
		jsr	sub_BAF6(pc)

locret_CA8C:
		rts

sub_CA8E:
		move.w	(level_main_index).w,d1
		add.w	d1,d1
		move.w	off_CAA6(pc,d1.w),d1
		lea	off_CAA6(pc,d1.w),a1
		add.w	d0,d0
		move.w	(a1,d0.w),$32(a0)
		rts

off_CAA6:	dc.w word_CABA-off_CAA6
		dc.w word_CAC6-off_CAA6
		dc.w word_CAD2-off_CAA6
		dc.w word_CAE2-off_CAA6
		dc.w word_CAEE-off_CAA6
		dc.w word_CAFC-off_CAA6
		dc.w word_CB0A-off_CAA6
		dc.w word_CB18-off_CAA6
		dc.w word_CB28-off_CAA6
		dc.w word_CB3A-off_CAA6
word_CABA:	dc.w $A4, $A4, $B4, $C4, $B4, $D4
word_CAC6:	dc.w $A4, $A4, $B4, $C4, $B4, $D4
word_CAD2:	dc.w $E4, $A4, $B4, $C4, $B4, $D4, $104, $F4
word_CAE2:	dc.w $114, $124, $134, $C4, $154, $B4
word_CAEE:	dc.w $194, $A4,	$B4, $B4, $B4, $B4, $1A4
word_CAFC:	dc.w $164, $A4,	$B4, $1C4, $174, $184, $1A4
word_CB0A:	dc.w $A4, $A4, $1B4, $1C4, $D4,	$D4, $1A4
word_CB18:	dc.w $E4, $A4, $B4, $D4, $224, $D4, $1E4, $F4
word_CB28:	dc.w $A4, $A4, $B4, $1C4, $A4, $D4, $1A4, $1D4,	$204
word_CB3A:	dc.w $114, $1F4, $B4, $1C4, $224, $D4, $1A4, $1D4, $FAFE, $FEFE
		dc.w $FA02, $FE02, $FAFE, $FA02, 0, 0, $F404, $FE04, $F4FC, $FEFC
		dc.w $F4FC, $F404, $FC,	4, $FF01, $FF01, $FFFF,	$FFFF, $D4FC, $D404
		dc.w 0,	0, $E20C, $FE0C, $E2F4,	$FEF4, $E2F8, $E208, 0,	0
		dc.w $E60C, $FE0C, $E6F4, $FEF4, $E6F8,	$E608, 0, 0, $DE10, $FC10
		dc.w $DEF6, $FCF6, $D4F8, $D408, 0, 0, $40C, $1C0C, $4F4, $1CF4
		dc.w $F8, 8, $20F8, $2008, $E410, $FC10, $E4F6,	$FCF6, $D400, $D400
		dc.w 0,	0, $E410, $FC10, $E4F0,	$FCF0, $E2F4, $E20C, $F4, $C
		dc.w $F008, $FC08, $F0F8, $FCF8, $EEFC,	$EE04, $FC, 4, $E220, $FC20
		dc.w $E2E0, $FCE0, $C0E0, $C020, $E0, $20, $FA00, $FC00, $FA00,	$FC00
		dc.w $FAFD, $FA03, 0, 0, $E40C,	$EF0C, $E4F4, $EFF4, $E2F8, $E208
		dc.w 0,	0, 0, 0, 0, 0, 0, 0, $1800, $1800
		dc.w $F218, $F218, $F2E8, $F2E8, $F0EC,	$F014, $EC, $14, 0, 0
		dc.w 0,	0, 0, 0, $F8F8,	$F808, $D810, $F810, $D8F0, $F8F0
		dc.w 0,	0, $F6,	$A, $E20C, $F80C, $E2F4, $F8F4,	$FEF6, $FE0A
		dc.w $F6, $A, $E201, $EF01, $E2FF, $EFFF, 0, 0,	0, 0
		dc.w $40C, $1C0C, $4F4,	$1CF4, $F8, 8, $2000, $2000, $FE02, $202
		dc.w $FEFE, $2FE, $FEFE, $FE02,	$2FE, $202, $F808, $808, $F8F8,	$8F8
		dc.w $F8F8, $F808, $8F8, $808, $F820, $20, $F8E0, $E0, $F8F8, $F808
		dc.w $E8, $18, $F40C, $C0C, $F4FE, $CFE, $F4F4,	$F40C, $CF4, $C0C
		dc.w $A040, $FE40, $A0C4, $FEC4, $A0E2,	$A01E, $E2, $1E
sub_CCDA:
		cmpi.w	#1,2(a0)
		beq.s	loc_CD0C
		bgt.s	loc_CD58
		move.w	#$86B4,$A(a0)
		move.l	#off_1D66A,$20(a0)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		bset	#7,$C(a0)
		moveq	#1,d0
		jmp	sub_B83E

loc_CD0C:
		jsr	sub_B9A8(pc)
		beq.s	locret_CD42
		addq.w	#1,2(a0)
		cmpi.b	#8,$36(a0)
		beq.s	loc_CD44
		jsr	sub_EA3C(pc)
		bne.s	loc_CD44
		move.w	#$68,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.b	$36(a0),$36(a1)
		bset	#0,$C(a0)

locret_CD42:
		rts

loc_CD44:
		bclr	#1,$D(a0)
		bset	#3,$D(a0)
		move.b	#$20,$26(a0)
		rts

loc_CD58:
		subq.b	#1,$26(a0)
		bhi.s	locret_CD64
		bset	#0,$C(a0)

locret_CD64:
		rts

sub_CD66:
		lea	(off_CD70).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_CD70:	dc.w sub_CDFA-off_CD70
		dc.w sub_CE7E-off_CD70
		dc.w sub_CEDC-off_CD70
		dc.w sub_CFBE-off_CD70
		dc.w sub_D02E-off_CD70
		dc.w sub_CF36-off_CD70
		dc.w sub_CFBE-off_CD70
		dc.w sub_D02E-off_CD70
		dc.w sub_D09C-off_CD70
		dc.w sub_D0D8-off_CD70
		dc.w sub_D0FA-off_CD70
		dc.w sub_D118-off_CD70
sub_CD88:
		jsr	sub_B9B8(pc)
		beq.s	loc_CDD0
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_CDA2
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_CDD8

loc_CDA2:
		btst	#1,5(a0)
		beq.s	loc_CDAE
		jmp	sub_B960(pc)

loc_CDAE:
		jsr	sub_15CD6
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.w	#8,2(a0)
		bset	#1,$D(a0)
		jsr	sub_EA54(pc)

loc_CDD0:
		jsr	sub_B960(pc)
		jmp	loc_B97A(pc)

loc_CDD8:
		jsr	sub_15CCC
		move.w	#9,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		jsr	sub_EA54(pc)
		moveq	#4,d0
		move.b	4(a0),d0
		bra.w	loc_B842

sub_CDFA:
		jsr	sub_BC72(pc)
		move.l	#off_11A704,$20(a0)
		addq.w	#1,2(a0)
		addq.b	#1,$39(a0)
		moveq	#5,d0
		jsr	sub_CA8E(pc)
		btst	#0,$36(a0)
		bne.s	loc_CE2A
		move.l	#$14000,$18(a0)
		bsr.w	sub_B86E
		bra.s	loc_CE38

loc_CE2A:
		move.l	#$FFFEC000,$18(a0)
		moveq	#1,d0
		bsr.w	sub_B83E

loc_CE38:
		btst	#7,$36(a0)
		beq.s	locret_CE7C
		jsr	sub_EA04(pc)
		bne.s	locret_CE7C
		move.w	#2,0.w(a1)
		move.w	#$83C0,$A(a1)
		move.l	#off_121DB4,$20(a1)
		move.w	a2,$2A(a1)
		move.w	$10(a2),$10(a1)
		move.w	$14(a2),$14(a1)
		move.w	a1,$3E(a2)
		btst	#0,4(a2)
		beq.s	locret_CE7C
		bset	#0,$36(a1)

locret_CE7C:
		rts

sub_CE7E:
		move.w	$10(a0),d0
		sub.w	(planea_start_x).w,d0
		cmpi.w	#$1A0,d0
		bge.s	loc_CED8
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_CEA6
		neg.l	$18(a0)
		addq.w	#1,2(a0)
		moveq	#1,d0
		bra.w	loc_B842

loc_CEA6:
		moveq	#0,d0
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		bne.s	loc_CEC0
		neg.l	$18(a0)
		addq.w	#1,2(a0)
		moveq	#1,d0
		bra.w	loc_B842

loc_CEC0:
		move.w	(player_pos_y).w,d0
		cmp.w	$14(a0),d0
		bne.s	loc_CED8
		move.b	#$20,$26(a0)
		addq.w	#2,2(a0)
		clr.l	$18(a0)

loc_CED8:
		bra.w	sub_CD88

sub_CEDC:
		move.w	$10(a0),d0
		sub.w	(planea_start_x).w,d0
		cmpi.w	#$FFA0,d0
		ble.s	loc_CF32
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_CF02
		neg.l	$18(a0)
		subq.w	#1,2(a0)
		bra.w	sub_B86E

loc_CF02:
		moveq	#1,d0
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		bne.s	loc_CF1A
		neg.l	$18(a0)
		subq.w	#1,2(a0)
		bra.w	sub_B86E

loc_CF1A:
		move.w	(player_pos_y).w,d0
		cmp.w	$14(a0),d0
		bne.s	loc_CF32
		move.b	#$20,$26(a0)
		addq.w	#2,2(a0)
		clr.l	$18(a0)

loc_CF32:
		bra.w	sub_CD88

sub_CF36:
		tst.b	$26(a0)
		beq.s	loc_CF42
		subq.b	#1,$26(a0)
		bra.s	loc_CFBA

loc_CF42:
		move.w	(player_pos_y).w,d0
		cmp.w	$14(a0),d0
		beq.s	loc_CF86
		bclr	#4,$E(a0)
		move.w	(player_pos_x).w,d0
		cmp.w	$10(a0),d0
		blt.s	loc_CF6E
		move.b	#$60,$26(a0)
		move.l	#$14000,$18(a0)
		bra.w	sub_B852

loc_CF6E:
		move.b	#$60,$26(a0)
		move.l	#$FFFEC000,$18(a0)
		addq.w	#2,2(a0)
		moveq	#1,d0
		bra.w	loc_B842

loc_CF86:
		btst	#1,$36(a0)
		beq.s	loc_CFBA
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$30,d0
		bgt.s	loc_CFBA
		cmpi.w	#$FFD0,d0
		blt.s	loc_CFBA
		addq.w	#5,2(a0)
		move.b	#$18,$26(a0)
		tst.w	d0
		blt.s	loc_CFB4
		jmp	sub_B876(pc)

loc_CFB4:
		moveq	#5,d0
		jmp	loc_B842(pc)

loc_CFBA:
		bra.w	sub_CD88

sub_CFBE:
		move.w	$10(a0),d0
		sub.w	(planea_start_x).w,d0
		cmpi.w	#$1A0,d0
		bge.s	loc_D02A
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_CFE6
		neg.l	$18(a0)
		addq.w	#1,2(a0)
		moveq	#1,d0
		bra.w	loc_B842

loc_CFE6:
		moveq	#0,d0
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		bne.s	loc_D000
		neg.l	$18(a0)
		addq.w	#1,2(a0)
		moveq	#1,d0
		bra.w	loc_B842

loc_D000:
		subq.b	#1,$26(a0)
		bne.s	loc_D02A
		cmpi.w	#3,2(a0)
		bne.s	loc_D026
		move.b	#$20,$26(a0)
		addq.w	#2,2(a0)
		bset	#4,$E(a0)
		bsr.w	sub_B872
		bra.w	sub_CD88

loc_D026:
		subq.w	#5,2(a0)

loc_D02A:
		bra.w	sub_CD88

sub_D02E:
		move.w	$10(a0),d0
		sub.w	(planea_start_x).w,d0
		cmpi.w	#$FFA0,d0
		ble.s	loc_D098
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_D054
		neg.l	$18(a0)
		subq.w	#1,2(a0)
		bra.w	sub_B86E

loc_D054:
		moveq	#1,d0
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		bne.s	loc_D06C
		neg.l	$18(a0)
		subq.w	#1,2(a0)
		bra.w	sub_B86E

loc_D06C:
		subq.b	#1,$26(a0)
		bne.s	loc_D098
		cmpi.w	#4,2(a0)
		bne.s	loc_D094
		move.b	#$20,$26(a0)
		addq.w	#1,2(a0)
		bset	#4,$E(a0)
		moveq	#3,d0
		bsr.w	loc_B842
		bra.w	sub_CD88

loc_D094:
		subq.w	#5,2(a0)

loc_D098:
		bra.w	sub_CD88

sub_D09C:
		jsr	sub_15C24
		bne.w	locret_D0D6
		bclr	#1,$D(a0)
		btst	#0,5(a0)
		bne.s	loc_D0C4
		subq.w	#7,2(a0)
		move.l	#$14000,$18(a0)
		bra.w	sub_B86E

loc_D0C4:
		subq.w	#6,2(a0)
		move.l	#$FFFEC000,$18(a0)
		moveq	#1,d0
		bra.w	loc_B842

locret_D0D6:
		rts

sub_D0D8:
		move.l	#$4000,d0
		jsr	sub_15C06
		move.w	(planea_start_x).w,d0
		addi.w	#$C0,d0
		cmp.w	$10(a0),d0
		bgt.s	locret_D0F8
		andi.w	#$7FFF,$A(a0)

locret_D0F8:
		rts

sub_D0FA:
		subq.b	#1,$26(a0)
		bhi.s	loc_D112
		move.b	#$14,$26(a0)
		moveq	#0,d0
		move.w	4(a0),d0
		subq.w	#2,d0
		jmp	sub_B83E(pc)

loc_D112:
		jmp	sub_CD88

sub_D118:
		subq.b	#1,$26(a0)
		bhi.s	loc_D126
		subq.w	#6,2(a0)
		clr.b	$26(a0)

loc_D126:
		jmp	sub_CD88

sub_D12C:
		cmpi.w	#1,2(a0)
		beq.s	loc_D154
		jsr	sub_BC72(pc)
		move.l	#off_11A7AA,$20(a0)
		addq.w	#1,2(a0)
		bset	#4,$C(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		bra.w	loc_B842

loc_D154:
		move.w	(planea_start_x).w,d0
		addi.w	#$F0,d0
		move.w	d0,$10(a0)
		move.w	(planeb_start_y).w,d0
		sub.w	(planeb_y).w,d0
		add.w	d0,$14(a0)
		rts

sub_D16E:
		cmpi.w	#1,2(a0)
		beq.s	locret_D196
		jsr	sub_BC72(pc)
		move.l	#off_11A798,$20(a0)
		bset	#7,$C(a0)
		bset	#1,$D(a0)
		bsr.w	sub_B86E
		addq.w	#1,2(a0)

locret_D196:
		rts

sub_D198:
		cmpi.w	#1,2(a0)
		beq.s	loc_D1D2
		bgt.s	loc_D1EC
		subq.w	#8,$14(a0)

loc_D1A6:
		jsr	sub_BC72(pc)
		move.l	#off_11A7E0,$20(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		addq.w	#1,2(a0)
		bset	#1,$D(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		bra.w	loc_B842

loc_D1D2:
		tst.w	6(a0)
		beq.s	locret_D1EA
		addq.w	#1,2(a0)
		move.b	#$1E,$26(a0)
		move.b	#$B5,d2
		jsr	sub_ED12(pc)

locret_D1EA:
		rts

loc_D1EC:
		subq.b	#1,$26(a0)
		bgt.s	locret_D1EA
		subq.w	#2,2(a0)
		clr.w	6(a0)
		bra.w	loc_D1A6

sub_D1FE:
		lea	(off_D208).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_D208:	dc.w sub_D35E-off_D208
		dc.w sub_D438-off_D208
		dc.w sub_D470-off_D208
		dc.w sub_D438-off_D208
		dc.w sub_D4D8-off_D208
		dc.w sub_D574-off_D208
		dc.w sub_D626-off_D208
		dc.w sub_D658-off_D208
sub_D218:
		lea	(word_FF9000).w,a1
		move.w	#$2F,d7
		tst.b	d0
		beq.s	loc_D22C
		move.w	$10(a0),d1
		bra.w	loc_D2B0

loc_D22C:
		move.w	$28(a0),d1
		cmpi.b	#1,$36(a0)
		beq.s	loc_D276
		bgt.w	loc_D2B0

loc_D23C:
		cmpi.w	#$15,0.w(a1)
		bne.s	loc_D26C
		move.w	$10(a1),d2
		tst.w	$18(a0)
		bgt.s	loc_D256
		cmp.w	d2,d1
		beq.s	loc_D25E
		bra.w	loc_D26C

loc_D256:
		subi.w	#$B0,d2
		cmp.w	d2,d1
		bne.s	loc_D26C

loc_D25E:
		bset	#0,7(a1)
		move.b	#$1E,$26(a1)
		rts

loc_D26C:
		adda.w	#$40,a1
		dbf	d7,loc_D23C
		rts

loc_D276:
		cmpi.w	#$15,0.w(a1)
		bne.s	loc_D2A6
		move.w	$10(a1),d2
		tst.w	$18(a0)
		blt.s	loc_D290
		cmp.w	d2,d1
		beq.s	loc_D298
		bra.w	loc_D2A6

loc_D290:
		addi.w	#$B0,d2
		cmp.w	d2,d1
		bne.s	loc_D2A6

loc_D298:
		bset	#0,7(a1)
		move.b	#$1E,$26(a1)
		rts

loc_D2A6:
		adda.w	#$40,a1
		dbf	d7,loc_D276
		rts

loc_D2B0:
		cmpi.w	#$15,0.w(a1)
		bne.s	loc_D2CE
		move.w	$10(a1),d2
		cmp.w	d2,d1
		bne.s	loc_D2CE
		bset	#0,7(a1)
		move.b	#$1E,$26(a1)
		rts

loc_D2CE:
		adda.w	#$40,a1
		dbf	d7,loc_D2B0
		rts

sub_D2D8:
		jsr	sub_B9B8(pc)
		beq.s	loc_D304

loc_D2DE:
		cmpi.b	#2,$27(a0)
		beq.s	loc_D30E

loc_D2E6:
		move.w	a0,$30(a1)
		jsr	sub_15CD6
		move.w	#5,2(a0)
		move.b	#3,$2C(a0)
		bsr.w	sub_D338
		jmp	sub_B960(pc)

loc_D304:
		tst.b	$27(a0)
		bne.s	loc_D2DE
		jmp	sub_B960(pc)

loc_D30E:
		bra.s	loc_D2E6

nullsub_11:
		rts

sub_D312:
		move.w	#3,d6

loc_D316:
		move.w	d6,d0
		add.w	d0,d0
		tst.w	$38(a0,d0.w)
		beq.s	loc_D332
		movea.w	$38(a0,d0.w),a1
		cmpi.w	#$14,0.w(a1)
		bne.s	loc_D332
		move.w	#2,2(a1)

loc_D332:
		dbf	d6,loc_D316
		rts

sub_D338:
		move.w	#3,d6

loc_D33C:
		move.w	d6,d0
		add.w	d0,d0
		tst.w	$38(a0,d0.w)
		beq.s	loc_D358
		movea.w	$38(a0,d0.w),a1
		cmpi.w	#$14,0.w(a1)
		bne.s	loc_D358
		move.w	#3,2(a1)

loc_D358:
		dbf	d6,loc_D33C
		rts

sub_D35E:
		jsr	sub_BC72(pc)
		move.l	#off_11A822,$20(a0)
		addq.w	#1,2(a0)
		bset	#4,$E(a0)
		move.l	#$FFFC0000,$1C(a0)
		move.b	#6,$26(a0)
		move.w	$10(a0),$28(a0)
		move.w	$14(a0),$2A(a0)
		moveq	#1,d0
		bsr.w	sub_D218
		btst	#1,$36(a0)
		bne.s	loc_D3B4
		move.l	#$1D000,$18(a0)
		btst	#0,$36(a0)
		beq.s	loc_D3B4
		move.l	#$FFFE3000,$18(a0)

loc_D3B4:
		bsr.w	sub_B86E
		movea.l	a0,a4
		moveq	#3,d6

loc_D3BC:
		jsr	sub_E9D8(pc)
		bne.s	locret_D412
		movea.l	a2,a0
		cmpi.w	#3,d6
		bne.s	loc_D3CC
		movea.l	a0,a3

loc_D3CC:
		lea	(stru_D418).l,a2
		move.l	#off_11A822,$20(a1)
		move.w	#$14,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	a3,$2A(a1)
		movea.l	a1,a3
		move.w	(a2)+,d0
		move.b	d0,$36(a1)
		move.w	(a2)+,d0
		move.b	d0,$26(a1)
		move.l	(a2)+,$18(a1)
		move.w	d6,d0
		add.w	d0,d0
		move.w	a1,$38(a0,d0.w)
		move.w	a0,$3E(a1)
		dbf	d6,loc_D3BC

locret_D412:
		rts
sub_D414:
		bra.w	sub_D2D8

stru_D418:	struc_42 0, 4,	$1A000
		struc_42 0, 8,	$1B000
		struc_42 0, $C, $1C000
		struc_42 1, $10, $1D000
sub_D438:
		jsr	sub_E9A8(pc)
		bne.w	locret_D624
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		subq.b	#1,$26(a0)
		bne.w	locret_D624
		addq.w	#1,2(a0)
		cmpi.w	#2,2(a0)
		beq.s	loc_D464
		move.b	#$FA,$26(a0)
		rts

loc_D464:
		move.b	#$50,$26(a0)
		clr.b	$27(a0)
		rts

sub_D470:
		jsr	sub_E9A8(pc)
		bne.s	loc_D4D4
		subq.b	#1,$26(a0)
		tst.b	$26(a0)
		cmpi.b	#$41,$26(a0)
		bne.s	loc_D48A
		bsr.w	sub_D312

loc_D48A:
		tst.b	$26(a0)
		bne.s	loc_D496
		moveq	#0,d0
		bsr.w	sub_D218

loc_D496:
		move.l	$1C(a0),d0
		addi.l	#$1500,d0
		cmpi.l	#$40000,d0
		ble.s	loc_D4AE
		move.l	#$40000,d0

loc_D4AE:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		move.w	$14(a0),d0
		move.w	$2A(a0),d1
		subi.w	#$18,d1
		cmp.w	d1,d0
		blt.s	loc_D4D4
		addq.w	#1,2(a0)
		move.b	#6,$26(a0)
		bra.w	sub_D338

loc_D4D4:
		bra.w	sub_D2D8

sub_D4D8:
		subq.b	#1,$26(a0)
		cmpi.b	#$C8,$26(a0)
		bne.w	locret_D54C
		move.w	#1,2(a0)
		moveq	#1,d0
		bsr.w	sub_D218
		move.b	#6,$26(a0)
		neg.l	$18(a0)
		move.l	#$FFFC0000,$1C(a0)
		btst	#1,$36(a0)
		bne.s	loc_D522
		btst	#0,$36(a0)
		bne.s	loc_D54E
		move.w	$28(a0),d0
		addi.w	#$58,d0
		cmp.w	$10(a0),d0
		blt.s	loc_D534

loc_D522:
		move.w	$28(a0),$10(a0)
		move.w	$2A(a0),$14(a0)
		moveq	#1,d0
		bra.w	sub_D218

loc_D534:
		move.w	$28(a0),$10(a0)
		addi.w	#$B0,$10(a0)
		move.w	$2A(a0),$14(a0)
		moveq	#1,d0
		bra.w	sub_D218

locret_D54C:
		rts

loc_D54E:
		move.w	$28(a0),d0
		subi.w	#$58,d0
		cmp.w	$10(a0),d0
		blt.s	loc_D522
		move.w	$28(a0),$10(a0)
		subi.w	#$B0,$10(a0)
		move.w	$2A(a0),$14(a0)
		moveq	#1,d0
		bra.w	sub_D218

sub_D574:
		jsr	sub_E9A8(pc)
		bne.w	locret_D624
		btst	#0,$36(a0)
		bne.s	loc_D59A
		move.w	$28(a0),d0
		move.w	d0,d1
		addi.w	#$58,d1
		cmp.w	$10(a0),d1
		bgt.s	loc_D5AE
		addi.w	#$B0,d0
		bra.s	loc_D5AE

loc_D59A:
		move.w	$28(a0),d0
		move.w	d0,d1
		subi.w	#$58,d1
		cmp.w	$10(a0),d1
		blt.s	loc_D5AE
		subi.w	#$B0,d0

loc_D5AE:
		addq.b	#1,$26(a0)
		lea	(word_FF9000).w,a1
		move.w	#$2F,d7
		move.w	d0,d1
		bsr.w	loc_D2B0
		move.w	$2A(a0),d1
		subi.w	#$18,d1
		move.w	$10(a0),d4
		move.w	$14(a0),d5
		jsr	sub_EAB6(pc)
		move.w	#$400,d3
		jsr	sub_EB3C(pc)
		add.l	d0,$10(a0)
		add.l	d1,$14(a0)
		btst	#0,$26(a0)
		bne.w	loc_D5FC
		btst	#1,$26(a0)
		bne.w	loc_D5FC
		neg.b	$2C(a0)

loc_D5FC:
		move.w	$14(a0),d0
		move.w	$2A(a0),d1
		subi.w	#$18,d1
		cmp.w	d1,d0
		blt.w	locret_D624
		clr.b	$2C(a0)
		addq.w	#1,2(a0)
		move.b	#6,$26(a0)
		move.l	#$40000,$1C(a0)

locret_D624:
		rts

sub_D626:
		jsr	sub_E9A8(pc)
		bne.w	locret_D624
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		subq.b	#1,$26(a0)
		bne.w	loc_D648
		addq.w	#1,2(a0)
		move.b	#$FA,$26(a0)

loc_D648:
		move.w	$2A(a0),d0
		cmp.w	$14(a0),d0
		bgt.s	locret_D656
		move.w	d0,$14(a0)

locret_D656:
		rts

sub_D658:
		subq.b	#1,$26(a0)
		bne.w	locret_D6D6
		move.w	#1,2(a0)
		move.l	#$FFFC0000,$1C(a0)
		move.b	#6,$26(a0)
		move.w	$2A(a0),$14(a0)
		clr.b	$27(a0)
		btst	#1,$36(a0)
		bne.s	loc_D6A4
		btst	#0,$36(a0)
		bne.s	loc_D6D8
		move.w	$28(a0),d0
		addi.w	#$58,d0
		cmp.w	$10(a0),d0
		blt.s	loc_D6B6
		move.l	#$1D000,$18(a0)

loc_D6A4:
		move.w	$28(a0),$10(a0)
		move.w	$2A(a0),$14(a0)
		moveq	#1,d0
		bra.w	sub_D218

loc_D6B6:
		move.l	#$FFFE3000,$18(a0)
		move.w	$28(a0),$10(a0)
		addi.w	#$B0,$10(a0)
		move.w	$2A(a0),$14(a0)
		moveq	#1,d0
		bra.w	sub_D218

locret_D6D6:
		rts

loc_D6D8:
		move.w	$28(a0),d0
		subi.w	#$58,d0
		cmp.w	$10(a0),d0
		bgt.s	loc_D700
		move.l	#$FFFE3000,$18(a0)
		move.w	$28(a0),$10(a0)
		move.w	$2A(a0),$14(a0)
		moveq	#1,d0
		bra.w	sub_D218

loc_D700:
		move.l	#$1D000,$18(a0)
		move.w	$28(a0),$10(a0)
		subi.w	#$B0,$10(a0)
		move.w	$2A(a0),$14(a0)
		moveq	#1,d0
		bra.w	sub_D218

sub_D720:
		lea	(off_D72A).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_D72A:	dc.w sub_D76C-off_D72A
		dc.w sub_D792-off_D72A
		dc.w sub_D79A-off_D72A
		dc.w sub_D800-off_D72A
sub_D732:
		jsr	sub_B9B8(pc)
		beq.s	loc_D756
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_D74C
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_D75A

loc_D74C:
		movea.w	$3E(a0),a1
		move.b	#1,$27(a1)

loc_D756:
		jmp	sub_B960(pc)

loc_D75A:
		movea.w	$3E(a0),a1
		move.b	#2,$27(a1)
		jmp	sub_B960(pc)
sub_D768:
		jmp	sub_B960(pc)

sub_D76C:
		jsr	sub_BC72(pc)
		move.l	#off_11A822,$20(a0)
		bset	#4,$E(a0)
		addq.w	#1,2(a0)
		move.b	#1,$39(a0)
		moveq	#1,d0
		add.b	$36(a0),d0
		bra.w	loc_B842

sub_D792:
		addq.w	#1,2(a0)
		bra.w	sub_D732

sub_D79A:
		movea.w	$3E(a0),a1
		cmpi.w	#$10,0.w(a1)
		beq.s	loc_D7AE
		bset	#0,$C(a0)
		rts

loc_D7AE:
		movea.w	$2A(a0),a1
		move.w	$10(a1),d0
		move.w	$14(a1),d1
		move.w	$10(a0),d4
		move.w	$14(a0),d5
		bsr.w	sub_EAB6
		move.b	d1,$28(a0)
		move.b	d2,$29(a0)
		move.w	$10(a1),d3
		move.w	$14(a1),d4
		move.w	$10(a0),d5
		move.w	$14(a0),d6
		bsr.w	sub_EB0A
		move.w	d0,d3
		move.b	$28(a0),d1
		move.b	$29(a0),d2
		bsr.w	sub_EB3C
		lsl.l	#6,d0
		add.l	d0,$10(a0)
		lsl.l	#6,d1
		add.l	d1,$14(a0)
		bra.w	sub_D732

sub_D800:
		movea.w	$3E(a0),a1
		cmpi.w	#$10,0.w(a1)
		beq.s	loc_D814
		bset	#0,$C(a0)
		rts

loc_D814:
		movea.w	$2A(a0),a1
		move.w	$10(a1),d0
		move.w	$14(a1),d1
		move.w	$10(a0),d4
		move.w	$14(a0),d5
		bsr.w	sub_EAB6
		move.b	d1,$28(a0)
		move.b	d2,$29(a0)
		move.w	$10(a1),d3
		move.w	$14(a1),d4
		move.w	$10(a0),d5
		move.w	$14(a0),d6
		bsr.w	sub_EB0A
		move.w	d0,d3
		move.b	$28(a0),d1
		move.b	$29(a0),d2
		bsr.w	sub_EB3C
		lsl.l	#6,d0
		add.l	d0,$10(a0)
		lsl.l	#6,d1
		add.l	d1,$14(a0)
		rts

sub_D864:
		cmpi.w	#1,2(a0)
		beq.s	loc_D8A2
		bgt.w	loc_D908
		jsr	sub_BC72(pc)
		move.l	#off_11A806,$20(a0)
		addq.w	#1,2(a0)
		move.l	#$10000,$18(a0)
		btst	#0,$36(a0)
		beq.s	loc_D898
		move.l	#$FFFF0000,$18(a0)

loc_D898:
		moveq	#0,d0
		move.b	$36(a0),d0
		bsr.w	loc_B842

loc_D8A2:
		jsr	sub_E9A8(pc)
		bne.s	loc_D8F2
		moveq	#0,d0
		move.w	$26(a0),d0
		addq.w	#1,d0
		cmpi.w	#$40,d0
		blt.s	loc_D8B8
		clr.w	d0

loc_D8B8:
		move.w	d0,$26(a0)
		lsr.l	#5,d0
		lea	(word_D904).l,a1
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		move.w	d0,(ram_palette_3+$1A).w
		move.b	#1,(cram_update_needed).w
		btst	#0,$27(a0)
		bne.s	loc_D8E4
		move.l	$18(a0),d0
		add.l	d0,$10(a0)

loc_D8E4:
		move.w	(planeb_start_x).w,d0
		sub.w	(planeb_x).w,d0
		add.w	d0,$10(a0)
		rts

loc_D8F2:
		addq.w	#1,2(a0)
		move.b	#$64,$28(a0)
		bset	#2,$D(a0)
		rts
word_D904:	dc.w $E, $EE

loc_D908:
		move.w	(planea_start_x).w,$10(a0)
		subi.w	#$1C,$10(a0)
		subq.b	#1,$28(a0)
		bne.s	loc_D8B8
		subq.w	#1,2(a0)
		bclr	#2,$D(a0)
		tst.b	$36(a0)
		beq.s	locret_D930
		addi.w	#$178,$10(a0)

locret_D930:
		rts

sub_D932:
		lea	(off_D93C).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_D93C:	dc.w sub_DA44-off_D93C
		dc.w sub_DB22-off_D93C
		dc.w sub_DB64-off_D93C
		dc.w sub_DB9C-off_D93C
		dc.w sub_DBA4-off_D93C
		dc.w sub_DBBA-off_D93C
sub_D948:
		clr.b	$F(a0)
		jsr	sub_B9B8(pc)
		bne.s	loc_D956
		jsr	loc_BA02(pc)

loc_D956:
		tst.b	$F(a0)
		beq.w	loc_DA3C
		bpl.s	loc_D96A
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_D9DE

loc_D96A:
		move.w	a0,$30(a1)
		jsr	sub_15CD6
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.w	2(a0),$2A(a0)
		move.w	#4,2(a0)
		bclr	#7,$36(a0)
		beq.w	loc_DA3C
		movea.w	$2E(a0),a1
		andi.b	#$F,-1(a1)
		subq.w	#8,4(a0)
		jsr	sub_EA3C(pc)
		bne.w	loc_DA3C
		move.w	#$68,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		moveq	#0,d0
		move.b	$36(a0),d0
		lsr.l	#4,d0
		move.b	d0,$36(a1)
		bset	#6,$36(a1)
		bra.s	loc_DA3C
		btst	#1,5(a0)
		bne.s	loc_DA3C
		jmp	sub_B960(pc)

loc_D9DE:
		move.w	a0,$30(a1)
		jsr	sub_15CCC
		move.w	#5,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		btst	#1,5(a0)
		bne.s	loc_DA3C
		addq.w	#2,4(a0)
		bclr	#7,$36(a0)
		beq.s	loc_DA3C
		movea.w	$2E(a0),a1
		andi.b	#$F,-1(a1)
		subq.w	#8,4(a0)
		jsr	sub_EA3C(pc)
		bne.s	loc_DA3C
		move.w	#$68,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		moveq	#0,d0
		move.b	$36(a0),d0
		lsr.l	#4,d0
		move.b	d0,$36(a1)

loc_DA3C:
		jsr	sub_B960(pc)
		jmp	loc_B97A(pc)

sub_DA44:
		jsr	sub_BC72(pc)
		move.l	#off_11A912,$20(a0)
		cmpi.w	#$D,0.w(a0)
		beq.s	loc_DA68
		cmpi.w	#$7C,0.w(a0)
		beq.s	loc_DA68
		move.l	#off_11AAFE,$20(a0)

loc_DA68:
		addq.w	#1,2(a0)
		bset	#7,$C(a0)
		move.b	#1,$39(a0)
		moveq	#0,d0
		move.l	#$18000,$18(a0)
		btst	#0,$36(a0)
		beq.s	loc_DA94
		moveq	#1,d0
		move.l	#$FFFE8000,$18(a0)

loc_DA94:
		btst	#7,$36(a0)
		beq.s	loc_DA9E
		addq.w	#8,d0

loc_DA9E:
		bsr.w	loc_B842
		jsr	sub_E9D8(pc)
		bne.w	locret_DB20
		move.w	#$7A,0.w(a1)
		move.l	#off_121738,$20(a1)
		move.w	#$83E0,$A(a1)
		move.b	#2,$36(a1)
		cmpi.w	#$7D,0.w(a2)
		beq.s	loc_DAF2
		cmpi.w	#$7C,0.w(a2)
		beq.s	loc_DAF2
		move.w	#$E,0.w(a1)
		move.l	#off_11A912,$20(a1)
		move.w	$A(a2),$A(a1)
		clr.b	$36(a1)
		move.w	#4,4(a1)

loc_DAF2:
		move.w	a1,$28(a2)
		move.w	a2,$28(a1)
		move.w	$10(a2),$10(a1)
		move.w	$14(a2),$14(a1)
		addq.w	#4,$14(a1)
		btst	#0,$36(a2)
		beq.s	loc_DB1A
		subi.w	#$17,$10(a1)
		rts

loc_DB1A:
		addi.w	#$17,$10(a1)

locret_DB20:
		rts

sub_DB22:
		jsr	sub_B88A(pc)
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$18,d0
		bgt.s	loc_DB60
		cmpi.w	#$FFE8,d0
		blt.s	loc_DB60
		move.w	$14(a0),d0
		sub.w	(planea_start_y).w,d0
		cmpi.w	#0,d0
		ble.s	loc_DB60
		move.w	$14(a0),d0
		sub.w	(player_pos_y).w,d0
		cmpi.w	#0,d0
		bge.s	loc_DB60
		addq.w	#1,2(a0)
		move.b	#$28,$26(a0)

loc_DB60:
		jmp	sub_D948(pc)

sub_DB64:
		subq.b	#1,$26(a0)
		cmpi.b	#$23,$26(a0)
		beq.s	loc_DB94
		tst.b	$26(a0)
		bne.s	loc_DB98
		addq.w	#1,2(a0)
		subq.w	#2,4(a0)
		tst.w	$28(a0)
		beq.s	loc_DB90
		movea.w	$28(a0),a1
		clr.w	$28(a1)
		clr.w	$28(a0)

loc_DB90:
		jmp	sub_D948(pc)

loc_DB94:
		addq.w	#2,4(a0)

loc_DB98:
		jmp	sub_D948(pc)

sub_DB9C:
		jsr	sub_B88A(pc)
		jmp	sub_D948(pc)

sub_DBA4:
		jsr	sub_15C24
		bne.w	locret_DBB8
		move.w	$2A(a0),2(a0)
		clr.b	$F(a0)

locret_DBB8:
		rts

sub_DBBA:
		move.l	#$4000,d0
		jmp	sub_15C06

sub_DBC6:
		move.w	6(a1),d0
		asl.w	#1,d0
		lea	(word_DBDE).l,a2
		move.w	(a2,d0.w),d0
		add.w	d0,$14(a0)
		jmp	sub_B960(pc)

word_DBDE:	dc.w 0,	$FFFF, $FFFE, $FFFF
sub_DBE6:
		moveq	#0,d0
		move.w	2(a0),d0
		add.w	d0,d0
		move.w	off_DBF6(pc,d0.w),d0
		jmp	off_DBF6(pc,d0.w)

off_DBF6:	dc.w sub_DBFE-off_DBF6
		dc.w sub_DC1A-off_DBF6
		dc.w sub_DC84-off_DBF6
		dc.w sub_DD4E-off_DBF6
sub_DBFE:
		jsr	sub_BC72(pc)
		move.l	#off_11A912,$20(a0)
		bset	#7,$C(a0)
		moveq	#2,d0
		jsr	sub_CA8E(pc)
		bra.w	sub_B85A

sub_DC1A:
		movea.w	$28(a0),a1
		tst.w	$28(a0)
		bne.s	loc_DC2C
		bset	#0,$C(a0)
		rts

loc_DC2C:
		btst	#1,5(a1)
		beq.s	loc_DC40
		addq.w	#1,2(a0)
		move.b	#$BE,d2
		jsr	sub_ED12(pc)

loc_DC40:
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		addq.w	#4,$14(a0)
		btst	#0,$36(a1)
		beq.s	loc_DC72
		subi.w	#$1A,$10(a0)
		cmpi.w	#4,2(a1)
		beq.s	loc_DC6A
		bra.w	sub_DBC6

loc_DC6A:
		move.w	$2C(a1),$2C(a0)
		rts

loc_DC72:
		addi.w	#$17,$10(a0)
		cmpi.w	#4,2(a1)
		beq.s	loc_DC6A
		bra.w	sub_DBC6

sub_DC84:
		move.l	#$4000,d0
		jsr	sub_15C06
		jsr	sub_E9A8(pc)
		beq.s	loc_DC9C
		bset	#0,$C(a0)

loc_DC9C:
		jsr	sub_15AB0(pc)
		bne.s	loc_DCAC
		clr.w	d1
		clr.w	d2
		jsr	sub_BA6C(pc)
		beq.s	loc_DCFE

loc_DCAC:
		addq.w	#1,2(a0)
		move.b	#$BF,d2
		jsr	sub_ED12(pc)
		move.l	#$FFFE0000,$1C(a0)
		moveq	#3,d6
		lea	(stru_DD16).l,a2

loc_DCC8:
		jsr	sub_EA3C(pc)
		bne.s	loc_DCFE
		move.w	#$1A,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	(a2)+,d0
		add.w	d0,$10(a1)
		move.w	(a2)+,d0
		add.w	d0,$14(a1)
		move.w	(a2)+,d0
		move.b	d0,$36(a1)
		move.l	(a2)+,$18(a1)
		move.l	(a2)+,$1C(a1)
		dbf	d6,loc_DCC8

loc_DCFE:
		move.w	(planea_start_y).w,d0
		addi.w	#$C0,d0
		cmp.w	$14(a0),d0
		bgt.s	loc_DD12
		andi.w	#$7FFF,$A(a0)

loc_DD12:
		jmp	sub_B960(pc)

stru_DD16:	struc_43 $FFFC, $FFF8,	6, $FFFF0000, $FFFF0000
		struc_43 4, $FFF8, 5, $10000, $FFFF0000
		struc_43 $FFFC, 0, 6, $FFFF0000, $10000
		struc_43 4, 0,	5, $10000, $10000
sub_DD4E:
		move.l	#$4000,d0
		jsr	sub_15C06
		move.w	(planea_start_y).w,d0
		addi.w	#$C0,d0
		cmp.w	$14(a0),d0
		bgt.s	locret_DD6E
		andi.w	#$7FFF,$A(a0)

locret_DD6E:
		rts

sub_DD70:
		lea	(off_DD7A).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_DD7A:	dc.w sub_DD84-off_DD7A
		dc.w sub_DDB6-off_DD7A
		dc.w sub_DDD2-off_DD7A
		dc.w sub_DE00-off_DD7A
		dc.w sub_DF4A-off_DD7A
sub_DD84:
		jsr	sub_BC72(pc)
		move.l	#off_11A912,$20(a0)
		addq.w	#1,2(a0)
		bset	#7,$C(a0)
		move.w	$10(a0),$28(a0)
		move.w	$14(a0),$2A(a0)
		move.b	#$14,$26(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		bra.w	loc_B842

sub_DDB6:
		subq.b	#1,$26(a0)
		bne.s	loc_DDCE
		move.b	#$B7,d2
		jsr	sub_ED12(pc)
		addq.w	#1,2(a0)
		move.b	#$A,$26(a0)

loc_DDCE:
		jmp	sub_B960(pc)

sub_DDD2:
		subq.b	#1,$26(a0)
		bne.s	loc_DDF8
		addq.w	#1,2(a0)
		move.b	#$B7,d2
		jsr	sub_ED12(pc)
		move.b	#$A,$26(a0)
		bsr.w	rand
		move.b	d0,$27(a0)
		move.w	#$12C,$38(a0)

loc_DDF8:
		bsr.w	sub_B88A
		jmp	sub_B960(pc)

sub_DE00:
		jsr	sub_E9A8(pc)
		beq.s	loc_DE0E
		bset	#0,$C(a0)
		rts

loc_DE0E:
		subq.w	#1,$38(a0)
		bne.s	loc_DE28
		move.l	#$FFFE0000,$1C(a0)
		addq.w	#1,2(a0)
		move.b	#$B7,(smps_cmd2).w
		rts

loc_DE28:
		move.w	$38(a0),d0
		andi.w	#$3F,d0
		bne.s	loc_DE38
		move.b	#$B7,(smps_cmd2).w

loc_DE38:
		subq.b	#1,$26(a0)
		bne.s	loc_DE50
		move.b	#$A,$26(a0)
		bsr.w	rand
		move.b	d0,$27(a0)
		jmp	sub_B960(pc)

loc_DE50:
		move.w	$2A(a0),d0
		subi.w	#$30,d0
		cmp.w	$14(a0),d0
		bgt.w	loc_DEEA
		addi.w	#$60,d0
		cmp.w	$14(a0),d0
		blt.s	loc_DECA
		btst	#1,$27(a0)
		bne.s	loc_DECA
		bra.s	loc_DEEA

loc_DE74:
		move.w	$28(a0),d0
		subi.w	#$30,d0
		cmp.w	$10(a0),d0
		bgt.w	loc_DF2A
		addi.w	#$60,d0
		cmp.w	$10(a0),d0
		blt.s	loc_DF0A
		btst	#0,$27(a0)
		bne.w	loc_DF2A
		bra.s	loc_DF0A

loc_DE9A:
		tst.w	$18(a0)
		blt.s	loc_DEB6
		cmpi.w	#5,4(a0)
		beq.s	loc_DEAE
		moveq	#5,d0
		bsr.w	loc_B842

loc_DEAE:
		bsr.w	sub_B88A
		jmp	sub_B960(pc)

loc_DEB6:
		cmpi.w	#6,4(a0)
		beq.s	loc_DEAE
		bsr.w	sub_B87A
		bsr.w	sub_B88A
		jmp	sub_B960(pc)

loc_DECA:
		move.l	$1C(a0),d0
		addi.l	#-$2000,d0
		cmpi.l	#$FFFE0000,d0
		bge.s	loc_DEE2
		move.l	#$FFFE0000,d0

loc_DEE2:
		move.l	d0,$1C(a0)
		bra.w	loc_DE74

loc_DEEA:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$20000,d0
		ble.s	loc_DF02
		move.l	#$20000,d0

loc_DF02:
		move.l	d0,$1C(a0)
		bra.w	loc_DE74

loc_DF0A:
		move.l	$18(a0),d0
		addi.l	#-$2000,d0
		cmpi.l	#$FFFE0000,d0
		bge.s	loc_DF22
		move.l	#$FFFE0000,d0

loc_DF22:
		move.l	d0,$18(a0)
		bra.w	loc_DE9A

loc_DF2A:
		move.l	$18(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$20000,d0
		ble.s	loc_DF42
		move.l	#$20000,d0

loc_DF42:
		move.l	d0,$18(a0)
		bra.w	loc_DE9A

sub_DF4A:
		jsr	sub_B88A(pc)
		jmp	sub_B960(pc)

sub_DF52:
		lea	(off_DF5C).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_DF5C:	dc.w sub_DFCA-off_DF5C
		dc.w sub_E076-off_DF5C
		dc.w sub_E112-off_DF5C
		dc.w sub_E276-off_DF5C
		dc.w sub_E312-off_DF5C
		dc.w sub_E476-off_DF5C
		dc.w sub_E4B0-off_DF5C
sub_DF6A:
		jsr	sub_B9B8(pc)
		beq.w	loc_DFA8
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_DF86
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_DFAC

loc_DF86:
		move.b	#$FA,$27(a0)
		jsr	sub_15CD6
		move.b	#3,$2C(a0)
		move.w	#5,2(a0)
		bset	#1,$D(a0)
		jsr	sub_EA54(pc)

loc_DFA8:
		jmp	sub_B960(pc)

loc_DFAC:
		jsr	sub_15CCC(pc)
		move.w	#6,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		jsr	sub_EA54(pc)
		bset	#1,$D(a0)
		rts

sub_DFCA:
		jsr	sub_BC72(pc)
		move.l	#off_121E4A,$20(a0)
		cmpi.w	#$45,0.w(a0)
		beq.s	loc_DFFE
		move.l	#off_121F4E,$20(a0)
		cmpi.w	#$4D,0.w(a0)
		beq.s	loc_DFFE
		cmpi.w	#$7F,0.w(a0)
		beq.s	loc_DFFE
		move.l	#off_11ADD4,$20(a0)

loc_DFFE:
		addq.w	#1,2(a0)
		move.b	#1,$39(a0)
		move.b	#$78,$26(a0)
		bset	#1,$D(a0)
		move.b	$36(a0),$2A(a0)
		andi.b	#1,$2A(a0)
		moveq	#0,d0
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)
		btst	#7,$36(a0)
		beq.s	locret_E074
		jsr	sub_EA04(pc)
		bne.s	locret_E074
		move.w	#2,0.w(a1)
		move.w	#$83C0,$A(a1)
		move.l	#off_121DB4,$20(a1)
		move.w	a2,$2A(a1)
		move.w	$10(a2),$10(a1)
		move.w	$14(a2),$14(a1)
		move.b	#4,$36(a1)
		move.w	a1,$3E(a2)
		btst	#0,4(a2)
		beq.s	locret_E074
		bset	#0,$36(a1)

locret_E074:
		rts

sub_E076:
		subq.b	#1,$26(a0)
		bne.s	loc_E0A0
		jsr	sub_E9A8(pc)
		beq.s	loc_E08C
		move.b	#$78,$26(a0)
		bra.w	sub_DF6A

loc_E08C:
		move.b	#$14,$26(a0)
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)
		bra.w	sub_DF6A

loc_E0A0:
		btst	#1,$36(a0)
		beq.s	loc_E0D4
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		bcc.s	loc_E0BC
		btst	#0,$2A(a0)
		bne.s	loc_E0D4
		bra.s	loc_E0C4

loc_E0BC:
		btst	#0,$2A(a0)
		beq.s	loc_E0D4

loc_E0C4:
		bchg	#0,$2A(a0)
		moveq	#0,d0
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)

loc_E0D4:
		btst	#2,$36(a0)
		beq.s	loc_E10E
		move.w	(word_FFA2C4).w,d0
		cmpi.w	#$14,d0
		beq.s	loc_E0FC
		cmpi.w	#$15,d0
		beq.s	loc_E0FC
		cmpi.w	#6,d0
		blt.w	loc_E10E
		cmpi.w	#9,d0
		bgt.w	loc_E10E

loc_E0FC:
		addq.w	#2,2(a0)
		moveq	#0,d0
		addq.b	#2,$2A(a0)
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)

loc_E10E:
		bra.w	sub_DF6A

sub_E112:
		subq.b	#1,$26(a0)
		bne.s	loc_E136
		move.b	#$78,$26(a0)
		subq.w	#1,2(a0)
		bset	#1,$D(a0)
		moveq	#0,d0
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)
		bra.w	sub_DF6A

loc_E136:
		cmpi.w	#1,6(a0)
		bne.w	loc_E10E
		move.b	9(a0),d0
		subq.b	#1,d0
		cmp.b	8(a0),d0
		bne.w	loc_E10E
		jsr	sub_EA3C(pc)
		bne.w	loc_E10E
		move.b	#$B8,(smps_cmd2).w
		cmpi.w	#3,0.w(a0)
		beq.s	loc_E180
		cmpi.w	#$2D,0.w(a0)
		beq.s	loc_E1D2
		cmpi.w	#$7E,0.w(a0)
		beq.w	loc_E22A
		cmpi.w	#$7F,0.w(a0)
		beq.w	loc_E22A

loc_E180:
		move.w	#6,0.w(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$14,$14(a1)
		move.w	$10(a0),$10(a1)
		btst	#0,5(a0)
		bne.s	loc_E1B6
		addi.w	#$18,$10(a1)
		move.w	#4,$18(a1)
		move.b	#6,$36(a1)
		bra.w	sub_DF6A

loc_E1B6:
		subi.w	#$18,$10(a1)
		move.w	#$FFFC,$18(a1)
		move.b	#1,$26(a1)
		move.b	#7,$36(a1)
		bra.w	sub_DF6A

loc_E1D2:
		move.w	#$2E,0.w(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$1C,$14(a1)
		move.w	$10(a0),$10(a1)
		move.w	#$FFFD,$1C(a1)
		btst	#0,5(a0)
		bne.s	loc_E20E
		addi.w	#$14,$10(a1)
		move.w	#2,$18(a1)
		move.b	#6,$36(a1)
		bra.w	sub_DF6A

loc_E20E:
		subi.w	#$14,$10(a1)
		move.w	#$FFFE,$18(a1)
		move.b	#1,$26(a1)
		move.b	#7,$36(a1)
		bra.w	sub_DF6A

loc_E22A:
		move.w	#$7A,0.w(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$1C,$14(a1)
		move.w	$10(a0),$10(a1)
		move.w	#$FFFD,$1C(a1)
		btst	#0,5(a0)
		bne.s	loc_E260
		addi.w	#$14,$10(a1)
		move.w	#2,$18(a1)
		bra.w	sub_DF6A

loc_E260:
		subi.w	#$14,$10(a1)
		move.w	#$FFFE,$18(a1)
		move.b	#1,$26(a1)
		bra.w	sub_DF6A

sub_E276:
		subq.b	#1,$26(a0)
		bne.s	loc_E2A0
		jsr	sub_E9A8(pc)
		beq.s	loc_E28C
		move.b	#$78,$26(a0)
		bra.w	sub_DF6A

loc_E28C:
		move.b	#$14,$26(a0)
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)
		bra.w	sub_DF6A

loc_E2A0:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		bcc.s	loc_E2B4
		btst	#0,$2A(a0)
		bne.s	loc_E2D4
		bra.s	loc_E2BC

loc_E2B4:
		btst	#0,$2A(a0)
		beq.s	loc_E2D4

loc_E2BC:
		btst	#1,$36(a0)
		beq.s	loc_E2D4
		bchg	#0,$2A(a0)
		moveq	#0,d0
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)

loc_E2D4:
		move.w	(word_FFA2C4).w,d0
		cmpi.w	#$14,d0
		beq.w	loc_E30E
		cmpi.w	#$15,d0
		beq.w	loc_E30E
		cmpi.w	#6,d0
		blt.w	loc_E2F8
		cmpi.w	#9,d0
		ble.w	loc_E30E

loc_E2F8:
		subq.w	#2,2(a0)
		moveq	#0,d0
		subq.b	#2,$2A(a0)
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)
		bra.w	sub_DF6A

loc_E30E:
		bra.w	sub_DF6A

sub_E312:
		subq.b	#1,$26(a0)
		bne.w	loc_E338
		move.b	#$78,$26(a0)
		subq.w	#1,2(a0)
		bset	#1,$D(a0)
		moveq	#0,d0
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)
		bra.w	sub_DF6A

loc_E338:
		cmpi.w	#1,6(a0)
		bne.w	loc_E10E
		move.b	9(a0),d0
		subq.b	#1,d0
		cmp.b	8(a0),d0
		bne.w	loc_E10E
		jsr	sub_EA3C(pc)
		bne.w	loc_E10E
		move.b	#$B8,(smps_cmd2).w
		cmpi.w	#3,0.w(a0)
		beq.s	loc_E382
		cmpi.w	#$2D,0.w(a0)
		beq.s	loc_E3D2
		cmpi.w	#$7E,0.w(a0)
		beq.w	loc_E42A
		cmpi.w	#$7F,0.w(a0)
		beq.w	loc_E42A

loc_E382:
		move.w	#6,0.w(a1)
		move.w	$14(a0),$14(a1)
		subq.w	#4,$14(a1)
		move.w	$10(a0),$10(a1)
		btst	#0,5(a0)
		bne.s	loc_E3B6
		addi.w	#$1C,$10(a1)
		move.w	#4,$18(a1)
		move.b	#6,$36(a1)
		bra.w	sub_DF6A

loc_E3B6:
		subi.w	#$1C,$10(a1)
		move.w	#$FFFC,$18(a1)
		move.b	#1,$26(a1)
		move.b	#7,$36(a1)
		bra.w	sub_DF6A

loc_E3D2:
		move.w	#$2E,0.w(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$10,$14(a1)
		move.w	$10(a0),$10(a1)
		move.w	#$FFFE,$1C(a1)
		btst	#0,5(a0)
		bne.s	loc_E40E
		addi.w	#$1C,$10(a1)
		move.w	#2,$18(a1)
		move.b	#6,$36(a1)
		bra.w	sub_DF6A

loc_E40E:
		subi.w	#$1C,$10(a1)
		move.w	#$FFFE,$18(a1)
		move.b	#1,$26(a1)
		move.b	#7,$36(a1)
		bra.w	sub_DF6A

loc_E42A:
		move.w	#$7A,0.w(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$10,$14(a1)
		move.w	$10(a0),$10(a1)
		move.w	#$FFFE,$1C(a1)
		btst	#0,5(a0)
		bne.s	loc_E460
		addi.w	#$1C,$10(a1)
		move.w	#2,$18(a1)
		bra.w	sub_DF6A

loc_E460:
		subi.w	#$1C,$10(a1)
		move.w	#$FFFE,$18(a1)
		move.b	#1,$26(a1)
		bra.w	sub_DF6A

sub_E476:
		jsr	sub_15C24
		bne.w	locret_E4AE
		subq.w	#4,2(a0)
		bset	#1,$D(a0)
		move.b	#$78,$26(a0)
		move.w	#1,$28(a0)
		moveq	#0,d0
		btst	#0,$2A(a0)
		beq.s	loc_E4A4
		bset	#0,d0

loc_E4A4:
		bclr	#1,$2A(a0)
		jmp	loc_B842(pc)

locret_E4AE:
		rts

sub_E4B0:
		move.l	#$4000,d0
		jmp	sub_15C06

sub_E4BC:
		cmpi.w	#1,2(a0)
		bgt.w	loc_E55C
		beq.s	loc_E4F4
		jsr	sub_BC72(pc)
		move.l	#off_11ADD4,$20(a0)
		bset	#7,$C(a0)
		addq.w	#1,2(a0)
		bset	#1,$D(a0)
		moveq	#1,d0
		jsr	sub_CA8E(pc)
		moveq	#0,d0
		move.b	$36(a0),d0
		bra.w	loc_B842

loc_E4F4:
		move.w	$18(a0),d0
		add.w	d0,$10(a0)
		moveq	#0,d0
		tst.w	$18(a0)
		bgt.s	loc_E506
		moveq	#1,d0

loc_E506:
		jsr	sub_CA58(pc)
		cmpi.w	#$2D,d7
		beq.s	loc_E514
		tst.w	d7
		bne.s	loc_E52C

loc_E514:
		jsr	sub_1190C(pc)
		beq.s	locret_E52A
		lea	(word_FFA2C0).w,a1
		jsr	sub_B960(pc)
		beq.s	locret_E52A
		jsr	sub_B948(pc)
		bne.s	loc_E52C

locret_E52A:
		rts

loc_E52C:
		move.w	#1,6(a0)
		move.b	#$BB,d2
		jsr	sub_ED12(pc)
		clr.l	$18(a0)
		addq.w	#1,2(a0)
		andi.w	#$FFF0,$10(a0)
		subq.w	#1,$10(a0)
		btst	#0,$36(a0)
		beq.s	locret_E55A
		addi.w	#$11,$10(a0)

locret_E55A:
		rts

loc_E55C:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$30000,d0
		ble.s	loc_E574
		move.l	#$30000,d0

loc_E574:
		move.l	d0,$1C(a0)
		add.l	d0,$14(a0)
		move.w	(planea_start_y).w,d0
		addi.w	#$C0,d0
		cmp.w	$14(a0),d0
		bgt.s	loc_E590
		andi.w	#$7FFF,$A(a0)

loc_E590:
		moveq	#3,d0
		jsr	sub_CA58(pc)
		beq.s	locret_E52A
		bset	#0,$C(a0)
		rts

sub_E5A0:
		lea	(off_E5AA).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_E5AA:	dc.w sub_E5B8-off_E5AA
		dc.w sub_E626-off_E5AA
		dc.w sub_E64A-off_E5AA
		dc.w sub_E674-off_E5AA
		dc.w sub_E6BA-off_E5AA
		dc.w sub_E6DC-off_E5AA
		dc.w sub_E70E-off_E5AA
sub_E5B8:
		jsr	sub_BC72(pc)
		move.l	#off_11AEBE,$20(a0)
		addq.w	#1,2(a0)
		tst.b	$36(a0)
		beq.s	loc_E5D8
		addq.w	#2,2(a0)
		addi.w	#$30,$14(a0)

loc_E5D8:
		moveq	#1,d0
		jsr	loc_B842(pc)
		jsr	sub_EA04(pc)
		bne.w	locret_E6B8
		move.w	#5,0.w(a1)
		move.w	$10(a2),$10(a1)
		addq.w	#4,$10(a1)
		move.w	$14(a2),$14(a1)
		subi.w	#$14,$14(a1)
		move.w	a1,$28(a2)
		move.w	a2,$28(a1)
		move.w	#$847F,$A(a1)
		move.l	#off_11AEBE,$20(a1)
		tst.b	$36(a2)
		beq.s	locret_E624
		bclr	#7,$A(a1)

locret_E624:
		rts

sub_E626:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$20,d0
		bgt.s	sub_E64A
		cmpi.w	#$FFE0,d0
		blt.s	sub_E64A
		addq.w	#1,2(a0)
		movea.w	$28(a0),a1
		addq.w	#1,2(a1)
		bsr.w	sub_B872

sub_E64A:
		movea.w	$28(a0),a1
		cmpi.w	#5,0.w(a1)
		beq.s	locret_E6B8
		clr.w	$28(a0)
		move.w	#1,2(a0)
		tst.b	$36(a0)
		beq.w	loc_E5D8
		addq.w	#2,2(a0)
		bra.w	loc_E5D8
sub_E670:
		jmp	sub_B960(pc)

sub_E674:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$80,d0
		bgt.s	locret_E6B8
		cmpi.w	#$FF80,d0
		blt.s	locret_E6B8
		addq.w	#1,2(a0)
		move.w	#$3A,$26(a0)

loc_E692:
		movea.w	$28(a0),a1
		cmpi.w	#5,0.w(a1)
		beq.s	locret_E6B8
		clr.w	$28(a0)
		move.w	#1,2(a0)
		tst.b	$36(a0)
		beq.w	loc_E5D8
		addq.w	#2,2(a0)
		bra.w	loc_E5D8

locret_E6B8:
		rts

sub_E6BA:
		cmpi.w	#$30,$26(a0)
		bgt.s	loc_E6C6
		subq.w	#1,$14(a0)

loc_E6C6:
		subq.w	#1,$26(a0)
		bne.s	loc_E692
		addq.w	#1,2(a0)
		movea.w	$28(a0),a1
		bset	#7,$A(a1)
		rts

sub_E6DC:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$20,d0
		bgt.w	sub_E64A
		cmpi.w	#$FFE0,d0
		blt.w	sub_E64A
		addq.w	#1,2(a0)
		movea.w	$28(a0),a1
		addq.w	#1,2(a1)
		bsr.w	sub_B872
		move.w	#$94,$26(a0)
		bra.w	sub_E64A

sub_E70E:
		cmpi.w	#$30,$26(a0)
		bgt.s	loc_E71A
		addq.w	#1,$14(a0)

loc_E71A:
		subq.w	#1,$26(a0)
		bne.w	locret_E6B8
		clr.w	$28(a0)
		move.w	#1,2(a0)
		tst.b	$36(a0)
		beq.w	loc_E74E
		addq.w	#2,2(a0)
		bra.w	loc_E5D8

sub_E73C:
		cmpi.w	#1,2(a0)
		beq.s	loc_E752
		bgt.s	loc_E76E
		move.l	#off_11AEBE,$20(a0)

loc_E74E:
		bra.w	sub_B852

loc_E752:
		movea.w	$28(a0),a1
		move.w	$10(a1),$10(a0)
		addq.w	#4,$10(a0)
		move.w	$14(a1),$14(a0)
		subi.w	#$14,$14(a0)
		rts

loc_E76E:
		move.l	#$2000,d0
		jsr	sub_15C06
		move.w	(planea_start_y).w,d0
		addi.w	#$C0,d0
		cmp.w	$14(a0),d0
		bgt.s	loc_E78E
		andi.w	#$7FFF,$A(a0)

loc_E78E:
		jmp	sub_B960(pc)

sub_E792:
		cmpi.w	#1,2(a0)
		beq.s	loc_E7B8
		bcc.s	loc_E802
		jsr	sub_BC72(pc)
		move.l	#off_11AD26,$20(a0)
		bset	#2,$D(a0)
		move.b	#$F0,$26(a0)
		bra.w	sub_B856

loc_E7B8:
		subq.b	#1,$26(a0)
		bne.s	locret_E800
		addq.w	#1,2(a0)
		move.b	#$BD,(smps_cmd2).w
		move.b	#$F0,$26(a0)
		move.w	#4,$1C(a0)
		move.l	(planea_start_y).w,d0
		move.l	d0,$14(a0)
		move.w	$10(a0),$28(a0)
		move.w	$14(a0),$2A(a0)
		tst.b	$36(a0)
		beq.s	loc_E7FA
		move.w	#$FFFC,$1C(a0)
		addi.w	#$E0,$14(a0)

loc_E7FA:
		bclr	#2,$D(a0)

locret_E800:
		rts

loc_E802:
		subq.b	#1,$26(a0)
		move.w	$1C(a0),d0
		add.w	d0,$14(a0)
		move.w	(planea_start_x).w,d0
		addi.w	#$C0,d0
		cmp.w	$10(a0),d0
		bgt.s	loc_E822
		andi.w	#$7FFF,$A(a0)

loc_E822:
		jsr	sub_E9A8(pc)
		beq.s	loc_E83E
		subq.w	#1,2(a0)
		bset	#2,$D(a0)
		move.w	$28(a0),$10(a0)
		move.w	$2A(a0),$14(a0)

loc_E83E:
		jmp	sub_B960(pc)

sub_E842:
		tst.w	2(a0)
		bne.s	loc_E864
		jsr	sub_BC72(pc)
		move.l	#off_11AD26,$20(a0)
		bset	#7,$C(a0)
		move.b	#$BD,(smps_cmd2).w
		bra.w	sub_B856

loc_E864:
		move.w	$18(a0),d0
		add.w	d0,$10(a0)
		jmp	sub_B960

sub_E872:
		cmpi.w	#1,2(a0)
		beq.s	loc_E8A8
		bgt.s	loc_E8C0
		jsr	sub_BC72(pc)
		move.l	#off_11AD26,$20(a0)
		bset	#7,$C(a0)
		addq.w	#1,2(a0)
		move.b	#$B9,$26(a0)
		bset	#1,$D(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		bra.w	loc_B842

loc_E8A8:
		subq.b	#1,$26(a0)
		bne.s	locret_E8BE
		move.b	#$37,$26(a0)
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)

locret_E8BE:
		rts

loc_E8C0:
		subq.b	#1,$26(a0)
		bne.s	loc_E8E0
		move.b	#$B9,$26(a0)
		subq.w	#1,2(a0)
		bset	#1,$D(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		bra.w	loc_B842

loc_E8E0:
		cmpi.w	#4,6(a0)
		bne.w	locret_E8BE
		move.b	9(a0),d0
		subq.b	#1,d0
		cmp.b	8(a0),d0
		bne.w	locret_E8BE
		jsr	sub_E9A8(pc)
		bne.s	locret_E8BE
		jsr	sub_EA3C(pc)
		bne.w	locret_E8BE
		move.w	#9,0.w(a1)
		move.w	$14(a0),$14(a1)
		move.w	$10(a0),$10(a1)
		tst.w	4(a0)
		bne.s	loc_E92C
		addi.w	#$18,$10(a1)
		move.w	#3,$18(a1)
		rts

loc_E92C:
		subi.w	#$18,$10(a1)
		move.w	#$FFFD,$18(a1)
		rts

sub_E93A:
		tst.w	2(a0)
		bne.s	loc_E960
		jsr	sub_BC72(pc)
		move.l	#off_11AD6A,$20(a0)
		addq.w	#1,2(a0)
		bset	#2,$D(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		bra.w	loc_B842

loc_E960:
		tst.b	(byte_FFEEF7).w
		bne.s	loc_E9A0
		addq.b	#1,$26(a0)
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$80,d0
		bgt.s	loc_E998
		cmpi.w	#$FF80,d0
		blt.s	loc_E998
		btst	#0,$26(a0)
		beq.s	loc_E998
		bclr	#2,$D(a0)
		move.b	#$C6,d2
		jsr	sub_ED12(pc)
		jmp	sub_B960(pc)

loc_E998:
		bset	#2,$D(a0)
		rts

loc_E9A0:
		bset	#0,$C(a0)
		rts

sub_E9A8:
		move.w	$10(a0),d0
		move.w	$14(a0),d1
		sub.w	(planea_start_x).w,d0
		cmpi.w	#$FFE0,d0
		ble.s	loc_E9D4
		cmpi.w	#$160,d0
		bge.s	loc_E9D4
		sub.w	(planea_start_y).w,d1
		cmpi.w	#$FFF0,d1
		ble.s	loc_E9D4
		cmpi.w	#$E0,d1
		bge.s	loc_E9D4
		moveq	#0,d0
		rts

loc_E9D4:
		moveq	#1,d0
		rts

sub_E9D8:
		jsr	sub_EA3C(pc)
		bne.w	locret_EA02
		cmpa.l	a0,a1
		bcc.s	loc_E9FE
		movea.l	a1,a2
		movea.l	a0,a1
		jsr	copy_bytes_to_dest_64(pc) ; a1 = source
		movea.l	a0,a1
		moveq	#0,d1
		jsr	fill_ram_64_bytes(pc) ;	d1 = dword
		suba.w	#$40,a1
		suba.w	#$40,a2
		bra.s	loc_EA00

loc_E9FE:
		movea.l	a0,a2

loc_EA00:
		moveq	#0,d1

locret_EA02:
		rts

sub_EA04:
		jsr	sub_EA3C(pc)
		bne.w	loc_EA30
		cmpa.l	a0,a1
		bcs.s	loc_EA2A
		movea.l	a1,a2
		movea.l	a0,a1
		jsr	copy_bytes_to_dest_64(pc) ; a1 = source
		movea.l	a0,a1
		moveq	#0,d1
		jsr	fill_ram_64_bytes(pc) ;	d1 = dword
		suba.w	#$40,a1
		suba.w	#$40,a2
		bra.s	loc_EA2C

loc_EA2A:
		movea.l	a0,a2

loc_EA2C:
		moveq	#0,d1
		rts

loc_EA30:
		moveq	#1,d1
		rts

sub_EA34:
		lea	(objects_memory).w,a1
		moveq	#$F,d7
		bra.s	loc_EA42

sub_EA3C:
		lea	(word_FF9000).w,a1
		moveq	#$2F,d7

loc_EA42:
		tst.w	0.w(a1)
		beq.s	locret_EA52
		adda.w	#$40,a1
		dbf	d7,loc_EA42
		rts

locret_EA52:
		rts

sub_EA54:
		bclr	#7,$36(a0)
		beq.s	locret_EAB4
		movea.w	$2E(a0),a1
		andi.b	#$F,-1(a1)
		movea.w	$3E(a0),a1
		bset	#0,$C(a1)
		jsr	sub_EA3C(pc)
		bne.s	locret_EAB4
		move.w	#$68,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		moveq	#0,d0
		move.b	$36(a0),d0
		lsr.l	#4,d0
		move.b	d0,$36(a1)
		bset	#6,$36(a1)
		subq.w	#8,$14(a1)
		btst	#0,5(a0)
		bne.s	loc_EAAE
		subi.w	#$A,$10(a1)
		rts

loc_EAAE:
		addi.w	#$A,$10(a1)

locret_EAB4:
		rts

sub_EAB6:
		moveq	#0,d2
		move.w	d0,d3
		eor.w	d4,d3
		sub.w	d4,d0
		bcc.s	loc_EACE
		andi.w	#$8000,d3
		bne.s	loc_EAD4

loc_EAC6:
		bset	#0,d2
		neg.w	d0
		bra.s	loc_EAD4

loc_EACE:
		andi.w	#$8000,d3
		bne.s	loc_EAC6

loc_EAD4:
		sub.w	d5,d1
		bpl.s	loc_EAE2
		tst.w	d5
		bmi.s	loc_EAE2
		bset	#1,d2
		neg.w	d1

loc_EAE2:
		cmp.w	d0,d1
		bcs.s	loc_EAEC
		bset	#2,d2
		exg	d0,d1

loc_EAEC:
		ext.l	d1
		lsl.l	#6,d1
		tst.w	d0
		bne.s	loc_EAF8
		moveq	#0,d1
		bra.s	loc_EAFA

loc_EAF8:
		divu.w	d0,d1

loc_EAFA:
		andi.w	#$FF,d1
		cmpi.b	#$40,d1
		bcs.s	locret_EB08
		move.b	#$3F,d1

locret_EB08:
		rts

sub_EB0A:
		lea	word_EC90(pc),a1
		andi.w	#$FF,d1
		add.w	d1,d1
		adda.w	d1,a1
		move.w	#0,d0
		move.w	#0,d1
		move.w	(a1),d0
		btst	#2,d2
		beq.s	loc_EB2C
		move.w	d6,d1
		move.w	d4,d2
		bra.s	loc_EB30

loc_EB2C:
		move.w	d5,d1
		move.w	d3,d2

loc_EB30:
		sub.w	d2,d1
		bpl.s	loc_EB36
		neg.w	d1

loc_EB36:
		mulu.w	d1,d0
		lsr.l	#8,d0
		rts

sub_EB3C:
		lea	stru_EB8C(pc),a1
		andi.w	#$FF,d1
		add.w	d1,d1
		add.w	d1,d1
		bne.s	loc_EB52
		move.w	#0,d0
		move.w	d3,d1
		bra.s	loc_EB60

loc_EB52:
		adda.w	d1,a1
		move.w	(a1)+,d0
		move.w	(a1),d1
		mulu.w	d3,d0
		swap	d0
		mulu.w	d3,d1
		swap	d1

loc_EB60:
		btst	#2,d2
		beq.s	loc_EB68
		exg	d0,d1

loc_EB68:
		btst	#1,d2
		beq.s	loc_EB70
		neg.w	d0

loc_EB70:
		swap	d0
		move.w	#0,d0
		asr.l	#8,d0
		btst	#0,d2
		beq.s	loc_EB80
		neg.w	d1

loc_EB80:
		swap	d1
		move.w	#0,d1
		asr.l	#8,d1
		exg	d0,d1
		rts

stru_EB8C:	struc_44 $FF, $FFFF
		struc_44 $400,	$FFF8
		struc_44 $7FF,	$FFE0
		struc_44 $BFD,	$FFB8
		struc_44 $FF8,	$FF80
		struc_44 $13F0, $FF39
		struc_44 $17E5, $FEE2
		struc_44 $1BD6, $FE7B
		struc_44 $1FC1, $FE06
		struc_44 $23A6, $FD81
		struc_44 $2785, $FCEE
		struc_44 $2B5D, $FC4D
		struc_44 $2F2E, $FB9E
		struc_44 $32F6, $FAE0
		struc_44 $36B5, $FA16
		struc_44 $3A6B, $F93F
		struc_44 $3E17, $F85B
		struc_44 $41B9, $F76C
		struc_44 $4550, $F670
		struc_44 $48DB, $F56A
		struc_44 $4C5C, $F459
		struc_44 $4FD0, $F33E
		struc_44 $5338, $F219
		struc_44 $5694, $F0EA
		struc_44 $59E3, $EFB3
		struc_44 $5D25, $EE74
		struc_44 $605A, $ED2D
		struc_44 $6382, $EBDF
		struc_44 $669C, $EA89
		struc_44 $69A9, $E92E
		struc_44 $6CA8, $E7CC
		struc_44 $6F99, $E665
		struc_44 $727D, $E4F9
		struc_44 $7552, $E389
		struc_44 $781B, $E214
		struc_44 $7AD5, $E09B
		struc_44 $7D82, $DF20
		struc_44 $8021, $DDA1
		struc_44 $82B3, $DC1F
		struc_44 $8537, $DA9C
		struc_44 $87AE, $D916
		struc_44 $8A18, $D78F
		struc_44 $8C75, $D607
		struc_44 $8EC5, $D47E
		struc_44 $9108, $D2F4
		struc_44 $933F, $D16A
		struc_44 $9569, $CFE0
		struc_44 $9787, $CE56
		struc_44 $999A, $CCCD
		struc_44 $9BA0, $CB44
		struc_44 $9D9B, $C9BC
		struc_44 $9F8A, $C835
		struc_44 $A16F, $C6AF
		struc_44 $A348, $C52B
		struc_44 $A516, $C3A9
		struc_44 $A6DA, $C228
		struc_44 $A894, $C0A9
		struc_44 $AA43, $BF2C
		struc_44 $ABE9, $BDB1
		struc_44 $AD84, $BC39
		struc_44 $AF17, $BAC3
		struc_44 $B0A0, $B94F
		struc_44 $B220, $B7DF
		struc_44 $B397, $B670
		struc_44 $B505, $B505
word_EC90:	dc.w $FF, $100,	$100, $100, $100, $100,	$101, $101, $101, $102
		dc.w $103, $103, $104, $105, $106, $106, $107, $108, $109, $10B
		dc.w $10C, $10D, $10E, $110, $111, $112, $114, $115, $117, $119
		dc.w $11A, $11C, $11E, $120, $121, $123, $125, $127, $129, $12B
		dc.w $12D, $130, $132, $134, $136, $138, $13B, $13D, $140, $142
		dc.w $144, $147, $149, $14C, $14E, $151, $154, $156, $159, $15C
		dc.w $15E, $161, $164, $167, $16A
sub_ED12:
		jsr	sub_E9A8(pc)
		bne.s	locret_ED1C
		move.b	d2,(smps_cmd2).w

locret_ED1C:
		rts

sub_ED1E:
		lea	(off_ED28).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_ED28:	dc.w sub_EDBE-off_ED28
		dc.w sub_EDFE-off_ED28
		dc.w sub_EE2A-off_ED28
		dc.w sub_EEB8-off_ED28
		dc.w sub_EF46-off_ED28
		dc.w sub_EF6C-off_ED28
		dc.w sub_EFA6-off_ED28
		dc.w sub_EFFE-off_ED28
		dc.w sub_F094-off_ED28
		dc.w sub_F0BE-off_ED28
sub_ED3C:
		jsr	loc_BA02(pc)
		beq.s	loc_ED50
		move.w	a0,$30(a1)
		bset	#4,$E(a0)
		bra.w	loc_ED8E

loc_ED50:
		jsr	sub_B9B8(pc)
		beq.w	loc_ED8E
		bclr	#4,$E(a0)
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_ED72
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_ED96

loc_ED72:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.w	#8,2(a0)
		bset	#1,$D(a0)

loc_ED8E:
		jsr	sub_B960(pc)
		jmp	loc_B97A(pc)

loc_ED96:
		jsr	sub_15CCC(pc)
		move.w	#9,2(a0)
		move.b	#$27,$26(a0)
		bclr	#1,$D(a0)
		btst	#0,$36(a0)
		bne.s	loc_EDB8
		jmp	sub_B876(pc)

loc_EDB8:
		moveq	#5,d0
		jmp	loc_B842(pc)

sub_EDBE:
		jsr	sub_BC72(pc)
		move.l	#off_11A196,$20(a0)
		moveq	#0,d0
		jsr	sub_CA8E(pc)
		bset	#4,$E(a0)
		bset	#1,$D(a0)
		btst	#0,$36(a0)
		bne.s	loc_EDF0
		move.l	#$10000,$18(a0)
		jmp	sub_B852(pc)

loc_EDF0:
		move.l	#$FFFF0000,$18(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

sub_EDFE:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$78,d0
		bgt.s	locret_EE28
		cmpi.w	#$FF88,d0
		blt.s	locret_EE28
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)
		btst	#0,$36(a0)
		beq.s	locret_EE28
		addq.w	#1,2(a0)

locret_EE28:
		rts

sub_EE2A:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$20,d0
		bgt.s	loc_EE68
		tst.w	d0
		blt.s	loc_EE4A
		addq.w	#2,2(a0)
		move.b	#$1E,$26(a0)
		jmp	sub_B872(pc)

loc_EE4A:
		cmpi.w	#$FFE0,d0
		bgt.s	loc_EE68
		addq.w	#1,2(a0)
		move.l	#$FFFF0000,$18(a0)
		bset	#0,$36(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

loc_EE68:
		jsr	sub_B88A(pc)
		jsr	sub_15A46(pc)
		moveq	#0,d0
		jsr	sub_CA58(pc)
		beq.s	loc_EE8A
		addq.w	#4,2(a0)
		move.l	#$FFFC0000,$1C(a0)
		clr.l	$18(a0)
		rts

loc_EE8A:
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_EEA0
		addq.w	#5,2(a0)
		clr.l	$1C(a0)
		clr.l	$18(a0)
		rts

loc_EEA0:
		move.w	(word_FFA2C4).w,d0
		cmpi.w	#$12,d0
		beq.w	sub_F0CC
		cmpi.w	#$14,d0
		beq.w	sub_F0FA
		bra.w	sub_ED3C

sub_EEB8:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$FFE0,d0
		blt.s	loc_EEF6
		tst.w	d0
		bgt.s	loc_EEDA
		addq.w	#1,2(a0)
		move.b	#$1E,$26(a0)
		moveq	#3,d0
		jmp	loc_B842(pc)

loc_EEDA:
		cmpi.w	#$20,d0
		blt.s	loc_EEF6
		subq.w	#1,2(a0)
		move.l	#$10000,$18(a0)
		bclr	#0,$36(a0)
		jmp	sub_B86E(pc)

loc_EEF6:
		jsr	sub_B88A(pc)
		jsr	sub_15A46(pc)
		moveq	#1,d0
		jsr	sub_CA58(pc)
		beq.s	loc_EF18
		addq.w	#3,2(a0)
		move.l	#$FFFC0000,$1C(a0)
		clr.l	$18(a0)
		rts

loc_EF18:
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_EF2E
		addq.w	#4,2(a0)
		clr.l	$1C(a0)
		clr.l	$18(a0)
		rts

loc_EF2E:
		move.w	(word_FFA2C4).w,d0
		cmpi.w	#$13,d0
		beq.w	sub_F0CC
		cmpi.w	#$15,d0
		beq.w	sub_F0FA
		bra.w	sub_ED3C

sub_EF46:
		subq.b	#1,$26(a0)
		bhi.s	loc_EF68
		moveq	#0,d0
		btst	#0,$36(a0)
		bne.s	loc_EF5E
		subq.w	#2,2(a0)
		jmp	sub_B86E(pc)

loc_EF5E:
		subq.w	#1,2(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

loc_EF68:
		bra.w	sub_ED3C

sub_EF6C:
		subq.b	#1,$26(a0)
		bhi.s	loc_EFA2
		bclr	#1,$D(a0)
		btst	#0,$36(a0)
		bne.s	loc_EF90
		subq.w	#3,2(a0)
		move.l	#$10000,$18(a0)
		jmp	sub_B86E(pc)

loc_EF90:
		subq.w	#2,2(a0)
		move.l	#$FFFF0000,$18(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

loc_EFA2:
		bra.w	sub_ED3C

sub_EFA6:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		move.l	d0,$1C(a0)
		ble.s	loc_EFBC
		addq.w	#1,2(a0)
		rts

loc_EFBC:
		btst	#0,5(a0)
		bne.s	loc_EFD6
		moveq	#0,d0
		jsr	sub_CA58(pc)
		bne.s	loc_EFE6
		move.l	#$A000,$18(a0)
		bra.s	loc_EFE6

loc_EFD6:
		moveq	#1,d0
		jsr	sub_CA58(pc)
		bne.s	loc_EFE6
		move.l	#$FFFF6000,$18(a0)

loc_EFE6:
		jsr	sub_B88A(pc)
		moveq	#2,d0
		jsr	sub_CA58(pc)
		beq.s	loc_EFFA
		clr.l	$1C(a0)
		addq.w	#1,2(a0)

loc_EFFA:
		bra.w	sub_ED3C

sub_EFFE:
		move.l	$1C(a0),d0
		addi.l	#$1C00,d0
		cmpi.l	#$40000,d0
		ble.s	loc_F016
		move.l	#$40000,d0

loc_F016:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		beq.s	loc_F090
		bclr	#0,$C(a0)
		andi.w	#$FFF0,$14(a0)
		clr.l	$1C(a0)
		btst	#0,5(a0)
		beq.s	loc_F068
		moveq	#1,d0
		jsr	sub_CA58(pc)
		bne.s	loc_F070

loc_F046:
		move.l	#$FFFF0000,$18(a0)
		subq.w	#4,2(a0)
		move.b	#$1E,$26(a0)
		subq.w	#1,$10(a0)
		bset	#0,$36(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

loc_F068:
		moveq	#0,d0
		jsr	sub_CA58(pc)
		bne.s	loc_F046

loc_F070:
		move.l	#$10000,$18(a0)
		subq.w	#5,2(a0)
		move.b	#$1E,$26(a0)
		addq.w	#1,$10(a0)
		bclr	#0,$36(a0)
		jmp	sub_B86E(pc)

loc_F090:
		bra.w	sub_ED3C

sub_F094:
		jsr	sub_15C24(pc)
		bne.w	locret_F0BC
		bclr	#1,$D(a0)
		btst	#0,$36(a0)
		bne.s	loc_F0B2
		subq.w	#6,2(a0)
		jmp	sub_B86E(pc)

loc_F0B2:
		subq.w	#5,2(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

locret_F0BC:
		rts

sub_F0BE:
		subq.b	#1,$26(a0)
		bhi.s	locret_F0CA
		bset	#0,$C(a0)

locret_F0CA:
		rts

sub_F0CC:
		move.b	#$1E,$26(a0)
		move.w	#5,2(a0)
		clr.w	6(a0)
		bset	#1,$D(a0)
		btst	#0,$36(a0)
		bne.s	loc_F0F2
		move.w	#4,4(a0)
		rts

loc_F0F2:
		move.w	#5,4(a0)
		rts

sub_F0FA:
		move.b	#$1E,$26(a0)
		move.w	#5,2(a0)
		move.w	#1,6(a0)
		bset	#1,$D(a0)
		btst	#0,$36(a0)
		bne.s	loc_F122
		move.w	#4,4(a0)
		rts

loc_F122:
		move.w	#5,4(a0)
		rts

sub_F12A:
		lea	(off_F134).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_F134:	dc.w sub_F1A0-off_F134
		dc.w sub_F1CA-off_F134
		dc.w sub_F1FE-off_F134
		dc.w sub_F25C-off_F134
		dc.w sub_F272-off_F134
sub_F13E:
		jsr	sub_B9B8(pc)
		bne.w	loc_F14E
		jsr	loc_BA02(pc)
		beq.w	loc_F17E

loc_F14E:
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_F162
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_F186

loc_F162:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.w	#3,2(a0)
		bset	#1,$D(a0)

loc_F17E:
		jsr	sub_B960(pc)
		jmp	loc_B97A(pc)

loc_F186:
		jsr	sub_15CCC(pc)
		move.w	#4,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		bset	#1,$D(a0)
		rts

sub_F1A0:
		jsr	sub_BC72(pc)
		move.l	#off_1215E4,$20(a0)
		moveq	#3,d0
		jsr	sub_CA8E(pc)
		move.w	#$C,$18(a0)
		btst	#0,$36(a0)
		beq.s	loc_F1C6
		move.w	#$FFF4,$18(a0)

loc_F1C6:
		jmp	sub_B856(pc)

sub_F1CA:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$78,d0
		bgt.s	loc_F1FA
		cmpi.w	#$FF88,d0
		blt.s	loc_F1FA
		addq.w	#2,$14(a0)
		jsr	sub_15AB0(pc)
		beq.s	loc_F1FA
		btst	#0,$36(a0)
		bne.s	loc_F1F4
		jmp	sub_B852(pc)

loc_F1F4:
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_F1FA:
		jmp	sub_B960(pc)

sub_F1FE:
		move.b	9(a0),d0
		subq.b	#1,d0
		cmp.b	8(a0),d0
		bne.w	loc_F23E
		jsr	sub_B88A(pc)
		jsr	sub_15A46(pc)
		move.w	d7,d0
		add.w	d7,d7
		lea	(word_F27C).l,a1
		btst	#0,$36(a0)
		beq.s	loc_F22C
		lea	(word_F28A).l,a1

loc_F22C:
		move.w	(a1,d7.w),$1C(a0)
		cmpi.w	#0,d0
		beq.s	loc_F244
		cmpi.w	#6,d0
		beq.s	loc_F244

loc_F23E:
		jmp	sub_F13E

loc_F244:
		bchg	#0,$36(a0)
		neg.w	$18(a0)
		neg.w	$1C(a0)
		moveq	#0,d0
		add.b	$36(a0),d0
		jmp	loc_B842(pc)

sub_F25C:
		jsr	sub_15C24(pc)
		bne.w	locret_F270
		move.w	#2,2(a0)
		bclr	#1,$D(a0)

locret_F270:
		rts

sub_F272:
		move.l	#$4000,d0
		bra.w	sub_15C06

word_F27C:	dc.w 0,	0, 0, 0, $C, 6,	0
word_F28A:	dc.w 0,	0, $C, 6, 0, 0,	0
sub_F298:
		lea	(off_F2A2).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_F2A2:	dc.w sub_F310-off_F2A2
		dc.w sub_F340-off_F2A2
		dc.w sub_F340-off_F2A2
		dc.w sub_F3A8-off_F2A2
		dc.w sub_F3C0-off_F2A2
		dc.w sub_F3E2-off_F2A2
		dc.w sub_F340-off_F2A2
		dc.w sub_F438-off_F2A2
		dc.w sub_F44E-off_F2A2
sub_F2B4:
		jsr	sub_B9B8(pc)
		beq.w	loc_F2F2
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_F2D0
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_F2F6

loc_F2D0:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.w	2(a0),$28(a0)
		move.w	#7,2(a0)
		bset	#1,$D(a0)

loc_F2F2:
		jmp	sub_B960(pc)

loc_F2F6:
		jsr	sub_15CCC(pc)
		move.w	#8,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		bset	#1,$D(a0)
		rts

sub_F310:
		jsr	sub_BC72(pc)
		move.l	#off_12165A,$20(a0)
		bset	#1,$D(a0)
		move.l	#$FFF80000,$1C(a0)
		move.b	#$28,$26(a0)
		addi.w	#$20,$14(a0)
		move.w	$14(a0),$2A(a0)
		jmp	sub_B852(pc)

sub_F340:
		subq.b	#1,$26(a0)
		bhi.s	locret_F3A6
		cmpi.w	#2,2(a0)
		blt.s	loc_F364
		beq.s	loc_F38E
		subq.w	#5,2(a0)
		move.b	#$1E,$26(a0)
		move.l	#$FFF80000,$1C(a0)
		rts

loc_F364:
		addq.w	#1,2(a0)
		jsr	sub_EA3C(pc)
		bne.s	locret_F3A6
		move.w	#$88,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.b	#$3A,$26(a1)
		move.b	#$28,$26(a0)
		rts

loc_F38E:
		addq.w	#2,2(a0)
		bclr	#1,$D(a0)
		move.b	#$1E,$26(a0)
		move.b	#$DE,d2
		jsr	sub_ED12(pc)

locret_F3A6:
		rts

sub_F3A8:
		jsr	sub_B88A(pc)
		subq.b	#1,$26(a0)
		bhi.s	loc_F3BC
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)

loc_F3BC:
		bra.w	sub_F2B4

sub_F3C0:
		move.l	$1C(a0),d1
		addi.l	#$3000,d1
		add.l	d1,$14(a0)
		move.l	d1,$1C(a0)
		blt.s	loc_F3DE
		addq.w	#1,2(a0)
		bset	#1,$D(a0)

loc_F3DE:
		bra.w	sub_F2B4

sub_F3E2:
		move.l	$1C(a0),d1
		addi.l	#$1000,d1
		add.l	d1,$14(a0)
		move.l	d1,$1C(a0)
		move.w	$2A(a0),d0
		sub.w	$14(a0),d0
		bgt.s	loc_F434
		addq.w	#1,2(a0)
		move.w	$2A(a0),$14(a0)
		jsr	sub_EA3C(pc)
		bne.s	loc_F3BC
		move.w	#$88,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.b	#1,$36(a1)
		move.b	#$12,$26(a1)
		move.b	#$80,$26(a0)
		rts

loc_F434:
		bra.w	sub_F2B4

sub_F438:
		jsr	sub_15C24(pc)
		bne.w	locret_F44C
		bclr	#1,$D(a0)
		move.w	$28(a0),2(a0)

locret_F44C:
		rts

sub_F44E:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_F458:
		lea	(off_F462).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_F462:	dc.w sub_F468-off_F462
		dc.w sub_F4AC-off_F462
		dc.w sub_F4FE-off_F462
sub_F468:
		jsr	sub_BC72(pc)
		move.l	#off_1216BE,$20(a0)
		cmpi.w	#$9D,0.w(a0)
		bne.s	loc_F484
		move.l	#off_121694,$20(a0)

loc_F484:
		moveq	#4,d0
		jsr	sub_CA8E(pc)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		bset	#1,$E(a0)
		bset	#4,$C(a0)
		move.w	#1,$18(a0)
		jmp	sub_B852(pc)

sub_F4AC:
		move.w	$18(a0),d0
		add.w	d0,$10(a0)
		bclr	#6,$E(a0)
		beq.s	loc_F4C4
		move.l	#$10000,d1
		bra.s	loc_F4D0

loc_F4C4:
		jsr	sub_15C9A(pc)
		beq.s	loc_F4D4
		bset	#0,$28(a0)

loc_F4D0:
		move.l	d1,(dword_FFEF5C).w

loc_F4D4:
		moveq	#0,d0
		jsr	sub_CA58(pc)
		beq.s	loc_F4F4
		addq.w	#1,2(a0)
		move.w	#$FFFF,$18(a0)
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		blt.s	loc_F4F4
		bsr.w	sub_F550

loc_F4F4:
		bclr	#0,$28(a0)
		bra.w	sub_15C5A

sub_F4FE:
		move.w	$18(a0),d0
		add.w	d0,$10(a0)
		bclr	#6,$E(a0)
		beq.s	loc_F516
		move.l	#$FFFF0000,d1
		bra.s	loc_F522

loc_F516:
		jsr	sub_15C9A(pc)
		beq.s	loc_F526
		bset	#0,$28(a0)

loc_F522:
		move.l	d1,(dword_FFEF5C).w

loc_F526:
		moveq	#1,d0
		jsr	sub_CA58(pc)
		beq.s	loc_F546
		subq.w	#1,2(a0)
		move.w	#1,$18(a0)
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		bgt.s	loc_F546
		bsr.w	sub_F550

loc_F546:
		bclr	#0,$28(a0)
		bra.w	sub_15C5A

sub_F550:
		cmpi.w	#$23,d7
		beq.s	loc_F55E
		cmpi.w	#$24,d7
		beq.s	loc_F55E
		rts

loc_F55E:
		bclr	#0,$28(a0)
		beq.s	loc_F4F4
		tst.b	(byte_FFEE09).w
		bne.s	loc_F4F4
		tst.b	(byte_FFEE08).w
		bne.s	loc_F4F4
		tst.b	(byte_FFEE62).w
		bne.w	loc_F4F4
		st	(byte_FFEE09).w
		rts

sub_F580:
		lea	(off_F58A).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_F58A:	dc.w sub_F5A4-off_F58A
		dc.w sub_F5F4-off_F58A
		dc.w sub_F696-off_F58A
		dc.w sub_F6A8-off_F58A
		dc.w sub_F6C0-off_F58A
		dc.w sub_F6DC-off_F58A
		dc.w sub_F6F4-off_F58A
		dc.w sub_F700-off_F58A
		dc.w sub_F696-off_F58A
		dc.w sub_F71A-off_F58A
		dc.w sub_F6C0-off_F58A
		dc.w sub_F736-off_F58A
		dc.w sub_F6F4-off_F58A
sub_F5A4:
		jsr	sub_BC72(pc)
		move.l	#off_121704,$20(a0)
		btst	#3,$36(a0)
		bne.s	loc_F5C2
		addi.w	#$38,$14(a0)
		jmp	sub_B852(pc)

loc_F5C2:
		btst	#0,$36(a0)
		bne.s	loc_F5DE
		subi.w	#$38,$10(a0)
		addq.w	#7,2(a0)
		move.w	#4,$18(a0)
		jmp	sub_B872(pc)

loc_F5DE:
		addi.w	#$38,$10(a0)
		addq.w	#7,2(a0)
		moveq	#3,d0
		move.w	#$FFFC,$18(a0)
		jmp	loc_B842(pc)

sub_F5F4:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		moveq	#0,d1
		move.b	$36(a0),d1
		add.w	d1,d1
		add.w	d1,d1
		jmp	loc_F60A(pc,d1.w)

loc_F60A:
		bra.w	loc_F622
		bra.w	loc_F632
		bra.w	loc_F642
		bra.w	loc_F652
		bra.w	loc_F662
		bra.w	loc_F670

loc_F622:
		cmpi.w	#$28,d0
		bgt.s	locret_F67C
		cmpi.w	#$18,d0
		bgt.w	loc_F67E
		rts

loc_F632:
		cmpi.w	#$FFD8,d0
		blt.s	locret_F67C
		cmpi.w	#$FFE8,d0
		blt.w	loc_F67E
		rts

loc_F642:
		cmpi.w	#$FFD8,d0
		blt.s	locret_F67C
		cmpi.w	#$FFE8,d0
		blt.w	loc_F67E
		rts

loc_F652:
		cmpi.w	#$28,d0
		bgt.s	locret_F67C
		cmpi.w	#$18,d0
		bgt.w	loc_F67E
		rts

loc_F662:
		tst.w	d0
		bgt.s	locret_F67C
		cmpi.w	#$FFF0,d0
		bgt.w	loc_F68A
		rts

loc_F670:
		tst.w	d0
		blt.s	locret_F67C
		cmpi.w	#$10,d0
		blt.w	loc_F68A

locret_F67C:
		rts

loc_F67E:
		addq.w	#2,2(a0)
		move.b	#$E,$26(a0)
		rts

loc_F68A:
		addq.w	#1,2(a0)
		move.b	#6,$26(a0)
		rts

sub_F696:
		subq.b	#1,$26(a0)
		bhi.s	locret_F6A6
		addq.w	#1,2(a0)
		move.b	#$E,$26(a0)

locret_F6A6:
		rts

sub_F6A8:
		subq.w	#4,$14(a0)
		subq.b	#1,$26(a0)
		bhi.s	loc_F6BC
		addq.w	#1,2(a0)
		move.b	#$14,$26(a0)

loc_F6BC:
		jmp	sub_B960(pc)

sub_F6C0:
		subq.b	#1,$26(a0)
		bhi.s	loc_F6D8
		addq.w	#1,2(a0)
		move.b	#$1C,$26(a0)
		move.b	#$CE,d2
		jsr	sub_ED12(pc)

loc_F6D8:
		jmp	sub_B960(pc)

sub_F6DC:
		addq.w	#2,$14(a0)
		subq.b	#1,$26(a0)
		bhi.s	loc_F6F0
		addq.w	#1,2(a0)
		move.b	#$14,$26(a0)

loc_F6F0:
		jmp	sub_B960(pc)

sub_F6F4:
		subq.b	#1,$26(a0)
		bhi.s	locret_F6FE
		subq.w	#5,2(a0)

locret_F6FE:
		rts

sub_F700:
		move.w	(player_pos_y).w,d0
		sub.w	$14(a0),d0
		cmpi.w	#$38,d0
		bgt.w	locret_F67C
		cmpi.w	#$FFF0,d0
		bgt.w	loc_F68A
		rts

sub_F71A:
		move.w	$18(a0),d0
		add.w	d0,$10(a0)
		subq.b	#1,$26(a0)
		bhi.s	loc_F732
		addq.w	#1,2(a0)
		move.b	#$14,$26(a0)

loc_F732:
		jmp	sub_B960(pc)

sub_F736:
		move.w	$18(a0),d0
		asr.w	#1,d0
		neg.w	d0
		add.w	d0,$10(a0)
		subq.b	#1,$26(a0)
		bhi.s	loc_F752
		addq.w	#1,2(a0)
		move.b	#$50,$26(a0)

loc_F752:
		jmp	sub_B960(pc)

sub_F756:
		lea	(off_F760).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_F760:	dc.w sub_F768-off_F760
		dc.w sub_F78A-off_F760
		dc.w sub_F7EE-off_F760
		dc.w sub_F86A-off_F760
sub_F768:
		jsr	sub_BC72(pc)
		move.l	#off_121738,$20(a0)
		moveq	#2,d0
		jsr	sub_CA8E(pc)
		bclr	#1,$36(a0)
		bne.s	loc_F786
		addq.w	#1,2(a0)

loc_F786:
		jmp	sub_B852(pc)

sub_F78A:
		movea.w	$28(a0),a1
		btst	#1,5(a1)
		beq.s	loc_F79A
		addq.w	#1,2(a0)

loc_F79A:
		movea.w	$28(a0),a1
		cmpa.w	$28(a1),a0
		beq.s	loc_F7AA
		bset	#0,$C(a0)

loc_F7AA:
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		addq.w	#4,$14(a0)
		btst	#0,$36(a1)
		beq.s	loc_F7DC
		subi.w	#$1A,$10(a0)
		cmpi.w	#4,2(a1)
		beq.s	loc_F7D4
		bra.w	sub_DBC6

loc_F7D4:
		move.w	$2C(a1),$2C(a0)
		rts

loc_F7DC:
		addi.w	#$17,$10(a0)
		cmpi.w	#4,2(a1)
		beq.s	loc_F7D4
		bra.w	sub_DBC6

sub_F7EE:
		move.l	$1C(a0),d0
		addi.l	#$3000,d0
		cmpi.l	#$40000,d0
		ble.s	loc_F806
		move.l	#$40000,d0

loc_F806:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		jsr	(sub_5D1E).l
		beq.s	loc_F81E
		andi.w	#$FFF0,$14(a0)
		bra.s	loc_F824

loc_F81E:
		jsr	sub_15AB0(pc)
		beq.s	loc_F866

loc_F824:
		move.b	#$C0,(smps_cmd2).w
		moveq	#1,d6

loc_F82C:
		jsr	sub_EA3C(pc)
		bne.s	loc_F85A
		move.w	#$7B,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		subq.w	#8,$14(a1)
		move.b	#2,$28(a1)
		move.b	d6,$36(a1)
		addq.w	#1,$36(a1)
		dbf	d6,loc_F82C

loc_F85A:
		move.b	#$18,$26(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_F866:
		jmp	sub_B960(pc)

sub_F86A:
		subq.b	#1,$26(a0)
		bhi.s	locret_F876
		bset	#0,$C(a0)

locret_F876:
		rts

sub_F878:
		cmpi.w	#1,2(a0)
		beq.s	loc_F8B2
		bgt.w	loc_F952
		jsr	sub_BC72(pc)
		move.l	#off_121738,$20(a0)
		bset	#1,$D(a0)
		bset	#2,$D(a0)
		move.b	#8,$26(a0)
		addq.w	#8,$14(a0)
		moveq	#2,d0
		jsr	sub_CA8E(pc)
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_F8B2:
		subq.b	#1,$26(a0)
		bne.s	loc_F908
		addq.w	#1,2(a0)
		move.b	#$C0,(smps_cmd2).w
		move.b	#$18,$26(a0)
		bclr	#1,$D(a0)
		bclr	#2,$D(a0)
		tst.b	$28(a0)
		beq.s	loc_F908
		jsr	sub_EA3C(pc)
		bne.s	loc_F908
		move.w	#$7B,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.b	$36(a0),$36(a1)
		subq.w	#8,$14(a1)
		move.b	$28(a0),$28(a1)
		subq.b	#1,$28(a1)
		rts

loc_F908:
		tst.b	$36(a0)
		bne.s	loc_F934
		addq.w	#2,$10(a0)
		jsr	(sub_5D1E).l
		bne.s	locret_F932
		jsr	sub_15A46(pc)
		tst.w	d7
		bne.s	loc_F926
		addq.w	#1,$14(a0)

loc_F926:
		cmpi.w	#6,d7
		bne.s	locret_F932
		bset	#0,$C(a0)

locret_F932:
		rts

loc_F934:
		subq.w	#2,$10(a0)
		jsr	(sub_5D1E).l
		bne.s	locret_F932
		jsr	sub_15A46(pc)
		cmpi.w	#6,d7
		bne.s	locret_F932
		bset	#0,$C(a0)
		rts

loc_F952:
		subq.b	#1,$26(a0)
		bne.s	loc_F95E
		bset	#0,$C(a0)

loc_F95E:
		jmp	sub_B960(pc)

sub_F962:
		lea	(off_F96C).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_F96C:	dc.w sub_F9C8-off_F96C
		dc.w sub_FA12-off_F96C
		dc.w sub_FA58-off_F96C
		dc.w sub_FAF4-off_F96C
		dc.w sub_FB12-off_F96C
		dc.w sub_FB12-off_F96C
		dc.w sub_FB4A-off_F96C
sub_F97A:
		jsr	sub_B9B8(pc)
		beq.w	loc_F9AE
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_F996
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_F9B2

loc_F996:
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.w	#5,2(a0)
		bset	#1,$D(a0)

loc_F9AE:
		jmp	sub_B960(pc)

loc_F9B2:
		move.w	#6,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		bset	#1,$D(a0)
		rts

sub_F9C8:
		jsr	sub_BC72(pc)
		move.l	#off_1214DC,$20(a0)
		bset	#4,$C(a0)
		tst.b	(byte_FFEEF8).w
		beq.s	loc_F9E6
		bset	#0,$C(a0)

loc_F9E6:
		addq.w	#1,2(a0)
		move.b	#1,$39(a0)
		move.b	#$78,$26(a0)
		bset	#1,$D(a0)
		move.b	$36(a0),$2A(a0)
		andi.b	#1,$2A(a0)
		moveq	#0,d0
		move.b	$2A(a0),d0
		jmp	loc_B842(pc)

sub_FA12:
		subq.b	#1,$26(a0)
		bne.s	loc_FA3C
		jsr	sub_E9A8(pc)
		beq.s	loc_FA28
		move.b	#$78,$26(a0)
		bra.w	sub_F97A

loc_FA28:
		move.b	#$14,$26(a0)
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)
		bra.w	sub_F97A

loc_FA3C:
		bsr.w	sub_FB54
		beq.s	loc_FA54
		addq.w	#2,2(a0)
		moveq	#0,d0
		addq.b	#2,$2A(a0)
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)

loc_FA54:
		bra.w	sub_F97A

sub_FA58:
		subq.b	#1,$26(a0)
		bne.s	loc_FA7C
		move.b	#$78,$26(a0)
		subq.w	#1,2(a0)
		bset	#1,$D(a0)
		moveq	#0,d0
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)
		bra.w	sub_F97A

loc_FA7C:
		cmpi.w	#1,6(a0)
		bne.w	loc_FA54
		move.b	9(a0),d0
		subq.b	#1,d0
		cmp.b	8(a0),d0
		bne.w	loc_FA54
		jsr	sub_EA3C(pc)
		bne.w	loc_FA54
		move.b	#$B8,(smps_cmd2).w
		move.w	#6,0.w(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$14,$14(a1)
		move.w	$10(a0),$10(a1)
		btst	#0,5(a0)
		bne.s	loc_FAD8
		addi.w	#$18,$10(a1)
		move.w	#4,$18(a1)
		move.b	#6,$36(a1)
		bra.w	sub_F97A

loc_FAD8:
		subi.w	#$18,$10(a1)
		move.w	#$FFFC,$18(a1)
		move.b	#1,$26(a1)
		move.b	#7,$36(a1)
		bra.w	sub_F97A

sub_FAF4:
		bsr.w	sub_FB54
		bne.w	loc_FA54
		subq.w	#2,2(a0)
		moveq	#0,d0
		subq.b	#2,$2A(a0)
		move.b	$2A(a0),d0
		jsr	loc_B842(pc)
		bra.w	sub_F97A

sub_FB12:
		jsr	sub_15C24(pc)
		bne.w	locret_FB48
		subq.w	#4,2(a0)
		bset	#1,$D(a0)
		move.b	#$78,$26(a0)
		move.w	#1,$28(a0)
		moveq	#0,d0
		btst	#0,$2A(a0)
		beq.s	loc_FB3E
		bset	#0,d0

loc_FB3E:
		bclr	#1,$2A(a0)
		jmp	loc_B842(pc)

locret_FB48:
		rts

sub_FB4A:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_FB54:
		lea	(unk_FF9C00).w,a1
		moveq	#$A,d6

loc_FB5A:
		tst.w	0.w(a1)
		beq.s	loc_FBA4
		move.w	$14(a1),d0
		sub.w	$14(a0),d0
		cmpi.w	#$FFC8,d0
		blt.s	loc_FBA4
		cmpi.w	#$FFF8,d0
		bgt.s	loc_FBA4
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		btst	#0,$2A(a0)
		bne.s	loc_FB94
		cmpi.w	#$FFE8,d0
		blt.s	loc_FBA4
		cmpi.w	#$40,d0
		bgt.s	loc_FBA4
		bra.w	loc_FBB0

loc_FB94:
		cmpi.w	#$18,d0
		bgt.s	loc_FBA4
		cmpi.w	#$FFD0,d0
		blt.s	loc_FBA4
		bra.w	loc_FBB0

loc_FBA4:
		lea	$40(a1),a1
		dbf	d6,loc_FB5A
		moveq	#0,d7
		rts

loc_FBB0:
		moveq	#1,d7
		rts

sub_FBB4:
		lea	(off_FBBE).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_FBBE:	dc.w sub_FBC8-off_FBBE
		dc.w sub_FBEA-off_FBBE
		dc.w sub_FC04-off_FBBE
		dc.w sub_FC2A-off_FBBE
		dc.w sub_FC3A-off_FBBE
sub_FBC8:
		jsr	sub_BC72(pc)
		move.l	#off_11A6B2,$20(a0)
		tst.b	$36(a0)
		bne.s	loc_FBE6
		bset	#2,$D(a0)
		subi.w	#$10,$14(a0)

loc_FBE6:
		jmp	sub_B852(pc)

sub_FBEA:
		tst.b	$36(a0)
		bne.w	sub_B960
		jsr	sub_E9A8(pc)
		bne.s	locret_FC02
		addq.w	#1,2(a0)
		addi.w	#$10,$14(a0)

locret_FC02:
		rts

sub_FC04:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		addi.w	#$48,d0
		blt.s	locret_FC28
		addq.w	#1,2(a0)
		bclr	#2,$D(a0)
		move.b	#$A7,(smps_cmd2).w
		move.b	#$24,$26(a0)

locret_FC28:
		rts

sub_FC2A:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		blt.s	locret_FC28
		addq.w	#1,2(a0)
		rts

sub_FC3A:
		move.l	#$3000,d0
		bsr.w	sub_15C06
		jmp	sub_B960

sub_FC4A:
		lea	(off_FC54).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_FC54:	dc.w sub_FC60-off_FC54
		dc.w sub_FCDC-off_FC54
		dc.w sub_FCF4-off_FC54
		dc.w sub_FD16-off_FC54
		dc.w sub_FD28-off_FC54
		dc.w sub_FD32-off_FC54
sub_FC60:
		jsr	sub_BC72(pc)
		move.l	#off_12191A,$20(a0)
		bset	#2,$D(a0)
		cmpi.w	#$8E,0.w(a0)
		bne.s	loc_FC92
		move.l	#off_1216F2,$20(a0)
		addi.w	#$10,$14(a0)
		addq.w	#4,2(a0)
		bclr	#2,$D(a0)

loc_FC92:
		cmpi.w	#$78,0.w(a0)
		bne.s	loc_FCAC
		move.l	#off_121872,$20(a0)
		addq.w	#1,2(a0)
		bclr	#2,$D(a0)

loc_FCAC:
		cmpi.w	#$87,0.w(a0)
		bne.s	loc_FCCC
		move.l	#off_11A3E4,$20(a0)
		addi.w	#$10,$14(a0)
		addq.w	#4,2(a0)
		bclr	#2,$D(a0)

loc_FCCC:
		bset	#7,$E(a0)
		subi.w	#$10,$14(a0)
		jmp	sub_B852(pc)

sub_FCDC:
		jsr	sub_E9A8(pc)
		bne.s	locret_FCF2
		addq.w	#1,2(a0)
		addi.w	#$10,$14(a0)
		bclr	#2,$D(a0)

locret_FCF2:
		rts

sub_FCF4:
		bclr	#6,$E(a0)
		beq.s	locret_FD14
		addq.w	#1,2(a0)
		move.b	#$13,$26(a0)
		cmpi.w	#$78,0.w(a0)
		bne.s	locret_FD14
		move.b	#$14,$26(a0)

locret_FD14:
		rts

sub_FD16:
		subq.b	#1,$26(a0)
		bhi.s	locret_FD26
		addq.w	#1,2(a0)
		move.b	#$D0,(smps_cmd2).w

locret_FD26:
		rts

sub_FD28:
		move.l	#$3000,d0
		bra.w	sub_15C06

sub_FD32:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#8,d0
		bgt.s	locret_FD5E
		cmpi.w	#$FFF8,d0
		blt.s	locret_FD5E
		subq.w	#2,2(a0)
		move.b	#$10,$26(a0)
		cmpi.w	#$8E,0.w(a0)
		bne.s	locret_FD5E
		move.b	#2,$26(a0)

locret_FD5E:
		rts

sub_FD60:
		lea	(off_FD6A).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_FD6A:	dc.w sub_FD74-off_FD6A
		dc.w sub_FDBA-off_FD6A
		dc.w sub_FDDA-off_FD6A
		dc.w sub_FE3C-off_FD6A
		dc.w sub_FE4A-off_FD6A
sub_FD74:
		jsr	sub_BC72(pc)
		move.l	#off_11A0DE,$20(a0)
		bset	#4,$C(a0)
		bclr	#7,$36(a0)
		bne.s	loc_FDA6
		bset	#2,$D(a0)
		moveq	#6,d0
		jsr	sub_CA8E(pc)
		move.l	#$20000,$1C(a0)
		jmp	sub_B85E(pc)

loc_FDA6:
		addq.w	#3,2(a0)
		moveq	#6,d0
		jsr	sub_CA8E(pc)
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	loc_B842(pc)

sub_FDBA:
		move.w	(player_pos_y).w,d0
		sub.w	$14(a0),d0
		cmpi.w	#$100,d0
		blt.s	locret_FDD8
		addq.w	#1,2(a0)
		bclr	#2,$D(a0)
		move.w	#$408,$26(a0)

locret_FDD8:
		rts

sub_FDDA:
		subq.b	#1,$26(a0)
		bhi.w	locret_FE3A
		move.b	#4,$26(a0)
		subq.b	#1,$27(a0)
		moveq	#0,d0
		move.b	$27(a0),d0
		add.w	d0,d0
		add.w	d0,d0
		jsr	sub_EA3C(pc)
		bne.w	locret_FE3A
		move.w	0.w(a0),0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.l	$1C(a0),$1C(a1)
		lea	(stru_10026).l,a2
		move.w	(a2,d0.w),d1
		add.w	d1,$14(a1)
		move.b	2(a2,d0.w),$36(a1)
		move.b	3(a2,d0.w),$26(a1)
		tst.b	$27(a0)
		bne.s	locret_FE3A
		addq.w	#2,2(a0)

locret_FE3A:
		rts

sub_FE3C:
		subq.b	#1,$26(a0)
		bhi.s	loc_FE46
		addq.w	#1,2(a0)

loc_FE46:
		jmp	sub_B960(pc)

sub_FE4A:
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		beq.s	loc_FE5C
		bset	#0,$C(a0)

loc_FE5C:
		jmp	sub_B960(pc)

sub_FE60:
		lea	(off_FE6A).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_FE6A:	dc.w sub_FE74-off_FE6A
		dc.w sub_FEFA-off_FE6A
		dc.w sub_FF38-off_FE6A
		dc.w sub_FFFA-off_FE6A
		dc.w sub_10008-off_FE6A
sub_FE74:
		jsr	sub_BC72(pc)
		move.l	#off_11A0DE,$20(a0)
		bset	#4,$C(a0)
		bclr	#7,$36(a0)
		bne.s	loc_FEE4
		moveq	#0,d0
		bset	#2,$D(a0)
		move.b	$36(a0),d0
		add.w	d0,d0
		add.w	d0,d0
		add.w	d0,d0
		lea	(stru_FEBC).l,a1
		move.l	(a1,d0.w),$18(a0)
		move.l	4(a1,d0.w),$1C(a0)
		moveq	#6,d0
		jsr	sub_CA8E(pc)
		jmp	sub_B85E(pc)
stru_FEBC:	struc_46 $28000, 0
		struc_46 $1A000, $FFFF3000
		struc_46 $1A000, $FFFE6000
		struc_46 $30000, $18000
		struc_46 $30000, $30000

loc_FEE4:
		addq.w	#3,2(a0)
		move.w	#6,d0
		jsr	sub_CA8E(pc)
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	loc_B842(pc)

sub_FEFA:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		tst.b	$36(a0)
		bne.s	loc_FF10
		cmpi.w	#$B0,d0
		blt.s	locret_FF36
		bra.s	loc_FF26

loc_FF10:
		btst	#0,$36(a0)
		bne.s	loc_FF20
		cmpi.w	#$60,d0
		blt.s	locret_FF36
		bra.s	loc_FF26

loc_FF20:
		cmpi.w	#$90,d0
		blt.s	locret_FF36

loc_FF26:
		addq.w	#1,2(a0)
		bclr	#2,$D(a0)
		move.w	#$408,$26(a0)

locret_FF36:
		rts

sub_FF38:
		subq.b	#1,$26(a0)
		bhi.w	locret_FFF8
		move.b	#$CC,(smps_cmd2).w
		move.b	#4,$26(a0)
		subq.b	#1,$27(a0)
		moveq	#0,d0
		move.b	$27(a0),d0
		add.w	d0,d0
		add.w	d0,d0
		jsr	sub_EA3C(pc)
		bne.w	locret_FFF8
		move.w	0.w(a0),0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.l	$18(a0),$18(a1)
		move.l	$1C(a0),$1C(a1)
		lea	(stru_10026).l,a2
		btst	#0,$36(a0)
		bne.s	loc_FFA0
		cmpi.b	#2,$36(a0)
		bge.s	loc_FFC6
		move.w	(a2,d0.w),d1
		add.w	d1,$10(a1)
		bra.s	loc_FFE2

loc_FFA0:
		move.w	(a2,d0.w),d1
		lsr.w	#1,d1
		move.w	d1,d2
		lsr.w	#1,d2
		add.w	d2,d1
		add.w	d1,$10(a1)
		lsr.w	#1,d1
		btst	#1,$36(a0)
		bne.s	loc_FFC0
		sub.w	d1,$14(a1)
		bra.s	loc_FFE2

loc_FFC0:
		add.w	d1,$14(a1)
		bra.s	loc_FFE2

loc_FFC6:
		move.w	(a2,d0.w),d1
		lsr.w	#1,d1
		add.w	d1,$10(a1)
		btst	#1,$36(a0)
		beq.s	loc_FFDE
		sub.w	d1,$14(a1)
		bra.s	loc_FFE2

loc_FFDE:
		add.w	d1,$14(a1)

loc_FFE2:
		move.b	2(a2,d0.w),$36(a1)
		move.b	3(a2,d0.w),$26(a1)
		tst.b	$27(a0)
		bne.s	locret_FFF8
		addq.w	#2,2(a0)

locret_FFF8:
		rts

sub_FFFA:
		subq.b	#1,$26(a0)
		bhi.s	loc_10004
		addq.w	#1,2(a0)

loc_10004:
		jmp	sub_B960(pc)

sub_10008:
		jsr	sub_B88A(pc)
		moveq	#0,d0
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		beq.s	loc_1001C
		jmp	sub_B960(pc)

loc_1001C:
		bset	#0,$C(a0)
		jmp	sub_B960(pc)

stru_10026:	struc_45 $88, $80, 0
		struc_45 $6A, $80, 4
		struc_45 $54, $82, 8
		struc_45 $3E, $82, $C
		struc_45 $28, $82, $10
		struc_45 $1A, $84, $14
		struc_45 $C, $84, $18
		struc_45 6, $86, $1C
sub_10046:
		lea	(off_10050).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_10050:	dc.w sub_10054-off_10050
		dc.w sub_10090-off_10050
sub_10054:
		jsr	sub_BC72(pc)
		move.l	#off_11A536,$20(a0)
		bset	#1,$D(a0)
		bset	#4,$E(a0)
		moveq	#7,d0
		jsr	sub_CA8E(pc)
		move.w	#$FFFC,$1C(a0)
		move.w	#1,$18(a0)
		btst	#0,$36(a0)
		beq.s	loc_1008C
		move.w	#$FFFF,$18(a0)

loc_1008C:
		jmp	sub_B852(pc)

sub_10090:
		move.l	$1C(a0),d0
		addi.l	#$1800,d0
		cmpi.l	#$40000,d0
		ble.s	loc_100A8
		move.l	#$40000,d0

loc_100A8:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		beq.s	loc_100C6
		move.w	#0,6(a0)
		move.l	#$FFFC0000,$1C(a0)

loc_100C6:
		jsr	sub_B9B8(pc)
		beq.s	loc_100D0
		move.w	a0,$30(a1)

loc_100D0:
		jmp	sub_B960(pc)

sub_100D4:
		lea	(off_100DE).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_100DE:	dc.w sub_1020A-off_100DE
		dc.w sub_10272-off_100DE
		dc.w sub_1030A-off_100DE
		dc.w sub_10324-off_100DE
		dc.w sub_1036E-off_100DE
sub_100E8:
		moveq	#2,d0
		jsr	sub_CA58(pc)
		cmpi.w	#$2D,d7
		beq.w	loc_101A8
		jsr	sub_B9B8(pc)
		beq.w	loc_101A8
		move.w	a0,$30(a1)
		btst	#7,$A(a0)
		beq.s	loc_10110
		ori.w	#$8000,$A(a1)

loc_10110:
		cmpi.w	#1,2(a0)
		bne.w	loc_101A8
		tst.b	$F(a0)
		bpl.s	loc_1012E
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_10170
		bra.w	loc_101A8

loc_1012E:
		subq.b	#1,$38(a0)
		bhi.s	loc_101A8
		move.b	#3,$38(a0)
		bclr	#4,$E(a0)
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.b	3(a0),$29(a0)
		move.b	#3,$2C(a0)
		movea.w	$2A(a0),a1
		move.b	#3,$2C(a1)
		bset	#1,$D(a0)
		move.w	#3,2(a0)
		jmp	sub_B960(pc)

loc_10170:
		jsr	sub_15CCC(pc)
		move.w	#4,2(a0)
		move.l	#$FFFD0000,$1C(a0)
		bset	#1,$D(a0)
		movea.w	$2A(a0),a1
		cmpi.b	#1,2(a1)
		beq.s	loc_101A8
		move.w	#5,2(a1)
		move.l	#$FFFD0000,$1C(a0)
		bset	#1,$D(a1)

loc_101A8:
		jsr	sub_1190C(pc)
		beq.s	loc_101B2
		jmp	sub_B960(pc)

loc_101B2:
		bra.w	loc_1038E

sub_101B6:
		move.b	#$CA,d2
		jsr	sub_ED12(pc)
		move.b	#$80,$26(a0)
		jsr	sub_EA3C(pc)
		bne.s	locret_10208
		move.w	a0,$2A(a1)
		move.w	#$54,0.w(a1)
		move.b	#$60,$26(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$10,$14(a1)
		move.b	$36(a0),$36(a1)
		btst	#0,$36(a0)
		bne.s	loc_10202
		addi.w	#$18,$10(a1)
		rts

loc_10202:
		subi.w	#$18,$10(a1)

locret_10208:
		rts

sub_1020A:
		jsr	sub_BC72(pc)
		move.l	#off_12192C,$20(a0)
		moveq	#2,d0
		jsr	sub_CA8E(pc)
		bset	#7,$C(a0)
		move.b	#3,$39(a0)
		move.b	#3,$38(a0)
		bset	#4,$E(a0)
		jsr	sub_EA3C(pc)
		bne.s	loc_1025A
		move.w	a1,$2A(a0)
		move.w	a0,$2A(a1)
		move.w	#$53,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.b	$36(a0),$36(a1)

loc_1025A:
		move.b	#$80,$26(a0)
		btst	#0,$36(a0)
		bne.s	loc_1026C
		jmp	sub_B852(pc)

loc_1026C:
		moveq	#1,d0
		jmp	sub_B83E(pc)

sub_10272:
		tst.b	$28(a0)
		beq.s	loc_1028A
		addq.w	#1,2(a0)
		bset	#1,$D(a0)
		bset	#4,$E(a0)
		rts

loc_1028A:
		cmpi.w	#3,6(a0)
		bne.s	loc_102CC
		move.b	9(a0),d0
		subq.b	#1,d0
		cmp.b	8(a0),d0
		bne.w	loc_102CC
		btst	#0,$36(a0)
		bne.s	loc_102BA
		addi.w	#$B,$10(a0)
		jsr	sub_15A46(pc)
		cmpi.w	#6,d7
		beq.s	loc_102F0
		rts

loc_102BA:
		subi.w	#$B,$10(a0)
		jsr	sub_15A46(pc)
		cmpi.w	#6,d7
		beq.s	loc_102F0
		rts

loc_102CC:
		subq.b	#1,$26(a0)
		bhi.s	loc_102D6
		bsr.w	sub_101B6

loc_102D6:
		movea.w	$2A(a0),a1
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	6(a0),6(a1)
		bra.w	sub_100E8

loc_102F0:
		bchg	#0,$36(a0)
		movea.w	$2A(a0),a1
		bchg	#0,$36(a1)
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	loc_B842(pc)

sub_1030A:
		tst.b	$28(a0)
		bne.s	loc_10320
		subq.w	#1,2(a0)
		bclr	#1,$D(a0)
		bset	#4,$E(a0)

loc_10320:
		bra.w	sub_100E8

sub_10324:
		subq.b	#1,$27(a0)
		btst	#0,$27(a0)
		bne.s	loc_1034C
		btst	#1,$27(a0)
		bne.s	loc_1034C
		neg.b	$2C(a0)
		movea.w	$2A(a0),a1
		cmpi.w	#1,2(a1)
		bne.s	loc_1034C
		neg.b	$2C(a1)

loc_1034C:
		tst.b	$27(a0)
		bne.w	loc_1036A
		clr.b	$2C(a0)
		move.b	$29(a0),3(a0)
		bclr	#1,$D(a0)
		bset	#4,$E(a0)

loc_1036A:
		bra.w	loc_1038E

sub_1036E:
		move.l	#$4000,d0
		bsr.w	sub_15C06
		movea.w	$2A(a0),a1
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	6(a0),6(a1)

loc_1038E:
		movea.w	$2A(a0),a1
		cmpa.w	$2A(a1),a0
		beq.s	locret_1039E
		bset	#0,$C(a0)

locret_1039E:
		rts

sub_103A0:
		lea	(off_103AA).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_103AA:	dc.w sub_103C2-off_103AA
		dc.w sub_103FC-off_103AA
		dc.w sub_1045C-off_103AA
		dc.w sub_10494-off_103AA
		dc.w sub_10524-off_103AA
		dc.w sub_10590-off_103AA
sub_103B6:
		jsr	sub_1190C(pc)
		beq.s	locret_103C0
		jmp	sub_B960(pc)

locret_103C0:
		rts

sub_103C2:
		jsr	sub_BC72(pc)
		move.l	#off_12192C,$20(a0)
		bset	#7,$C(a0)
		bset	#1,$36(a0)
		moveq	#3,d0
		jsr	sub_CA8E(pc)
		bset	#1,$D(a0)
		addq.w	#1,2(a0)
		btst	#0,$36(a0)
		bne.s	loc_103F6
		jmp	sub_B872(pc)

loc_103F6:
		moveq	#3,d0
		jmp	loc_B842(pc)

sub_103FC:
		movea.w	$2A(a0),a1
		cmpa.w	$2A(a1),a0
		beq.s	loc_1040E
		bset	#0,$C(a0)
		rts

loc_1040E:
		tst.b	$28(a1)
		beq.s	loc_1044A
		subi.w	#$28,$14(a0)
		bset	#1,$D(a0)
		move.l	#$FFFF0000,$1C(a0)
		btst	#0,$36(a0)
		bne.s	loc_1043C
		move.l	#$10000,$18(a0)
		jmp	sub_B85A(pc)

loc_1043C:
		move.l	#$FFFF0000,$18(a0)
		moveq	#5,d0
		jmp	sub_B83E(pc)

loc_1044A:
		moveq	#0,d0
		move.b	$36(a0),d0
		cmp.w	4(a0),d0
		beq.s	locret_1045A
		jmp	loc_B842(pc)

locret_1045A:
		rts

sub_1045C:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$40000,d0
		ble.s	loc_10474
		move.l	#$40000,d0

loc_10474:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		jsr	sub_15AB0(pc)
		beq.s	locret_10492
		andi.w	#$FFF0,$14(a0)
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)

locret_10492:
		rts

sub_10494:
		tst.w	6(a0)
		beq.s	loc_104E4
		move.b	9(a0),d0
		subq.b	#1,d0
		cmp.b	8(a0),d0
		bne.w	loc_104E4
		btst	#0,$36(a0)
		bne.s	loc_104C8
		addi.w	#$19,$10(a0)
		jsr	sub_15A46(pc)
		beq.s	loc_104EA
		cmpi.w	#6,d7
		beq.s	loc_104EA
		jmp	loc_104FC

loc_104C8:
		subi.w	#$19,$10(a0)
		jsr	sub_15A46(pc)
		cmpi.w	#6,d7
		beq.s	loc_104EA
		jsr	sub_E9A8(pc)
		bne.s	loc_104EA
		jmp	loc_104FC

loc_104E4:
		jsr	sub_103B6(pc)
		beq.s	locret_104FA

loc_104EA:
		bchg	#0,$36(a0)
		moveq	#2,d0
		add.b	$36(a0),d0
		jmp	sub_B83E(pc)

locret_104FA:
		rts

loc_104FC:
		movea.w	$2A(a0),a1
		cmpa.w	$2A(a1),a0
		beq.s	loc_1050E
		bset	#0,$C(a0)
		rts

loc_1050E:
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		cmpi.w	#$C0,d0
		bgt.s	loc_104EA
		cmpi.w	#$FF40,d0
		blt.s	loc_104EA
		rts

sub_10524:
		movea.w	$2A(a0),a1
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		cmpi.w	#$10,d0
		bgt.s	loc_1055C
		cmpi.w	#$FFF0,d0
		blt.s	loc_1055C
		bchg	#0,$36(a0)
		movea.w	$2A(a0),a1
		clr.b	$28(a1)
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		clr.w	2(a0)
		rts

loc_1055C:
		tst.w	6(a0)
		beq.s	loc_1058C
		move.b	9(a0),d0
		subq.b	#1,d0
		cmp.b	8(a0),d0
		bne.w	loc_1058C
		btst	#0,$36(a0)
		bne.s	loc_10582
		addi.w	#$19,$10(a0)
		jmp	sub_15AB0(pc)

loc_10582:
		subi.w	#$19,$10(a0)
		jmp	sub_15AB0(pc)

loc_1058C:
		jmp	sub_103B6(pc)

sub_10590:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_1059A:
		lea	(off_105A4).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_105A4:	dc.w sub_105AE-off_105A4
		dc.w sub_10600-off_105A4
		dc.w sub_1067C-off_105A4
		dc.w sub_10724-off_105A4
		dc.w locret_10772-off_105A4
sub_105AE:
		jsr	sub_BC72(pc)
		move.l	#off_12192C,$20(a0)
		bset	#7,$C(a0)
		moveq	#1,d0
		jsr	sub_CA8E(pc)
		cmpi.b	#5,$36(a0)
		bhi.s	loc_105F0
		btst	#0,$36(a0)
		bne.s	loc_105E2
		move.l	#$20000,$18(a0)
		jmp	sub_B85E(pc)

loc_105E2:
		move.l	#$FFFE0000,$18(a0)
		moveq	#7,d0
		jmp	sub_B83E(pc)

loc_105F0:
		move.w	#3,2(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	loc_B842(pc)

sub_10600:
		subq.b	#1,$26(a0)
		beq.s	loc_10674
		jsr	sub_1065C
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$10000,d0
		ble.s	loc_10628
		move.l	#$10000,d0
		addq.w	#1,2(a0)

loc_10628:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		jsr	sub_1190C(pc)
		beq.s	locret_1065A
		jsr	sub_B9A8(pc)
		beq.s	locret_1065A
		addq.w	#2,2(a0)
		movea.w	$2A(a0),a1
		cmpi.w	#$52,0.w(a1)
		beq.s	loc_10654
		bset	#0,$C(a0)
		rts

loc_10654:
		st	$28(a1)
		bra.s	loc_106D8

locret_1065A:
		rts

sub_1065C:
		moveq	#0,d0
		btst	#0,$36(a0)
		bne.s	loc_10668
		moveq	#1,d0

loc_10668:
		jsr	sub_CA58(pc)
		beq.s	locret_1067A
		cmpi.w	#$2D,d7
		beq.s	locret_1067A

loc_10674:
		bset	#0,$C(a0)

locret_1067A:
		rts

sub_1067C:
		subq.b	#1,$26(a0)
		beq.s	loc_10674
		jsr	sub_1065C
		move.l	$1C(a0),d0
		subi.l	#$2000,d0
		cmpi.l	#$FFFF0000,d0
		bge.s	loc_106A4
		move.l	#$FFFF0000,d0
		subq.w	#1,2(a0)

loc_106A4:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		jsr	sub_1190C(pc)
		beq.s	locret_106D6
		jsr	sub_B9A8(pc)
		beq.s	locret_106D6
		addq.w	#1,2(a0)
		movea.w	$2A(a0),a1
		cmpi.w	#$52,0.w(a1)
		beq.s	loc_106D0
		bset	#0,$C(a0)
		rts

loc_106D0:
		st	$28(a1)
		bra.s	loc_106D8

locret_106D6:
		rts

loc_106D8:
		move.b	#$CB,(smps_cmd2).w
		moveq	#3,d6
		lea	(stru_1071C).l,a2

loc_106E6:
		jsr	sub_EA3C(pc)
		bne.s	loc_10716
		move.w	#$54,0.w(a1)
		move.w	(player_pos_x).w,$10(a1)
		move.w	(player_pos_y).w,$14(a1)
		move.w	$2A(a0),$2A(a1)
		move.b	#$80,$26(a1)
		move.b	(a2)+,$36(a1)
		move.b	(a2)+,$27(a1)
		dbf	d6,loc_106E6

loc_10716:
		bra.w	loc_10674

nullsub_12:
		rts

stru_1071C:	struc_47 6, 0
		struc_47 7, $40
		struc_47 8, $80
		struc_47 7, $C0
sub_10724:
		addq.b	#2,$27(a0)
		movea.w	$2A(a0),a1
		cmpi.w	#$52,0.w(a1)
		beq.s	loc_1073C
		bset	#0,$C(a0)
		rts

loc_1073C:
		tst.b	$28(a1)
		beq.w	loc_10674
		moveq	#0,d0
		move.b	$27(a0),d1
		moveq	#$18,d2
		jsr	sub_B89C(pc)
		add.l	(player_pos_x).w,d3
		add.l	(player_pos_y).w,d4
		subi.l	#$180000,d4
		move.l	d3,$10(a0)
		move.l	d4,$14(a0)
		andi.w	#$8080,(word_FF8F2C).w
		move.b	#$B4,(byte_FFEE0B).w

locret_10772:
		rts

sub_10774:
		lea	(off_1077E).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_1077E:	dc.w sub_10830-off_1077E
		dc.w sub_10884-off_1077E
		dc.w sub_108D0-off_1077E
		dc.w sub_108D0-off_1077E
		dc.w sub_108EA-off_1077E
		dc.w sub_1092E-off_1077E
		dc.w sub_10942-off_1077E
		dc.w sub_1094C-off_1077E
sub_1078E:
		jsr	sub_B9B8(pc)
		beq.s	loc_10806
		move.w	a0,$30(a1)
		cmpi.w	#4,2(a0)
		bne.s	loc_10806
		tst.b	$F(a0)
		bpl.s	loc_107B8
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_107EE
		move.b	#1,$26(a0)
		bra.s	loc_10806

loc_107B8:
		addq.b	#1,$38(a0)
		cmpi.b	#3,$38(a0)
		bne.s	loc_10806
		bclr	#4,$E(a0)
		clr.b	$38(a0)
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.w	2(a0),$28(a0)
		move.b	#3,$2C(a0)
		move.w	#5,2(a0)
		jmp	sub_B960(pc)

loc_107EE:
		jsr	sub_15CCC(pc)
		move.w	#6,2(a0)
		move.l	#$FFFD0000,$1C(a0)
		bset	#1,$D(a0)

loc_10806:
		jmp	sub_B960(pc)

sub_1080A:
		lea	(word_FF9000).w,a1
		move.w	#$A3,d3
		moveq	#$2F,d6

loc_10814:
		cmp.w	(a1),d3
		bne.s	loc_10820
		jsr	sub_B948
		bne.s	loc_1082C

loc_10820:
		lea	$40(a1),a1
		dbf	d6,loc_10814
		moveq	#0,d7
		rts

loc_1082C:
		moveq	#1,d7
		rts

sub_10830:
		jsr	sub_BC72(pc)
		move.l	#off_121A14,$20(a0)
		bset	#4,$E(a0)
		move.b	#3,$39(a0)
		moveq	#6,d0
		jsr	sub_CA8E(pc)
		move.b	#$5A,$26(a0)
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		blt.s	loc_10870
		move.l	#$28000,$18(a0)
		bclr	#0,$36(a0)
		jmp	sub_B852(pc)

loc_10870:
		move.l	#$FFFD8000,$18(a0)
		bset	#0,$36(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

sub_10884:
		jsr	sub_B88A(pc)
		bsr.w	sub_15A46
		cmpi.w	#6,d7
		beq.s	loc_108BA
		tst.w	d7
		beq.s	loc_108BA
		bsr.w	sub_1080A
		bne.s	loc_108BA
		subq.b	#1,$26(a0)
		bhi.s	loc_108B6
		addq.w	#2,2(a0)
		move.b	#$3C,$26(a0)
		moveq	#2,d0
		add.w	4(a0),d0
		jmp	loc_B842(pc)

loc_108B6:
		bra.w	sub_1078E

loc_108BA:
		neg.l	$18(a0)
		bchg	#0,$36(a0)
		move.w	4(a0),d0
		bchg	#0,d0
		jmp	loc_B842(pc)

sub_108D0:
		subq.b	#1,$26(a0)
		bhi.s	loc_108E6
		move.b	#$1E,$26(a0)
		moveq	#2,d0
		add.w	4(a0),d0
		jmp	sub_B83E(pc)

loc_108E6:
		bra.w	sub_1078E

sub_108EA:
		subq.b	#1,$26(a0)
		bhi.s	loc_1092A
		move.b	#$5A,$26(a0)
		subq.w	#3,2(a0)
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		blt.s	loc_10916
		move.l	#$20000,$18(a0)
		bclr	#0,$36(a0)
		jmp	sub_B86E(pc)

loc_10916:
		move.l	#$FFFE0000,$18(a0)
		bset	#0,$36(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

loc_1092A:
		bra.w	sub_1078E

sub_1092E:
		jsr	sub_15C24(pc)
		bne.s	locret_10940
		move.w	$28(a0),2(a0)
		bset	#4,$E(a0)

locret_10940:
		rts

sub_10942:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_1094C:
		cmpi.w	#1,2(a0)
		beq.s	loc_10984
		bhi.s	loc_10990
		jsr	sub_BC72(pc)
		move.l	#off_121AAA,$20(a0)
		btst	#0,$36(a0)
		bne.s	loc_10976
		move.l	#$40000,$18(a0)
		jmp	sub_B852(pc)

loc_10976:
		move.l	#$FFFC0000,$18(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_10984:
		tst.b	$26(a0)
		beq.s	locret_1098E
		addq.w	#1,2(a0)

locret_1098E:
		rts

loc_10990:
		jsr	sub_B88A(pc)
		jsr	sub_E9A8(pc)
		beq.s	loc_109A0
		bset	#0,$C(a0)

loc_109A0:
		jmp	sub_B960(pc)

sub_109A4:
		cmpi.w	#1,2(a0)
		beq.s	loc_109D0
		bgt.s	loc_10A04
		jsr	sub_BC72(pc)
		move.l	#off_121AAA,$20(a0)
		bset	#7,$E(a0)
		bset	#1,$E(a0)
		bset	#1,$D(a0)
		jsr	sub_B85E(pc)

loc_109D0:
		jsr	sub_B9B8(pc)
		beq.s	locret_10A02
		move.w	a0,$30(a1)
		cmpi.w	#$65,(a1)
		bne.s	locret_10A02
		move.w	#$A,$26(a0)
		bclr	#1,$D(a0)
		bset	#3,$D(a0)
		bclr	#7,$E(a0)
		addq.w	#1,2(a0)
		move.b	#$D4,(smps_cmd2).w

locret_10A02:
		rts

loc_10A04:
		subi.l	#$8000,$14(a0)
		bchg	#2,$D(a0)
		subq.w	#1,$26(a0)
		bne.s	locret_10A1E
		bset	#0,$C(a0)

locret_10A1E:
		rts

sub_10A20:
		lea	(off_10A2A).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_10A2A:	dc.w sub_10AB0-off_10A2A
		dc.w sub_10B2C-off_10A2A
		dc.w sub_10BC8-off_10A2A
		dc.w sub_10C10-off_10A2A
		dc.w sub_10C48-off_10A2A
		dc.w sub_10C86-off_10A2A
		dc.w sub_10C94-off_10A2A
sub_10A38:
		movea.w	$3E(a0),a1
		cmpa.w	$3E(a1),a0
		bne.s	loc_10A7C
		jsr	sub_B9B8(pc)
		beq.s	loc_10AAC
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_10A5C
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_10A7C

loc_10A5C:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.w	2(a0),$28(a0)
		move.b	#3,$2C(a0)
		move.w	#5,2(a0)
		jmp	sub_B960(pc)

loc_10A7C:
		jsr	sub_15CCC(pc)
		move.w	#6,2(a0)
		move.l	#$FFFD0000,$1C(a0)
		bset	#1,$D(a0)
		bset	#7,$C(a0)
		btst	#0,$36(a0)
		bne.s	loc_10AA6
		jmp	sub_B876(pc)

loc_10AA6:
		moveq	#5,d0
		jmp	loc_B842(pc)

loc_10AAC:
		jmp	sub_B960(pc)

sub_10AB0:
		jsr	sub_BC72(pc)
		ori.w	#$8000,$A(a0)
		move.l	#off_121AAA,$20(a0)
		moveq	#0,d0
		jsr	sub_CA8E(pc)
		move.b	#$8C,$26(a0)
		btst	#0,$36(a0)
		bne.s	loc_10ADC
		jsr	sub_B856(pc)
		bra.s	loc_10AE2

loc_10ADC:
		moveq	#3,d0
		jsr	sub_B83E(pc)

loc_10AE2:
		jsr	sub_EA04(pc)
		bne.s	loc_10B24
		move.w	a2,$3E(a1)
		move.w	a1,$3E(a2)
		move.l	#off_121AAA,$20(a1)
		move.w	$A(a2),$A(a1)
		bset	#6,$A(a1)
		bclr	#5,$A(a1)
		move.w	#$50,0.w(a1)
		bset	#7,$E(a1)
		move.w	$10(a2),$10(a1)
		move.w	$14(a2),$14(a1)
		rts

loc_10B24:
		bset	#0,$C(a0)
		rts

sub_10B2C:
		subq.b	#1,$26(a0)
		bhi.s	loc_10BAE
		move.b	#$14,$26(a0)
		bset	#1,$D(a0)
		addq.w	#1,2(a0)
		movea.w	$3E(a0),a1
		cmpa.w	$3E(a1),a0
		beq.s	loc_10B5A
		moveq	#2,d0
		add.w	4(a0),d0
		jsr	loc_B842(pc)
		bra.w	loc_10A7C

loc_10B5A:
		jsr	sub_EA04(pc)
		bne.s	loc_10BAE
		move.w	a1,$2A(a2)
		movea.w	$3E(a2),a3
		move.w	a2,$3E(a3)
		move.w	#$56,0.w(a1)
		move.w	$A(a2),$A(a1)
		move.l	$20(a2),$20(a1)
		move.w	$10(a2),$10(a1)
		move.w	$14(a2),$14(a1)
		move.b	$36(a2),$36(a1)
		subi.w	#$12,$14(a1)
		btst	#0,$36(a2)
		bne.s	loc_10BA6
		addi.w	#$C,$10(a1)
		rts

loc_10BA6:
		subi.w	#$C,$10(a1)
		rts

loc_10BAE:
		movea.w	$3E(a0),a1
		cmpa.w	$3E(a1),a0
		beq.s	locret_10BC6
		moveq	#2,d0
		add.w	4(a0),d0
		jsr	loc_B842(pc)
		bra.w	loc_10A7C

locret_10BC6:
		rts

sub_10BC8:
		cmpi.b	#$A,$26(a0)
		bne.s	loc_10BE8
		addq.w	#6,$14(a0)
		btst	#0,$36(a0)
		bne.s	loc_10BE2
		jsr	sub_B876(pc)
		bra.s	loc_10BE8

loc_10BE2:
		moveq	#5,d0
		jsr	loc_B842(pc)

loc_10BE8:
		subq.w	#1,$14(a0)
		movea.w	$2A(a0),a1
		cmpi.w	#$56,0.w(a1)
		bne.s	loc_10BFC
		subq.w	#1,$14(a1)

loc_10BFC:
		subq.b	#1,$26(a0)
		bhi.s	loc_10C0C
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)

loc_10C0C:
		bra.w	sub_10A38

sub_10C10:
		subq.b	#1,$26(a0)
		bgt.s	loc_10C20
		addq.w	#1,2(a0)
		move.b	#$14,$26(a0)

loc_10C20:
		cmpi.b	#$1E,$26(a0)
		bne.s	loc_10C44
		movea.w	$2A(a0),a1
		cmpi.w	#$56,0.w(a1)
		bne.s	loc_10C44
		st	$26(a1)
		move.b	#$D1,d2
		jsr	sub_ED12(pc)
		clr.w	$2A(a0)

loc_10C44:
		bra.w	sub_10A38

sub_10C48:
		cmpi.b	#$A,$26(a0)
		bne.s	loc_10C68
		subq.w	#6,$14(a0)
		btst	#0,$36(a0)
		bne.s	loc_10C62
		jsr	sub_B872(pc)
		bra.s	loc_10C68

loc_10C62:
		moveq	#3,d0
		jsr	loc_B842(pc)

loc_10C68:
		addq.w	#1,$14(a0)
		subq.b	#1,$26(a0)
		bhi.s	loc_10C82
		bclr	#1,$D(a0)
		subq.w	#3,2(a0)
		move.b	#$8C,$26(a0)

loc_10C82:
		bra.w	sub_10A38

sub_10C86:
		jsr	sub_15C24(pc)
		bne.s	locret_10C92
		move.w	$28(a0),2(a0)

locret_10C92:
		rts

sub_10C94:
		move.l	#$4000,d0
		bsr.w	sub_15C06
		tst.w	$2A(a0)
		beq.s	locret_10CAC
		movea.w	$2A(a0),a1
		add.l	d1,$14(a1)

locret_10CAC:
		rts

sub_10CAE:
		lea	(off_10CB8).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_10CB8:	dc.w sub_10CC2-off_10CB8
		dc.w sub_10D24-off_10CB8
		dc.w sub_10D36-off_10CB8
		dc.w sub_10D76-off_10CB8
		dc.w sub_10D88-off_10CB8
sub_10CC2:
		jsr	sub_BC72(pc)
		move.l	#off_121B50,$20(a0)
		bset	#7,$C(a0)
		bset	#7,$E(a0)
		moveq	#1,d6

loc_10CDC:
		jsr	sub_EA3C(pc)
		bne.s	loc_10D08
		move.w	d6,d0
		add.w	d0,d0
		move.w	a1,$28(a0,d0.w)
		move.w	a0,$2A(a1)
		move.w	#$47,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.b	d6,$36(a1)
		dbf	d6,loc_10CDC

loc_10D08:
		btst	#0,$36(a0)
		bne.s	loc_10D1A
		move.w	#1,$1C(a0)
		jmp	sub_B852(pc)

loc_10D1A:
		move.w	#$FFFF,$1C(a0)
		jmp	sub_B852(pc)

sub_10D24:
		bclr	#6,$E(a0)
		beq.s	locret_10D34
		addq.w	#1,2(a0)
		neg.l	$1C(a0)

locret_10D34:
		rts

sub_10D36:
		bclr	#6,$E(a0)
		bne.s	loc_10D48
		addq.w	#2,2(a0)
		neg.l	$1C(a0)
		rts

loc_10D48:
		cmpi.w	#$160,$26(a0)
		bne.s	loc_10D54
		addq.w	#1,2(a0)

loc_10D54:
		addq.w	#1,$26(a0)
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		movea.w	$28(a0),a1
		add.l	d0,$14(a1)
		movea.w	$2A(a0),a1
		add.l	d0,$14(a1)
		add.l	d0,(player_pos_y).w
		rts

sub_10D76:
		bclr	#6,$E(a0)
		bne.s	locret_10D86
		addq.w	#1,2(a0)
		neg.l	$1C(a0)

locret_10D86:
		rts

sub_10D88:
		bclr	#6,$E(a0)
		beq.s	loc_10D9A
		subq.w	#2,2(a0)
		neg.l	$1C(a0)
		rts

loc_10D9A:
		tst.w	$26(a0)
		bne.s	loc_10DA4
		subq.w	#3,2(a0)

loc_10DA4:
		subq.w	#1,$26(a0)
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		movea.w	$28(a0),a1
		add.l	d0,$14(a1)
		movea.w	$2A(a0),a1
		add.l	d0,$14(a1)
		rts

sub_10DC2:
		tst.w	2(a0)
		bne.s	locret_10DF2
		jsr	sub_BC72(pc)
		move.l	#off_121B66,$20(a0)
		bset	#7,$C(a0)
		bset	#7,$E(a0)
		btst	#0,$36(a0)
		bne.s	loc_10DEC
		jmp	sub_B852(pc)

loc_10DEC:
		moveq	#1,d0
		jmp	sub_B83E(pc)

locret_10DF2:
		rts

sub_10DF4:
		lea	(off_10DFE).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_10DFE:	dc.w sub_10E7A-off_10DFE
		dc.w sub_10EB4-off_10DFE
		dc.w sub_10F1A-off_10DFE
		dc.w sub_10F76-off_10DFE
		dc.w sub_10F76-off_10DFE
		dc.w sub_10F76-off_10DFE
		dc.w sub_10F76-off_10DFE
		dc.w sub_10F9C-off_10DFE
sub_10E0E:
		jsr	sub_B9B8(pc)
		bne.s	loc_10E1A
		jsr	loc_BA02(pc)
		beq.s	loc_10E72

loc_10E1A:
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_10E2E
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_10E52

loc_10E2E:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.w	2(a0),$28(a0)
		move.b	#3,$2C(a0)
		bset	#1,$D(a0)
		move.w	#6,2(a0)
		rts

loc_10E52:
		jsr	sub_15CCC(pc)
		move.w	#7,2(a0)
		move.l	#$FFFD0000,$1C(a0)
		bset	#1,$D(a0)
		move.l	#$FFFD0000,$1C(a0)

loc_10E72:
		jsr	sub_B960(pc)
		jmp	loc_B97A(pc)

sub_10E7A:
		jsr	sub_BC72(pc)
		move.l	#off_121BAA,$20(a0)
		move.b	#$A2,$26(a0)
		moveq	#5,d0
		jsr	sub_CA8E(pc)
		btst	#0,$36(a0)
		bne.s	loc_10EA6
		move.l	#$C000,$18(a0)
		jmp	sub_B852(pc)

loc_10EA6:
		move.l	#$FFFF4000,$18(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

sub_10EB4:
		jsr	sub_15A46(pc)
		cmpi.w	#6,d7
		bne.s	loc_10ED2

loc_10EBE:
		neg.l	$18(a0)
		bchg	#0,$36(a0)
		bchg	#0,5(a0)
		jmp	sub_B88A(pc)

loc_10ED2:
		tst.w	d7
		beq.s	loc_10EBE
		cmpi.w	#1,6(a0)
		bgt.s	loc_10EE2
		jsr	sub_B88A(pc)

loc_10EE2:
		subq.b	#1,$26(a0)
		bne.s	loc_10F16
		bset	#1,$D(a0)
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)
		move.w	#1,6(a0)
		move.l	#$10000,$18(a0)
		btst	#0,$36(a0)
		beq.s	loc_10F16
		move.l	#$FFFF0000,$18(a0)

loc_10F16:
		bra.w	sub_10E0E

sub_10F1A:
		subq.b	#1,$26(a0)
		beq.s	loc_10F3E
		jsr	sub_15A46(pc)
		cmpi.w	#6,d7
		bne.s	loc_10F6A

loc_10F2A:
		neg.l	$18(a0)
		bchg	#0,$36(a0)
		bchg	#0,5(a0)
		jsr	sub_B88A(pc)

loc_10F3E:
		bclr	#1,$D(a0)
		subq.w	#1,2(a0)
		move.b	#$A2,$26(a0)
		move.l	#$C000,$18(a0)
		btst	#0,$36(a0)
		beq.s	loc_10F66
		move.l	#$FFFF4000,$18(a0)

loc_10F66:
		jmp	sub_B88A(pc)

loc_10F6A:
		tst.w	d7
		beq.s	loc_10F2A
		jsr	sub_B88A(pc)
		bra.w	sub_10E0E

sub_10F76:
		jsr	sub_15C24(pc)
		bne.s	locret_10F9A
		move.w	$28(a0),2(a0)
		cmpi.w	#1,2(a0)
		beq.s	loc_10F94
		cmpi.w	#3,2(a0)
		beq.s	loc_10F94
		rts

loc_10F94:
		bclr	#1,$D(a0)

locret_10F9A:
		rts

sub_10F9C:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_10FA6:
		lea	(off_10FB0).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_10FB0:	dc.w sub_10FB8-off_10FB0
		dc.w sub_10FDA-off_10FB0
		dc.w sub_10FEE-off_10FB0
		dc.w sub_1100E-off_10FB0
sub_10FB8:
		jsr	sub_BC72(pc)
		move.l	#off_121B88,$20(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		bset	#1,$D(a0)
		jmp	sub_B852(pc)

sub_10FDA:
		bclr	#6,$E(a0)
		beq.s	locret_10FEC
		addq.w	#1,2(a0)
		move.b	#$A,$26(a0)

locret_10FEC:
		rts

sub_10FEE:
		subq.b	#1,$26(a0)
		bgt.s	locret_1100C
		move.b	#$D2,(smps_cmd2).w
		move.w	#1,$1C(a0)
		bclr	#7,$E(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

locret_1100C:
		rts

sub_1100E:
		addi.l	#$1000,$1C(a0)
		jmp	sub_B88A(pc)

sub_1101A:
		lea	(off_11024).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_11024:	dc.w sub_110CC-off_11024
		dc.w sub_11132-off_11024
		dc.w sub_11180-off_11024
		dc.w sub_111CE-off_11024
		dc.w sub_11230-off_11024
		dc.w sub_11240-off_11024
		dc.w sub_1124A-off_11024
sub_11032:
		jsr	sub_B9B8(pc)
		bne.s	loc_1103E
		jsr	loc_BA02(pc)
		beq.s	locret_110BA

loc_1103E:
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_11052
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_1107E

loc_11052:
		move.b	(byte_FFEE48).w,d0
		cmpi.b	#2,d0
		beq.s	loc_110BC
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.b	3(a0),$26(a0)
		move.w	#4,2(a0)
		btst	#1,5(a0)
		bne.s	locret_110BA
		rts

loc_1107E:
		jsr	sub_EA3C(pc)
		move.w	0.w(a0),0.w(a1)
		move.w	(planea_start_x).w,$10(a1)
		subi.w	#$20,$10(a1)
		move.w	$28(a0),$14(a1)
		move.b	$36(a0),$36(a1)
		move.w	#5,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		btst	#1,5(a0)
		bne.s	locret_110BA
		addq.w	#2,4(a0)

locret_110BA:
		rts

loc_110BC:
		move.w	a1,$2A(a0)
		move.w	#3,2(a0)
		clr.l	$1C(a0)
		rts

sub_110CC:
		jsr	sub_BC72(pc)
		move.l	#off_11A912,$20(a0)
		cmpi.w	#$B3,0.w(a0)
		beq.s	loc_110E8
		move.l	#off_11AAFE,$20(a0)

loc_110E8:
		addq.w	#1,2(a0)
		bset	#7,$C(a0)
		bset	#4,$C(a0)
		bclr	#4,$E(a0)
		move.b	#1,$39(a0)
		move.w	$14(a0),$28(a0)
		move.l	#$FFFF8000,$1C(a0)
		move.l	#$10000,$18(a0)
		moveq	#0,d0
		btst	#0,$36(a0)
		beq.s	loc_1112E
		move.l	#$FFFF0000,$18(a0)
		moveq	#1,d0

loc_1112E:
		jmp	loc_B842(pc)

sub_11132:
		move.l	$1C(a0),d0
		addi.l	#$400,d0
		cmpi.l	#$8000,d0
		ble.s	loc_1114E
		move.l	#$8000,d0
		addq.w	#1,2(a0)

loc_1114E:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		bsr.w	sub_1125C
		bne.s	loc_1117C
		move.w	(planea_start_x).w,d0
		addi.w	#$160,d0
		cmp.w	$10(a0),d0
		bgt.s	loc_1117C
		move.w	(planea_start_x).w,$10(a0)
		subi.w	#$20,$10(a0)
		move.b	#1,$3F(a0)

loc_1117C:
		jmp	sub_11032(pc)

sub_11180:
		move.l	$1C(a0),d0
		subi.l	#$400,d0
		cmpi.l	#$FFFF8000,d0
		bge.s	loc_1119C
		move.l	#$FFFF8000,d0
		subq.w	#1,2(a0)

loc_1119C:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		bsr.w	sub_1125C
		bne.s	loc_111CA
		move.w	(planea_start_x).w,d0
		addi.w	#$160,d0
		cmp.w	$10(a0),d0
		bgt.s	loc_111CA
		move.w	(planea_start_x).w,$10(a0)
		subi.w	#$20,$10(a0)
		move.b	#1,$3F(a0)

loc_111CA:
		jmp	sub_11032(pc)

sub_111CE:
		cmpi.w	#$B3,0.w(a0)
		bne.s	loc_111EE
		cmpi.w	#$840,$10(a0)
		blt.s	loc_111EE
		bclr	#4,$C(a0)
		addq.w	#3,2(a0)
		clr.l	$1C(a0)
		rts

loc_111EE:
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		move.w	(planea_start_x).w,d0
		addi.w	#$160,d0
		cmp.w	$10(a0),d0
		bgt.s	locret_1122E
		move.w	(planea_start_x).w,$10(a0)
		subi.w	#$20,$10(a0)
		move.b	#1,$3F(a0)
		clr.b	(byte_FFEE60).w
		move.w	$28(a0),$14(a0)
		clr.b	$F(a0)
		bset	#4,$E(a0)
		clr.w	2(a0)

locret_1122E:
		rts

sub_11230:
		jsr	sub_15C24(pc)
		bne.w	locret_1123E
		move.b	$26(a0),3(a0)

locret_1123E:
		rts

sub_11240:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_1124A:
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		move.l	#$FFFFF000,d0
		bra.w	sub_15C06

sub_1125C:
		cmpi.w	#$B3,0.w(a0)
		bne.s	loc_11286
		tst.b	$3F(a0)
		beq.s	loc_11286
		cmpi.w	#$260,(planea_start_x).w
		bgt.s	loc_11286
		move.w	(planea_start_x).w,d0
		subi.w	#$20,d0
		move.w	d0,$10(a0)
		move.b	#1,$3F(a0)
		rts

loc_11286:
		clr.b	$3F(a0)
		rts

sub_1128C:
		lea	(off_11296).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_11296:	dc.w sub_112A4-off_11296
		dc.w sub_112DC-off_11296
		dc.w sub_112F6-off_11296
		dc.w sub_11320-off_11296
		dc.w sub_11348-off_11296
		dc.w sub_11390-off_11296
		dc.w sub_113C2-off_11296
sub_112A4:
		jsr	sub_BC72(pc)
		move.l	#off_121C7E,$20(a0)
		addi.w	#$38,$14(a0)
		move.w	$14(a0),$2A(a0)
		bset	#1,$D(a0)
		btst	#0,$36(a0)
		beq.s	loc_112D2
		addq.w	#5,2(a0)
		jmp	sub_B86E(pc)

loc_112D2:
		move.b	#$78,$26(a0)
		jmp	sub_B852(pc)

sub_112DC:
		subq.b	#1,$26(a0)
		bgt.s	locret_112F4
		move.w	2(a0),$28(a0)
		addq.w	#1,2(a0)
		move.l	#$FFFD0000,$1C(a0)

locret_112F4:
		rts

sub_112F6:
		move.l	$1C(a0),d0
		addi.l	#$1800,d0
		move.l	d0,$1C(a0)
		add.l	d0,$14(a0)
		tst.l	d0
		blt.s	loc_1131C
		bclr	#1,$D(a0)
		addq.w	#1,2(a0)
		move.b	#$1E,$26(a0)

loc_1131C:
		jmp	sub_B960(pc)

sub_11320:
		tst.w	6(a0)
		bne.s	loc_1132E
		move.b	#$DD,d2
		jsr	sub_ED12(pc)

loc_1132E:
		subq.b	#1,$26(a0)
		bgt.s	loc_11344
		bset	#1,$D(a0)
		move.w	#1,6(a0)
		addq.w	#1,2(a0)

loc_11344:
		jmp	sub_B960(pc)

sub_11348:
		move.l	$1C(a0),d0
		addi.l	#$1000,d0
		move.l	d0,$1C(a0)
		add.l	d0,$14(a0)
		move.w	$2A(a0),d0
		cmp.w	$14(a0),d0
		bgt.s	loc_11384
		move.w	d0,$14(a0)
		clr.w	$16(a0)
		move.w	$28(a0),2(a0)
		clr.w	6(a0)
		cmpi.w	#1,2(a0)
		bne.s	loc_11388
		move.b	#$78,$26(a0)

loc_11384:
		jmp	sub_B960(pc)

loc_11388:
		move.b	#$1E,$26(a0)
		rts

sub_11390:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$30,d0
		bgt.s	locret_113C0
		cmpi.w	#$FFD0,d0
		blt.s	locret_113C0
		move.w	(player_pos_y).w,d0
		cmpi.w	#$1C0,d0
		bge.s	locret_113C0
		move.w	#6,$28(a0)
		subq.w	#3,2(a0)
		move.l	#$FFFD0000,$1C(a0)

locret_113C0:
		rts

sub_113C2:
		subq.b	#1,$26(a0)
		bgt.s	locret_113CC
		subq.w	#1,2(a0)

locret_113CC:
		rts

sub_113CE:
		lea	(off_113D8).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_113D8:	dc.w sub_11452-off_113D8
		dc.w sub_1149E-off_113D8
		dc.w sub_11554-off_113D8
		dc.w sub_1160E-off_113D8
		dc.w sub_11656-off_113D8
		dc.w sub_116A2-off_113D8
		dc.w sub_11728-off_113D8
		dc.w nullsub_13-off_113D8
		dc.w nullsub_13-off_113D8
		dc.w sub_117B6-off_113D8
		dc.w sub_117F8-off_113D8
		dc.w sub_1181C-off_113D8
sub_113F0:
		tst.b	$F(a0)
		bne.s	loc_11400
		jsr	sub_B9B8(pc)
		beq.s	loc_1144E
		move.w	a0,$30(a1)

loc_11400:
		tst.b	$F(a0)
		bpl.s	loc_11410
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_11436

loc_11410:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.b	3(a0),$2B(a0)
		move.b	#3,$2C(a0)
		move.w	#$A,2(a0)
		bset	#1,$D(a0)
		jmp	sub_B960(pc)

loc_11436:
		jsr	sub_15CCC(pc)
		move.w	#$B,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		bset	#1,$D(a0)

loc_1144E:
		jmp	sub_B960(pc)

sub_11452:
		jsr	sub_BC72(pc)
		move.l	#off_121CBA,$20(a0)
		moveq	#0,d0
		jsr	sub_CA8E(pc)
		jsr	sub_15AB0(pc)
		move.b	d7,$2A(a0)
		bclr	#1,$36(a0)
		beq.s	loc_11478
		st	$2A(a0)

loc_11478:
		btst	#0,$36(a0)
		bne.s	loc_1148C
		move.l	#$10000,$18(a0)
		jmp	sub_B852(pc)

loc_1148C:
		move.l	#$FFFF0000,$18(a0)
		addq.w	#2,2(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

sub_1149E:
		cmpi.b	#$10,$2A(a0)
		beq.s	loc_114C4
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$FFB0,d0
		bgt.s	loc_114C4
		bset	#0,$36(a0)
		st	$2A(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_114C4:
		moveq	#0,d0
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		beq.s	loc_1152A
		move.l	$18(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$10000,d0
		blt.s	loc_114E8
		move.l	#$10000,d0

loc_114E8:
		move.l	d0,$18(a0)
		jsr	sub_B88A(pc)
		jsr	sub_15AB0(pc)
		bne.s	loc_11502
		move.w	2(a0),$28(a0)
		addq.w	#8,2(a0)
		rts

loc_11502:
		cmp.b	$2A(a0),d7
		beq.s	loc_1150C
		st	$2A(a0)

loc_1150C:
		tst.b	$26(a0)
		ble.s	loc_11518
		subq.b	#1,$26(a0)
		bra.s	loc_1152A

loc_11518:
		cmpi.w	#1,d7
		beq.s	loc_11534
		cmpi.w	#4,d7
		beq.s	loc_1152E
		cmpi.w	#5,d7
		beq.s	loc_1152E

loc_1152A:
		bra.w	sub_113F0

loc_1152E:
		bset	#1,$36(a0)

loc_11534:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$50,d0
		bgt.s	loc_1152A
		tst.w	d0
		blt.s	loc_1152A
		addq.w	#2,2(a0)
		move.b	#6,$26(a0)
		jmp	sub_B872(pc)

sub_11554:
		cmpi.b	#$FF,$2A(a0)
		beq.s	loc_1157C
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$50,d0
		blt.s	loc_1157C
		bclr	#0,$36(a0)
		sf	$2A(a0)
		subq.w	#1,2(a0)
		jmp	sub_B86E(pc)

loc_1157C:
		moveq	#1,d0
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		beq.s	loc_115E2
		move.l	$18(a0),d0
		subi.l	#$2000,d0
		cmpi.l	#$FFFF0000,d0
		bgt.s	loc_115A0
		move.l	#$FFFF0000,d0

loc_115A0:
		move.l	d0,$18(a0)
		jsr	sub_B88A(pc)
		jsr	sub_15AB0(pc)
		bne.s	loc_115BA
		move.w	2(a0),$28(a0)
		addq.w	#7,2(a0)
		rts

loc_115BA:
		cmp.b	$2A(a0),d7
		beq.s	loc_115C4
		st	$2A(a0)

loc_115C4:
		tst.b	$26(a0)
		ble.s	loc_115D0
		subq.b	#1,$26(a0)
		bra.s	loc_115E2

loc_115D0:
		cmpi.w	#1,d7
		beq.s	loc_115EC
		cmpi.w	#2,d7
		beq.s	loc_115E6
		cmpi.w	#3,d7
		beq.s	loc_115E6

loc_115E2:
		bra.w	sub_113F0

loc_115E6:
		bset	#1,$36(a0)

loc_115EC:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$FFB0,d0
		blt.s	loc_115E2
		tst.w	d0
		bgt.s	loc_115E2
		addq.w	#2,2(a0)
		move.b	#6,$26(a0)
		moveq	#3,d0
		jmp	loc_B842(pc)

sub_1160E:
		subq.b	#1,$26(a0)
		bgt.s	loc_11652
		addq.w	#2,2(a0)
		move.b	#$DC,d2
		jsr	sub_ED12(pc)
		bset	#1,$D(a0)
		move.b	#$3C,$26(a0)
		move.l	#$20000,$18(a0)
		bclr	#1,$36(a0)
		bne.s	loc_11646
		addi.w	#$C,$10(a0)
		jmp	sub_B876(pc)

loc_11646:
		addq.w	#4,$10(a0)
		addq.w	#4,$14(a0)
		jmp	sub_B87A(pc)

loc_11652:
		bra.w	sub_113F0

sub_11656:
		subq.b	#1,$26(a0)
		bgt.s	loc_1169E
		addq.w	#2,2(a0)
		move.b	#$DC,d2
		jsr	sub_ED12(pc)
		bset	#1,$D(a0)
		move.b	#$3C,$26(a0)
		move.l	#$FFFE0000,$18(a0)
		bclr	#1,$36(a0)
		bne.s	loc_11690
		subi.w	#$C,$10(a0)
		moveq	#5,d0
		jmp	loc_B842(pc)

loc_11690:
		subq.w	#4,$10(a0)
		addq.w	#4,$14(a0)
		moveq	#5,d0
		jmp	loc_B842(pc)

loc_1169E:
		bra.w	sub_113F0

sub_116A2:
		jsr	sub_B88A(pc)
		jsr	sub_15A46(pc)
		add.w	d7,d7
		add.w	d7,d7
		jmp	loc_116B2(pc,d7.w)

loc_116B2:
		bra.w	loc_116CE
		bra.w	loc_116DA
		bra.w	loc_11702
		bra.w	loc_11702
		bra.w	loc_116EC
		bra.w	loc_116EC
		bra.w	loc_11702

loc_116CE:
		move.w	2(a0),$28(a0)
		addq.w	#4,2(a0)
		rts

loc_116DA:
		jsr	sub_B876(pc)
		clr.l	$1C(a0)
		subq.b	#1,$26(a0)
		ble.s	loc_11702
		bra.w	sub_113F0

loc_116EC:
		jsr	sub_B87A(pc)
		move.l	#$20000,$1C(a0)
		subq.b	#1,$26(a0)
		ble.s	loc_11702
		bra.w	sub_113F0

loc_11702:
		subq.w	#4,2(a0)
		bclr	#1,$D(a0)
		clr.b	$26(a0)
		move.l	#$14000,$18(a0)
		subi.w	#$C,$10(a0)
		move.b	#$10,$26(a0)
		jmp	sub_B86E(pc)

sub_11728:
		jsr	sub_B88A(pc)
		jsr	sub_15A46(pc)
		add.w	d7,d7
		add.w	d7,d7
		jmp	loc_11738(pc,d7.w)

loc_11738:
		bra.w	loc_11754
		bra.w	loc_11760
		bra.w	loc_11774
		bra.w	loc_11774
		bra.w	loc_1178C
		bra.w	loc_1178C
		bra.w	loc_1178C

loc_11754:
		move.w	2(a0),$28(a0)
		addq.w	#3,2(a0)
		rts

loc_11760:
		moveq	#5,d0
		jsr	loc_B842(pc)
		clr.l	$1C(a0)
		subq.b	#1,$26(a0)
		ble.s	loc_1178C
		bra.w	sub_113F0

loc_11774:
		moveq	#7,d0
		jsr	loc_B842(pc)
		move.l	#$20000,$1C(a0)
		subq.b	#1,$26(a0)
		ble.s	loc_1178C
		bra.w	sub_113F0

loc_1178C:
		subq.w	#4,2(a0)
		bclr	#1,$D(a0)
		clr.b	$26(a0)
		move.l	#$FFFEC000,$18(a0)
		addi.w	#$C,$10(a0)
		move.b	#$10,$26(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

nullsub_13:
		rts

sub_117B6:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$40000,d0
		blt.s	loc_117CE
		move.l	#$40000,d0

loc_117CE:
		tst.w	$10(a0)
		bgt.s	loc_117DC
		bset	#0,$C(a0)
		rts

loc_117DC:
		move.l	d0,$1C(a0)
		add.l	d0,$14(a0)
		jsr	sub_15AB0(pc)
		beq.s	loc_117F4
		move.w	$28(a0),2(a0)
		clr.l	$1C(a0)

loc_117F4:
		bra.w	sub_113F0

sub_117F8:
		jsr	sub_15C24(pc)
		bne.w	locret_1181A
		move.b	$2B(a0),3(a0)
		clr.b	$F(a0)
		move.w	4(a0),d0
		andi.w	#$FFFE,d0
		bne.s	locret_1181A
		bclr	#1,$D(a0)

locret_1181A:
		rts

sub_1181C:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_11826:
		lea	(off_11830).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_11830:	dc.w sub_11838-off_11830
		dc.w sub_1188A-off_11830
		dc.w sub_118A0-off_11830
		dc.w sub_118FE-off_11830
sub_11838:
		jsr	sub_BC72(pc)
		move.l	#off_121C02,$20(a0)
		moveq	#4,d0
		jsr	sub_CA8E(pc)
		bset	#1,$D(a0)
		bset	#7,$E(a0)
		btst	#0,$36(a0)
		bne.s	loc_11874
		move.l	#$40000,$18(a0)
		move.l	#$40000,$1C(a0)
		jsr	sub_B852(pc)
		bra.s	locret_11888

loc_11874:
		move.l	#$30000,$18(a0)
		move.l	#$18000,$1C(a0)
		jsr	sub_B856(pc)

locret_11888:
		rts

sub_1188A:
		bclr	#6,$E(a0)
		bne.s	loc_11894
		rts

loc_11894:
		move.b	#$D3,(smps_cmd2).w
		addq.w	#1,2(a0)
		rts

sub_118A0:
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		move.l	$1C(a0),d1
		add.l	d1,$14(a0)
		bclr	#6,$E(a0)
		beq.s	loc_118C2
		add.l	d0,(player_pos_x).w
		move.l	$14(a0),(player_pos_y).w

loc_118C2:
		moveq	#3,d0
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		bne.s	loc_118F6
		move.b	#$D4,d2
		jsr	sub_ED12(pc)
		move.b	#$13,$26(a0)
		bclr	#1,$D(a0)
		btst	#0,$36(a0)
		bne.s	loc_118F0
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_118F0:
		moveq	#3,d0
		jmp	sub_B83E(pc)

loc_118F6:
		jsr	sub_11932(pc)
		jmp	loc_B97A(pc)

sub_118FE:
		subq.b	#1,$26(a0)
		bgt.s	locret_1190A
		bset	#0,$C(a0)

locret_1190A:
		rts

sub_1190C:
		move.w	(player_pos_x).w,d2
		move.w	(player_pos_y).w,d1
		subq.w	#8,d1
		jsr	sub_BB2C(pc)
		moveq	#0,d7
		lea	(some_mapping_array).w,a2
		move.b	(a2,d4.w),d7
		cmpi.b	#$2D,d7
		bne.s	loc_1192E
		moveq	#0,d0
		rts

loc_1192E:
		moveq	#1,d0
		rts

sub_11932:
		jsr	sub_BB84(pc)
		lea	(word_FF9000).w,a1
		moveq	#$2F,d6

loc_1193C:
		tst.w	(a1)
		beq.s	loc_1194E
		move.l	a3,-(sp)
		jsr	sub_BB72(pc)
		jsr	sub_BBA8(pc)
		bne.s	loc_11958
		movea.l	(sp)+,a3

loc_1194E:
		lea	$40(a1),a1
		dbf	d6,loc_1193C
		rts

loc_11958:
		movea.l	(sp)+,a3
		move.b	#$FF,$F(a1)
		bra.s	loc_1194E

sub_11962:
		cmpi.w	#1,2(a0)
		beq.s	loc_119C6
		bgt.w	locret_119F4
		move.w	#$6308,$A(a0)
		move.l	#off_127D68,$20(a0)
		move.w	#$A8,$10(a0)
		move.w	#$88,$14(a0)
		move.b	#$40,$26(a0)
		tst.b	(byte_FFEEFB).w
		bne.s	loc_119BA
		tst.b	(byte_FFEEFA).w
		bne.s	loc_119AC
		addq.w	#1,2(a0)
		bset	#2,$D(a0)
		moveq	#4,d0
		bsr.s	sub_119F6
		jmp	sub_B852(pc)

loc_119AC:
		moveq	#4,d0
		bsr.s	sub_119F6
		move.b	#$E2,(smps_cmd2).w
		jmp	sub_B852(pc)

loc_119BA:
		moveq	#0,d0
		bsr.s	sub_119F6
		addq.w	#1,2(a0)
		jmp	sub_B852(pc)

loc_119C6:
		subq.b	#1,$26(a0)
		bne.s	loc_119EA
		addq.w	#1,2(a0)
		st	(byte_FFEEFB).w
		move.b	#$92,(smps_cmd1_new).w
		move.b	#$95,(byte_FFEE76).w
		moveq	#$1D,d1
		jsr	(sub_105A).l
		rts

loc_119EA:
		moveq	#0,d0
		move.b	$26(a0),d0
		lsr.w	#4,d0
		bra.s	sub_119F6

locret_119F4:
		rts

sub_119F6:
		move.b	#1,(cram_update_needed).w
		lea	(word_11A14).l,a1
		lsl.w	#4,d0
		adda.l	d0,a1
		lea	((ram_palette_3+$10)).w,a2
		moveq	#3,d7

loc_11A0C:
		move.l	(a1)+,(a2)+
		dbf	d7,loc_11A0C
		rts

word_11A14:	dc.w $ACE, $8AC, $68A, $468, $446, $66A, $488, 0, $ACE,	$ACE, $8AC, $68A, $468,	$88C, $6AA, 0
		dc.w $ACE, $ACE, $ACE, $8AC, $68A, $AAC, $ACC, 0, $ACE,	$ACE, $ACE, $ACE, $8AC,	$ACE, $ACE, 0
		dc.w $ACE, $ACE, $ACE, $ACE, $ACE, $ACE, $ACE, 0
sub_11A64:
		tst.w	2(a0)
		bne.s	locret_11A7E
		move.w	#$8300,$A(a0)
		move.l	#off_127D7A,$20(a0)
		moveq	#2,d0
		jmp	sub_B83E(pc)

locret_11A7E:
		rts

sub_11A80:
		tst.w	2(a0)
		bne.s	loc_11AAC
		move.w	#$8260,$A(a0)
		move.l	#off_12E272,$20(a0)
		move.w	#$FFE0,$10(a0)
		move.w	#$90,$14(a0)
		move.w	#2,$18(a0)
		moveq	#9,d0
		jsr	sub_B83E(pc)

loc_11AAC:
		jmp	sub_B88A(pc)

sub_11AB0:
		lea	(off_11ABA).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_11ABA:	dc.w sub_11AC4-off_11ABA
		dc.w sub_11AEA-off_11ABA
		dc.w sub_11B1C-off_11ABA
		dc.w sub_11B2E-off_11ABA
		dc.w sub_11B58-off_11ABA
sub_11AC4:
		jsr	sub_BC72(pc)
		move.l	#off_11A2EC,$20(a0)
		subq.w	#8,$14(a0)
		bset	#1,$D(a0)
		bset	#2,$D(a0)
		bset	#4,$E(a0)
		jmp	sub_B852(pc)

sub_11AEA:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$1C,d0
		bgt.s	locret_11B1A
		cmpi.w	#$FFE4,d0
		blt.s	locret_11B1A
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)
		bclr	#2,$D(a0)
		bset	#7,$E(a0)
		move.w	#$1D,$26(a0)

locret_11B1A:
		rts

sub_11B1C:
		subq.w	#1,$26(a0)
		bhi.s	locret_11B1A
		bset	#1,$D(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

sub_11B2E:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$1C,d0
		bgt.s	loc_11B46
		cmpi.w	#$FFE4,d0
		blt.s	loc_11B46
		bra.w	sub_15C48

loc_11B46:
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)
		move.w	#$1D,$26(a0)

locret_11B56:
		rts

sub_11B58:
		subq.w	#1,$26(a0)
		bhi.s	locret_11B56
		bset	#1,$D(a0)
		subq.w	#3,2(a0)
		bset	#1,$D(a0)
		bset	#2,$D(a0)
		bclr	#7,$E(a0)
		jmp	sub_B86E(pc)

sub_11B7E:
		lea	(off_11B88).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_11B88:	dc.w sub_11C10-off_11B88
		dc.w sub_11C32-off_11B88
		dc.w sub_11C42-off_11B88
sub_11B8E:
		moveq	#0,d0
		move.b	$26(a0),d0
		addq.b	#1,d0
		andi.b	#$7F,d0
		move.b	d0,$26(a0)
		lsr.b	#2,d0
		lea	(byte_11BF0).l,a1
		move.b	(a1,d0.w),d0
		ext.w	d0
		add.w	d0,$10(a0)
		bclr	#6,$E(a0)
		beq.s	loc_11BEC
		movem.l	a0,-(sp)
		lea	(word_FFA2C0).w,a0
		moveq	#0,d1
		move.w	#$FFF2,d2
		jsr	(sub_756C).l
		bmi.s	loc_11BDC
		moveq	#0,d1
		move.w	#$E,d2
		jsr	(sub_756C).l
		bge.s	loc_11BDE

loc_11BDC:
		clr.l	d0

loc_11BDE:
		movem.l	(sp)+,a0
		ext.l	d0
		asl.l	#8,d0
		asl.l	#8,d0
		move.l	d0,(dword_FFEF5C).w

loc_11BEC:
		bra.w	sub_15C48

byte_11BF0:	dc.b 1,	1, 0, 1, 0, 1, 0, 0, 0,	0, $FF,	0, $FF,	0, $FF,	$FF
		dc.b $FF, $FF, 0, $FF, 0, $FF, 0, 0, 0,	0, 1, 0, 1, 0, 1, 1
sub_11C10:
		jsr	sub_BC72(pc)
		move.l	#off_11A322,$20(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		bset	#4,$E(a0)
		jmp	sub_B852(pc)

sub_11C32:
		btst	#6,$E(a0)
		beq.s	loc_11C3E
		addq.w	#1,2(a0)

loc_11C3E:
		bra.w	sub_11B8E

sub_11C42:
		move.l	$1C(a0),d0
		addi.l	#$3000,d0
		cmpi.l	#$20000,d0
		ble.s	loc_11C5A
		move.l	#$20000,d0

loc_11C5A:
		move.l	d0,$1C(a0)
		add.l	d0,$14(a0)
		btst	#6,$E(a0)
		beq.s	loc_11C6E
		add.l	d0,(dword_FFEF60).w

loc_11C6E:
		bra.w	sub_11B8E

sub_11C72:
		tst.w	2(a0)
		bne.s	loc_11C94
		jsr	sub_BC72(pc)
		move.l	#off_11A352,$20(a0)
		subi.w	#$18,$14(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	sub_B83E(pc)

loc_11C94:
		subq.b	#1,$26(a0)
		bhi.s	locret_11CA0
		bset	#0,$C(a0)

locret_11CA0:
		rts

sub_11CA2:
		lea	(off_11CAC).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_11CAC:	dc.w sub_11CB6-off_11CAC
		dc.w sub_11D4E-off_11CAC
		dc.w sub_11D7A-off_11CAC
		dc.w sub_11DA2-off_11CAC
		dc.w sub_11DD0-off_11CAC
sub_11CB6:
		jsr	sub_BC72(pc)
		move.l	#off_11A3A6,$20(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		bset	#4,$E(a0)
		clr.w	$26(a0)
		btst	#1,$36(a0)
		bne.s	loc_11D3E
		move.w	#$10,d0
		btst	#0,$36(a0)
		beq.s	loc_11CF0
		move.w	#$FFF0,d0

loc_11CF0:
		move.w	a0,$28(a0)
		moveq	#3,d6

loc_11CF6:
		jsr	sub_EA3C(pc)
		bne.s	loc_11D3A
		move.w	#$87,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	$A(a0),$A(a1)
		move.l	$20(a0),$20(a1)
		move.w	a0,$28(a1)
		move.w	$2A(a0),$2A(a1)
		move.w	a1,$2A(a0)
		move.b	$36(a0),$36(a1)
		addq.b	#2,$36(a1)
		add.w	d0,$10(a0)
		dbf	d6,loc_11CF6

loc_11D3A:
		addq.w	#1,2(a0)

loc_11D3E:
		btst	#0,$36(a0)
		beq.w	sub_B852
		moveq	#1,d0
		jmp	sub_B83E(pc)

sub_11D4E:
		tst.b	$26(a0)
		beq.s	loc_11D76
		addq.w	#2,2(a0)
		move.b	#$C0,(smps_cmd2).w
		bset	#3,$D(a0)
		btst	#0,$36(a0)
		bne.s	loc_11D70
		jmp	sub_B872(pc)

loc_11D70:
		moveq	#3,d0
		jmp	loc_B842(pc)

loc_11D76:
		bra.w	sub_11E02

sub_11D7A:
		move.w	(player_pos_y).w,d0
		sub.w	$14(a0),d0
		cmpi.w	#$FFC0,d0
		bgt.s	loc_11D8E
		move.b	#1,$27(a0)

loc_11D8E:
		tst.b	$27(a0)
		beq.s	loc_11D9E
		addq.w	#2,2(a0)
		move.b	#$A,$26(a0)

loc_11D9E:
		bra.w	sub_11E02

sub_11DA2:
		subq.b	#1,$26(a0)
		bhi.s	locret_11DCE
		tst.w	$2A(a0)
		beq.s	loc_11DC8
		movea.w	$2A(a0),a1
		move.b	$36(a0),d0
		lsr.b	#4,d0
		move.b	$36(a1),d1
		lsr.b	#4,d1
		cmp.b	d0,d1
		bne.s	loc_11DC8
		move.b	#$A,$26(a1)

loc_11DC8:
		bset	#0,$C(a0)

locret_11DCE:
		rts

sub_11DD0:
		subq.b	#1,$26(a0)
		bhi.s	locret_11E00
		subq.w	#1,2(a0)
		move.b	#$C0,d2
		jsr	sub_ED12(pc)
		move.b	#$A,$26(a0)
		bset	#3,$D(a0)
		btst	#0,$36(a0)
		bne.s	loc_11DFA
		jmp	sub_B872(pc)

loc_11DFA:
		moveq	#3,d0
		jmp	loc_B842(pc)

locret_11E00:
		rts

sub_11E02:
		btst	#6,$E(a0)
		beq.s	loc_11E24
		movea.w	$28(a0),a1
		move.b	$36(a0),d0
		lsr.b	#4,d0
		move.b	$36(a1),d1
		lsr.b	#4,d1
		cmp.b	d0,d1
		bne.s	loc_11E24
		move.b	#1,$27(a1)

loc_11E24:
		bra.w	sub_15C48

sub_11E28:
		lea	(off_11E32).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_11E32:	dc.w sub_11E3C-off_11E32
		dc.w sub_11E8E-off_11E32
		dc.w sub_11EA8-off_11E32
		dc.w sub_11EDC-off_11E32
		dc.w sub_11EF6-off_11E32
sub_11E3C:
		jsr	sub_BC72(pc)
		move.l	#off_1214C6,$20(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		bset	#4,$E(a0)
		bset	#4,$C(a0)
		bset	#7,$C(a0)
		btst	#0,$36(a0)
		bne.s	loc_11E7E
		move.w	#1,$1C(a0)
		move.w	#$230,$28(a0)
		jmp	sub_B852(pc)

loc_11E7E:
		move.w	#$FFFF,$1C(a0)
		move.w	#$110,$28(a0)
		jmp	sub_B852(pc)

sub_11E8E:
		bclr	#6,$E(a0)
		beq.s	loc_11EA4
		addq.w	#1,2(a0)
		move.b	#$E1,(smps_cmd2).w
		neg.l	$1C(a0)

loc_11EA4:
		bra.w	sub_15C48

sub_11EA8:
		bclr	#6,$E(a0)
		bne.s	loc_11EBA
		addq.w	#2,2(a0)
		neg.l	$1C(a0)
		rts

loc_11EBA:
		move.w	$26(a0),d0
		cmp.w	$28(a0),d0
		bne.s	loc_11EC8
		addq.w	#1,2(a0)

loc_11EC8:
		addq.w	#1,$26(a0)
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		add.l	d0,(dword_FFEF60).w
		bra.w	sub_15C48

sub_11EDC:
		bclr	#6,$E(a0)
		bne.s	loc_11EF2
		addq.w	#1,2(a0)
		move.b	#$E1,(smps_cmd2).w
		neg.l	$1C(a0)

loc_11EF2:
		bra.w	sub_15C48

sub_11EF6:
		bclr	#6,$E(a0)
		beq.s	loc_11F08
		subq.w	#2,2(a0)
		neg.l	$1C(a0)
		rts

loc_11F08:
		tst.w	$26(a0)
		bne.s	loc_11F12
		subq.w	#3,2(a0)

loc_11F12:
		subq.w	#1,$26(a0)
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		bra.w	sub_15C48

sub_11F22:
		lea	(off_11F2C).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_11F2C:	dc.w sub_11F36-off_11F2C
		dc.w sub_11FAA-off_11F2C
		dc.w sub_12050-off_11F2C
		dc.w sub_12080-off_11F2C
		dc.w sub_120A2-off_11F2C
sub_11F36:
		jsr	sub_BC72(pc)
		move.l	#off_1215C6,$20(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		bset	#4,$E(a0)
		bset	#4,$C(a0)
		btst	#1,$36(a0)
		bne.s	loc_11F7E
		move.w	#$80,$28(a0)
		btst	#0,$36(a0)
		beq.s	loc_11F7A
		move.b	#$40,$26(a0)
		addq.w	#1,2(a0)

loc_11F7A:
		jmp	sub_B852(pc)

loc_11F7E:
		addq.w	#5,2(a0)
		btst	#0,$36(a0)
		bne.s	loc_11F9A
		move.w	#1,$1C(a0)
		move.w	#$230,$28(a0)
		jmp	sub_B86E(pc)

loc_11F9A:
		move.w	#$FFFF,$1C(a0)
		move.w	#$110,$28(a0)
		jmp	sub_B86E(pc)

sub_11FAA:
		move.w	(player_pos_x).w,d1
		sub.w	$10(a0),d1
		cmpi.w	#$120,d1
		bgt.s	loc_11FE0
		cmpi.w	#$FEE0,d1
		blt.w	loc_11FE0
		move.w	(player_pos_y).w,d1
		sub.w	$14(a0),d1
		cmpi.w	#$120,d1
		bgt.s	loc_11FE0
		cmpi.w	#$FEE0,d1
		blt.w	loc_11FE0
		move.w	(word_FFA342).w,d0
		andi.w	#$FF,d0
		beq.s	loc_11FE4

loc_11FE0:
		bra.w	sub_15C48

loc_11FE4:
		move.b	#$E0,(smps_cmd2).w
		move.w	#5,d6
		lea	(stru_12020).l,a2

loc_11FF4:
		jsr	sub_EA3C(pc)
		bne.s	locret_1201E
		move.w	#$89,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.l	(a2)+,$18(a1)
		move.l	(a2)+,$1C(a1)
		move.b	#1,$36(a1)
		dbf	d6,loc_11FF4

locret_1201E:
		rts

stru_12020:	struc_48 $FFFE8000, $FFFF0000
		struc_48 $FFFF0000, $FFFF8000
		struc_48 $18000, $10000
		struc_48 $10000, $8000
		struc_48 $18000, $FFFF0000
		struc_48 $FFFE8000, $10000
sub_12050:
		jsr	sub_B88A(pc)
		bclr	#6,$E(a0)
		beq.s	loc_1206C
		move.l	$18(a0),d0
		add.l	d0,(dword_FFEF5C).w
		move.l	$1C(a0),d0
		add.l	d0,(dword_FFEF60).w

loc_1206C:
		subq.b	#1,$26(a0)
		bhi.s	loc_1207C
		addq.w	#1,2(a0)
		move.b	#$80,$26(a0)

loc_1207C:
		bra.w	sub_15C48

sub_12080:
		subq.b	#1,$26(a0)
		bhi.s	loc_1209E
		addq.w	#1,2(a0)
		move.b	#$DF,(smps_cmd2).w
		move.b	#$40,$26(a0)
		neg.l	$18(a0)
		neg.l	$1C(a0)

loc_1209E:
		bra.w	sub_15C48

sub_120A2:
		jsr	sub_B88A(pc)
		bclr	#6,$E(a0)
		beq.s	loc_120BE
		move.l	$18(a0),d0
		add.l	d0,(dword_FFEF5C).w
		move.l	$1C(a0),d0
		add.l	d0,(dword_FFEF60).w

loc_120BE:
		subq.b	#1,$26(a0)
		bhi.s	loc_120CA
		bset	#0,$C(a0)

loc_120CA:
		bra.w	sub_15C48

sub_120CE:
		lea	(off_120D8).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_120D8:	dc.w sub_12114-off_120D8
		dc.w sub_1215E-off_120D8
		dc.w sub_121CC-off_120D8
		dc.w sub_121FE-off_120D8
		dc.w sub_1225C-off_120D8
		dc.w sub_122B8-off_120D8
sub_120E4:
		moveq	#0,d0
		move.b	$28(a0),d0
		addq.b	#1,d0
		move.b	d0,$28(a0)
		lsr.w	#2,d0
		andi.b	#$F,d0
		lea	(byte_12104).l,a1
		move.b	(a1,d0.w),$2D(a0)
		rts

byte_12104:	dc.b 0,	1, 2, 3, 3, 3, 2, 1, 0,	$FF, $FE, $FD, $FD, $FD, $FE, $FF
sub_12114:
		jsr	sub_BC72(pc)
		move.l	#off_121D3E,$20(a0)
		moveq	#3,d0
		jsr	sub_CA8E(pc)
		move.w	#$12C,$26(a0)
		bset	#7,$C(a0)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		bclr	#0,$36(a0)
		jsr	sub_B852(pc)
		movea.l	a0,a1
		lea	(unk_FF9F00).w,a2
		jsr	copy_bytes_to_dest_64 ;	a1 = source
		movea.l	a0,a1
		moveq	#0,d1
		jsr	fill_ram_64_bytes ; d1 = dword

sub_1215E:
		move.w	(planea_start_x).w,d0
		move.w	$10(a0),d1
		sub.w	d0,d1
		cmpi.w	#$160,d1
		bge.w	loc_121BE
		cmpi.w	#$140,d1
		bge.w	loc_12192
		subq.w	#1,$26(a0)
		bgt.s	loc_12192
		addq.w	#1,2(a0)
		move.w	#1,6(a0)
		move.w	#$1E,$26(a0)
		jmp	sub_120E4(pc)

loc_12192:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#0,d0
		bgt.s	loc_121BA
		cmpi.w	#$FFA0,d0
		blt.s	loc_121BA
		tst.l	(dword_FFA2D8).w
		blt.s	loc_121BA
		move.l	(dword_FFA2D8).w,d0
		addi.l	#$10000,d0
		add.l	d0,$10(a0)

loc_121BA:
		jmp	sub_120E4(pc)

loc_121BE:
		move.l	(dword_FFA2D8).w,d0
		tst.l	d0
		bge.s	loc_121BA
		add.l	d0,$10(a0)
		bra.s	loc_121BA

sub_121CC:
		subq.w	#1,$26(a0)
		bgt.s	loc_121FA
		addq.w	#1,2(a0)
		bchg	#0,5(a0)
		move.w	#$B4,$26(a0)
		move.b	(word_FFA2C4+1).w,$2A(a0)
		move.b	(byte_FFA2C7).w,$2B(a0)
		move.w	(player_pos_x).w,$3C(a0)
		move.w	(player_pos_y).w,$3E(a0)

loc_121FA:
		jmp	sub_120E4(pc)

sub_121FE:
		move.w	(word_FFA2C4).w,d0
		cmpi.w	#$1A,d0
		beq.s	loc_12222
		cmpi.w	#$1B,d0
		beq.s	loc_12222
		move.b	(word_FFA2C4+1).w,d0
		cmp.b	$2A(a0),d0
		bne.s	loc_12254
		move.b	(byte_FFA2C7).w,d0
		cmp.b	$2B(a0),d0
		bne.s	loc_12254

loc_12222:
		move.w	(player_pos_x).w,d0
		cmp.w	$3C(a0),d0
		bne.s	loc_12254
		move.w	(player_pos_y).w,d0
		cmp.w	$3E(a0),d0
		bne.s	loc_12254
		subq.w	#1,$26(a0)
		bgt.s	loc_12250
		subq.w	#2,2(a0)
		bchg	#0,5(a0)
		clr.w	6(a0)
		move.w	#$12C,$26(a0)

loc_12250:
		jmp	sub_120E4(pc)

loc_12254:
		addq.w	#1,2(a0)
		jmp	sub_120E4(pc)

sub_1225C:
		move.b	#$C4,(smps_cmd2).w
		moveq	#7,d6
		lea	(stru_122EC).l,a2

loc_1226A:
		jsr	sub_EA34(pc)
		bne.s	loc_122A0
		move.w	#$4E,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	(a2)+,d0
		add.w	d0,$10(a1)
		move.w	(a2)+,d0
		add.w	d0,$14(a1)
		move.w	(a2)+,d0
		move.b	d0,$36(a1)
		move.l	(a2)+,$18(a1)
		move.l	(a2)+,$1C(a1)
		dbf	d6,loc_1226A

loc_122A0:
		bset	#2,$D(a0)
		move.w	#$168,$26(a0)
		addq.w	#1,2(a0)
		bset	#0,$36(a0)
		rts

sub_122B8:
		subq.w	#1,$26(a0)
		bgt.s	loc_122DC
		clr.w	2(a0)
		bclr	#0,$36(a0)
		bclr	#2,$D(a0)
		move.w	#$12C,$26(a0)
		jsr	sub_B852(pc)
		jmp	sub_120E4(pc)

loc_122DC:
		move.w	(planea_start_x).w,d0
		addi.w	#$160,d0
		move.w	d0,$10(a0)
		jmp	sub_120E4(pc)

stru_122EC:	struc_43 $FFF0, $FFE0,	7, $FFFF0000, $FFFF0000
		struc_43 $10, $FFE0, 6, $10000, $FFFF0000
		struc_43 $FFF0, 0, 7, $FFFF0000, $10000
		struc_43 $10, 0, 0, $10000, $10000
		struc_43 0, $FFF0, 7, $FFFF0000, 0
		struc_43 $FFE0, $FFF0,	5, $FFFF0000, $FFFF0000
		struc_43 $20, $FFF0, 4, $10000, $FFFF0000
		struc_43 0, $FFD0, 5, 0, $FFFF0000
sub_1235C:
		lea	(off_12366).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_12366:	dc.w sub_1236E-off_12366
		dc.w sub_12394-off_12366
		dc.w sub_123D0-off_12366
		dc.w sub_12394-off_12366
sub_1236E:
		jsr	sub_BC72(pc)
		move.l	#off_1221C8,$20(a0)
		bset	#7,$C(a0)
		bset	#3,$D(a0)
		moveq	#0,d0
		add.b	$36(a0),d0
		andi.w	#1,d0
		jmp	sub_B83E(pc)

sub_12394:
		cmpi.w	#2,6(a0)
		blt.s	locret_123B2
		cmpi.b	#7,8(a0)
		blt.s	locret_123B2
		cmpi.w	#3,2(a0)
		bne.s	loc_123B4
		bset	#0,$C(a0)

locret_123B2:
		rts

loc_123B4:
		bclr	#3,$D(a0)
		move.w	#$12C,$38(a0)
		move.b	#$A,$26(a0)
		moveq	#2,d0
		add.w	4(a0),d0
		jmp	sub_B83E(pc)

sub_123D0:
		jsr	sub_E9A8(pc)
		beq.s	loc_123DE
		bset	#0,$C(a0)
		rts

loc_123DE:
		subq.w	#1,$38(a0)
		bne.s	loc_123F4
		move.b	#$C4,(smps_cmd2).w
		moveq	#2,d0
		add.w	4(a0),d0
		jmp	sub_B83E(pc)

loc_123F4:
		subq.b	#1,$26(a0)
		bne.s	loc_1240E
		move.b	#$A,$26(a0)
		jsr	rand
		move.b	d0,$27(a0)
		jmp	sub_B960(pc)

loc_1240E:
		btst	#2,$36(a0)
		beq.s	loc_12434
		move.w	(player_pos_y).w,d0
		subi.w	#$60,d0
		cmp.w	$14(a0),d0
		bgt.w	loc_12520
		addi.w	#$20,d0
		cmp.w	$14(a0),d0
		blt.w	loc_12500
		bra.s	loc_12450

loc_12434:
		move.w	(player_pos_y).w,d0
		subi.w	#$40,d0
		cmp.w	$14(a0),d0
		bgt.w	loc_12520
		addi.w	#$40,d0
		cmp.w	$14(a0),d0
		blt.w	loc_12500

loc_12450:
		btst	#1,$27(a0)
		bne.w	loc_12500
		bra.w	loc_12520

loc_1245E:
		btst	#2,$36(a0)
		bne.s	loc_12484
		move.w	(player_pos_x).w,d0
		subi.w	#$50,d0
		cmp.w	$10(a0),d0
		bgt.w	loc_12560
		addi.w	#$A0,d0
		cmp.w	$10(a0),d0
		blt.w	loc_12540
		bra.s	loc_124C4

loc_12484:
		btst	#1,$36(a0)
		bne.s	loc_124AA
		move.w	(player_pos_x).w,d0
		addi.w	#$30,d0
		cmp.w	$10(a0),d0
		bgt.w	loc_12560
		addi.w	#$60,d0
		cmp.w	$10(a0),d0
		blt.w	loc_12540
		bra.s	loc_124C4

loc_124AA:
		move.w	(player_pos_x).w,d0
		subi.w	#$90,d0
		cmp.w	$10(a0),d0
		bgt.w	loc_12560
		addi.w	#$60,d0
		cmp.w	$10(a0),d0
		blt.s	loc_12540

loc_124C4:
		btst	#0,$27(a0)
		bne.w	loc_12560
		bra.s	loc_12540

loc_124D0:
		tst.w	$18(a0)
		bgt.s	loc_124EC
		cmpi.w	#3,4(a0)
		beq.s	loc_124E4
		moveq	#3,d0
		bsr.w	loc_B842

loc_124E4:
		bsr.w	sub_B88A
		jmp	sub_B960(pc)

loc_124EC:
		cmpi.w	#2,4(a0)
		beq.s	loc_124E4
		bsr.w	sub_B872
		bsr.w	sub_B88A
		jmp	sub_B960(pc)

loc_12500:
		move.l	$1C(a0),d0
		addi.l	#-$2000,d0
		cmpi.l	#$FFFE0000,d0
		bge.s	loc_12518
		move.l	#$FFFE0000,d0

loc_12518:
		move.l	d0,$1C(a0)
		bra.w	loc_1245E

loc_12520:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$20000,d0
		ble.s	loc_12538
		move.l	#$20000,d0

loc_12538:
		move.l	d0,$1C(a0)
		bra.w	loc_1245E

loc_12540:
		move.l	$18(a0),d0
		addi.l	#-$2000,d0
		cmpi.l	#$FFFD0000,d0
		bge.s	loc_12558
		move.l	#$FFFD0000,d0

loc_12558:
		move.l	d0,$18(a0)
		bra.w	loc_124D0

loc_12560:
		move.l	$18(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$30000,d0
		ble.s	loc_12578
		move.l	#$30000,d0

loc_12578:
		move.l	d0,$18(a0)
		bra.w	loc_124D0

sub_12580:
		cmpi.w	#1,2(a0)
		bgt.w	loc_1260A
		beq.s	loc_125A4
		jsr	sub_BC72(pc)
		move.l	#off_1222B6,$20(a0)
		moveq	#4,d0
		jsr	sub_CA8E(pc)
		moveq	#0,d0
		jmp	sub_B83E(pc)

loc_125A4:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$30000,d0
		ble.s	loc_125BC
		move.l	#$30000,d0

loc_125BC:
		tst.w	$10(a0)
		bgt.s	loc_125CA
		bset	#0,$C(a0)
		rts

loc_125CA:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		jsr	sub_15AB0(pc)
		beq.s	loc_12606
		clr.l	$1C(a0)
		addq.w	#1,2(a0)
		btst	#0,$36(a0)
		bne.s	loc_125F2
		move.l	#$18000,$18(a0)
		bra.s	loc_125FA

loc_125F2:
		move.l	#$FFFE8000,$18(a0)

loc_125FA:
		cmp.w	4(a0),d7
		beq.s	loc_12606
		move.l	d7,d0
		jsr	loc_B842(pc)

loc_12606:
		jmp	sub_B960(pc)

loc_1260A:
		jsr	sub_B88A(pc)
		jsr	sub_15A46(pc)
		bne.s	loc_12628
		subq.w	#1,2(a0)
		clr.l	$18(a0)
		move.l	#$10000,$1C(a0)
		bra.w	loc_125A4

loc_12628:
		moveq	#0,d0
		btst	#0,$36(a0)
		beq.s	loc_12634
		moveq	#1,d0

loc_12634:
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		bne.s	loc_12644
		bset	#0,$C(a0)

loc_12644:
		jmp	sub_B960(pc)

sub_12648:
		lea	(off_12652).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_12652:	dc.w sub_1265A-off_12652
		dc.w sub_1268A-off_12652
		dc.w sub_126EC-off_12652
		dc.w sub_126EC-off_12652
sub_1265A:
		jsr	sub_BC72(pc)
		move.l	#off_121DB4,$20(a0)
		subi.w	#$10,$14(a0)
		bset	#1,$D(a0)
		moveq	#0,d0
		move.b	$36(a0),d0
		move.w	d0,d1
		lsr.w	#1,d1
		add.w	d1,2(a0)
		jsr	sub_B83E(pc)
		jmp	sub_12648

sub_1268A:
		movea.w	$2A(a0),a1
		cmpa.w	$3E(a1),a0
		beq.s	loc_1269C
		bset	#0,$C(a0)
		rts

loc_1269C:
		move.w	$2C(a1),$2C(a0)
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		move.w	6(a1),6(a0)
		move.w	4(a1),d0
		cmp.w	4(a0),d0
		beq.s	loc_126CE
		cmpi.w	#1,d0
		blt.s	loc_126D6
		beq.s	loc_126E0
		bset	#2,$D(a0)
		rts

loc_126CE:
		bclr	#2,$D(a0)
		rts

loc_126D6:
		bclr	#2,$D(a0)
		jmp	sub_B86E(pc)

loc_126E0:
		bclr	#2,$D(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

sub_126EC:
		movea.w	$2A(a0),a1
		cmpa.w	$3E(a1),a0
		beq.s	loc_126FE
		bset	#0,$C(a0)
		rts

loc_126FE:
		move.w	$2C(a1),$2C(a0)
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		move.w	6(a1),6(a0)
		move.w	4(a1),d0
		addq.w	#4,d0
		cmp.w	4(a0),d0
		beq.s	loc_12732
		cmpi.w	#5,d0
		blt.s	loc_1273A
		beq.s	loc_12744
		bset	#2,$D(a0)
		rts

loc_12732:
		bclr	#2,$D(a0)
		rts

loc_1273A:
		bclr	#2,$D(a0)
		jmp	sub_B876(pc)

loc_12744:
		bclr	#2,$D(a0)
		moveq	#5,d0
		jmp	loc_B842(pc)

sub_12750:
		lea	(off_1275A).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_1275A:	dc.w sub_127C6-off_1275A
		dc.w sub_127E8-off_1275A
		dc.w sub_12858-off_1275A
		dc.w sub_1287C-off_1275A
		dc.w sub_12898-off_1275A
		dc.w sub_128FC-off_1275A
		dc.w sub_12934-off_1275A
		dc.w sub_1294E-off_1275A
sub_1276A:
		jsr	sub_B9B8(pc)
		beq.s	loc_127C2
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_12784
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_127AA

loc_12784:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.w	2(a0),$28(a0)
		move.b	#3,$2C(a0)
		move.w	#6,2(a0)
		bset	#1,$D(a0)
		jmp	sub_B960(pc)

loc_127AA:
		jsr	sub_15CCC(pc)
		move.w	#7,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		bset	#1,$D(a0)

loc_127C2:
		jmp	sub_B960(pc)

sub_127C6:
		jsr	sub_BC72(pc)
		move.l	#off_122052,$20(a0)
		subi.w	#$10,$14(a0)
		move.b	#1,$39(a0)
		bset	#1,$D(a0)
		jmp	sub_B852(pc)

sub_127E8:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$90,d0
		bgt.s	locret_12836
		cmpi.w	#$FF70,d0
		blt.s	locret_12836
		bclr	#1,$D(a0)
		move.b	#$E,$26(a0)
		btst	#1,$36(a0)
		bne.s	loc_12838
		addq.w	#1,2(a0)
		tst.w	d0
		blt.s	loc_12828
		bset	#0,$36(a0)
		move.l	#$18000,$18(a0)
		rts

loc_12828:
		bclr	#0,$36(a0)
		move.l	#$FFFE8000,$18(a0)

locret_12836:
		rts

loc_12838:
		btst	#0,$36(a0)
		beq.s	loc_1284C
		move.l	#$18000,$18(a0)
		jmp	sub_B852(pc)

loc_1284C:
		move.l	#$FFFE8000,$18(a0)
		jmp	sub_B852(pc)

sub_12858:
		subq.b	#1,$26(a0)
		bgt.s	locret_1287A
		btst	#1,$36(a0)
		bne.s	loc_1286A
		addq.w	#1,2(a0)

loc_1286A:
		tst.l	$18(a0)
		blt.s	loc_12876
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_12876:
		jmp	sub_B856(pc)

locret_1287A:
		rts

sub_1287C:
		jsr	sub_B88A(pc)
		subq.b	#1,$26(a0)
		bhi.s	loc_12894
		move.b	#8,$26(a0)
		move.b	#$C5,d2
		jsr	sub_ED12(pc)

loc_12894:
		jmp	sub_1276A(pc)

sub_12898:
		addi.l	#$1800,$1C(a0)
		cmpi.l	#$30000,$1C(a0)
		ble.s	loc_128B2
		move.l	#$30000,$1C(a0)

loc_128B2:
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		move.w	(player_pos_y).w,d0
		sub.w	$14(a0),d0
		cmpi.w	#$28,d0
		bgt.w	loc_128F8
		move.l	#$10000,$1C(a0)
		btst	#0,$36(a0)
		bne.w	loc_128EA
		move.l	#$FFFDC000,$18(a0)
		moveq	#2,d0
		jmp	sub_B83E(pc)

loc_128EA:
		move.l	#$24000,$18(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_128F8:
		jmp	sub_1276A(pc)

sub_128FC:
		move.l	$1C(a0),d0
		subi.l	#$400,d0
		cmpi.l	#$FFFE8000,d0
		bge.s	loc_12914
		move.l	#$FFFE8000,d0

loc_12914:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		subq.b	#1,$26(a0)
		bhi.s	loc_12930
		move.b	#8,$26(a0)
		move.b	#$C5,d2
		jsr	sub_ED12(pc)

loc_12930:
		jmp	sub_1276A(pc)

sub_12934:
		jsr	sub_15C24(pc)
		bne.w	locret_1294C
		move.w	$28(a0),2(a0)
		bclr	#1,$D(a0)
		jmp	sub_B960(pc)

locret_1294C:
		rts

sub_1294E:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_12958:
		lea	(off_12962).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_12962:	dc.w sub_1296A-off_12962
		dc.w sub_129D6-off_12962
		dc.w sub_129F8-off_12962
		dc.w sub_12A66-off_12962
sub_1296A:
		jsr	sub_BC72(pc)
		move.l	#off_1222B6,$20(a0)
		bset	#6,$C(a0)
		bset	#2,$D(a0)
		bset	#4,$E(a0)
		moveq	#2,d0
		jsr	sub_CA8E(pc)
		jsr	sub_B852(pc)
		jsr	sub_EA04(pc)
		bne.s	loc_129CE
		move.w	a2,$3E(a1)
		move.w	a1,$3E(a2)
		move.l	#off_1F44C,$20(a1)
		move.w	#$C350,$A(a1)
		bset	#6,$A(a1)
		move.w	#$A3,0.w(a1)
		move.w	$10(a2),$10(a1)
		move.w	$14(a2),$14(a1)
		move.w	$2E(a2),$2E(a1)
		rts

loc_129CE:
		bset	#0,$C(a0)
		rts

sub_129D6:
		movea.w	$3E(a0),a1
		cmpa.w	$3E(a1),a0
		beq.s	locret_129F6
		addq.w	#1,2(a0)
		addi.w	#$10,$10(a0)
		addi.w	#$10,$14(a0)
		bclr	#2,$D(a0)

locret_129F6:
		rts

sub_129F8:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$40000,d0
		ble.s	loc_12A10
		move.l	#$40000,d0

loc_12A10:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		moveq	#2,d0
		jsr	sub_CA58(pc)
		beq.s	loc_12A24
		clr.l	$1C(a0)

loc_12A24:
		jsr	sub_15AB0(pc)
		beq.s	loc_12A58
		clr.l	$1C(a0)
		addq.w	#1,2(a0)
		btst	#0,$36(a0)
		beq.s	loc_12A44
		move.l	#$18000,$18(a0)
		bra.s	loc_12A4C

loc_12A44:
		move.l	#$FFFE8000,$18(a0)

loc_12A4C:
		cmp.w	4(a0),d7
		beq.s	loc_12A58
		move.l	d7,d0
		jsr	loc_B842(pc)

loc_12A58:
		jsr	sub_B9B8(pc)
		beq.s	loc_12A62
		move.w	a0,$30(a1)

loc_12A62:
		jmp	sub_B960(pc)

sub_12A66:
		jsr	sub_B88A(pc)
		jsr	sub_15A46(pc)
		bne.s	loc_12A80
		subq.w	#1,2(a0)
		move.l	#$10000,$1C(a0)
		bra.w	sub_129F8

loc_12A80:
		moveq	#0,d0
		tst.w	$18(a0)
		bgt.s	loc_12A8A
		moveq	#1,d0

loc_12A8A:
		jsr	sub_CA58(pc)
		cmpi.w	#1,d7
		bne.s	loc_12A9A
		bset	#0,$C(a0)

loc_12A9A:
		jsr	sub_B9B8(pc)
		beq.s	loc_12AA4
		move.w	a0,$30(a1)

loc_12AA4:
		jmp	sub_B960(pc)

sub_12AA8:
		lea	(off_12AB2).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_12AB2:	dc.w sub_12ABE-off_12AB2
		dc.w sub_12AE0-off_12AB2
		dc.w sub_12AE0-off_12AB2
		dc.w sub_12B74-off_12AB2
		dc.w sub_12B48-off_12AB2
		dc.w sub_12B8C-off_12AB2
sub_12ABE:
		jsr	sub_BC72(pc)
		move.l	#off_1222A4,$20(a0)
		bset	#4,$E(a0)
		move.w	$14(a0),$2A(a0)
		moveq	#1,d0
		jsr	sub_CA8E(pc)
		jmp	sub_B852(pc)

sub_12AE0:
		move.l	$1C(a0),d0
		addi.l	#$4000,d0
		cmpi.l	#$30000,d0
		ble.s	loc_12AF8
		move.l	#$30000,d0

loc_12AF8:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		beq.s	loc_12B2A
		move.b	#$E3,d2
		jsr	sub_ED12(pc)
		andi.w	#$FFF0,$14(a0)
		addq.w	#1,2(a0)
		cmpi.w	#3,2(a0)
		beq.s	loc_12B38
		move.l	#$FFFF0000,$1C(a0)

loc_12B2A:
		jsr	sub_B9B8(pc)
		beq.s	loc_12B34
		move.w	a0,$30(a1)

loc_12B34:
		jmp	sub_B960(pc)

loc_12B38:
		move.l	#$FFFE0000,$1C(a0)
		move.b	#$3C,$26(a0)
		rts

sub_12B48:
		jsr	sub_B88A(pc)
		move.w	$2A(a0),d0
		cmp.w	$14(a0),d0
		blt.s	loc_12B66
		move.w	$2A(a0),$14(a0)
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)

loc_12B66:
		jsr	sub_B9B8(pc)
		beq.s	loc_12B70
		move.w	a0,$30(a1)

loc_12B70:
		jmp	sub_B960(pc)

sub_12B74:
		subq.b	#1,$26(a0)
		bgt.s	loc_12B7E
		addq.w	#1,2(a0)

loc_12B7E:
		jsr	sub_B9B8(pc)
		beq.s	loc_12B88
		move.w	a0,$30(a1)

loc_12B88:
		jmp	sub_B960(pc)

sub_12B8C:
		subq.b	#1,$26(a0)
		bgt.s	loc_12B9A
		subq.w	#4,2(a0)
		clr.l	$1C(a0)

loc_12B9A:
		jsr	sub_B9B8(pc)
		beq.s	locret_12BA4
		move.w	a0,$30(a1)

locret_12BA4:
		rts

sub_12BA6:
		tst.w	2(a0)
		bne.s	loc_12C10
		bra.s	loc_12BD6

loc_12BAE:
		movea.w	$3C(a0),a1
		cmpa.w	$3C(a1),a1
		beq.s	loc_12BBE
		bset	#0,$C(a0)

loc_12BBE:
		movea.w	$3E(a0),a2
		cmpa.w	$3C(a2),a1
		beq.s	locret_12BD4
		bset	#0,$39(a1)
		bset	#0,$C(a0)

locret_12BD4:
		rts

loc_12BD6:
		jsr	sub_BC72(pc)
		move.l	#off_122282,$20(a0)
		bset	#1,$D(a0)
		move.b	#7,$26(a0)
		move.w	#1,$28(a0)
		move.w	#$14,d0
		move.w	d0,d1
		add.w	d1,d1
		move.b	$36(a0),d7

loc_12C00:
		beq.s	loc_12C08
		add.w	d1,d0
		subq.b	#1,d7
		bra.s	loc_12C00

loc_12C08:
		move.w	d0,$2A(a0)
		jmp	sub_B852(pc)

loc_12C10:
		subq.b	#1,$26(a0)
		bgt.s	loc_12C5A
		moveq	#0,d0
		move.b	$27(a0),d0
		addq.b	#1,d0
		andi.b	#$F,d0
		move.b	d0,$27(a0)
		add.w	d0,d0
		add.w	d0,d0
		lea	(stru_12C7C).l,a1
		move.b	(a1,d0.w),$28(a0)
		move.b	1(a1,d0.w),$29(a0)
		move.b	3(a1,d0.w),$26(a0)
		move.b	2(a1,d0.w),d0
		move.w	d0,d1
		add.w	d1,d1
		move.b	$36(a0),d7

loc_12C4E:
		beq.s	loc_12C56
		add.w	d1,d0
		subq.b	#1,d7
		bra.s	loc_12C4E

loc_12C56:
		move.w	d0,$2A(a0)

loc_12C5A:
		move.b	$28(a0),d1
		move.b	$29(a0),d2
		moveq	#0,d3
		move.w	$2A(a0),d3
		jsr	sub_EB3C(pc)
		move.l	d0,$18(a0)
		move.l	d1,$1C(a0)
		jsr	sub_B88A(pc)
		jmp	loc_12BAE(pc)

stru_12C7C:	struc_49 0, 1,	$14, $10
		struc_49 $20, 3, $14, $10
		struc_49 $3F, 3, $10, $18
		struc_49 $20, 7, 8, $10
		struc_49 0, 7,	0, 6
		struc_49 $20, 4, 8, $10
		struc_49 $3F, 0, $10, $18
		struc_49 $20, 0, $14, $10
		struc_49 0, 0,	$14, $10
		struc_49 $20, 2, $14, $10
		struc_49 $3F, 6, $10, $18
		struc_49 $20, 6, 8, $10
		struc_49 0, 4,	0, 6
		struc_49 $20, 5, 8, $10
		struc_49 $3F, 5, $10, $18
		struc_49 $20, 1, $14, $10
sub_12CBC:
		cmpi.w	#1,2(a0)
		beq.s	loc_12D02
		bgt.s	loc_12D22
		jsr	sub_BC72(pc)
		move.l	#off_122282,$20(a0)
		bset	#2,$D(a0)
		jsr	sub_EA3C(pc)
		bne.s	loc_12CFC
		move.w	a1,$28(a0)
		move.w	#$27,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	a0,$3C(a0)
		move.w	a0,$3C(a1)

loc_12CFC:
		jmp	sub_B852

loc_12D02:
		tst.b	$2B(a0)
		bne.s	loc_12D16
		movea.w	$28(a0),a1
		cmpi.w	#$27,0.w(a1)
		bne.s	loc_12D16
		rts

loc_12D16:
		addq.w	#1,2(a0)
		move.b	#$A,$26(a0)
		rts

loc_12D22:
		subq.b	#1,$26(a0)
		bgt.s	locret_12D54
		moveq	#0,d1
		lea	(word_FF9000).w,a1
		moveq	#$2F,d7

loc_12D30:
		btst	#4,$36(a1)
		beq.s	loc_12D44
		cmpa.w	$3C(a1),a0
		bne.s	loc_12D44
		bset	#0,$C(a1)

loc_12D44:
		adda.w	#$40,a1
		dbf	d7,loc_12D30
		clr.w	2(a0)
		clr.b	$2B(a0)

locret_12D54:
		rts

sub_12D56:
		tst.w	2(a0)
		bne.w	loc_12E28
		bra.w	loc_12D90

loc_12D62:
		movea.w	$3C(a0),a1
		cmpa.w	$3C(a1),a1
		beq.s	loc_12D72
		bset	#0,$C(a0)

loc_12D72:
		movea.w	$3E(a0),a2
		cmpa.w	$3C(a2),a1
		beq.s	loc_12D88
		bset	#0,$39(a1)
		bset	#0,$C(a0)

loc_12D88:
		jsr	sub_B960(pc)
		jmp	loc_B97A(pc)

loc_12D90:
		jsr	sub_BC72(pc)
		move.l	#off_122282,$20(a0)
		bset	#1,$D(a0)
		bset	#4,$E(a0)
		move.w	$10(a0),$38(a0)
		move.w	$14(a0),$3A(a0)
		addi.w	#$3A,$14(a0)
		move.b	#7,$26(a0)
		move.w	#1,$28(a0)
		move.w	#$154,$2A(a0)
		move.w	a0,$3E(a0)
		moveq	#5,d6

loc_12DD2:
		jsr	sub_EA3C(pc)
		bne.s	loc_12E22
		move.w	#$26,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	$38(a0),$38(a1)
		move.w	$3A(a0),$3A(a1)
		subi.w	#$14,$14(a1)
		moveq	#5,d5
		sub.w	d6,d5

loc_12E00:
		beq.s	loc_12E0A
		subq.w	#6,$14(a1)
		subq.w	#1,d5
		bra.s	loc_12E00

loc_12E0A:
		move.b	d6,$36(a1)
		move.w	$3E(a0),$3E(a1)
		move.w	$3C(a0),$3C(a1)
		move.w	a1,$3E(a0)
		dbf	d6,loc_12DD2

loc_12E22:
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_12E28:
		subq.b	#1,$26(a0)
		bgt.s	loc_12E70
		moveq	#0,d0
		move.b	$27(a0),d0
		addq.b	#1,d0
		andi.b	#$F,d0
		move.b	d0,$27(a0)
		add.w	d0,d0
		add.w	d0,d0
		lea	(stru_12C7C).l,a1
		move.b	(a1,d0.w),$28(a0)
		move.b	1(a1,d0.w),$29(a0)
		move.b	3(a1,d0.w),$26(a0)
		move.b	2(a1,d0.w),d0
		moveq	#0,d1
		move.w	d0,d1
		add.w	d1,d1
		add.w	d1,d1
		add.w	d1,d1
		add.w	d1,d0
		add.w	d1,d0
		move.w	d0,$2A(a0)

loc_12E70:
		move.b	$28(a0),d1
		move.b	$29(a0),d2
		moveq	#0,d3
		move.w	$2A(a0),d3
		jsr	sub_EB3C(pc)
		move.l	d0,$18(a0)
		move.l	d1,$1C(a0)
		jsr	sub_B88A(pc)
		clr.b	$F(a0)
		jsr	sub_B9B8(pc)
		jsr	loc_BA02(pc)
		tst.b	$F(a0)
		beq.s	loc_12EA4
		move.w	a0,$30(a1)

loc_12EA4:
		jmp	loc_12D62(pc)

sub_12EA8:
		lea	(off_12EB2).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_12EB2:	dc.w sub_12EE6-off_12EB2
		dc.w sub_12F70-off_12EB2
		dc.w sub_12F9E-off_12EB2
		dc.w sub_12FF2-off_12EB2
		dc.w sub_1304E-off_12EB2
		dc.w sub_12F9E-off_12EB2
		dc.w sub_12FE4-off_12EB2
		dc.w sub_13040-off_12EB2
sub_12EC2:
		move.w	(player_pos_x).w,d0
		cmp.w	$10(a0),d0
		blt.s	loc_12ED8
		move.l	#$8000,$18(a0)
		jmp	sub_B872(pc)

loc_12ED8:
		move.l	#$FFFF8000,$18(a0)
		moveq	#3,d0
		jmp	loc_B842(pc)

sub_12EE6:
		jsr	sub_BC72(pc)
		move.l	#off_1221C8,$20(a0)
		bset	#2,$D(a0)
		move.l	#$FFFF0000,$1C(a0)
		btst	#0,$36(a0)
		bne.s	loc_12F3C
		move.l	#$8000,$18(a0)
		btst	#1,$36(a0)
		bne.s	loc_12F2A
		move.w	#$600,$28(a0)
		move.w	#$140,$26(a0)
		jmp	sub_B852

loc_12F2A:
		move.w	#$300,$28(a0)
		move.w	#$280,$26(a0)
		jmp	sub_B852

loc_12F3C:
		move.l	#$FFFF8000,$18(a0)
		btst	#1,$36(a0)
		bne.s	loc_12F5E
		move.w	#$600,$28(a0)
		move.w	#$140,$26(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

loc_12F5E:
		move.w	#$300,$28(a0)
		move.w	#$280,$26(a0)
		moveq	#1,d0
		jmp	sub_B83E(pc)

sub_12F70:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$80,d0
		bgt.s	locret_12F9C
		cmpi.w	#$FF80,d0
		blt.s	locret_12F9C
		addq.w	#1,2(a0)
		move.b	#$C4,d2
		jsr	sub_ED12(pc)
		bclr	#2,$D(a0)
		bset	#3,$D(a0)

locret_12F9C:
		rts

sub_12F9E:
		cmpi.w	#2,6(a0)
		blt.s	locret_12FBC
		cmpi.b	#7,8(a0)
		blt.s	locret_12FBC
		cmpi.w	#5,2(a0)
		bne.s	loc_12FBE
		bset	#0,$C(a0)

locret_12FBC:
		rts

loc_12FBE:
		bclr	#3,$D(a0)
		btst	#3,$36(a0)
		bne.s	loc_12FD6
		moveq	#2,d0
		add.w	4(a0),d0
		jmp	sub_B83E(pc)

loc_12FD6:
		addq.w	#4,2(a0)
		move.w	#$12C,$26(a0)
		bra.w	sub_12EC2

sub_12FE4:
		move.w	$26(a0),d0
		andi.w	#$F,d0
		bne.s	sub_12FF2
		bsr.w	sub_12EC2

sub_12FF2:
		btst	#2,$36(a0)
		bne.s	loc_13016
		subq.w	#1,$26(a0)
		bgt.s	loc_13016
		move.w	#5,2(a0)
		bset	#3,$D(a0)
		moveq	#2,d0
		add.w	4(a0),d0
		jmp	loc_B842(pc)

loc_13016:
		move.l	$1C(a0),d0
		moveq	#0,d1
		move.w	$28(a0),d1
		add.l	d1,d0
		cmpi.l	#$10000,d0
		ble.s	loc_13034
		move.l	#$10000,d0
		addq.w	#1,2(a0)

loc_13034:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		jmp	sub_B960(pc)

sub_13040:
		move.w	$26(a0),d0
		andi.w	#$F,d0
		bne.s	sub_1304E
		bsr.w	sub_12EC2

sub_1304E:
		btst	#2,$36(a0)
		bne.s	loc_13072
		subq.w	#1,$26(a0)
		bgt.s	loc_13072
		move.w	#5,2(a0)
		bset	#3,$D(a0)
		moveq	#2,d0
		add.w	4(a0),d0
		jmp	loc_B842(pc)

loc_13072:
		move.l	$1C(a0),d0
		moveq	#0,d1
		move.w	$28(a0),d1
		sub.l	d1,d0
		cmpi.l	#$FFFF0000,d0
		bge.s	loc_13090
		move.l	#$FFFF0000,d0
		subq.w	#1,2(a0)

loc_13090:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		jmp	sub_B960(pc)

sub_1309C:
		lea	(off_130A6).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_130A6:	dc.w sub_130B0-off_130A6
		dc.w sub_130FE-off_130A6
		dc.w sub_13126-off_130A6
		dc.w sub_13126-off_130A6
		dc.w locret_13142-off_130A6
sub_130B0:
		jsr	sub_BC72(pc)
		move.l	#off_1220D2,$20(a0)
		jsr	sub_B852
		jsr	sub_E9D8(pc)
		bne.s	locret_130FC
		move.w	#$23,0.w(a1)
		move.w	$10(a2),$10(a1)
		move.w	$14(a2),$14(a1)
		subi.w	#$D,$14(a1)
		move.w	a1,$2A(a2)
		move.w	a2,$2A(a1)
		move.w	#$C42C,$A(a1)
		move.l	#off_1220FC,$20(a1)
		move.w	$2E(a0),$2E(a1)

locret_130FC:
		rts

sub_130FE:
		btst	#0,$36(a0)
		beq.s	locret_13124
		addq.w	#1,2(a0)
		clr.b	$36(a0)
		move.l	#$8000,$18(a0)
		move.b	#$50,$26(a0)
		move.b	#$C3,d2
		jsr	sub_ED12(pc)

locret_13124:
		rts

sub_13126:
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		subq.b	#1,$26(a0)
		bgt.s	locret_13142
		addq.w	#1,2(a0)
		neg.l	$18(a0)
		move.b	#$50,$26(a0)

locret_13142:
		rts

sub_13144:
		lea	(off_1314E).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_1314E:	dc.w sub_13276-off_1314E
		dc.w sub_1329A-off_1314E
		dc.w sub_132C4-off_1314E
		dc.w sub_13342-off_1314E
		dc.w sub_13412-off_1314E
		dc.w sub_134E4-off_1314E
		dc.w sub_1350A-off_1314E
		dc.w sub_13542-off_1314E
		dc.w sub_13568-off_1314E
		dc.w sub_135A2-off_1314E
		dc.w sub_1360C-off_1314E
		dc.w sub_136B0-off_1314E
		dc.w sub_136CA-off_1314E
sub_13168:
		lea	(word_FF9000).w,a1
		move.w	#$A3,d3
		move.w	#$50,d4
		moveq	#$2F,d6

loc_13176:
		cmp.w	(a1),d3
		beq.s	loc_1317E
		cmp.w	(a1),d4
		bne.s	loc_13186

loc_1317E:
		jsr	sub_B948
		bne.s	loc_13192

loc_13186:
		lea	$40(a1),a1
		dbf	d6,loc_13176
		moveq	#0,d7
		rts

loc_13192:
		moveq	#1,d7
		rts

sub_13196:
		jsr	sub_B9B8(pc)
		beq.s	loc_131EE
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_131B0
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_131D6

loc_131B0:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.b	3(a0),$29(a0)
		move.b	#3,$2C(a0)
		move.w	#$B,2(a0)
		bset	#1,$D(a0)
		jmp	sub_B960(pc)

loc_131D6:
		jsr	sub_15CCC(pc)
		move.w	#$C,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		bset	#1,$D(a0)

loc_131EE:
		tst.w	$2A(a0)
		beq.s	loc_131FE
		movea.w	$2A(a0),a1
		cmpa.w	$2A(a1),a0
		beq.s	loc_13272

loc_131FE:
		jsr	sub_EA3C(pc)
		bne.s	loc_13272
		bclr	#1,$D(a0)
		move.w	#$24,0.w(a1)
		move.w	a0,$2A(a1)
		move.w	a1,$2A(a0)
		bset	#7,$C(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$23,$14(a1)
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		blt.s	loc_13256
		addq.w	#4,$10(a1)
		move.b	#4,$36(a1)
		move.l	#$A000,$18(a0)
		jsr	sub_B852
		jmp	sub_B960(pc)

loc_13256:
		addq.w	#4,$10(a1)
		move.b	#5,$36(a1)
		addq.w	#2,2(a0)
		move.l	#$FFFF6000,$18(a0)
		moveq	#1,d0
		jsr	loc_B842(pc)

loc_13272:
		jmp	sub_B960(pc)

sub_13276:
		jsr	sub_BC72(pc)
		move.l	#off_1220FC,$20(a0)
		moveq	#0,d0
		jsr	sub_CA8E(pc)
		btst	#0,$36(a0)
		bne.s	loc_13294
		jmp	sub_B85E(pc)

loc_13294:
		addq.w	#2,2(a0)
		bra.s	sub_132C4

sub_1329A:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$A0,d0
		bgt.s	locret_132C2
		cmpi.w	#$FF60,d0
		blt.s	locret_132C2
		addq.w	#1,2(a0)
		move.b	#$50,$26(a0)
		movea.w	$2A(a0),a1
		move.b	#1,$36(a1)

locret_132C2:
		rts

sub_132C4:
		subq.b	#1,$26(a0)
		bgt.s	locret_13340
		bset	#7,$C(a0)
		jsr	sub_EA3C(pc)
		bne.s	locret_13340
		move.w	#$24,0.w(a1)
		bset	#7,$C(a1)
		move.w	a0,$2A(a1)
		move.w	a1,$2A(a0)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$23,$14(a1)
		move.b	#$14,$26(a0)
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		blt.s	loc_13324
		addq.w	#4,$10(a1)
		move.b	#4,$36(a1)
		move.l	#$A000,$18(a0)
		jmp	sub_B852

loc_13324:
		addq.w	#4,$10(a1)
		move.b	#5,$36(a1)
		addq.w	#2,2(a0)
		move.l	#$FFFF6000,$18(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

locret_13340:
		rts

sub_13342:
		cmpi.b	#3,$28(a0)
		bgt.w	loc_133B2
		jsr	sub_B88A(pc)
		moveq	#0,d0
		jsr	sub_CA58(pc)
		bne.s	loc_13360
		jsr	sub_13168
		beq.s	loc_13372

loc_13360:
		addq.w	#6,2(a0)
		move.l	#$FFFC0000,$1C(a0)
		clr.l	$18(a0)
		rts

loc_13372:
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_13388
		addq.w	#7,2(a0)
		clr.l	$1C(a0)
		clr.l	$18(a0)
		rts

loc_13388:
		subq.b	#1,$26(a0)
		bgt.s	loc_133AE
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$50,d0
		bgt.s	loc_133AE
		tst.w	d0
		blt.s	loc_133BE
		addq.w	#2,2(a0)
		move.b	#$14,$26(a0)
		jmp	sub_B872(pc)

loc_133AE:
		bra.w	sub_13196

loc_133B2:
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_133DA

loc_133BE:
		addq.w	#1,2(a0)
		neg.l	$18(a0)
		movea.w	$2A(a0),a1
		addq.w	#8,$10(a1)
		move.b	#5,$36(a1)
		moveq	#1,d0
		jmp	loc_B842(pc)

loc_133DA:
		moveq	#0,d0
		jsr	sub_CA58(pc)
		beq.s	loc_133E8
		cmpi.w	#1,d7
		beq.s	loc_133BE

loc_133E8:
		subq.b	#1,$26(a0)
		bgt.s	loc_1340E
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$50,d0
		bgt.s	loc_1340E
		tst.w	d0
		blt.s	loc_1340E
		addq.w	#2,2(a0)
		move.b	#$14,$26(a0)
		jsr	sub_B872(pc)

loc_1340E:
		bra.w	sub_13196

sub_13412:
		cmpi.b	#3,$28(a0)
		bgt.w	loc_13484
		jsr	sub_B88A(pc)
		moveq	#1,d0
		jsr	sub_CA58(pc)
		bne.s	loc_13430
		jsr	sub_13168
		beq.s	loc_13442

loc_13430:
		addq.w	#5,2(a0)
		move.l	#$FFFC0000,$1C(a0)
		clr.l	$18(a0)
		rts

loc_13442:
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_13458
		addq.w	#6,2(a0)
		clr.l	$1C(a0)
		clr.l	$18(a0)
		rts

loc_13458:
		subq.b	#1,$26(a0)
		bgt.s	loc_13480
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$FFB0,d0
		blt.s	loc_13480
		tst.w	d0
		bgt.s	loc_13490
		addq.w	#3,2(a0)
		move.b	#$14,$26(a0)
		moveq	#3,d0
		jsr	loc_B842(pc)

loc_13480:
		bra.w	sub_13196

loc_13484:
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		bne.s	loc_134AA

loc_13490:
		subq.w	#1,2(a0)
		neg.l	$18(a0)
		movea.w	$2A(a0),a1
		subq.w	#8,$10(a1)
		move.b	#4,$36(a1)
		jmp	sub_B86E(pc)

loc_134AA:
		moveq	#1,d0
		jsr	sub_CA58(pc)
		beq.s	loc_134B8
		cmpi.w	#1,d7
		beq.s	loc_13490

loc_134B8:
		subq.b	#1,$26(a0)
		bgt.s	loc_134E0
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$FFB0,d0
		blt.s	loc_134E0
		tst.w	d0
		bgt.s	loc_134E0
		addq.w	#3,2(a0)
		move.b	#$14,$26(a0)
		moveq	#3,d0
		jmp	loc_B842(pc)

loc_134E0:
		bra.w	sub_13196

sub_134E4:
		subq.b	#1,$26(a0)
		bgt.s	loc_13506
		addq.w	#1,2(a0)
		bset	#1,$D(a0)
		movea.w	$2A(a0),a1
		move.b	#2,$36(a1)
		move.l	#$30000,$18(a1)

loc_13506:
		bra.w	sub_13196

sub_1350A:
		movea.w	$2A(a0),a1
		cmpi.w	#1,2(a1)
		beq.s	loc_13520
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		bgt.s	loc_1353E

loc_13520:
		addq.b	#1,$28(a0)
		move.w	#1,2(a1)
		bset	#0,$C(a1)
		bclr	#1,$D(a0)
		subq.w	#4,2(a0)
		jmp	sub_B86E(pc)

loc_1353E:
		bra.w	sub_13196

sub_13542:
		subq.b	#1,$26(a0)
		bgt.s	loc_13564
		addq.w	#1,2(a0)
		bset	#1,$D(a0)
		movea.w	$2A(a0),a1
		move.b	#3,$36(a1)
		move.l	#$FFFD0000,$18(a1)

loc_13564:
		bra.w	sub_13196

sub_13568:
		movea.w	$2A(a0),a1
		cmpi.w	#1,2(a1)
		beq.s	loc_1357E
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		blt.s	loc_1359E

loc_1357E:
		addq.b	#1,$28(a0)
		move.w	#1,2(a1)
		bset	#0,$C(a1)
		bclr	#1,$D(a0)
		subq.w	#6,2(a0)
		moveq	#1,d0
		jmp	loc_B842(pc)

loc_1359E:
		bra.w	sub_13196

sub_135A2:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		move.l	d0,$1C(a0)
		ble.s	loc_135B8
		addq.w	#1,2(a0)
		rts

loc_135B8:
		btst	#0,5(a0)
		bne.s	loc_135D8
		moveq	#0,d0
		jsr	sub_CA58(pc)
		bne.s	loc_135F0
		jsr	sub_13168(pc)
		bne.s	loc_135F0
		move.l	#$A000,$18(a0)
		bra.s	loc_135F4

loc_135D8:
		moveq	#1,d0
		jsr	sub_CA58(pc)
		bne.s	loc_135F0
		jsr	sub_13168(pc)
		bne.s	loc_135F0
		move.l	#$FFFF6000,$18(a0)
		bra.s	loc_135F4

loc_135F0:
		clr.l	$18(a0)

loc_135F4:
		jsr	sub_B88A(pc)
		moveq	#2,d0
		jsr	sub_CA58(pc)
		beq.s	loc_13608
		clr.l	$1C(a0)
		addq.w	#1,2(a0)

loc_13608:
		bra.w	sub_13196

sub_1360C:
		move.l	$1C(a0),d0
		addi.l	#$1C00,d0
		cmpi.l	#$40000,d0
		ble.s	loc_13624
		move.l	#$40000,d0

loc_13624:
		move.l	d0,$1C(a0)
		jsr	sub_B88A(pc)
		moveq	#3,d0
		jsr	sub_CA58(pc)
		beq.s	loc_136AC
		bclr	#0,$C(a0)
		andi.w	#$FFF0,$14(a0)
		clr.l	$1C(a0)
		btst	#0,5(a0)
		beq.s	loc_1367C
		moveq	#1,d0
		jsr	sub_CA58(pc)
		bne.s	loc_1368A
		jsr	sub_13168(pc)
		bne.s	loc_1368A

loc_1365A:
		move.l	#$FFFF0000,$18(a0)
		subq.w	#6,2(a0)
		move.b	#$1E,$26(a0)
		movea.w	$2A(a0),a1
		bset	#0,$36(a1)
		moveq	#1,d0
		jmp	loc_B842(pc)

loc_1367C:
		moveq	#0,d0
		jsr	sub_CA58(pc)
		bne.s	loc_1365A
		jsr	sub_13168(pc)
		bne.s	loc_1365A

loc_1368A:
		move.l	#$10000,$18(a0)
		subq.w	#7,2(a0)
		move.b	#$1E,$26(a0)
		movea.w	$2A(a0),a1
		bclr	#0,$36(a1)
		jmp	sub_B86E

loc_136AC:
		bra.w	sub_13196

sub_136B0:
		jsr	sub_15C24(pc)
		bne.w	locret_136C8
		move.b	$29(a0),3(a0)
		bclr	#1,$D(a0)
		bra.w	sub_13196

locret_136C8:
		rts

sub_136CA:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_136D4:
		lea	(off_136DE).l,a1
		jmp	jump_by_table1(pc) ; a0	= ?

off_136DE:	dc.w sub_136E8-off_136DE
		dc.w sub_1370C-off_136DE
		dc.w sub_13776-off_136DE
		dc.w sub_137A4-off_136DE
		dc.w sub_137F2-off_136DE
sub_136E8:
		jsr	sub_BC72(pc)
		move.l	#off_1220FC,$20(a0)
		bset	#1,$D(a0)
		moveq	#2,d0
		jsr	sub_CA8E
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	sub_B83E(pc)

sub_1370C:
		btst	#1,$36(a0)
		beq.s	loc_13720
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)
		rts

loc_13720:
		btst	#0,$36(a0)
		bne.s	loc_1372E
		jsr	sub_B876(pc)
		bra.s	loc_13734

loc_1372E:
		moveq	#5,d0
		jsr	loc_B842(pc)

loc_13734:
		movea.w	$2A(a0),a1
		cmpa.w	$2A(a1),a0
		beq.s	loc_13744
		bset	#0,$C(a0)

loc_13744:
		move.w	$10(a1),$10(a0)
		move.w	$14(a1),$14(a0)
		move.w	$2C(a1),$2C(a0)
		subi.w	#$23,$14(a0)
		move.b	#$28,$26(a0)
		btst	#0,5(a0)
		beq.s	loc_13770
		subq.w	#4,$10(a0)
		rts

loc_13770:
		addq.w	#4,$10(a0)
		rts

sub_13776:
		jsr	sub_B88A(pc)
		bsr.w	sub_13844
		bgt.s	loc_13790
		blt.s	loc_1379A
		subq.b	#1,$26(a0)
		bgt.s	loc_137A0
		btst	#0,$36(a0)
		bne.s	loc_1379A

loc_13790:
		move.w	#3,2(a0)
		jmp	sub_B960(pc)

loc_1379A:
		move.w	#4,2(a0)

loc_137A0:
		jmp	sub_B960(pc)

sub_137A4:
		move.l	$18(a0),d0
		subi.l	#$2000,d0
		cmpi.l	#$FFFD0000,d0
		bgt.s	loc_137BC
		move.l	#$FFFD0000,d0

loc_137BC:
		add.l	d0,$10(a0)
		move.l	d0,$18(a0)
		bsr.w	sub_13844
		bgt.s	loc_13790
		blt.s	loc_1379A
		movea.w	$2A(a0),a1
		cmpi.w	#$B,2(a1)
		bne.s	loc_137EE
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		blt.s	loc_137EE
		move.w	#1,2(a0)
		bclr	#1,$36(a0)

loc_137EE:
		jmp	sub_B960(pc)

sub_137F2:
		move.l	$18(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$30000,d0
		blt.s	loc_1380A
		move.l	#$30000,d0

loc_1380A:
		add.l	d0,$10(a0)
		move.l	d0,$18(a0)
		bsr.w	sub_13844
		bgt.w	loc_13790
		blt.w	loc_1379A
		movea.w	$2A(a0),a1
		cmpi.w	#$B,2(a1)
		bne.s	loc_13840
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		bgt.s	loc_13840
		move.w	#1,2(a0)
		bclr	#1,$36(a0)

loc_13840:
		jmp	sub_B960(pc)

sub_13844:
		btst	#0,$36(a0)
		bne.s	loc_13870
		moveq	#0,d0
		jsr	sub_CA58(pc)
		beq.s	locret_13892
		movea.w	$2A(a0),a1
		cmpa.w	$2A(a1),a0
		beq.s	loc_13866
		bset	#0,$C(a0)
		rts

loc_13866:
		clr.l	$18(a0)
		move.w	#1,d7
		rts

loc_13870:
		moveq	#1,d0
		jsr	sub_CA58(pc)
		beq.s	locret_13892
		movea.w	$2A(a0),a1
		cmpa.w	$2A(a1),a0
		beq.s	loc_1388A
		bset	#0,$C(a0)
		rts

loc_1388A:
		clr.l	$18(a0)
		move.w	#$FFFF,d7

locret_13892:
		rts

sub_13894:
		tst.w	2(a0)
		bne.s	locret_138B0
		jsr	sub_BC72(pc)
		move.l	#off_1220A4,$20(a0)
		addq.w	#4,$10(a0)
		jmp	sub_B852

locret_138B0:
		rts

sub_138B2:
		lea	(off_138BE).l,a1
		jmp	jump_by_table1	; a0 = ?

off_138BE:	dc.w sub_138C6-off_138BE
		dc.w sub_138F8-off_138BE
		dc.w sub_1390A-off_138BE
		dc.w sub_13958-off_138BE
sub_138C6:
		jsr	sub_BC72
		move.l	#off_121888,$20(a0)
		subi.w	#$20,$14(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		move.w	$14(a0),$2A(a0)
		moveq	#3,d0
		add.b	$36(a0),d0
		jmp	sub_B83E

sub_138F8:
		bclr	#6,$E(a0)
		beq.s	locret_13908
		addq.w	#1,2(a0)
		clr.b	$26(a0)

locret_13908:
		rts

sub_1390A:
		moveq	#0,d0
		move.b	$26(a0),d0
		addq.b	#1,d0
		cmpi.b	#$1C,d0
		blt.s	loc_1391A
		clr.b	d0

loc_1391A:
		move.b	d0,$26(a0)
		bclr	#6,$E(a0)
		beq.s	loc_1393E
		lsr.b	#1,d0
		lea	(byte_1394A).l,a1
		move.b	(a1,d0.w),d0
		ext.w	d0
		add.w	d0,$14(a0)
		add.w	d0,(player_pos_y).w
		rts

loc_1393E:
		move.w	$2A(a0),$14(a0)
		addq.w	#1,2(a0)
		rts

byte_1394A:	dc.b 1,	0, 0, 1, 0, 0, 0, $FF, 0, 0, $FF, 0, 0,	0
sub_13958:
		moveq	#0,d0
		move.b	$26(a0),d0
		addq.b	#1,d0
		cmpi.b	#$1C,d0
		blt.s	loc_13974
		clr.b	d0
		subq.w	#2,2(a0)
		move.w	$2A(a0),$14(a0)
		rts

loc_13974:
		move.b	d0,$26(a0)
		lsr.b	#1,d0
		lea	(byte_1394A).l,a1
		move.b	(a1,d0.w),d0
		ext.w	d0
		add.w	d0,$14(a0)
		add.w	d0,(player_pos_y).w
		rts

sub_13990:
		moveq	#0,d0
		move.b	$36(a0),d0
		add.w	d0,d0
		move.w	off_139A0(pc,d0.w),d0
		jmp	off_139A0(pc,d0.w)

off_139A0:	dc.w sub_139A8-off_139A0
		dc.w sub_139A8-off_139A0
		dc.w sub_13B76-off_139A0
		dc.w sub_13B32-off_139A0
sub_139A8:
		lea	(off_139B4).l,a1
		jmp	jump_by_table1	; a0 = ?

off_139B4:	dc.w sub_139BC-off_139B4
		dc.w sub_13A60-off_139B4
		dc.w sub_13AA6-off_139B4
		dc.w sub_13AEC-off_139B4
sub_139BC:
		jsr	sub_BC72
		move.l	#off_11A3F6,$20(a0)
		cmpi.w	#$3B,0.w(a0)
		bne.s	loc_139DA
		move.l	#off_121888,$20(a0)

loc_139DA:
		subi.w	#$40,$14(a0)
		tst.b	$36(a0)
		beq.s	loc_139EC
		subi.w	#$80,$14(a0)

loc_139EC:
		bset	#1,$D(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		bset	#1,$E(a0)
		jsr	sub_EA34(pc)
		bne.s	loc_13A30
		move.w	0.w(a0),0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		addi.w	#$80,$14(a1)
		move.b	#3,$36(a1)
		move.w	a1,$2A(a0)
		move.w	a0,$2A(a1)

loc_13A30:
		moveq	#1,d0
		jsr	sub_B83E
		jsr	sub_EA34(pc)
		bne.s	locret_13A5E
		movea.l	a1,a2
		movea.l	a0,a1
		jsr	copy_bytes_to_dest_64 ;	a1 = source
		suba.w	#$40,a2
		movea.w	$2A(a2),a1
		move.w	a2,$2A(a1)
		moveq	#0,d1
		movea.l	a0,a1
		jmp	fill_ram_64_bytes ; d1 = dword

locret_13A5E:
		rts

sub_13A60:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$60,d0
		bgt.s	loc_13A98
		cmpi.w	#$FFA0,d0
		blt.s	loc_13A98
		addq.w	#1,2(a0)
		movea.w	$2A(a0),a1
		move.w	#$100,$26(a0)
		move.l	#$FFFF8000,$1C(a0)
		tst.b	$36(a0)
		beq.s	loc_13A98
		move.l	#$8000,$1C(a0)

loc_13A98:
		jsr	sub_15C9A(pc)
		beq.s	loc_13AA2
		move.l	d1,(dword_FFEF5C).w

loc_13AA2:
		bra.w	sub_15C5A

sub_13AA6:
		movea.w	$2A(a0),a1
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		add.l	d0,$14(a1)
		neg.b	$2C(a0)
		neg.b	$2C(a1)
		bclr	#6,$E(a0)
		beq.s	loc_13ACA
		add.l	d0,(dword_FFEF60).w

loc_13ACA:
		subq.w	#1,$26(a0)
		bne.s	loc_13ADE
		addq.w	#1,2(a0)
		neg.l	$1C(a0)
		move.w	#$100,$26(a0)

loc_13ADE:
		jsr	sub_15C9A(pc)
		beq.s	loc_13AE8
		move.l	d1,(dword_FFEF5C).w

loc_13AE8:
		bra.w	sub_15C5A

sub_13AEC:
		movea.w	$2A(a0),a1
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		add.l	d0,$14(a1)
		neg.b	$2C(a0)
		neg.b	$2C(a1)
		bclr	#6,$E(a0)
		beq.s	loc_13B10
		add.l	d0,(dword_FFEF60).w

loc_13B10:
		subq.w	#1,$26(a0)
		bne.s	loc_13B24
		subq.w	#1,2(a0)
		neg.l	$1C(a0)
		move.w	#$100,$26(a0)

loc_13B24:
		jsr	sub_15C9A(pc)
		beq.s	loc_13B2E
		move.l	d1,(dword_FFEF5C).w

loc_13B2E:
		bra.w	sub_15C5A

sub_13B32:
		tst.w	2(a0)
		bne.s	loc_13B68
		jsr	sub_BC72
		move.l	#off_11A3F6,$20(a0)
		cmpi.w	#$3B,0.w(a0)
		bne.s	loc_13B56
		move.l	#off_121888,$20(a0)

loc_13B56:
		bset	#1,$D(a0)
		bset	#1,$E(a0)
		jmp	sub_B856

loc_13B68:
		jsr	sub_15C9A(pc)
		beq.s	loc_13B72
		move.l	d1,(dword_FFEF5C).w

loc_13B72:
		bra.w	sub_15C5A

sub_13B76:
		lea	(off_13B82).l,a1
		jmp	jump_by_table1	; a0 = ?

off_13B82:	dc.w sub_13B8A-off_13B82
		dc.w sub_13BB6-off_13B82
		dc.w sub_13BE2-off_13B82
		dc.w sub_13C4A-off_13B82
sub_13B8A:
		jsr	sub_BC72
		move.l	#off_11A3F6,$20(a0)
		subi.w	#$40,$14(a0)
		move.w	$10(a0),$2A(a0)
		bset	#1,$D(a0)
		bset	#7,$E(a0)
		jmp	sub_B852

sub_13BB6:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$A0,d0
		bgt.s	locret_13BE0
		cmpi.w	#$FF60,d0
		blt.s	locret_13BE0
		addq.w	#1,2(a0)
		move.l	#$FFFF4000,$18(a0)
		move.w	#$80,$26(a0)
		clr.w	$28(a0)

locret_13BE0:
		rts

sub_13BE2:
		move.w	$10(a0),d0
		sub.w	(planea_start_x).w,d0
		cmpi.w	#$FFC0,d0
		ble.s	loc_13C22
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		bclr	#6,$E(a0)
		beq.s	loc_13C26
		movem.l	a0,-(sp)
		lea	(word_FFA2C0).w,a0
		moveq	#0,d1
		move.w	#$FFF2,d2
		jsr	(sub_756C).l
		movem.l	(sp)+,a0
		bge.s	loc_13C1C
		clr.l	d0

loc_13C1C:
		add.l	d0,(dword_FFEF5C).w
		bra.s	loc_13C26

loc_13C22:
		addq.w	#1,$28(a0)

loc_13C26:
		subq.w	#1,$26(a0)
		bgt.s	locret_13C48
		addq.w	#1,2(a0)
		move.l	#$C000,$18(a0)
		move.w	#$100,d0
		sub.w	$28(a0),d0
		clr.w	$28(a0)
		move.w	d0,$26(a0)

locret_13C48:
		rts

sub_13C4A:
		move.w	$10(a0),d0
		sub.w	(planea_start_x).w,d0
		cmpi.w	#$180,d0
		bge.s	loc_13C8A
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		bclr	#6,$E(a0)
		beq.s	loc_13C8E
		movem.l	a0,-(sp)
		lea	(word_FFA2C0).w,a0
		moveq	#0,d1
		move.w	#$E,d2
		jsr	(sub_756C).l
		movem.l	(sp)+,a0
		bge.s	loc_13C84
		clr.l	d0

loc_13C84:
		add.l	d0,(dword_FFEF5C).w
		bra.s	loc_13C8E

loc_13C8A:
		addq.w	#1,$28(a0)

loc_13C8E:
		subq.w	#1,$26(a0)
		bgt.s	locret_13CB0
		subq.w	#1,2(a0)
		move.l	#$FFFF4000,$18(a0)
		move.w	#$100,d0
		sub.w	$28(a0),d0
		clr.w	$28(a0)
		move.w	d0,$26(a0)

locret_13CB0:
		rts

nullsub_8:
		rts

sub_13CB4:
		lea	(off_13CC0).l,a1
		jmp	jump_by_table1	; a0 = ?

off_13CC0:	dc.w sub_13CC8-off_13CC0
		dc.w sub_13CDC-off_13CC0
		dc.w sub_13D02-off_13CC0
		dc.w sub_13D44-off_13CC0
sub_13CC8:
		jsr	sub_BC72
		move.l	#off_11A4E0,$20(a0)
		jmp	sub_B852

sub_13CDC:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#8,d0
		bgt.s	locret_13D00
		cmpi.w	#$FFF8,d0
		blt.s	locret_13D00
		tst.w	(dword_FFA2D8).w
		ble.s	locret_13D00
		addq.w	#1,2(a0)
		move.b	#$15,$26(a0)

locret_13D00:
		rts

sub_13D02:
		subq.b	#1,$26(a0)
		bne.s	locret_13D42
		jsr	sub_EA3C(pc)
		bne.s	loc_13D38
		move.w	#$1F,0.w(a1)
		move.w	$A(a0),$A(a1)
		move.l	$20(a0),$20(a1)
		move.w	$10(a0),$10(a1)
		addi.w	#$10,$10(a1)
		move.w	$14(a0),$14(a1)
		move.b	#$B,$28(a1)

loc_13D38:
		addq.w	#1,2(a0)
		move.b	#$A,$26(a0)

locret_13D42:
		rts

sub_13D44:
		subq.b	#1,$26(a0)
		bne.s	locret_13D4E
		subq.w	#2,2(a0)

locret_13D4E:
		rts

sub_13D50:
		cmpi.w	#1,2(a0)
		beq.s	loc_13D88
		bgt.w	loc_13DDE
		jsr	sub_BC72
		move.l	#off_11A4E0,$20(a0)
		bset	#1,$D(a0)
		bset	#2,$D(a0)
		move.b	#$A,$26(a0)
		addq.w	#8,$14(a0)
		moveq	#1,d0
		jmp	sub_B83E

loc_13D88:
		subq.b	#1,$26(a0)
		bne.s	locret_13DDC
		addq.w	#1,2(a0)
		move.b	#$18,$26(a0)
		bclr	#1,$D(a0)
		bclr	#2,$D(a0)
		tst.b	$28(a0)
		beq.s	locret_13DDC
		move.b	#$C0,(smps_cmd2).w
		jsr	sub_EA3C(pc)
		bne.s	locret_13DDC
		move.w	#$1F,0.w(a1)
		move.w	$10(a0),$10(a1)
		addi.w	#$10,$10(a1)
		move.w	$14(a0),$14(a1)
		subq.w	#8,$14(a1)
		move.b	$28(a0),$28(a1)
		subq.b	#1,$28(a1)

locret_13DDC:
		rts

loc_13DDE:
		subq.b	#1,$26(a0)
		bne.s	loc_13DEA
		bset	#0,$C(a0)

loc_13DEA:
		jmp	sub_B960

sub_13DF0:
		tst.w	2(a0)
		bne.s	locret_13E28
		jsr	sub_BC72
		move.l	#off_11A4CE,$20(a0)
		subi.w	#$10,$14(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		bset	#4,$E(a0)
		bset	#4,$C(a0)
		jmp	sub_B852

locret_13E28:
		rts

sub_13E2A:
		lea	(off_13E36).l,a1
		jmp	jump_by_table1	; a0 = ?

off_13E36:	dc.w sub_13E90-off_13E36
		dc.w sub_13F00-off_13E36
		dc.w sub_13F1A-off_13E36
		dc.w sub_13F32-off_13E36
		dc.w sub_13F46-off_13E36
		dc.w sub_13F66-off_13E36
		dc.w sub_13F8A-off_13E36
sub_13E44:
		jsr	sub_B9B8
		beq.s	loc_13E7C
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_13E60
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_13E8C

loc_13E60:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.b	3(a0),$29(a0)
		move.w	#6,2(a0)

loc_13E7C:
		cmpi.w	#1,2(a0)
		beq.s	locret_13E8A
		jmp	sub_B960

locret_13E8A:
		rts

loc_13E8C:
		bra.s	loc_13E60

nullsub_14:
		rts

sub_13E90:
		jsr	sub_BC72
		move.l	#off_11A5A8,$20(a0)
		addi.w	#$15,$14(a0)
		move.b	#1,$39(a0)
		bset	#1,$D(a0)
		move.b	#$1E,d1
		moveq	#0,d0
		move.b	$36(a0),d0
		lsl.b	d0,d1
		move.b	d1,$28(a0)
		move.b	d1,$26(a0)

loc_13EC4:
		clr.w	$2A(a0)
		jsr	sub_EA3C(pc)
		bne.s	loc_13EFA
		move.w	a1,$2A(a0)
		move.w	#$13,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$25,$14(a1)
		move.w	a0,$2A(a1)
		move.w	$14(a0),$28(a1)
		subi.w	#$35,$28(a1)

loc_13EFA:
		jmp	sub_B852

sub_13F00:
		subq.b	#1,$26(a0)
		bne.s	loc_13F10
		addq.w	#1,2(a0)
		move.b	#$15,$26(a0)

loc_13F10:
		jmp	sub_B960
sub_13F16:
		bra.w	sub_13E44

sub_13F1A:
		subq.w	#1,$14(a0)
		subq.b	#1,$26(a0)
		bne.s	loc_13F2E
		addq.w	#1,2(a0)
		move.b	#$A,$26(a0)

loc_13F2E:
		bra.w	sub_13E44

sub_13F32:
		subq.b	#1,$26(a0)
		bne.s	loc_13F42
		addq.w	#1,2(a0)
		move.w	#1,6(a0)

loc_13F42:
		bra.w	sub_13E44

sub_13F46:
		movea.w	$2A(a0),a1
		tst.b	$27(a1)
		beq.s	loc_13F62
		clr.b	$27(a1)
		clr.w	6(a0)
		addq.w	#1,2(a0)
		move.b	#$15,$26(a0)

loc_13F62:
		bra.w	sub_13E44

sub_13F66:
		addq.w	#1,$14(a0)
		subq.b	#1,$26(a0)
		bne.s	loc_13F86
		subq.w	#5,2(a0)
		move.b	$28(a0),$26(a0)
		tst.w	$2A(a0)
		beq.w	loc_13EC4
		addq.w	#1,2(a0)

loc_13F86:
		bra.w	sub_13E44

sub_13F8A:
		movea.w	$2A(a0),a1
		tst.b	$27(a1)
		beq.s	loc_13F98
		clr.b	$27(a1)

loc_13F98:
		subq.b	#1,$27(a0)
		btst	#0,$27(a0)
		bne.s	loc_13FB0
		btst	#1,$27(a0)
		bne.s	loc_13FB0
		neg.b	$2C(a0)

loc_13FB0:
		tst.b	$27(a0)
		bne.w	locret_13FDA
		move.b	$29(a0),3(a0)
		clr.b	$2C(a0)
		cmpi.w	#4,2(a0)
		bne.s	locret_13FDA
		move.w	#5,2(a0)
		clr.w	6(a0)
		move.b	#$15,$26(a0)

locret_13FDA:
		rts

sub_13FDC:
		lea	(off_13FE8).l,a1
		jmp	jump_by_table1	; a0 = ?

off_13FE8:	dc.w sub_13FF0-off_13FE8
		dc.w sub_14020-off_13FE8
		dc.w sub_1407E-off_13FE8
		dc.w sub_140CA-off_13FE8
sub_13FF0:
		jsr	sub_BC72
		move.l	#off_11A5A8,$20(a0)
		bset	#1,$D(a0)
		subi.w	#$10,$14(a0)
		bset	#7,$E(a0)
		bset	#5,$E(a0)
		move.w	#1,d0
		jmp	sub_B83E

sub_14020:
		movea.w	$2A(a0),a1
		cmpi.w	#$12,0.w(a1)
		beq.s	loc_14034
		bset	#0,$C(a0)
		rts

loc_14034:
		move.w	$14(a1),$14(a0)
		subi.w	#$24,$14(a0)
		movea.w	$2A(a0),a1
		cmpi.w	#6,2(a1)
		beq.s	loc_1406E
		cmpi.w	#0,6(a1)
		beq.s	loc_1406E
		subi.w	#$B,$14(a0)
		addq.w	#1,2(a0)
		move.b	#$B9,d2
		jsr	sub_ED12(pc)
		move.l	#$FFFC0000,$1C(a0)

loc_1406E:
		bclr	#6,$E(a0)
		beq.s	locret_1407C
		move.w	$14(a0),(player_pos_y).w

locret_1407C:
		rts

sub_1407E:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$40000,d0
		ble.s	loc_14096
		move.l	#$40000,d0

loc_14096:
		move.l	d0,$1C(a0)
		bclr	#6,$E(a0)
		beq.s	loc_140A6
		add.l	d0,(player_pos_y).w

loc_140A6:
		jsr	sub_B88A
		move.w	$28(a0),d0
		cmp.w	$14(a0),d0
		bgt.s	locret_140C8
		move.b	#1,$27(a0)
		subq.w	#1,2(a0)
		move.b	#$BA,d2
		jsr	sub_ED12(pc)

locret_140C8:
		rts

sub_140CA:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$40000,d0
		ble.s	loc_140E2
		move.l	#$40000,d0

loc_140E2:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		jsr	sub_E9A8(pc)
		beq.s	locret_14100
		bset	#0,$C(a0)
		movea.w	$2A(a0),a1
		clr.w	$2A(a1)

locret_14100:
		rts

sub_14102:
		moveq	#0,d0
		move.b	$36(a0),d0
		add.w	d0,d0
		move.w	off_14112(pc,d0.w),d0
		jmp	off_14112(pc,d0.w)

off_14112:	dc.w sub_1411A-off_14112
		dc.w sub_14264-off_14112
		dc.w sub_143DE-off_14112
		dc.w sub_14568-off_14112
sub_1411A:
		lea	(off_14126).l,a1
		jmp	jump_by_table1	; a0 = ?

off_14126:	dc.w sub_1416C-off_14126
		dc.w sub_1419A-off_14126
		dc.w sub_141B6-off_14126
		dc.w sub_141FC-off_14126
		dc.w sub_14218-off_14126
		dc.w sub_1423E-off_14126
		dc.w sub_14254-off_14126
sub_14134:
		jsr	sub_B9B8
		beq.s	loc_1415C
		move.w	a0,$30(a1)
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.w	2(a0),$28(a0)
		move.b	#3,$2C(a0)
		move.w	#6,2(a0)

loc_1415C:
		cmpi.w	#1,2(a0)
		beq.s	locret_1416A
		jmp	sub_B960

locret_1416A:
		rts

sub_1416C:
		jsr	sub_BC72
		move.l	#off_11A536,$20(a0)
		subi.w	#$20,$14(a0)
		bset	#1,$D(a0)
		move.w	$14(a0),$2A(a0)
		moveq	#6,d0
		jsr	sub_CA8E
		jmp	sub_B852

sub_1419A:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$60,d0
		bgt.s	loc_141B2
		cmpi.w	#$FFA0,d0
		blt.s	loc_141B2
		addq.w	#1,2(a0)

loc_141B2:
		bra.w	sub_14134

sub_141B6:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$40000,d0
		ble.s	loc_141CE
		move.l	#$40000,d0

loc_141CE:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		moveq	#3,d0
		jsr	sub_CA58
		beq.s	loc_141F8
		andi.w	#$FFF0,$14(a0)
		move.w	#0,6(a0)
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)

loc_141F8:
		bra.w	sub_14134

sub_141FC:
		subq.b	#1,$26(a0)
		bne.s	loc_14214
		move.l	#$FFFE0000,$1C(a0)
		move.w	#1,6(a0)
		addq.w	#1,2(a0)

loc_14214:
		bra.w	sub_14134

sub_14218:
		jsr	sub_B88A
		move.w	$2A(a0),d0
		cmp.w	$14(a0),d0
		blt.s	loc_1423A
		move.w	d0,$14(a0)
		addq.w	#1,2(a0)
		clr.l	$1C(a0)
		move.b	#$3C,$26(a0)

loc_1423A:
		bra.w	sub_14134

sub_1423E:
		subq.b	#1,$26(a0)
		bne.s	loc_14250
		move.l	#$20000,$1C(a0)
		subq.w	#4,2(a0)

loc_14250:
		bra.w	sub_14134

sub_14254:
		jsr	sub_15C24(pc)
		bne.w	locret_14262
		move.w	$28(a0),2(a0)

locret_14262:
		rts

sub_14264:
		lea	(off_14270).l,a1
		jmp	jump_by_table1	; a0 = ?

off_14270:	dc.w sub_142B4-off_14270
		dc.w sub_142F0-off_14270
		dc.w sub_14348-off_14270
		dc.w sub_1435C-off_14270
		dc.w sub_143BA-off_14270
		dc.w sub_143CE-off_14270
sub_1427C:
		jsr	sub_B9B8
		beq.s	loc_142A4
		move.w	a0,$30(a1)
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.w	2(a0),$28(a0)
		move.b	#3,$2C(a0)
		move.w	#5,2(a0)

loc_142A4:
		cmpi.w	#5,2(a0)
		beq.s	locret_142B2
		jmp	sub_B960

locret_142B2:
		rts

sub_142B4:
		jsr	sub_BC72
		move.l	#off_11A536,$20(a0)
		subi.w	#$20,$14(a0)
		bset	#1,$D(a0)
		move.w	$10(a0),$2A(a0)
		move.w	#$FFFD,$1C(a0)
		move.l	#$10000,$18(a0)
		moveq	#6,d0
		jsr	sub_CA8E
		jmp	sub_B852

sub_142F0:
		move.l	$1C(a0),d0
		addi.l	#$1800,d0
		cmpi.l	#$30000,d0
		ble.s	loc_14308
		move.l	#$30000,d0

loc_14308:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		moveq	#3,d0
		jsr	sub_CA58
		beq.s	loc_14344
		andi.w	#$FFF0,$14(a0)
		move.w	#0,6(a0)
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)
		andi.w	#$FFF0,$14(a0)
		move.l	#$FFFD0000,$1C(a0)
		neg.l	$18(a0)

loc_14344:
		bra.w	sub_1427C

sub_14348:
		subq.b	#1,$26(a0)
		bne.s	loc_14358
		move.w	#1,6(a0)
		addq.w	#1,2(a0)

loc_14358:
		bra.w	sub_1427C

sub_1435C:
		move.l	$1C(a0),d0
		addi.l	#$1800,d0
		cmpi.l	#$30000,d0
		ble.s	loc_14374
		move.l	#$30000,d0

loc_14374:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		moveq	#3,d0
		jsr	sub_CA58
		beq.s	loc_143B6
		andi.w	#$FFF0,$14(a0)
		move.w	$2A(a0),$10(a0)
		move.w	#0,6(a0)
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)
		andi.w	#$FFF0,$14(a0)
		move.l	#$FFFD0000,$1C(a0)
		neg.l	$18(a0)

loc_143B6:
		bra.w	sub_1427C

sub_143BA:
		subq.b	#1,$26(a0)
		bne.s	loc_143CA
		move.w	#1,6(a0)
		subq.w	#3,2(a0)

loc_143CA:
		bra.w	sub_1427C

sub_143CE:
		jsr	sub_15C24(pc)
		bne.w	locret_143DC
		move.w	$28(a0),2(a0)

locret_143DC:
		rts

sub_143DE:
		lea	(off_143EA).l,a1
		jmp	jump_by_table1	; a0 = ?

off_143EA:	dc.w sub_1442E-off_143EA
		dc.w sub_14466-off_143EA
		dc.w sub_144C8-off_143EA
		dc.w sub_144DC-off_143EA
		dc.w sub_14544-off_143EA
		dc.w sub_14558-off_143EA
sub_143F6:
		jsr	sub_B9B8
		beq.s	loc_1441E
		move.w	a0,$30(a1)
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.w	2(a0),$28(a0)
		move.b	#3,$2C(a0)
		move.w	#5,2(a0)

loc_1441E:
		cmpi.w	#5,2(a0)
		beq.s	locret_1442C
		jmp	sub_B960

locret_1442C:
		rts

sub_1442E:
		jsr	sub_BC72
		move.l	#off_11A536,$20(a0)
		bset	#1,$D(a0)
		move.w	$10(a0),$2A(a0)
		move.w	#3,$1C(a0)
		move.l	#$10000,$18(a0)
		moveq	#6,d0
		jsr	sub_CA8E
		moveq	#1,d0
		jmp	sub_B83E

sub_14466:
		move.l	$1C(a0),d0
		subi.l	#$1800,d0
		cmpi.l	#$FFFD0000,d0
		bge.s	loc_1447E
		move.l	#$FFFD0000,d0

loc_1447E:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		moveq	#2,d0
		jsr	sub_CA58
		beq.s	loc_144C4
		andi.w	#$FFF0,$14(a0)
		move.w	#0,6(a0)
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)
		move.w	$14(a0),d0
		andi.w	#$FFF0,$14(a0)
		addi.w	#$10,$14(a0)
		move.l	#$30000,$1C(a0)
		neg.l	$18(a0)

loc_144C4:
		bra.w	sub_143F6

sub_144C8:
		subq.b	#1,$26(a0)
		bne.s	loc_144D8
		move.w	#1,6(a0)
		addq.w	#1,2(a0)

loc_144D8:
		bra.w	sub_143F6

sub_144DC:
		move.l	$1C(a0),d0
		subi.l	#$1800,d0
		cmpi.l	#$FFFD0000,d0
		bge.s	loc_144F4
		move.l	#$FFFD0000,d0

loc_144F4:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		moveq	#2,d0
		jsr	sub_CA58
		beq.s	loc_14540
		andi.w	#$FFF0,$14(a0)
		move.w	$2A(a0),$10(a0)
		move.w	#0,6(a0)
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)
		move.w	$14(a0),d0
		andi.w	#$FFF0,$14(a0)
		addi.w	#$10,$14(a0)
		move.l	#$30000,$1C(a0)
		neg.l	$18(a0)

loc_14540:
		bra.w	sub_143F6

sub_14544:
		subq.b	#1,$26(a0)
		bne.s	loc_14554
		move.w	#1,6(a0)
		subq.w	#3,2(a0)

loc_14554:
		bra.w	sub_143F6

sub_14558:
		jsr	sub_15C24(pc)
		bne.w	locret_14566
		move.w	$28(a0),2(a0)

locret_14566:
		rts

sub_14568:
		lea	(off_14574).l,a1
		jmp	jump_by_table1	; a0 = ?

off_14574:	dc.w sub_145B8-off_14574
		dc.w sub_145FA-off_14574
		dc.w sub_14620-off_14574
		dc.w sub_1462E-off_14574
		dc.w sub_14650-off_14574
		dc.w sub_1465E-off_14574
sub_14580:
		jsr	sub_B9B8
		beq.s	loc_145B2
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.w	2(a0),$28(a0)
		move.b	#3,$2C(a0)
		move.w	#5,2(a0)
		bset	#7,$E(a0)

loc_145B2:
		jmp	sub_B960

sub_145B8:
		jsr	sub_BC72
		move.l	#off_11A536,$20(a0)
		subi.w	#$18,$14(a0)
		cmpi.w	#7,(level_params1_index).w
		bne.s	loc_145DA
		bset	#0,$C(a0)

loc_145DA:
		bset	#1,$D(a0)
		move.w	$14(a0),$2A(a0)
		move.w	#2,$1C(a0)
		moveq	#6,d0
		jsr	sub_CA8E
		jmp	sub_B856

sub_145FA:
		jsr	sub_B88A
		move.w	$2A(a0),d0
		sub.w	$14(a0),d0
		cmpi.w	#$FFB0,d0
		bgt.s	loc_1461C
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)
		neg.l	$1C(a0)

loc_1461C:
		bra.w	sub_14580

sub_14620:
		subq.b	#1,$26(a0)
		bne.s	loc_1462A
		addq.w	#1,2(a0)

loc_1462A:
		bra.w	sub_14580

sub_1462E:
		jsr	sub_B88A
		move.w	$2A(a0),d0
		cmp.w	$14(a0),d0
		blt.s	loc_1464C
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)
		neg.l	$1C(a0)

loc_1464C:
		bra.w	sub_14580

sub_14650:
		subq.b	#1,$26(a0)
		bne.s	loc_1465A
		subq.w	#3,2(a0)

loc_1465A:
		bra.w	sub_14580

sub_1465E:
		bclr	#6,$E(a0)
		jsr	sub_15C24(pc)
		bne.w	locret_14678
		move.w	$28(a0),2(a0)
		bclr	#7,$E(a0)

locret_14678:
		rts

sub_1467A:
		lea	(off_14686).l,a1
		jmp	jump_by_table1	; a0 = ?

off_14686:	dc.w sub_14692-off_14686
		dc.w sub_146B4-off_14686
		dc.w sub_1473C-off_14686
		dc.w sub_14868-off_14686
		dc.w sub_148C6-off_14686
		dc.w sub_148E8-off_14686
sub_14692:
		jsr	sub_BC72
		move.l	#off_11A5D8,$20(a0)
		moveq	#2,d0
		jsr	sub_CA8E
		move.w	#$10,$28(a0)
		jmp	sub_B85A

sub_146B4:
		cmpi.b	#1,$36(a0)
		blt.s	loc_146EC
		bgt.s	loc_146D6
		move.l	#$FFFD0000,$1C(a0)
		move.l	#$1C000,$18(a0)
		moveq	#5,d0
		jmp	sub_B83E

loc_146D6:
		move.l	#$FFFD0000,$1C(a0)
		move.l	#$FFFE4000,$18(a0)
		jmp	sub_B85E

loc_146EC:
		movea.w	$2A(a0),a1
		move.w	$10(a1),$10(a0)
		moveq	#0,d0
		move.b	$2C(a1),d0
		ext.w	d0
		add.w	d0,$10(a0)
		move.w	$14(a1),$14(a0)
		subi.w	#$14,$14(a0)
		btst	#0,5(a1)
		bne.s	loc_1471E
		subi.w	#$14,$10(a0)
		bra.s	loc_14724

loc_1471E:
		addi.w	#$14,$10(a0)

loc_14724:
		cmpi.w	#9,2(a1)
		beq.s	locret_1473A
		cmpi.w	#$A,2(a1)
		beq.s	locret_1473A
		jmp	sub_B960

locret_1473A:
		rts

sub_1473C:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$30000,d0
		ble.s	loc_14754
		move.l	#$30000,d0

loc_14754:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		moveq	#0,d0
		jsr	sub_CA58
		cmpi.b	#1,d7
		beq.s	loc_14790
		moveq	#1,d0
		jsr	sub_CA58
		cmpi.b	#1,d7
		beq.s	loc_14790
		moveq	#2,d0
		jsr	sub_CA58
		bne.s	loc_14790
		jsr	sub_15AB0(pc)
		bne.s	loc_14790
		jmp	sub_B960

loc_14790:
		move.b	d0,$3E(a0)
		move.b	d7,$3F(a0)
		move.b	#$3C,$26(a0)
		move.b	#$A7,d2
		jsr	sub_ED12(pc)
		jsr	sub_B85A
		cmpi.w	#3,d7
		beq.s	loc_147D4
		cmpi.w	#4,d7
		beq.s	loc_147EE
		cmpi.w	#5,d7
		beq.s	loc_1480A
		cmpi.w	#$A,d7
		beq.s	loc_14824
		cmpi.w	#$B,d7
		beq.s	loc_14838
		cmpi.w	#$C,d7
		beq.w	loc_14852
		rts

loc_147D4:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		andi.w	#$FFF0,$14(a0)
		addi.w	#$10,$14(a0)
		sub.w	d0,$14(a0)
		rts

loc_147EE:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		asr.w	#1,d0
		andi.w	#$FFF0,$14(a0)
		addi.w	#$10,$14(a0)
		sub.w	d0,$14(a0)
		rts

loc_1480A:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		asr.w	#1,d0
		andi.w	#$FFF0,$14(a0)
		addq.w	#8,$14(a0)
		sub.w	d0,$14(a0)
		rts

loc_14824:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		andi.w	#$FFF0,$14(a0)
		add.w	d0,$14(a0)
		rts

loc_14838:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		asr.w	#1,d0
		andi.w	#$FFF0,$14(a0)
		addq.w	#8,$14(a0)
		add.w	d0,$14(a0)
		rts

loc_14852:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		asr.w	#1,d0
		andi.w	#$FFF0,$14(a0)
		add.w	d0,$14(a0)
		rts

sub_14868:
		move.b	$26(a0),d0
		subq.b	#1,d0
		move.b	d0,$26(a0)
		cmpi.b	#$36,d0
		beq.s	loc_1488E
		cmpi.b	#$30,d0
		beq.s	loc_1488E
		tst.b	d0
		bne.s	loc_14888
		bset	#0,$C(a0)

loc_14888:
		jmp	sub_B960

loc_1488E:
		move.b	#$A7,d2
		jsr	sub_ED12(pc)
		jsr	sub_EA3C(pc)
		bne.s	loc_148C0
		move.w	#$1D,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	$28(a0),d0
		sub.w	d0,$14(a1)
		addq.w	#4,2(a1)
		addi.w	#$10,$28(a0)

loc_148C0:
		jmp	sub_B960

sub_148C6:
		jsr	sub_BC72
		move.l	#off_11A5D8,$20(a0)
		moveq	#2,d0
		jsr	sub_CA8E
		move.b	#$3C,$26(a0)
		jmp	sub_B85A

sub_148E8:
		subq.b	#1,$26(a0)
		bne.s	loc_14902
		bset	#0,$C(a0)
		tst.w	$2A(a0)
		beq.s	loc_14902
		movea.w	$2A(a0),a1
		clr.w	$2A(a1)

loc_14902:
		jmp	sub_B960

sub_14908:
		lea	(off_14914).l,a1
		jmp	jump_by_table1	; a0 = ?

off_14914:	dc.w sub_149E0-off_14914
		dc.w sub_14A74-off_14914
		dc.w sub_14B18-off_14914
		dc.w sub_14BBC-off_14914
		dc.w sub_14C1E-off_14914
		dc.w sub_14C82-off_14914
		dc.w sub_14CE8-off_14914
		dc.w sub_14D82-off_14914
		dc.w sub_14DAE-off_14914
		dc.w sub_14DDC-off_14914
		dc.w sub_14DF8-off_14914
sub_1492A:
		jsr	sub_B9B8
		beq.s	locret_14986
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_14946
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_1496E

loc_14946:
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.w	2(a0),$28(a0)
		move.b	#3,$2C(a0)
		move.w	#9,2(a0)
		bset	#1,$D(a0)
		jmp	sub_B960

loc_1496E:
		jsr	sub_15CCC(pc)
		move.w	#$A,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		bset	#1,$D(a0)

locret_14986:
		rts

sub_14988:
		tst.w	$2A(a0)
		beq.s	loc_14998
		movea.w	$2A(a0),a1
		cmpa.w	$2A(a1),a0
		beq.s	loc_149DA

loc_14998:
		jsr	sub_EA3C(pc)
		bne.s	loc_149DA
		move.w	#$1D,0.w(a1)
		move.w	a0,$2A(a1)
		move.w	a1,$2A(a0)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$14,$14(a1)
		btst	#0,5(a0)
		bne.s	loc_149CE
		subi.w	#$14,$10(a1)
		bra.s	loc_149D4

loc_149CE:
		addi.w	#$14,$10(a1)

loc_149D4:
		move.w	#4,4(a1)

loc_149DA:
		jmp	sub_B960

sub_149E0:
		jsr	sub_BC72
		move.l	#off_11A5D8,$20(a0)
		cmpi.w	#$79,0.w(a0)
		bne.s	loc_14A04
		move.l	#off_12178E,$20(a0)
		move.b	#4,$39(a0)

loc_14A04:
		move.b	#1,$39(a0)
		moveq	#7,d0
		jsr	sub_CA8E
		jsr	sub_EA3C(pc)
		bne.s	loc_14A68
		move.w	#$1D,0.w(a1)
		move.w	a0,$2A(a1)
		move.w	a1,$2A(a0)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		subi.w	#$14,$14(a1)
		btst	#0,$36(a0)
		bne.s	loc_14A50
		subi.w	#$14,$10(a1)
		move.l	#$10000,$18(a0)
		bra.s	loc_14A62

loc_14A50:
		addi.w	#$14,$10(a1)
		move.l	#$FFFF0000,$18(a0)
		addq.w	#1,2(a0)

loc_14A62:
		move.w	#4,4(a1)

loc_14A68:
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	sub_B83E

sub_14A74:
		jsr	sub_B88A
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		tst.w	d0
		blt.s	loc_14AFA
		cmpi.w	#$A0,d0
		bgt.s	loc_14ABE
		tst.w	$2A(a0)
		beq.s	loc_14ABE
		movea.w	$2A(a0),a1
		addi.w	#$28,$10(a1)
		subq.w	#8,$14(a1)
		move.b	#1,$36(a1)
		addq.w	#6,2(a0)
		move.b	#$CF,d2
		jsr	sub_ED12(pc)
		move.b	#$60,$26(a0)
		jmp	sub_B872

loc_14ABE:
		moveq	#3,d0
		jsr	sub_CA58
		bne.s	loc_14AD8
		addq.w	#5,2(a0)
		clr.l	$18(a0)
		bset	#1,$C(a0)
		rts

loc_14AD8:
		moveq	#0,d0
		jsr	sub_CA58
		beq.s	loc_14B10
		cmpi.w	#1,d7
		bne.s	loc_14AFA
		addq.w	#4,2(a0)
		move.l	#$FFFD0000,$1C(a0)
		clr.l	$18(a0)
		rts

loc_14AFA:
		neg.l	$18(a0)
		addq.w	#3,2(a0)
		move.b	#$1E,$26(a0)
		moveq	#1,d0
		jmp	loc_B842

loc_14B10:
		bsr.w	sub_1492A
		bra.w	sub_14988

sub_14B18:
		jsr	sub_B88A
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		tst.w	d0
		bgt.s	loc_14BA0
		cmpi.w	#$FF60,d0
		blt.s	loc_14B64
		tst.w	$2A(a0)
		beq.s	loc_14B64
		movea.w	$2A(a0),a1
		subi.w	#$28,$10(a1)
		subq.w	#8,$14(a1)
		move.b	#2,$36(a1)
		addq.w	#6,2(a0)
		move.b	#$CF,d2
		jsr	sub_ED12(pc)
		move.b	#$60,$26(a0)
		moveq	#3,d0
		jmp	loc_B842

loc_14B64:
		moveq	#3,d0
		jsr	sub_CA58
		bne.s	loc_14B7E
		addq.w	#4,2(a0)
		clr.l	$18(a0)
		bset	#1,$C(a0)
		rts

loc_14B7E:
		moveq	#1,d0
		jsr	sub_CA58
		beq.s	loc_14BB4
		cmpi.w	#1,d7
		bne.s	loc_14BA0
		addq.w	#3,2(a0)
		move.l	#$FFFD0000,$1C(a0)
		clr.l	$18(a0)
		rts

loc_14BA0:
		neg.l	$18(a0)
		addq.w	#1,2(a0)
		move.b	#$1E,$26(a0)
		jmp	sub_B86E

loc_14BB4:
		bsr.w	sub_1492A
		bra.w	sub_14988

sub_14BBC:
		jsr	sub_B88A
		subq.b	#1,$26(a0)
		bne.s	loc_14BCE
		subq.w	#2,2(a0)
		rts

loc_14BCE:
		moveq	#3,d0
		jsr	sub_CA58
		bne.s	loc_14BE8
		addq.w	#3,2(a0)
		clr.l	$18(a0)
		bset	#1,$C(a0)
		rts

loc_14BE8:
		moveq	#0,d0
		jsr	sub_CA58
		beq.s	loc_14C16
		cmpi.w	#1,d7
		bne.s	loc_14C0A
		addq.w	#2,2(a0)
		move.l	#$FFFD0000,$1C(a0)
		clr.l	$18(a0)
		rts

loc_14C0A:
		neg.l	$18(a0)
		moveq	#1,d0
		jmp	sub_B83E

loc_14C16:
		bsr.w	sub_1492A
		bra.w	sub_14988

sub_14C1E:
		jsr	sub_B88A
		subq.b	#1,$26(a0)
		bne.s	loc_14C30
		subq.w	#2,2(a0)
		rts

loc_14C30:
		moveq	#3,d0
		jsr	sub_CA58
		bne.s	loc_14C4A
		addq.w	#2,2(a0)
		clr.l	$18(a0)
		bset	#1,$C(a0)
		rts

loc_14C4A:
		moveq	#1,d0
		jsr	sub_CA58
		beq.s	loc_14C7A
		cmpi.w	#1,d7
		bne.s	loc_14C6C
		addq.w	#1,2(a0)
		move.l	#$FFFD0000,$1C(a0)
		clr.l	$18(a0)
		rts

loc_14C6C:
		neg.l	$18(a0)
		subq.w	#1,2(a0)
		jmp	sub_B86E

loc_14C7A:
		bsr.w	sub_1492A
		bra.w	sub_14988

sub_14C82:
		move.l	$1C(a0),d0
		addi.l	#$1C00,d0
		move.l	d0,$1C(a0)
		ble.s	loc_14C98
		addq.w	#1,2(a0)
		rts

loc_14C98:
		btst	#0,5(a0)
		bne.s	loc_14CB4
		moveq	#0,d0
		jsr	sub_CA58
		bne.s	loc_14CC6
		move.l	#$10000,$18(a0)
		bra.s	loc_14CC6

loc_14CB4:
		moveq	#1,d0
		jsr	sub_CA58
		bne.s	loc_14CC6
		move.l	#$FFFF0000,$18(a0)

loc_14CC6:
		jsr	sub_B88A
		moveq	#2,d0
		jsr	sub_CA58
		beq.s	loc_14CE0
		clr.l	$1C(a0)
		addq.w	#1,2(a0)
		rts

loc_14CE0:
		bsr.w	sub_1492A
		bra.w	sub_14988

sub_14CE8:
		move.l	$1C(a0),d0
		addi.l	#$1C00,d0
		cmpi.l	#$40000,d0
		ble.s	loc_14D00
		move.l	#$40000,d0

loc_14D00:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		moveq	#3,d0
		jsr	sub_CA58
		beq.s	loc_14D78
		bclr	#0,$C(a0)
		andi.w	#$FFF0,$14(a0)
		move.b	#$1E,$26(a0)
		clr.l	$1C(a0)
		btst	#0,5(a0)
		beq.s	loc_14D56
		moveq	#1,d0
		jsr	sub_CA58
		bne.s	loc_14D60

loc_14D3C:
		move.l	#$FFFF0000,$18(a0)
		subq.w	#2,2(a0)
		move.b	#$1E,$26(a0)
		moveq	#1,d0
		jmp	loc_B842

loc_14D56:
		moveq	#0,d0
		jsr	sub_CA58
		bne.s	loc_14D3C

loc_14D60:
		move.l	#$10000,$18(a0)
		subq.w	#3,2(a0)
		move.b	#$1E,$26(a0)
		jmp	sub_B86E

loc_14D78:
		bsr.w	sub_1492A
		jmp	sub_B960

sub_14D82:
		subq.b	#1,$26(a0)
		bne.s	loc_14DA4
		subq.w	#4,2(a0)
		move.b	#$1E,$26(a0)
		jsr	sub_B86E
		clr.w	$2A(a0)
		bsr.w	sub_1492A
		bra.w	sub_14988

loc_14DA4:
		bsr.w	sub_1492A
		jmp	sub_B960

sub_14DAE:
		subq.b	#1,$26(a0)
		bne.s	loc_14DD2
		subq.w	#4,2(a0)
		move.b	#$1E,$26(a0)
		moveq	#1,d0
		jsr	loc_B842
		clr.w	$2A(a0)
		bsr.w	sub_1492A
		bra.w	sub_14988

loc_14DD2:
		bsr.w	sub_1492A
		jmp	sub_B960

sub_14DDC:
		jsr	sub_15C24(pc)
		bne.w	locret_14DF6
		move.w	$28(a0),2(a0)
		bclr	#1,$D(a0)
		jmp	sub_B960

locret_14DF6:
		rts

sub_14DF8:
		move.l	#$4000,d0
		bra.w	sub_15C06

sub_14E02:
		moveq	#0,d0
		move.b	$36(a0),d0
		lsr.w	#1,d0
		add.w	d0,d0
		move.w	off_14E14(pc,d0.w),d0
		jmp	off_14E14(pc,d0.w)

off_14E14:	dc.w sub_14E1E-off_14E14
		dc.w sub_14E1E-off_14E14
		dc.w sub_14F34-off_14E14
		dc.w sub_14FDE-off_14E14
		dc.w sub_15130-off_14E14
sub_14E1E:
		lea	(off_14E2A).l,a1
		jmp	jump_by_table1	; a0 = ?

off_14E2A:	dc.w sub_14E34-off_14E2A
		dc.w sub_14E7C-off_14E2A
		dc.w sub_14EAA-off_14E2A
		dc.w sub_14ED8-off_14E2A
		dc.w sub_14F06-off_14E2A
sub_14E34:
		jsr	sub_BC72
		move.l	#off_11A6B2,$20(a0)
		move.l	#$C000,$18(a0)
		btst	#0,$36(a0)
		beq.s	loc_14E5A
		move.l	#$FFFF4000,$18(a0)

loc_14E5A:
		move.l	#$FFFEC000,$1C(a0)
		btst	#1,$36(a0)
		beq.s	loc_14E76
		move.l	#$FFFE0000,$1C(a0)
		addq.w	#2,2(a0)

loc_14E76:
		jmp	sub_B852

sub_14E7C:
		move.l	$1C(a0),d0
		addi.l	#$800,d0
		cmpi.l	#$14000,d0
		ble.s	loc_14E98
		move.l	#$14000,d0
		addq.w	#1,2(a0)

loc_14E98:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		jmp	sub_B960

nullsub_15:
		rts

sub_14EAA:
		move.l	$1C(a0),d0
		subi.l	#$800,d0
		cmpi.l	#$FFFEC000,d0
		bge.s	loc_14EC6
		move.l	#$FFFEC000,d0
		subq.w	#1,2(a0)

loc_14EC6:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		jmp	sub_B960

nullsub_16:
		rts

sub_14ED8:
		move.l	$1C(a0),d0
		addi.l	#$800,d0
		cmpi.l	#$20000,d0
		ble.s	loc_14EF4
		move.l	#$20000,d0
		addq.w	#1,2(a0)

loc_14EF4:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		jmp	sub_B960

nullsub_17:
		rts

sub_14F06:
		move.l	$1C(a0),d0
		subi.l	#$800,d0
		cmpi.l	#$FFFE0000,d0
		bge.s	loc_14F22
		move.l	#$FFFE0000,d0
		subq.w	#1,2(a0)

loc_14F22:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		jmp	sub_B960

nullsub_18:
		rts

sub_14F34:
		lea	(off_14F40).l,a1
		jmp	jump_by_table1	; a0 = ?

off_14F40:	dc.w sub_14F46-off_14F40
		dc.w sub_14F8A-off_14F40
		dc.w sub_14FAA-off_14F40
sub_14F46:
		jsr	sub_BC72
		move.l	#off_11A6B2,$20(a0)
		bset	#2,$D(a0)
		jsr	sub_EA3C(pc)
		bne.s	loc_14F84
		move.w	a1,$28(a0)
		move.w	#$1B,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.b	$36(a0),$36(a1)
		move.w	a0,$3C(a1)
		addq.b	#4,$36(a1)

loc_14F84:
		jmp	sub_B852

sub_14F8A:
		tst.b	$2B(a0)
		bne.s	loc_14F9E
		movea.w	$28(a0),a1
		cmpi.w	#$1B,0.w(a1)
		bne.s	loc_14F9E
		rts

loc_14F9E:
		addq.w	#1,2(a0)
		move.b	#$A,$26(a0)
		rts

sub_14FAA:
		subq.b	#1,$26(a0)
		bgt.s	locret_14FDC
		moveq	#0,d1
		lea	(word_FF9000).w,a1
		moveq	#$2F,d7

loc_14FB8:
		btst	#4,$36(a1)
		beq.s	loc_14FCC
		cmpa.w	$3C(a1),a0
		bne.s	loc_14FCC
		bset	#0,$C(a1)

loc_14FCC:
		adda.w	#$40,a1
		dbf	d7,loc_14FB8
		clr.w	2(a0)
		clr.b	$2B(a0)

locret_14FDC:
		rts

sub_14FDE:
		lea	(off_14FEA).l,a1
		jmp	jump_by_table1	; a0 = ?

off_14FEA:	dc.w sub_14FF2-off_14FEA
		dc.w sub_1501C-off_14FEA
		dc.w sub_15034-off_14FEA
		dc.w sub_150B2-off_14FEA
sub_14FF2:
		jsr	sub_BC72
		move.l	#off_11A6B2,$20(a0)
		move.b	#$78,$26(a0)
		subq.w	#8,$14(a0)
		move.w	$10(a0),$28(a0)
		move.w	$14(a0),$2A(a0)
		jmp	sub_B852

sub_1501C:
		subq.b	#1,$26(a0)
		bne.s	loc_1502E
		addq.w	#1,2(a0)
		move.l	#$FFFD0000,$1C(a0)

loc_1502E:
		jmp	sub_B960

sub_15034:
		move.w	$2A(a0),d0
		cmp.w	$14(a0),d0
		bge.s	loc_1505A
		subq.w	#1,2(a0)
		move.b	#$78,$26(a0)
		move.w	$28(a0),$10(a0)
		move.w	$2A(a0),$14(a0)
		clr.l	$18(a0)
		rts

loc_1505A:
		move.l	$1C(a0),d0
		addi.l	#$1000,d0
		cmpi.l	#$18000,d0
		ble.s	loc_150A2
		move.l	#$18000,d0
		move.l	d0,$1C(a0)
		move.l	$18(a0),d0
		addi.l	#$400,d0
		cmpi.l	#$4000,d0
		ble.s	loc_15092
		move.l	#$4000,d0
		addq.w	#1,2(a0)

loc_15092:
		move.l	d0,$18(a0)
		jsr	sub_B88A
		jmp	sub_B960

loc_150A2:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		jmp	sub_B960

sub_150B2:
		move.w	$2A(a0),d0
		cmp.w	$14(a0),d0
		bge.s	loc_150D8
		subq.w	#2,2(a0)
		move.b	#$78,$26(a0)
		move.w	$28(a0),$10(a0)
		move.w	$2A(a0),$14(a0)
		clr.l	$18(a0)
		rts

loc_150D8:
		move.l	$1C(a0),d0
		addi.l	#$1000,d0
		cmpi.l	#$18000,d0
		ble.s	loc_15120
		move.l	#$18000,d0
		move.l	d0,$1C(a0)
		move.l	$18(a0),d0
		addi.l	#-$400,d0
		cmpi.l	#$FFFFC000,d0
		ble.s	loc_15110
		move.l	#$FFFFC000,d0
		subq.w	#1,2(a0)

loc_15110:
		move.l	d0,$18(a0)
		jsr	sub_B88A
		jmp	sub_B960

loc_15120:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		jmp	sub_B960

sub_15130:
		lea	(off_1513C).l,a1
		jmp	jump_by_table1	; a0 = ?

off_1513C:	dc.w sub_1517A-off_1513C
		dc.w sub_15194-off_1513C
		dc.w sub_15218-off_1513C
		dc.w sub_15302-off_1513C
		dc.w sub_15326-off_1513C
		dc.w sub_153A6-off_1513C
		dc.w sub_153C4-off_1513C
sub_1514A:
		movea.w	$3C(a0),a1
		cmpi.w	#$1B,0.w(a1)
		beq.s	loc_1515C
		bset	#0,$C(a0)

loc_1515C:
		movea.w	$3E(a0),a2
		cmpi.w	#$1B,0.w(a2)
		beq.s	loc_15174
		bset	#0,$2B(a1)
		bset	#0,$C(a0)

loc_15174:
		jmp	sub_B960

sub_1517A:
		jsr	sub_BC72
		move.l	#off_11A6B2,$20(a0)
		bset	#2,$D(a0)
		jmp	sub_B852

sub_15194:
		move.w	(planea_start_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$38,d0
		bgt.s	locret_15216
		cmpi.w	#$FEA0,d0
		blt.s	locret_15216
		move.w	(planea_start_y).w,d0
		sub.w	$14(a0),d0
		cmpi.w	#$38,d0
		bgt.s	locret_15216
		cmpi.w	#$FEF8,d0
		blt.s	locret_15216
		addq.w	#1,2(a0)
		bclr	#2,$D(a0)
		move.w	a0,$3E(a0)
		lea	(stru_15386).l,a1
		btst	#0,$36(a0)
		bne.s	loc_151F8
		subi.w	#$C,$10(a0)
		subi.w	#$3C,$14(a0)
		move.b	0.w(a1),$28(a0)
		move.b	1(a1),$29(a0)
		move.b	#5,$26(a0)
		rts

loc_151F8:
		subi.w	#$10,$10(a0)
		subi.w	#$50,$14(a0)
		move.b	0.w(a1),$28(a0)
		move.b	1(a1),$29(a0)
		move.b	#8,$26(a0)

locret_15216:
		rts

sub_15218:
		moveq	#0,d0
		move.b	$26(a0),d0
		subq.b	#1,d0
		bge.s	loc_1522E
		addq.w	#1,2(a0)
		move.b	#8,$26(a0)
		rts

loc_1522E:
		move.b	d0,$26(a0)
		lsl.w	#3,d0
		lea	(stru_1529A).l,a2
		btst	#0,$36(a0)
		beq.s	loc_15248
		lea	(stru_152C2).l,a2

loc_15248:
		jsr	sub_EA3C(pc)
		bne.s	locret_15298
		move.w	#$1B,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	(a2,d0.w),d1
		add.w	d1,$10(a1)
		move.w	2(a2,d0.w),d1
		add.w	d1,$14(a1)
		move.w	4(a2,d0.w),$26(a1)
		move.w	6(a2,d0.w),$28(a1)
		move.w	#5,2(a1)
		move.b	$36(a0),$36(a1)
		move.w	$3E(a0),$3E(a1)
		move.w	$3C(a0),$3C(a1)
		move.w	a1,$3E(a0)

locret_15298:
		rts

stru_1529A:	struc_50 $FFE9, $6F, $100A, $3F03
		struc_50 $17, $79, $1008, 1
		struc_50 $3D, $5E, $1006, $3F05
		struc_50 $48, $30, $1004, 4
		struc_50 $2C, $A, $1002, $3F00
stru_152C2:	struc_50 $FFBE, $61, $200C, 7
		struc_50 $FFD7, $88, $100A, $3F03
		struc_50 0, $A2, $2009, $2003
		struc_50 $2D, $9B, $1007, $2001
		struc_50 $53, $7D, $2006, $3F05
		struc_50 $61, $52, $1004, 4
		struc_50 $53, $24, $2003, $2004
		struc_50 $2F, 7, $1001, $2000
sub_15302:
		subq.b	#1,$26(a0)
		bne.s	loc_15320
		addq.w	#1,2(a0)
		move.b	#$20,$26(a0)
		btst	#0,$36(a0)
		bne.s	loc_15320
		move.b	#$18,$26(a0)

loc_15320:
		jmp	sub_B960

sub_15326:
		subq.b	#1,$26(a0)
		bne.s	loc_15364
		lea	(stru_15386).l,a1
		moveq	#0,d0
		move.b	$27(a0),d0
		addq.b	#1,d0
		andi.b	#$F,d0
		move.b	d0,$27(a0)
		add.w	d0,d0
		move.b	(a1,d0.w),$28(a0)
		move.b	1(a1,d0.w),$29(a0)
		move.b	#$20,$26(a0)
		btst	#0,$36(a0)
		bne.s	loc_15364
		move.b	#$18,$26(a0)

loc_15364:
		move.b	$28(a0),d1
		move.b	$29(a0),d2
		move.w	#$100,d3
		jsr	sub_EB3C(pc)
		move.l	d0,$18(a0)
		move.l	d1,$1C(a0)
		jsr	sub_B88A
		jmp	sub_1514A(pc)

stru_15386:	struc_51 0, 0
		struc_51 $20, 0
		struc_51 $3F, 0
		struc_51 $20, 4
		struc_51 0, 4
		struc_51 $20, 5
		struc_51 $3F, 5
		struc_51 $20, 1
		struc_51 0, 1
		struc_51 $20, 3
		struc_51 $3F, 3
		struc_51 $20, 7
		struc_51 0, 7
		struc_51 $20, 6
		struc_51 $3F, 6
		struc_51 $20, 2
sub_153A6:
		jsr	sub_BC72
		move.l	#off_11A6B2,$20(a0)
		addq.w	#1,2(a0)
		move.b	#$10,$2A(a0)
		jmp	sub_B86E

sub_153C4:
		subq.b	#1,$2A(a0)
		bne.s	loc_153E0
		subq.w	#2,2(a0)
		btst	#0,$36(a0)
		bne.s	loc_153DC
		move.b	#$18,$26(a0)

loc_153DC:
		bra.w	sub_15326

loc_153E0:
		jmp	sub_B960

sub_153E6:
		lea	(off_153F2).l,a1
		jmp	jump_by_table1	; a0 = ?

off_153F2:	dc.w sub_15510-off_153F2
		dc.w sub_1553C-off_153F2
		dc.w sub_1555C-off_153F2
		dc.w sub_15572-off_153F2
		dc.w sub_15582-off_153F2
		dc.w sub_155DA-off_153F2
		dc.w sub_155FE-off_153F2
sub_15400:
		moveq	#3,d0
		jsr	sub_CA58
		lea	(byte_15454).l,a1
		moveq	#0,d0
		move.b	(a1,d7.w),d0
		rts

sub_15416:
		moveq	#3,d0
		jsr	sub_CA58
		lea	(byte_15454).l,a1
		moveq	#0,d0
		move.b	(a1,d7.w),d0
		move.b	d0,$28(a0)
		lea	(stru_15486).l,a1
		lsl.w	#3,d0
		move.l	(a1,d0.w),$18(a0)
		move.l	4(a1,d0.w),$1C(a0)
		btst	#0,5(a0)
		beq.s	locret_15452
		neg.l	$18(a0)
		neg.l	$1C(a0)

locret_15452:
		rts

byte_15454:	dc.b 0,	1, 1, 1, 1, 2, 6, 6, 2,	6, 6, 3, 7, 7, 3, 7, 7,	1, 0, 1
		dc.b 1,	2, 6, 6, 2, 6, 6, 3, 7,	7, 3, 7, 7, 0, 0, 0, 0,	2, 6, 3
		dc.b 7,	2, 6, 3, 7, 0, 0, 0, 0,	0
stru_15486:	struc_52 0, 0
		struc_52 $6000, 0
		struc_52 $6000, $FFFFA000
		struc_52 $6000, $6000
		struc_52 0, 0
		struc_52 $6000, 0
		struc_52 $6000, $FFFFD000
		struc_52 $6000, $3000
sub_154C6:
		tst.b	$2D(a0)
		blt.s	loc_154E8
		jsr	sub_B9B8
		beq.s	loc_15506
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_154F0
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_1550C

loc_154E8:
		jsr	loc_BA02
		beq.s	loc_15506

loc_154F0:
		move.w	a0,$30(a1)
		jsr	sub_15CD6(pc)
		move.w	#5,2(a0)
		move.b	#$20,$26(a0)
		rts

loc_15506:
		jmp	sub_B960

loc_1550C:
		bra.s	loc_154F0

nullsub_19:
		rts

sub_15510:
		jsr	sub_BC72
		move.l	#off_11A6D4,$20(a0)
		addq.w	#1,2(a0)
		addi.w	#$24,$14(a0)
		moveq	#0,d0
		jsr	sub_CA8E
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	loc_B842

sub_1553C:
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$70,d0
		bgt.s	locret_1555A
		cmpi.w	#$FF90,d0
		blt.s	locret_1555A
		addq.w	#1,2(a0)
		move.b	#$20,$26(a0)

locret_1555A:
		rts

sub_1555C:
		subq.w	#1,$14(a0)
		subq.b	#1,$26(a0)
		bne.s	locret_15570
		addq.w	#1,2(a0)
		move.b	#$A,$26(a0)

locret_15570:
		rts

sub_15572:
		subq.b	#1,$26(a0)
		bhi.s	locret_15580
		addq.w	#1,2(a0)
		bra.w	sub_15416

locret_15580:
		rts

sub_15582:
		addq.b	#1,$29(a0)
		moveq	#0,d0
		move.b	$29(a0),d0
		lsr.w	#3,d0
		andi.b	#$F,d0
		lea	(byte_155CA).l,a1
		move.b	(a1,d0.w),$2D(a0)
		jsr	sub_B88A
		bsr.w	sub_15400
		move.b	$28(a0),d1
		andi.b	#3,d1
		andi.b	#3,d0
		cmp.b	d0,d1
		beq.s	loc_155C6
		neg.l	$18(a0)
		neg.l	$1C(a0)
		bchg	#0,5(a0)

loc_155C6:
		bra.w	sub_154C6

byte_155CA:	dc.b 0,	1, 2, 3, 3, 3, 2, 1, 0,	$FF, $FE, $FD, $FD, $FD, $FE, $FF
sub_155DA:
		addq.w	#1,$14(a0)
		subq.b	#1,$26(a0)
		bne.s	locret_155FC
		addq.w	#1,2(a0)
		move.b	#$FA,$26(a0)
		clr.b	$2D(a0)
		bset	#4,$E(a0)
		clr.b	$F(a0)

locret_155FC:
		rts

sub_155FE:
		subq.b	#1,$26(a0)
		bne.s	locret_15618
		subq.w	#4,2(a0)
		move.b	#$20,$26(a0)
		bclr	#4,$E(a0)
		clr.b	$28(a0)

locret_15618:
		rts

nullsub_20:
		rts

sub_1561C:
		lea	(off_15628).l,a1
		jmp	jump_by_table1	; a0 = ?

off_15628:	dc.w sub_15638-off_15628
		dc.w sub_1565E-off_15628
		dc.w sub_15734-off_15628
		dc.w sub_157EA-off_15628
		dc.w sub_15832-off_15628
		dc.w sub_15846-off_15628
		dc.w sub_1585C-off_15628
		dc.w sub_15870-off_15628
sub_15638:
		jsr	sub_BC72
		move.l	#off_11A856,$20(a0)
		addq.w	#1,2(a0)
		moveq	#3,d0
		jsr	sub_CA8E
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	loc_B842

sub_1565E:
		cmpi.w	#3,6(a0)
		bne.w	loc_15688
		move.b	9(a0),d0
		subq.b	#1,d0
		cmp.b	8(a0),d0
		bne.w	loc_15688
		btst	#0,$36(a0)
		bne.s	loc_15684
		addq.w	#2,$10(a0)
		bra.s	loc_15688

loc_15684:
		subq.w	#2,$10(a0)

loc_15688:
		jsr	sub_15A46(pc)
		move.w	(player_pos_x).w,d0
		sub.w	$10(a0),d0
		cmpi.w	#$50,d0
		bgt.s	loc_15700
		cmpi.w	#$FFB0,d0
		blt.s	loc_15700

loc_156A0:
		lea	(stru_15704).l,a2
		moveq	#3,d6

loc_156A8:
		jsr	sub_EA3C(pc)
		bne.s	loc_156D8
		move.w	#$F,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	(a2)+,d0
		add.w	d0,$10(a1)
		move.w	(a2)+,d0
		add.w	d0,$14(a1)
		move.l	(a2)+,$18(a1)
		move.l	(a2)+,$1C(a1)
		dbf	d6,loc_156A8

loc_156D8:
		addq.w	#1,2(a0)
		subi.w	#$18,$14(a0)
		move.w	#$FFFC,$1C(a0)
		moveq	#3,d0
		jsr	sub_CA8E
		moveq	#0,d0
		move.b	$36(a0),d0
		bset	#1,d0
		jmp	loc_B842

loc_15700:
		jmp	sub_15898(pc)
stru_15704:	struc_53 0, 0,	$FFFF8000, $FFFC0000
		struc_53 0, $FFF4, $8000, $FFFC0000
		struc_53 $FFF4, $FFF4,	$FFFE8000, $FFFC0000
		struc_53 $C, $FFF4, $18000, $FFFC0000

sub_15734:
		move.l	$1C(a0),d0
		addi.l	#$3000,d0
		cmpi.l	#$40000,d0
		ble.s	loc_1574C
		move.l	#$40000,d0

loc_1574C:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		tst.w	$1C(a0)
		blt.s	loc_157C4
		moveq	#3,d0
		jsr	sub_CA58
		beq.s	loc_157C4
		jsr	sub_15AB0(pc)
		lea	(stru_157CA).l,a2
		movea.l	a0,a3
		moveq	#3,d6

loc_15774:
		jsr	sub_EA3C(pc)
		bne.s	loc_157B2
		move.w	d6,d0
		add.w	d0,d0
		move.w	a1,$38(a0,d0.w)
		move.w	a0,$2A(a1)
		move.w	#$F,0.w(a1)
		movea.l	a1,a3
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.l	(a2)+,$18(a1)
		move.l	(a2)+,$1C(a1)
		move.b	#$18,$26(a1)
		move.b	#1,$36(a1)
		dbf	d6,loc_15774

loc_157B2:
		addq.w	#1,2(a0)
		move.l	#$FFFF0000,$1C(a0)
		move.b	#$18,$26(a0)

loc_157C4:
		jmp	sub_B960

stru_157CA:	struc_54 $FFFF8000, $FFFF8000
		struc_54 0, $FFFF8000
		struc_54 $8000, $FFFF8000
		struc_54 0, 0
sub_157EA:
		jsr	sub_B88A
		subq.b	#1,$26(a0)
		bne.w	sub_158E4
		clr.l	$1C(a0)
		addi.w	#$18,$14(a0)
		addq.w	#1,2(a0)
		move.w	#7,d6

loc_1580A:
		clr.b	$38(a0,d6.w)
		dbf	d6,loc_1580A
		move.b	#$64,$26(a0)
		bset	#1,$D(a0)
		moveq	#3,d0
		jsr	sub_CA8E
		moveq	#0,d0
		move.b	$36(a0),d0
		jmp	loc_B842

sub_15832:
		subq.b	#1,$26(a0)
		bne.s	loc_15842
		subq.w	#3,2(a0)
		bclr	#1,$D(a0)

loc_15842:
		jmp	sub_15898(pc)

sub_15846:
		jsr	sub_15C24(pc)
		bne.w	locret_1585A
		bclr	#1,$D(a0)
		move.w	#1,2(a0)

locret_1585A:
		rts

sub_1585C:
		jsr	sub_15C24(pc)
		bne.w	locret_1585A
		move.w	#3,2(a0)
		clr.w	$2A(a0)
		rts

sub_15870:
		move.l	$1C(a0),d0
		addi.l	#$3000,d0
		cmpi.l	#$40000,d0
		ble.s	loc_15888
		move.l	#$40000,d0

loc_15888:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		jmp	sub_B960

sub_15898:
		jsr	sub_B9B8
		bne.s	loc_158A8
		jsr	loc_BA02
		beq.s	loc_158CE

loc_158A8:
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bmi.s	loc_158DA
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.w	#5,2(a0)
		bset	#1,$D(a0)

loc_158CE:
		jsr	sub_B960
		jmp	loc_B97A

loc_158DA:
		move.w	#6,2(a0)
		bra.w	loc_156A0

sub_158E4:
		jsr	sub_B9B8
		beq.s	loc_158F4
		tst.b	$F(a0)
		bmi.s	loc_1594C
		bra.s	loc_1590A

loc_158F4:
		tst.w	$2A(a0)
		beq.s	loc_15904
		cmpi.w	#2,$2A(a0)
		beq.s	loc_1594C
		bra.s	loc_1590A

loc_15904:
		jmp	sub_B960

loc_1590A:
		move.w	a0,$30(a1)
		jsr	sub_15CD6(pc)
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.w	#6,2(a0)
		move.w	#3,d6

loc_15928:
		move.w	d6,d0
		add.w	d0,d0
		movea.w	$38(a0,d0.w),a1
		move.b	#$FA,$27(a1)
		move.b	#3,$2C(a1)
		move.w	#3,2(a1)
		dbf	d6,loc_15928
		jmp	sub_B960

loc_1594C:
		lea	(stru_15704).l,a2
		moveq	#3,d6

loc_15954:
		move.w	d6,d0
		add.w	d0,d0
		movea.w	$38(a0,d0.w),a1
		move.w	#$F,0.w(a1)
		move.w	(a2)+,d0
		move.w	(a2)+,d0
		move.l	(a2)+,$18(a1)
		move.l	(a2)+,$1C(a1)
		move.w	#1,2(a1)
		dbf	d6,loc_15954
		move.w	#7,2(a0)
		move.w	#$FFFC,$1C(a0)
		clr.w	$2A(a0)
		rts

sub_1598A:
		move.w	2(a0),d0
		add.w	d0,d0
		move.w	off_15998(pc,d0.w),d0
		jmp	off_15998(pc,d0.w)

off_15998:	dc.w sub_159A0-off_15998
		dc.w sub_159C8-off_15998
		dc.w sub_159F0-off_15998
		dc.w sub_15A06-off_15998
sub_159A0:
		jsr	sub_BC72
		move.l	#off_11A856,$20(a0)
		addq.w	#1,2(a0)
		tst.b	$36(a0)
		beq.s	loc_159BC
		addq.w	#1,2(a0)

loc_159BC:
		bset	#1,$D(a0)
		jmp	sub_B876

sub_159C8:
		move.l	$1C(a0),d0
		addi.l	#$3000,d0
		cmpi.l	#$40000,d0
		ble.s	loc_159E0
		move.l	#$40000,d0

loc_159E0:
		move.l	d0,$1C(a0)
		jsr	sub_B88A
		jmp	sub_B960

sub_159F0:
		jsr	sub_B88A
		subq.b	#1,$26(a0)
		bne.s	loc_15A02
		bset	#0,$C(a0)

loc_15A02:
		jmp	sub_15A14(pc)

sub_15A06:
		jsr	sub_15C24(pc)
		bne.w	locret_15A12
		subq.w	#1,2(a0)

locret_15A12:
		rts

sub_15A14:
		jsr	sub_B9B8
		beq.s	loc_15A40
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_15A36
		movea.w	$2A(a0),a1
		move.w	#2,$2A(a1)
		jmp	sub_B960

loc_15A36:
		movea.w	$2A(a0),a1
		move.w	#1,$2A(a1)

loc_15A40:
		jmp	sub_B960

sub_15A46:
		btst	#0,$36(a0)
		bne.s	loc_15A68
		moveq	#0,d0
		jsr	sub_CA58
		lea	byte_15A82(pc,d7.w),a2
		tst.b	(a2)
		beq.w	sub_15AB0
		swap	d7
		move.w	#6,d7
		rts

loc_15A68:
		moveq	#1,d0
		jsr	sub_CA58
		lea	byte_15A82(pc,d7.w),a2
		tst.b	(a2)
		beq.w	sub_15AB0
		swap	d7
		move.w	#6,d7
		rts

byte_15A82:	dc.b 0,	1, 1, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 1, 1, 1, 1,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0
sub_15AB0:
		moveq	#0,d2
		move.w	#$FFFF,d1
		jsr	sub_BAF6
		beq.s	loc_15ACA
		cmpi.w	#$2D,d7
		beq.s	loc_15ACA
		subq.w	#1,$14(a0)
		bra.s	loc_15AD6

loc_15ACA:
		moveq	#0,d2
		move.w	#0,d1
		jsr	sub_BAF6

loc_15AD6:
		lea	off_15AE4(pc),a1
		add.w	d7,d7
		move.w	(a1,d7.w),d7
		jmp	(a1,d7.w)

off_15AE4:	dc.w sub_15B4A-off_15AE4
		dc.w sub_15B40-off_15AE4
		dc.w sub_15B40-off_15AE4
		dc.w sub_15B40-off_15AE4
		dc.w sub_15B40-off_15AE4
		dc.w sub_15B54-off_15AE4
		dc.w sub_15B76-off_15AE4
		dc.w sub_15B94-off_15AE4
		dc.w sub_15B54-off_15AE4
		dc.w sub_15B76-off_15AE4
		dc.w sub_15B94-off_15AE4
		dc.w sub_15BB6-off_15AE4
		dc.w sub_15BD2-off_15AE4
		dc.w sub_15BEE-off_15AE4
		dc.w sub_15BB6-off_15AE4
		dc.w sub_15BD2-off_15AE4
		dc.w sub_15BEE-off_15AE4
		dc.w sub_15B4A-off_15AE4
		dc.w sub_15B4A-off_15AE4
		dc.w sub_15B40-off_15AE4
		dc.w sub_15B4A-off_15AE4
		dc.w sub_15B54-off_15AE4
		dc.w sub_15B76-off_15AE4
		dc.w sub_15B94-off_15AE4
		dc.w sub_15B54-off_15AE4
		dc.w sub_15B76-off_15AE4
		dc.w sub_15B94-off_15AE4
		dc.w sub_15BB6-off_15AE4
		dc.w sub_15BD2-off_15AE4
		dc.w sub_15BEE-off_15AE4
		dc.w sub_15BB6-off_15AE4
		dc.w sub_15BD2-off_15AE4
		dc.w sub_15BEE-off_15AE4
		dc.w sub_15B40-off_15AE4
		dc.w sub_15B40-off_15AE4
		dc.w sub_15B40-off_15AE4
		dc.w sub_15B40-off_15AE4
		dc.w sub_15B4E-off_15AE4
		dc.w sub_15B70-off_15AE4
		dc.w sub_15BB0-off_15AE4
		dc.w sub_15BCC-off_15AE4
		dc.w sub_15B4E-off_15AE4
		dc.w sub_15B70-off_15AE4
		dc.w sub_15BB0-off_15AE4
		dc.w sub_15BCC-off_15AE4
		dc.w sub_15B4A-off_15AE4
sub_15B40:
		andi.w	#$FFF0,$14(a0)
		moveq	#1,d7
		rts

sub_15B4A:
		moveq	#0,d7
		rts

sub_15B4E:
		subi.w	#$10,$14(a0)

sub_15B54:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		andi.w	#$FFF0,$14(a0)
		addi.w	#$10,$14(a0)
		sub.w	d0,$14(a0)
		moveq	#2,d7
		rts

sub_15B70:
		subi.w	#$10,$14(a0)

sub_15B76:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		asr.w	#1,d0
		andi.w	#$FFF0,$14(a0)
		addi.w	#$10,$14(a0)
		sub.w	d0,$14(a0)
		moveq	#3,d7
		rts

sub_15B94:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		asr.w	#1,d0
		andi.w	#$FFF0,$14(a0)
		addq.w	#8,$14(a0)
		sub.w	d0,$14(a0)
		moveq	#3,d7
		rts

sub_15BB0:
		subi.w	#$10,$14(a0)

sub_15BB6:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		andi.w	#$FFF0,$14(a0)
		add.w	d0,$14(a0)
		moveq	#4,d7
		rts

sub_15BCC:
		subi.w	#$10,$14(a0)

sub_15BD2:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		asr.w	#1,d0
		andi.w	#$FFF0,$14(a0)
		addq.w	#8,$14(a0)
		add.w	d0,$14(a0)
		moveq	#5,d7
		rts

sub_15BEE:
		move.w	$10(a0),d0
		andi.w	#$F,d0
		asr.w	#1,d0
		andi.w	#$FFF0,$14(a0)
		add.w	d0,$14(a0)
		moveq	#5,d7
		rts

sub_15C06:
		move.l	$1C(a0),d1
		add.l	d0,d1
		cmpi.l	#$40000,d1
		ble.s	loc_15C1A
		move.l	#$40000,d1

loc_15C1A:
		move.l	d1,$1C(a0)
		add.l	d1,$14(a0)
		rts

sub_15C24:
		subq.b	#1,$27(a0)
		btst	#0,$27(a0)
		bne.s	loc_15C3C
		btst	#1,$27(a0)
		bne.s	loc_15C3C
		neg.b	$2C(a0)

loc_15C3C:
		tst.b	$27(a0)
		bne.s	locret_15C46
		clr.b	$2C(a0)

locret_15C46:
		rts

sub_15C48:
		jsr	sub_B9B8
		tst.b	$F(a0)
		beq.s	locret_15C58
		move.w	a0,$30(a1)

locret_15C58:
		rts

sub_15C5A:
		jsr	sub_B9B8
		tst.b	$F(a0)
		bne.s	loc_15C72
		jsr	loc_BA02
		tst.b	$F(a0)
		beq.s	loc_15C94

loc_15C72:
		tst.b	(byte_FFEE48).w
		bne.s	loc_15C90
		bset	#4,$E(a0)
		cmpi.w	#$21,0.w(a0)
		bne.s	loc_15C90
		movea.w	$2A(a0),a2
		bset	#4,$E(a2)

loc_15C90:
		move.w	a0,$30(a1)

loc_15C94:
		clr.b	$F(a0)
		rts

sub_15C9A:
		jsr	sub_B9B0
		beq.s	loc_15CC8
		moveq	#0,d1
		move.w	(player_pos_x).w,d1
		sub.w	$10(a0),d1
		blt.s	loc_15CBA
		subi.w	#$28,d1
		bgt.s	loc_15CC8
		neg.w	d1
		swap	d1
		bra.s	loc_15CC4

loc_15CBA:
		addi.w	#$28,d1
		blt.s	loc_15CC8
		neg.w	d1
		swap	d1

loc_15CC4:
		moveq	#1,d0
		rts

loc_15CC8:
		moveq	#0,d1
		rts

sub_15CCC:
		move.w	$34(a0),d0
		add.w	d0,(word_FF8F7A).w
		rts

sub_15CD6:
		movea.w	$2E(a0),a1
		bset	#6,-3(a1)
		bne.s	locret_15CEE
		moveq	#0,d0
		move.w	$34(a0),d0
		asr.w	#1,d0
		add.w	d0,(word_FF8F7A).w

locret_15CEE:
		rts

sub_15CF0:
		lea	(off_15CFC).l,a1
		jmp	jump_by_table1	; a0 = ?

off_15CFC:	dc.w sub_15E2A-off_15CFC
		dc.w sub_15E6A-off_15CFC
		dc.w sub_15E8E-off_15CFC
		dc.w sub_15EC0-off_15CFC
		dc.w sub_15EE2-off_15CFC
		dc.w sub_15F5E-off_15CFC
		dc.w sub_15F86-off_15CFC
		dc.w sub_160A6-off_15CFC
		dc.w sub_160DE-off_15CFC
		dc.w sub_16128-off_15CFC
sub_15D10:
		move.w	$2A(a0),d0
		lsr.w	#2,d0
		andi.w	#$F,d0
		lea	(byte_15D32).l,a1
		move.b	(a1,d0.w),$2D(a0)
		jsr	loc_B97A
		move.w	d7,(word_FF8FAA).w
		rts

byte_15D32:	dc.b 0,	1, 2, 3, 3, 3, 2, 1, 0,	$FF, $FE, $FD, $FD, $FD, $FE, $FF
sub_15D42:
		jsr	loc_BA02
		beq.s	locret_15D4E
		move.w	a0,$30(a1)

locret_15D4E:
		rts

sub_15D50:
		jsr	sub_B9B8
		beq.s	loc_15D94
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_15DA0
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		beq.s	loc_15D7A
		move.b	#$FA,$27(a0)
		move.w	#7,2(a0)
		rts

loc_15D7A:
		move.w	#8,2(a0)
		move.l	#$FFFD0000,$1C(a0)
		bset	#1,$D(a0)
		move.w	#$3C,$3E(a0)

loc_15D94:
		jsr	loc_B97A
		move.w	d7,(word_FF8FAA).w
		rts

loc_15DA0:
		subq.b	#1,$38(a0)
		tst.b	$38(a0)
		bgt.s	loc_15E06
		move.w	#$3C,$3E(a0)
		move.w	#9,2(a0)
		move.b	#8,$26(a0)
		bset	#1,$D(a0)
		move.w	#7,$3E(a0)
		movem.l	a0-a6,-(sp)
		move.w	#7,(word_FFFC4A).w
		move.l	#word_17AEA,(dword_FFFC40).w
		move.l	#$45800002,(dword_FFFC44).w
		lea	(nemesis_enemy_tiles_31).l,a0
		move.w	(a0),d0
		andi.w	#$FFF,d0
		subq.w	#1,d0
		move.w	d0,(word_FFFC48).w
		lea	(dword_FF6000).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		movem.l	(sp)+,a0-a6
		rts

loc_15E06:
		move.b	#$FA,$27(a0)
		move.b	#3,$2C(a0)
		move.w	#7,2(a0)
		bset	#1,$D(a0)
		jsr	loc_B97A
		move.w	d7,(word_FF8FAA).w
		rts

sub_15E2A:
		tst.b	(byte_FFEEF3).w
		beq.s	loc_15E36
		bset	#0,$C(a0)

loc_15E36:
		jsr	sub_BC72
		move.l	#off_12232C,$20(a0)
		bset	#4,$E(a0)
		move.w	#$1E,$2A(a0)
		move.b	#5,$39(a0)
		move.b	#5,$38(a0)
		bset	#0,$36(a0)
		moveq	#1,d0
		jmp	sub_B83E

sub_15E6A:
		subq.w	#1,$2A(a0)
		bhi.s	loc_15E82
		addq.w	#1,2(a0)
		move.w	#$40,$2A(a0)
		move.l	#$FFFF0000,$1C(a0)

loc_15E82:
		jsr	loc_B97A
		move.w	d7,(word_FF8FAA).w
		rts

sub_15E8E:
		subq.w	#1,$2A(a0)
		bhi.s	loc_15EB0
		move.w	#$E,$2A(a0)
		clr.b	$2D(a0)
		moveq	#2,d0
		btst	#0,$36(a0)
		beq.s	loc_15EAA
		moveq	#3,d0

loc_15EAA:
		jmp	sub_B83E

loc_15EB0:
		jsr	sub_B88A
		jsr	sub_15D10(pc)
		jmp	sub_15D42

sub_15EC0:
		subq.w	#1,$2A(a0)
		bhi.s	loc_15ED8
		move.w	#$1E,$2A(a0)
		move.w	4(a0),d0
		addq.w	#2,d0
		jmp	sub_B83E

loc_15ED8:
		jsr	sub_15D10(pc)
		jmp	sub_15D42

sub_15EE2:
		subq.w	#1,$2A(a0)
		bhi.s	loc_15F54
		move.b	#$C9,(smps_cmd2).w
		move.w	#$80,$2A(a0)
		lea	(stru_1606E).l,a2
		btst	#0,$36(a0)
		beq.s	loc_15F08
		lea	(stru_16036).l,a2

loc_15F08:
		moveq	#3,d6

loc_15F0A:
		jsr	sub_EA3C
		bne.s	loc_15F42
		move.w	#$71,0.w(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	(a2)+,d0
		add.w	d0,$10(a1)
		move.w	(a2)+,d0
		add.w	d0,$14(a1)
		move.w	(a2)+,d0
		move.b	d0,$36(a1)
		move.l	(a2)+,$18(a1)
		move.l	(a2)+,$1C(a1)
		dbf	d6,loc_15F0A

loc_15F42:
		move.b	#4,$29(a0)
		move.w	4(a0),d0
		addq.w	#2,d0
		jmp	sub_B83E

loc_15F54:
		jsr	sub_15D10(pc)
		jmp	sub_15D42

sub_15F5E:
		subq.w	#1,$2A(a0)
		tst.b	$29(a0)
		bgt.s	loc_15F7E
		addq.w	#1,2(a0)
		move.w	#$1E,$2A(a0)
		jsr	loc_B97A
		move.w	d7,(word_FF8FAA).w
		rts

loc_15F7E:
		jsr	sub_15D10(pc)
		bra.w	sub_15D50

sub_15F86:
		subq.w	#1,$2A(a0)
		bhi.s	loc_15F7E
		subq.w	#4,2(a0)
		moveq	#0,d0
		move.b	$28(a0),d0
		addq.b	#1,$28(a0)
		andi.b	#7,d0
		add.w	d0,d0
		add.w	d0,d0
		jmp	loc_15FA6(pc,d0.w)

loc_15FA6:
		bra.w	loc_15FC6
		bra.w	loc_15FE6
		bra.w	loc_15FC6
		bra.w	loc_16004
		bra.w	loc_15FE6
		bra.w	loc_15FC6
		bra.w	loc_1601C
		bra.w	loc_15FE6

loc_15FC6:
		move.w	#$F0,$2A(a0)
		bclr	#0,$36(a0)
		clr.l	$1C(a0)
		move.l	#$FFFF0000,$18(a0)
		moveq	#1,d0
		jmp	loc_B842

loc_15FE6:
		move.w	#$F0,$2A(a0)
		bset	#0,$36(a0)
		clr.l	$1C(a0)
		move.l	#$10000,$18(a0)
		jmp	sub_B86E

loc_16004:
		move.w	#$20,$2A(a0)
		clr.l	$18(a0)
		move.l	#$FFFF0000,$1C(a0)
		jmp	sub_B86E

loc_1601C:
		move.w	#$20,$2A(a0)
		clr.l	$18(a0)
		move.l	#$10000,$1C(a0)
		moveq	#0,d0
		jmp	loc_B842

stru_16036:	struc_43 $FFF0, $FFD8,	6, $FFFF0000, $FFFF0000
		struc_43 $10, $FFD8, 7, $FFFF0000, $FFFF0000
		struc_43 $FFF0, $FFE0,	4, 0, $18000
		struc_43 $10, $FFE0, 1, 0, $18000
stru_1606E:	struc_43 $FFF0, $FFD8,	6, $10000, $FFFF0000
		struc_43 $10, $FFD8, 5, $10000, $FFFF0000
		struc_43 $FFF0, $FFE0,	4, 0, $18000
		struc_43 $10, $FFE0, 1, 0, $18000
sub_160A6:
		subq.b	#1,$27(a0)
		btst	#0,$27(a0)
		bhi.s	loc_160BE
		btst	#1,$27(a0)
		bne.s	loc_160BE
		neg.b	$2C(a0)

loc_160BE:
		tst.b	$27(a0)
		bhi.s	loc_160D4
		bclr	#1,$D(a0)
		move.w	#6,2(a0)
		clr.w	$2A(a0)

loc_160D4:
		move.w	#$FFFF,d0
		bsr.w	sub_16550
		bra.s	loc_160F4

sub_160DE:
		subq.b	#1,$27(a0)
		move.w	#$FFFF,d0
		bsr.w	sub_16550
		move.l	#$4000,d0
		bsr.w	sub_15C06

loc_160F4:
		tst.w	$3E(a0)
		beq.s	locret_16106
		subq.w	#1,$3E(a0)
		cmpi.w	#1,$3E(a0)
		beq.s	loc_16108

locret_16106:
		rts

loc_16108:
		addi.w	#$3E8,(word_FF8F7A).w
		move.b	#$95,(byte_FFEE76).w
		move.b	#$88,(smps_cmd1_new).w
		moveq	#$D,d1
		jsr	(sub_104E).l
		st	(byte_FFEEF3).w
		rts

sub_16128:
		jsr	sub_AB26
		subq.b	#1,$26(a0)
		bgt.s	locret_1614A
		moveq	#4,d7
		lea	(word_FF9000).w,a1

loc_1613A:
		bset	#0,byte_FF900C-word_FF9000(a1)
		lea	$40(a1),a1
		dbf	d7,loc_1613A
		bra.s	loc_16108

locret_1614A:
		rts

sub_1614C:
		lea	(off_16158).l,a1
		jmp	jump_by_table1	; a0 = ?

off_16158:	dc.w sub_161EE-off_16158
		dc.w sub_1621E-off_16158
		dc.w sub_16262-off_16158
		dc.w sub_16460-off_16158
		dc.w sub_1621E-off_16158
		dc.w sub_164E0-off_16158
		dc.w sub_16532-off_16158
sub_16166:
		move.w	$10(a0),d0
		move.w	$14(a0),d1
		cmpi.w	#$FFE0,d0
		ble.s	loc_1618A
		cmpi.w	#$220,d0
		bge.s	loc_1618A
		cmpi.w	#$FFE0,d1
		ble.s	loc_1618A
		cmpi.w	#$120,d1
		bge.s	loc_1618A
		moveq	#0,d0
		rts

loc_1618A:
		moveq	#1,d0
		rts

sub_1618E:
		cmpi.w	#8,(word_FF9002).l
		beq.s	loc_161D4
		jsr	sub_B9B8
		beq.s	loc_161E8
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_161B4
		subq.b	#1,$39(a0)
		tst.b	$39(a0)
		ble.s	loc_161D4

loc_161B4:
		move.b	#$FA,$27(a0)
		move.w	2(a0),$2A(a0)
		move.b	#3,$2C(a0)
		move.w	#5,2(a0)
		bset	#1,$D(a0)
		rts

loc_161D4:
		move.w	#6,2(a0)
		move.l	#$FFFE0000,$1C(a0)
		bset	#1,$D(a0)

loc_161E8:
		jmp	sub_B960

sub_161EE:
		jsr	sub_BC72
		move.l	#off_122468,$20(a0)
		bset	#7,$C(a0)
		move.b	#1,$39(a0)
		btst	#0,$36(a0)
		bne.s	loc_16216
		jmp	sub_B852

loc_16216:
		moveq	#1,d0
		jmp	sub_B83E

sub_1621E:
		cmpi.w	#2,6(a0)
		blt.s	locret_16242
		cmpi.b	#7,8(a0)
		blt.s	locret_16242
		cmpi.w	#4,2(a0)
		bne.s	loc_16244
		subq.b	#1,(byte_FF9029).l
		bset	#0,$C(a0)

locret_16242:
		rts

loc_16244:
		bclr	#3,$D(a0)
		move.b	#$B4,$28(a0)
		move.b	#$A,$26(a0)
		moveq	#2,d0
		add.w	4(a0),d0
		jmp	sub_B83E

sub_16262:
		subq.b	#1,$26(a0)
		bhi.w	loc_16276
		move.b	#8,$26(a0)
		move.b	#$C5,(smps_cmd2).w

loc_16276:
		jsr	sub_16166(pc)
		beq.s	loc_1628A
		subq.b	#1,(byte_FF9029).l
		bset	#0,$C(a0)
		rts

loc_1628A:
		subq.b	#1,$28(a0)
		bne.s	loc_162C8
		addq.w	#1,2(a0)
		move.w	(word_FF9010).l,d0
		move.w	(dword_FF9014).l,d1
		subi.w	#$20,d1
		move.w	$10(a0),d4
		move.w	$14(a0),d5
		bsr.w	sub_EAB6
		move.w	#$200,d3
		bsr.w	sub_EB3C
		move.l	d0,$18(a0)
		move.l	d1,$1C(a0)
		move.b	#$3C,$28(a0)
		rts

loc_162C8:
		subq.b	#1,$26(a0)
		bne.s	loc_162E4
		move.b	#$A,$26(a0)
		jsr	rand
		move.b	d0,$29(a0)
		jmp	sub_B960

loc_162E4:
		btst	#2,$36(a0)
		beq.s	loc_1630A
		move.w	(player_pos_y).w,d0
		subi.w	#$60,d0
		cmp.w	$14(a0),d0
		bgt.w	loc_16400
		addi.w	#$28,d0
		cmp.w	$14(a0),d0
		blt.w	loc_163E0
		bra.s	loc_16326

loc_1630A:
		move.w	(player_pos_y).w,d0
		subi.w	#$40,d0
		cmp.w	$14(a0),d0
		bgt.w	loc_16400
		addi.w	#$20,d0
		cmp.w	$14(a0),d0
		blt.w	loc_163E0

loc_16326:
		btst	#1,$29(a0)
		bne.w	loc_163E0
		bra.w	loc_16400

loc_16334:
		btst	#2,$36(a0)
		bne.s	loc_1635A
		move.w	(player_pos_x).w,d0
		subi.w	#$50,d0
		cmp.w	$10(a0),d0
		bgt.w	loc_16440
		addi.w	#$A0,d0
		cmp.w	$10(a0),d0
		blt.w	loc_16420
		bra.s	loc_1639C

loc_1635A:
		btst	#1,$36(a0)
		bne.s	loc_16380
		move.w	(player_pos_x).w,d0
		addi.w	#$30,d0
		cmp.w	$10(a0),d0
		bgt.w	loc_16440
		addi.w	#$40,d0
		cmp.w	$10(a0),d0
		blt.w	loc_16420
		bra.s	loc_1639C

loc_16380:
		move.w	(player_pos_x).w,d0
		subi.w	#$70,d0
		cmp.w	$10(a0),d0
		bgt.w	loc_16440
		addi.w	#$40,d0
		cmp.w	$10(a0),d0
		blt.w	loc_16420

loc_1639C:
		btst	#0,$29(a0)
		bne.w	loc_16440
		bra.s	loc_16420

loc_163A8:
		tst.l	$18(a0)
		bgt.s	loc_163C8
		cmpi.w	#3,4(a0)
		beq.s	loc_163BE
		moveq	#3,d0
		jsr	loc_B842

loc_163BE:
		jsr	sub_B88A
		bra.w	sub_1618E

loc_163C8:
		cmpi.w	#2,4(a0)
		beq.s	loc_163BE
		jsr	sub_B872
		jsr	sub_B88A
		bra.w	sub_1618E

loc_163E0:
		move.l	$1C(a0),d0
		addi.l	#-$2000,d0
		cmpi.l	#$FFFE0000,d0
		bge.s	loc_163F8
		move.l	#$FFFE0000,d0

loc_163F8:
		move.l	d0,$1C(a0)
		bra.w	loc_16334

loc_16400:
		move.l	$1C(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$20000,d0
		ble.s	loc_16418
		move.l	#$20000,d0

loc_16418:
		move.l	d0,$1C(a0)
		bra.w	loc_16334

loc_16420:
		move.l	$18(a0),d0
		addi.l	#-$2000,d0
		cmpi.l	#$FFFD0000,d0
		bge.s	loc_16438
		move.l	#$FFFD0000,d0

loc_16438:
		move.l	d0,$18(a0)
		bra.w	loc_163A8

loc_16440:
		move.l	$18(a0),d0
		addi.l	#$2000,d0
		cmpi.l	#$30000,d0
		ble.s	loc_16458
		move.l	#$30000,d0

loc_16458:
		move.l	d0,$18(a0)
		bra.w	loc_163A8

sub_16460:
		subq.b	#1,$26(a0)
		bhi.s	loc_16472
		move.b	#8,$26(a0)
		move.b	#$C5,(smps_cmd2).w

loc_16472:
		subq.b	#1,$28(a0)
		beq.s	loc_164AA
		jsr	sub_B88A
		move.w	(word_FF9010).l,d0
		sub.w	$10(a0),d0
		cmpi.w	#$18,d0
		bgt.s	loc_164B0
		cmpi.w	#$FFE8,d0
		blt.s	loc_164B0
		move.w	(dword_FF9014).l,d0
		sub.w	$14(a0),d0
		cmpi.w	#$30,d0
		bgt.s	loc_164B0
		cmpi.w	#$28,d0
		blt.s	loc_164B0

loc_164AA:
		jmp	sub_B85A

loc_164B0:
		tst.l	$18(a0)
		bgt.s	loc_164CC
		cmpi.w	#3,4(a0)
		beq.w	sub_1618E
		moveq	#3,d0
		jsr	loc_B842
		bra.w	sub_1618E

loc_164CC:
		cmpi.w	#2,4(a0)
		beq.w	sub_1618E
		jsr	sub_B872
		bra.w	sub_1618E

sub_164E0:
		subq.b	#1,$28(a0)
		bne.s	loc_164FE
		move.w	#4,2(a0)
		bclr	#1,$D(a0)
		bset	#4,$E(a0)
		jmp	sub_B876

loc_164FE:
		subq.b	#1,$27(a0)
		btst	#0,$27(a0)
		bne.s	loc_16516
		btst	#1,$27(a0)
		bne.s	loc_16516
		neg.b	$2C(a0)

loc_16516:
		tst.b	$27(a0)
		bne.w	locret_16530
		move.w	$2A(a0),2(a0)
		bclr	#1,$D(a0)
		jmp	sub_B960

locret_16530:
		rts

sub_16532:
		move.l	#$4000,d0
		bsr.w	sub_15C06
		jsr	sub_16166(pc)
		beq.s	locret_1654E
		bset	#0,$C(a0)
		subq.b	#1,(byte_FF9029).l

locret_1654E:
		rts

sub_16550:
		move.b	#1,(cram_update_needed).w
		lea	(ram_palette_1).w,a2
		move.b	$27(a0),d1
		andi.b	#1,d1
		bne.s	loc_16572
		lea	(unk_FFF620).w,a1
		moveq	#7,d7

loc_1656A:
		move.l	(a1)+,(a2)+
		dbf	d7,loc_1656A
		rts

loc_16572:
		moveq	#$F,d7

loc_16574:
		btst	#0,d0
		beq.s	loc_1657E
		move.w	#$EEE,(a2)

loc_1657E:
		lsr.w	#1,d0
		lea	2(a2),a2
		dbf	d7,loc_16574
		rts
; a0 = ?
; a1 = funcs table

jump_by_table3:
		move.w	$3E(a0),d0

jump_by_table4:
		add.w	d0,d0		; a0 = ?
		move.w	(a1,d0.w),d0
		jmp	(a1,d0.w)

sub_16598:
		addq.w	#1,$3E(a0)
		jmp	loc_B842

sub_165A2:
		jsr	sub_16C5A(pc)
		tst.b	$34(a0)
		bne.s	loc_165D2
		cmpi.w	#7,2(a0)
		bcc.s	loc_165D2
		cmpi.w	#$68,$14(a0)
		bcs.s	loc_165D2
		jsr	loc_B97A
		beq.s	loc_165D2
		cmpi.w	#6,2(a0)
		bne.s	loc_165D2
		move.w	#1,(word_FF8FAA).w

loc_165D2:
		lea	(off_165E2).l,a1
		jsr	jump_by_table1	; a0 = ?
		jmp	sub_16CE0(pc)

off_165E2:	dc.w sub_165F6-off_165E2
		dc.w sub_16638-off_165E2
		dc.w sub_1666E-off_165E2
		dc.w sub_16868-off_165E2
		dc.w sub_168E8-off_165E2
		dc.w sub_1692A-off_165E2
		dc.w sub_169FC-off_165E2
		dc.w sub_16B40-off_165E2
		dc.w sub_16BA8-off_165E2
		dc.w sub_16C4A-off_165E2
sub_165F6:
		move.w	#$118,$10(a0)
		move.w	#$C0,$14(a0)
		move.w	#$83C0,$A(a0)
		move.l	#off_1245AE,$20(a0)
		move.b	#6,$38(a0)
		move.w	#8,2(a0)
		tst.b	(byte_FFEEEE).w
		beq.s	loc_16630
		bset	#0,$C(a0)
		moveq	#2,d0
		jsr	sub_82AA

loc_16630:
		moveq	#1,d0
		jmp	sub_B83E

sub_16638:
		jsr	rand
		andi.w	#3,d0
		add.w	d0,d0
		move.b	byte_16666(pc,d0.w),3(a0)
		move.b	byte_16666+1(pc,d0.w),$26(a0)
		clr.w	$3E(a0)
		move.l	#$280000,$10(a0)
		move.l	#$C00000,$14(a0)
		rts

byte_16666:	dc.b 2,	1, 4, 1, 3, 3, 4, 1
sub_1666E:
		lea	off_16680(pc),a1

loc_16672:
		jsr	sub_B88A	; a0 = ?
		jsr	jump_by_table3(pc) ; a0	= ?
		jmp	sub_16CFC(pc)

off_16680:	dc.w sub_16694-off_16680
		dc.w sub_166E4-off_16680
		dc.w sub_1673E-off_16680
		dc.w sub_16788-off_16680
		dc.w sub_16794-off_16680
		dc.w sub_167DC-off_16680
		dc.w sub_167F6-off_16680
		dc.w sub_16808-off_16680
		dc.w sub_167F6-off_16680
		dc.w sub_16856-off_16680
sub_16694:
		lea	stru_166D4(pc),a1
		cmpi.b	#4,$26(a0)
		bcs.s	loc_166A4	; a1 = ?
		lea	stru_166DC(pc),a1

loc_166A4:
		move.l	(a1)+,$1C(a0)
		move.l	(a1),d0
		moveq	#$20,d1
		btst	#0,$26(a0)
		beq.s	loc_166B8
		neg.l	d0
		neg.w	d1

loc_166B8:
		move.l	d0,$18(a0)
		sub.w	d1,$10(a0)
		bset	#1,$D(a0)
		move.w	4(a0),d0
		andi.w	#1,d0
		addq.w	#4,d0
		jmp	sub_16598(pc)

stru_166D4:	struc_57 $FFFC7880, $FFFD9400
stru_166DC:	struc_57 $FFFD4900, $FFFCE800
sub_166E4:
		addi.l	#$1C80,$1C(a0)
		bmi.s	loc_166F4
		bset	#0,7(a0)

loc_166F4:
		moveq	#$FFFFFFFC,d1
		moveq	#$18,d2
		tst.w	$18(a0)
		bpl.s	loc_16700
		moveq	#$FFFFFFE8,d2

loc_16700:
		jsr	sub_BAF6
		beq.s	locret_1673C
		move.b	#8,$27(a0)
		andi.w	#$FFF0,$14(a0)
		clr.l	$1C(a0)
		move.l	$18(a0),d0
		asr.l	#1,d0
		move.l	d0,$18(a0)
		move.w	#$17,$28(a0)
		bclr	#1,$D(a0)
		move.w	4(a0),d0
		andi.w	#1,d0
		addq.w	#6,d0
		jmp	sub_16598(pc)

locret_1673C:
		rts

sub_1673E:
		clr.w	(dword_FF8F86+2).w
		move.b	$27(a0),d0
		beq.s	loc_1675A
		subq.b	#1,$27(a0)
		moveq	#6,d1
		btst	#0,d0
		beq.s	loc_16756
		neg.w	d1

loc_16756:
		move.w	d1,(dword_FF8F86+2).w

loc_1675A:
		subq.w	#1,$28(a0)
		bne.s	locret_1673C
		moveq	#$FFFFFFF0,d0
		tst.w	$18(a0)
		bmi.s	loc_1676A
		moveq	#$10,d0

loc_1676A:
		add.w	d0,$10(a0)
		move.w	#8,$28(a0)
		clr.l	$18(a0)
		move.w	4(a0),d0
		andi.w	#1,d0
		bchg	#0,d0
		jmp	sub_16598(pc)

sub_16788:
		subq.w	#1,$28(a0)
		bne.s	locret_16792
		addq.w	#1,$3E(a0)

locret_16792:
		rts

sub_16794:
		addq.b	#1,$26(a0)
		moveq	#0,d0
		move.b	$26(a0),d0
		lea	off_167A6(pc),a1
		jmp	jump_by_table4(pc) ; a0	= ?

off_167A6:	dc.w sub_167D6-off_167A6
		dc.w sub_167D6-off_167A6
		dc.w sub_167D6-off_167A6
		dc.w sub_167C2-off_167A6
		dc.w sub_167C2-off_167A6
		dc.w sub_167D6-off_167A6
		dc.w sub_167D6-off_167A6
		dc.w sub_167C2-off_167A6
		dc.w sub_167BA-off_167A6
		dc.w sub_167BA-off_167A6
sub_167BA:
		move.w	#1,2(a0)
		rts

sub_167C2:
		bclr	#1,$D(a0)
		move.w	4(a0),d0
		andi.w	#1,d0
		addq.w	#2,d0
		jmp	sub_16598(pc)

sub_167D6:
		clr.w	$3E(a0)
		rts

sub_167DC:
		cmpi.w	#1,6(a0)
		bne.s	locret_167F4
		move.w	#$14,$28(a0)
		bset	#1,$D(a0)
		addq.w	#1,$3E(a0)

locret_167F4:
		rts

sub_167F6:
		subq.w	#1,$28(a0)
		bne.s	locret_167F4
		bclr	#1,$D(a0)
		addq.w	#1,$3E(a0)
		rts

sub_16808:
		cmpi.w	#5,6(a0)
		bne.s	locret_167F4
		clr.l	(dword_FFFC86).w
		clr.l	(dword_FFFC8A).w
		move.w	#$5A,$28(a0)
		bset	#1,$D(a0)
		addq.w	#1,$3E(a0)

loc_16828:
		jsr	sub_EA3C
		move.w	#$9B,0.w(a1)
		move.w	#5,2(a1)
		move.w	$A(a0),$A(a1)
		move.l	#off_124732,$20(a1)
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		rts

sub_16856:
		tst.w	6(a0)
		bne.s	locret_167F4
		addq.b	#1,$26(a0)
		move.w	#4,$3E(a0)
		rts

sub_16868:
		lea	off_16870(pc),a1
		jmp	loc_16672(pc)	; a0 = ?

off_16870:	dc.w sub_16694-off_16870
		dc.w sub_166E4-off_16870
		dc.w sub_1673E-off_16870
		dc.w sub_16788-off_16870
		dc.w sub_1689E-off_16870
		dc.w sub_166E4-off_16870
		dc.w sub_1673E-off_16870
		dc.w sub_16788-off_16870
		dc.w sub_168B4-off_16870
		dc.w sub_167DC-off_16870
		dc.w sub_167F6-off_16870
		dc.w sub_16808-off_16870
		dc.w sub_167F6-off_16870
		dc.w sub_168BE-off_16870
		dc.w sub_168CA-off_16870
		dc.w sub_166E4-off_16870
		dc.w sub_1673E-off_16870
		dc.w sub_16788-off_16870
		dc.w sub_168E0-off_16870
		dc.w sub_166E4-off_16870
		dc.w sub_1673E-off_16870
		dc.w sub_16788-off_16870
		dc.w sub_167BA-off_16870
sub_1689E:
		move.b	#4,$26(a0)
		lea	stru_168AC(pc),a1
		jmp	loc_166A4(pc)	; a1 = ?

stru_168AC:	struc_57 $FFFA8000, $FFFE2880
sub_168B4:
		move.b	#2,$26(a0)
		jmp	sub_16794(pc)

sub_168BE:
		tst.w	6(a0)
		bne.s	locret_168C8
		addq.w	#1,$3E(a0)

locret_168C8:
		rts

sub_168CA:
		move.b	#5,$26(a0)
		lea	stru_168D8(pc),a1
		jmp	loc_166A4(pc)	; a1 = ?

stru_168D8:	struc_57 $FFFEA880, $FFFDC000
sub_168E0:
		clr.b	$26(a0)
		jmp	sub_16694(pc)

sub_168E8:
		lea	off_168F0(pc),a1
		jmp	loc_16672(pc)	; a0 = ?

off_168F0:	dc.w sub_1690E-off_168F0
		dc.w sub_166E4-off_168F0
		dc.w sub_1673E-off_168F0
		dc.w sub_16788-off_168F0
		dc.w sub_168B4-off_168F0
		dc.w sub_167DC-off_168F0
		dc.w sub_167F6-off_168F0
		dc.w sub_16808-off_168F0
		dc.w sub_167F6-off_168F0
		dc.w sub_168BE-off_168F0
		dc.w sub_16916-off_168F0
		dc.w sub_166E4-off_168F0
		dc.w sub_1673E-off_168F0
		dc.w sub_16788-off_168F0
		dc.w sub_167BA-off_168F0
sub_1690E:
		lea	stru_168AC(pc),a1
		jmp	loc_166A4(pc)	; a1 = ?

sub_16916:
		clr.b	$26(a0)
		lea	stru_16922(pc),a1
		jmp	loc_166A4(pc)	; a1 = ?

stru_16922:	struc_57 $FFFEA880, $FFFE0000
sub_1692A:
		lea	off_16932(pc),a1
		jmp	jump_by_table3(pc) ; a0	= ?

off_16932:	dc.w sub_16938-off_16932
		dc.w sub_1696A-off_16932
		dc.w sub_16990-off_16932
sub_16938:
		moveq	#$30,d0
		cmpi.w	#4,(word_FF9002).w
		bne.s	loc_16944
		neg.w	d0

loc_16944:
		add.w	d0,$10(a0)
		addi.w	#-$22,$14(a0)
		move.w	(word_FF9006).w,d0
		andi.b	#1,d0
		move.w	d0,6(a0)
		move.w	#$808,$28(a0)
		addq.w	#1,$3E(a0)
		bset	#7,$C(a0)

sub_1696A:
		subq.b	#1,$28(a0)
		bne.s	locret_16982
		cmpi.w	#6,4(a0)
		bcc.s	loc_16984
		move.b	$29(a0),$28(a0)
		addq.w	#2,4(a0)

locret_16982:
		rts

loc_16984:
		addq.w	#1,$3E(a0)
		move.b	#1,$28(a0)
		rts

sub_16990:
		subq.b	#1,$28(a0)
		bne.s	locret_16982
		moveq	#$C,d0
		lea	byte_169EA(pc),a2
		cmpi.w	#2,(word_FF9002).w
		bne.s	loc_169AA
		moveq	#5,d0
		lea	byte_169F6(pc),a2

loc_169AA:
		cmp.b	$26(a0),d0
		beq.s	loc_169E2
		move.b	#4,$28(a0)
		jsr	loc_16828(pc)
		move.w	#6,2(a1)
		moveq	#0,d1
		move.b	$26(a0),d1
		move.b	(a2,d1.w),d1
		addq.b	#1,$26(a0)
		move.w	4(a0),d0
		andi.w	#1,d0
		add.w	d1,d0
		move.w	d0,4(a1)
		move.w	d0,4(a0)
		rts

loc_169E2:
		bset	#0,$C(a0)
		rts

byte_169EA:	dc.b 6,	6, 6, 4, 4, 4, 2, 2, 2,	0, 0, 0
byte_169F6:	dc.b 6,	4, 4, 2, 0, 0
sub_169FC:
		jsr	sub_B88A
		lea	off_16A0A(pc),a1
		jmp	jump_by_table3(pc) ; a0	= ?

off_16A0A:	dc.w sub_16A12-off_16A0A
		dc.w loc_16A48-off_16A0A
		dc.w loc_16AB0-off_16A0A
		dc.w sub_16AF4-off_16A0A
sub_16A12:
		move.b	#$CC,(smps_cmd2).w
		move.b	#5,$26(a0)
		addq.w	#1,$3E(a0)
		move.w	#5,$1C(a0)
		cmpi.w	#2,(word_FF9002).w
		bne.s	loc_16A38
		move.l	#$2800,$1C(a0)

loc_16A38:
		moveq	#4,d1
		cmpi.w	#4,(word_FF9002).w
		bne.s	loc_16A44
		neg.w	d1

loc_16A44:
		move.w	d1,$18(a0)

loc_16A48:
		subq.b	#1,$26(a0)
		bne.w	loc_16AB0
		addq.w	#1,$3E(a0)
		cmpi.w	#2,(word_FF9002).w
		beq.w	loc_16AB0
		tst.l	(dword_FFFC86).w
		bne.s	loc_16AA4
		move.w	(player_pos_x).w,d2
		move.l	$18(a0),d0
		move.l	$1C(a0),d1
		cmpi.w	#$60,d2
		bcs.s	loc_16A9C
		cmpi.w	#$E0,d2
		bcc.s	loc_16A9C
		move.w	(player_pos_x).w,d0
		move.w	(player_pos_y).w,d1
		addi.w	#$50,d1
		move.w	$10(a0),d4
		move.w	$14(a0),d5
		jsr	sub_EAB6(pc)
		move.w	#$400,d3
		jsr	sub_EB3C(pc)

loc_16A9C:
		move.l	d0,(dword_FFFC86).w
		move.l	d1,(dword_FFFC8A).w

loc_16AA4:
		move.l	(dword_FFFC86).w,$18(a0)
		move.l	(dword_FFFC8A).w,$1C(a0)

loc_16AB0:
		cmpi.w	#$70,$14(a0)
		bcs.s	loc_16ACC
		moveq	#$10,d1
		moveq	#$18,d2
		tst.w	$18(a0)
		bpl.s	loc_16AC4
		neg.w	d2

loc_16AC4:
		jsr	sub_BAF6
		bne.s	loc_16AE0

loc_16ACC:
		move.l	#$2800,d0
		tst.w	$18(a0)
		bpl.s	loc_16ADA
		neg.l	d0

loc_16ADA:
		add.l	d0,$18(a0)
		rts

loc_16AE0:
		clr.l	$18(a0)
		clr.l	$1C(a0)
		addq.w	#1,$3E(a0)
		move.b	#$C,$26(a0)
		rts

sub_16AF4:
		subq.b	#1,$26(a0)
		bne.s	locret_16B3E
		move.w	(player_pos_x).w,d1
		move.w	$10(a0),d0
		addi.w	#-$28,d0
		cmp.w	d1,d0
		bcc.s	loc_16B12
		addi.w	#$50,d0
		cmp.w	d1,d0
		bcc.s	loc_16B38

loc_16B12:
		jsr	sub_EA3C
		move.w	$10(a0),$10(a1)
		move.w	$14(a0),$14(a1)
		move.w	#$9C,0.w(a1)
		move.w	#$83C0,$A(a1)
		move.l	#off_1247EA,$20(a1)

loc_16B38:
		bset	#0,$C(a0)

locret_16B3E:
		rts

sub_16B40:
		move.b	$34(a0),d0
		andi.b	#$7F,d0
		subq.b	#1,d0
		beq.s	loc_16B6E
		ori.b	#$80,d0
		move.b	d0,$34(a0)
		andi.b	#3,d0
		bne.s	loc_16B6A
		moveq	#4,d1
		btst	#2,$34(a0)
		bne.s	loc_16B66
		neg.w	d1

loc_16B66:
		add.w	d1,$10(a0)

loc_16B6A:
		jmp	loc_16C72(pc)

loc_16B6E:
		bset	#4,$E(a0)
		tst.b	$38(a0)
		beq.s	loc_16B94
		move.b	$37(a0),3(a0)
		bclr	#7,3(a0)
		beq.s	loc_16B8E
		bset	#1,$D(a0)

loc_16B8E:
		clr.b	$34(a0)
		rts

loc_16B94:
		move.w	#8,2(a0)
		clr.l	$18(a0)
		clr.l	$1C(a0)
		clr.w	$3E(a0)
		rts

sub_16BA8:
		jsr	sub_B88A
		lea	off_16BB6(pc),a1
		jmp	jump_by_table3(pc) ; a0	= ?

off_16BB6:	dc.w sub_16BBC-off_16BB6
		dc.w sub_16BEA-off_16BB6
		dc.w sub_16C02-off_16BB6
sub_16BBC:
		move.b	#$CD,(smps_cmd2).w
		cmpi.w	#$C0,$14(a0)
		bcc.s	loc_16BD4
		addi.l	#$1800,$1C(a0)
		rts

loc_16BD4:
		move.b	#$3C,$28(a0)
		clr.l	$1C(a0)
		move.w	4(a0),d0
		andi.w	#1,d0
		jmp	sub_16598(pc)

sub_16BEA:
		subq.b	#1,$28(a0)
		bne.s	locret_16C00
		move.b	#8,$2A(a0)
		move.w	#$A0A,$28(a0)
		addq.w	#1,$3E(a0)

locret_16C00:
		rts

sub_16C02:
		subq.b	#1,$28(a0)
		bne.s	locret_16C26
		bchg	#2,$D(a0)
		move.b	$29(a0),$28(a0)
		subq.b	#1,$2A(a0)
		bne.s	locret_16C26
		move.b	#8,$2A(a0)
		subq.b	#1,$29(a0)
		beq.s	loc_16C28

locret_16C26:
		rts

loc_16C28:
		bset	#0,$C(a0)
		move.b	#$95,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		addi.w	#$3E8,(word_FF8F7A).w
		moveq	#2,d0
		jsr	sub_82AA
		rts

sub_16C4A:
		cmpi.w	#$70,(player_pos_x).w
		bcs.s	locret_16C58
		move.w	#2,2(a0)

locret_16C58:
		rts

sub_16C5A:
		cmpi.w	#5,2(a0)
		bcc.s	locret_16C9E
		bclr	#4,$E(a0)
		move.b	$34(a0),d0
		beq.s	locret_16C9E
		subq.b	#1,$34(a0)

loc_16C72:
		lea	word_16CA0(pc),a1
		btst	#0,d0
		beq.s	loc_16C80
		lea	word_16CC0(pc),a1

loc_16C80:
		move.b	#1,(cram_update_needed).w
		lea	(ram_palette_1).w,a2
		jsr	copy_bytes_to_dest_32 ;	a1 = source
		tst.b	$34(a0)
		bne.s	locret_16C9E
		tst.b	$38(a0)
		beq.w	loc_16B94

locret_16C9E:
		rts

word_16CA0:	dc.w $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE
		dc.w $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE
word_16CC0:	dc.w $A22, $EEE, $4AE, $28E, $26A, $ACC, $6AA, $488
		dc.w $266, $248, $24C, $24E, $EEC, $CCA, $886, $222
sub_16CE0:
		moveq	#$28,d0
		cmp.w	$10(a0),d0
		bcc.s	loc_16CF2
		move.w	#$118,d0
		cmp.w	$10(a0),d0
		bcc.s	locret_16CFA

loc_16CF2:
		move.w	d0,$10(a0)
		clr.w	$12(a0)

locret_16CFA:
		rts

sub_16CFC:
		tst.b	$34(a0)
		bne.s	locret_16D2C
		move.w	4(a0),d0
		andi.w	#$E,d0
		cmpi.w	#2,d0
		beq.s	locret_16D2C
		jsr	sub_B9B8
		beq.s	locret_16D2C
		subq.b	#1,$38(a0)
		move.w	a0,$30(a1)
		move.b	$F(a0),d0
		bpl.s	loc_16D2E
		move.b	#$28,$34(a0)

locret_16D2C:
		rts

loc_16D2E:
		move.b	3(a0),$37(a0)
		move.w	#7,2(a0)
		move.b	#$FB,$34(a0)
		bset	#1,$D(a0)
		beq.s	locret_16D4E
		bset	#7,$37(a0)

locret_16D4E:
		rts

sub_16D50:
		bsr.s	sub_16D6E
		jsr	sub_B88A
		lea	(off_16D64).l,a1
		jmp	jump_by_table1	; a0 = ?

off_16D64:	dc.w sub_16DA6-off_16D64
		dc.w sub_16DD0-off_16D64
		dc.w sub_16DF2-off_16D64
		dc.w sub_16E08-off_16D64
		dc.w sub_16E2C-off_16D64
sub_16D6E:
		cmpi.w	#3,2(a0)
		bcc.s	locret_16D86
		jsr	loc_BA02
		bne.s	loc_16D88
		jsr	loc_B97A
		bne.s	loc_16D9E

locret_16D86:
		rts

loc_16D88:
		tst.b	$F(a0)
		bmi.s	loc_16D9E
		move.w	a1,$36(a0)
		move.w	#3,2(a0)
		clr.l	$1C(a0)
		rts

loc_16D9E:
		bset	#0,$C(a0)
		rts

sub_16DA6:
		addq.w	#1,2(a0)
		moveq	#2,d0
		move.w	(player_pos_x).w,d1
		cmp.w	$10(a0),d1
		bcs.s	loc_16DB8
		neg.w	d0

loc_16DB8:
		moveq	#0,d1
		move.w	d0,$36(a0)
		bpl.s	loc_16DC2
		moveq	#1,d1

loc_16DC2:
		move.w	d1,4(a0)
		move.w	#2,$1C(a0)
		add.w	d0,$10(a0)

sub_16DD0:
		moveq	#0,d1
		moveq	#0,d2
		jsr	sub_BAF6
		beq.s	locret_16DF0
		move.w	#$C0,$14(a0)
		move.w	$36(a0),$18(a0)
		clr.l	$1C(a0)
		addq.w	#1,2(a0)

locret_16DF0:
		rts

sub_16DF2:
		moveq	#$FFFFFFF8,d1
		moveq	#$10,d2
		tst.w	$18(a0)
		bpl.s	loc_16DFE
		moveq	#$FFFFFFF0,d2

loc_16DFE:
		jsr	sub_BAF6
		bne.s	loc_16D9E
		rts

sub_16E08:
		movea.w	$36(a0),a1
		move.l	$18(a1),$18(a0)
		bsr.s	sub_16DF2
		bclr	#0,$C(a0)
		beq.s	locret_16E2A
		addq.w	#1,2(a0)
		clr.l	$18(a0)
		move.b	#$A,$38(a0)

locret_16E2A:
		rts

sub_16E2C:
		subq.b	#1,$38(a0)
		beq.w	loc_16D9E
		rts

sub_16E36:
		lea	(off_16E42).l,a1
		jmp	jump_by_table1	; a0 = ?

off_16E42:	dc.w sub_16E4A-off_16E42
		dc.w sub_16F06-off_16E42
		dc.w sub_17218-off_16E42
		dc.w sub_172BA-off_16E42
sub_16E4A:
		jsr	sub_BC72
		move.l	#off_125992,$20(a0)
		move.w	#$98,$10(a0)
		move.w	#$220,$14(a0)
		bset	#4,$C(a0)
		move.w	#0,4(a0)
		bset	#1,$D(a0)
		bclr	#4,$E(a0)
		bset	#1,$E(a0)
		jsr	sub_B852
		lea	(word_FF90C0).l,a1
		bset	#4,byte_FF90CC-word_FF90C0(a1)
		move.w	#$81,0.w(a1)
		lea	(word_FF9100).l,a1
		move.w	#$98,word_FF9110-word_FF9100(a1)
		move.w	#$230,$14(a1)
		bset	#4,$C(a1)
		move.w	#$82,0.w(a1)
		bset	#4,$E(a1)
		move.w	#2,d0
		lea	(word_FF9100).l,a1

loc_16EC8:
		adda.l	#(word_FF9140-word_FF9100),a1
		move.l	#$10000,$10(a1)
		move.l	#$10000,$14(a1)
		clr.b	$3A(a1)
		bset	#4,$C(a1)
		move.w	#$82,0.w(a1)
		bset	#4,$E(a1)
		dbf	d0,loc_16EC8
		move.w	#3,2(a0)
		move.w	#$258,$26(a0)
		rts

sub_16F06:
		tst.w	(word_FF90E6).l
		beq.w	loc_16F12
		rts

loc_16F12:
		jsr	sub_171DC
		beq.s	loc_16F24
		move.w	#2,2(a0)
		bra.w	loc_1702A

loc_16F24:
		jsr	sub_170E2
		move.l	d0,d6
		jsr	rand
		andi.w	#$FFFF,d0
		cmpi.w	#$FF00,d0
		bls.s	loc_16F52
		andi.w	#6,d0
		move.w	word_16F4A(pc,d0.w),d4
		move.w	d4,$3C(a0)
		bra.s	loc_16F5E
word_16F4A:	dc.w $101, $201, $102, $202

loc_16F52:
		move.w	$3C(a0),d0
		bne.s	loc_16F5E
		jsr	sub_17038

loc_16F5E:
		jsr	sub_17086
		move.b	$3D(a0),d1
		move.b	$3F(a0),d2
		cmp.b	d1,d2
		beq.w	loc_16FD6
		move.b	$3C(a0),d1
		move.b	$3E(a0),d2
		bne.s	loc_16F94
		cmpi.b	#1,d1
		beq.s	loc_16F8A
		cmpi.w	#$178,$10(a0)
		bra.s	loc_16F90

loc_16F8A:
		cmpi.w	#$98,$10(a0)

loc_16F90:
		bmi.s	loc_16FE6
		bra.s	loc_16FF6

loc_16F94:
		move.b	$3D(a0),d1
		andi.w	#$FF,d1
		cmpi.b	#4,d1
		bne.s	loc_16FBC
		cmpi.b	#2,$3E(a0)
		beq.s	loc_16FBC
		move.w	(word_16FD4).l,d0
		cmp.w	$14(a0),d0
		beq.w	loc_16FE6
		move.w	#5,d1

loc_16FBC:
		add.w	d1,d1
		move.w	word_16FCA(pc,d1.w),d0
		cmp.w	$14(a0),d0
		bge.s	loc_17006
		bra.s	loc_17016
word_16FCA:	dc.w 0,	$170, $E0, $B0,	$130
word_16FD4:	dc.w $E0

loc_16FD6:
		clr.w	$3C(a0)
		move.w	(player_pos_x).w,d0
		cmp.w	$10(a0),d0
		bge.s	loc_16FE6
		bra.s	loc_16FF6

loc_16FE6:
		btst	#0,d6
		beq.s	loc_17026
		addi.l	#$10000,$10(a0)
		bra.s	loc_1702A

loc_16FF6:
		btst	#1,d6
		beq.s	loc_17026
		subi.l	#$10000,$10(a0)
		bra.s	loc_1702A

loc_17006:
		btst	#3,d6
		beq.s	loc_17026
		addi.l	#$10000,$14(a0)
		bra.s	loc_1702A

loc_17016:
		btst	#2,d6
		beq.s	loc_17026
		subi.l	#$10000,$14(a0)
		bra.s	loc_1702A

loc_17026:
		clr.w	$3C(a0)

loc_1702A:
		jsr	sub_18686
		jsr	sub_17CBE
		rts

sub_17038:
		moveq	#0,d0
		move.w	(player_pos_x).w,d1
		move.w	(player_pos_y).w,d2
		cmpi.w	#$170,d1
		ble.s	loc_17054
		cmpi.w	#$120,d2
		ble.s	loc_17054
		move.w	#$204,d0
		bra.s	loc_17080

loc_17054:
		cmpi.w	#$156,d2
		ble.s	loc_17060
		move.w	#1,d0
		bra.s	loc_17070

loc_17060:
		cmpi.w	#$120,d2
		ble.s	loc_1706C
		move.w	#2,d0
		bra.s	loc_17070

loc_1706C:
		move.w	#3,d0

loc_17070:
		cmpi.w	#$108,d1
		ble.s	loc_1707C
		ori.w	#$200,d0
		bra.s	loc_17080

loc_1707C:
		ori.w	#$100,d0

loc_17080:
		move.w	d0,$3C(a0)
		rts

sub_17086:
		move.w	$10(a0),d1
		move.w	$14(a0),d2
		cmpi.w	#$170,d2
		bne.s	loc_1709A
		move.w	#1,d0
		bra.s	loc_170C6

loc_1709A:
		cmpi.w	#$E0,d2
		bne.s	loc_170A6
		move.w	#2,d0
		bra.s	loc_170C6

loc_170A6:
		cmpi.w	#$B0,d2
		bne.s	loc_170B2
		move.w	#3,d0
		bra.s	loc_170C6

loc_170B2:
		cmpi.w	#$130,d2
		bne.s	loc_170C4
		cmpi.w	#$98,d1
		beq.s	loc_170C4
		move.w	#4,d0
		bra.s	loc_170C6

loc_170C4:
		clr.w	d0

loc_170C6:
		cmpi.w	#$98,d1
		bne.s	loc_170D2
		ori.w	#$100,d0
		bra.s	loc_170DC

loc_170D2:
		cmpi.w	#$178,d1
		bne.s	loc_170DC
		ori.w	#$200,d0

loc_170DC:
		move.w	d0,$3E(a0)
		rts

sub_170E2:
		clr.l	d0

loc_170E4:
		move.w	word_17106(pc,d0.w),d1
		beq.s	loc_17136
		cmp.w	$10(a0),d1
		bne.s	loc_17102
		move.w	word_17106+2(pc,d0.w),d1
		cmp.w	$14(a0),d1
		bne.s	loc_17102
		move.w	word_17106+4(pc,d0.w),d0
		bra.w	locret_171BC

loc_17102:
		addq.l	#6,d0
		bra.s	loc_170E4
word_17106:	dc.w $98, $B0, $B
		dc.w $178, $B0,	$B
		dc.w $98, $E0, $D
		dc.w $178, $E0,	$E
		dc.w $98, $170,	$F
		dc.w $178, $170, 6
		dc.w $178, $130, $D
		dc.w 0,	0, 0

loc_17136:
		clr.l	d0

loc_17138:
		move.w	word_17174(pc,d0.w),d1
		beq.s	loc_17186
		cmp.w	$10(a0),d1
		beq.s	loc_17148
		addq.l	#6,d0
		bra.s	loc_17138

loc_17148:
		move.w	word_17174+2(pc,d0.w),d1
		cmp.w	$14(a0),d1
		bne.s	loc_1715A
		move.w	#8,d0
		bra.w	locret_171BC

loc_1715A:
		move.w	word_17174+4(pc,d0.w),d1
		cmp.w	$14(a0),d1
		bne.s	loc_1716C
		move.w	#4,d0
		bra.w	locret_171BC

loc_1716C:
		move.w	#$C,d0
		bra.w	locret_171BC
word_17174:	dc.w $98, $A0, $1C0
		dc.w $178, $A0,	$170
		dc.w 0,	0, 0

loc_17186:
		clr.l	d0

loc_17188:
		move.w	word_171BE(pc,d0.w),d1
		beq.s	locret_171BC
		cmp.w	$14(a0),d1
		beq.s	loc_17198
		addq.l	#6,d0
		bra.s	loc_17188

loc_17198:
		move.w	word_171BE+2(pc,d0.w),d1
		cmp.w	$10(a0),d1
		bne.s	loc_171A8
		move.w	#1,d0
		bra.s	locret_171BC

loc_171A8:
		move.w	word_171BE+4(pc,d0.w),d1
		cmp.w	$10(a0),d1
		bne.s	loc_171B8
		move.w	#2,d0
		bra.s	locret_171BC

loc_171B8:
		move.w	#3,d0

locret_171BC:
		rts

word_171BE:	dc.w $170, $30,	$178
		dc.w $B0, $30, $178
		dc.w $E0, $98, $178
		dc.w $130, $178, $1C8
		dc.w 0,	0, 0
sub_171DC:
		jsr	rand
		andi.w	#$FFFF,d0
		cmpi.w	#$FF70,d0
		bls.s	loc_171EE
		bra.s	loc_17210

loc_171EE:
		jsr	sub_17CDA
		btst	#3,d0
		beq.s	loc_17214
		tst.l	d1
		bge.s	loc_17200
		neg.l	d1

loc_17200:
		cmpi.l	#$20000,d1
		bgt.s	loc_17214
		cmpi.l	#$600000,d2
		bgt.s	loc_17214

loc_17210:
		moveq	#1,d0
		rts

loc_17214:
		moveq	#0,d0
		rts

sub_17218:
		lea	(word_FF9140).l,a1
		lea	(word_FF9100).l,a2
		bset	#7,$3A(a1)
		btst	#0,$3A(a1)
		bne.s	loc_17244
		bset	#0,$3A(a1)
		bset	#1,$3A(a1)
		bclr	#1,$D(a0)

loc_17244:
		move.w	$14(a0),d0
		move.w	$14(a2),d1
		btst	#1,$3A(a1)
		bne.s	loc_1726A
		sub.w	d0,d1
		cmpi.w	#$10,d1
		bgt.s	loc_172AC
		bclr	#0,$3A(a1)
		bclr	#2,$3A(a1)
		bra.s	loc_172A0

loc_1726A:
		movem.l	d0-d1/a0-a2,-(sp)
		moveq	#3,d0
		lea	(word_FF9100).l,a0
		jsr	sub_CA58
		movem.l	(sp)+,d0-d1/a0-a2
		tst.w	d7
		bne.s	loc_1728C
		sub.w	d0,d1
		cmpi.w	#$68,d1
		blt.s	loc_172AC

loc_1728C:
		move.b	#$E3,(smps_cmd2).w
		bset	#2,$3A(a1)
		bclr	#1,$3A(a1)
		bra.s	loc_172AC

loc_172A0:
		bset	#1,$D(a0)
		move.w	#1,2(a0)

loc_172AC:
		jsr	sub_18686
		jsr	sub_17CBE
		rts

sub_172BA:
		tst.w	$26(a0)
		bne.s	locret_172E6
		subi.l	#$10000,$14(a0)
		cmpi.w	#$170,$14(a0)
		bgt.s	loc_172DA
		clr.w	$26(a0)
		move.w	#1,2(a0)

loc_172DA:
		jsr	sub_18686
		jsr	sub_17CBE

locret_172E6:
		rts

sub_172E8:
		lea	(off_172F4).l,a1
		jmp	jump_by_table1	; a0 = ?

off_172F4:	dc.w sub_17304-off_172F4
		dc.w sub_1734A-off_172F4
		dc.w sub_173BA-off_172F4
		dc.w sub_17406-off_172F4
		dc.w sub_1743E-off_172F4
		dc.w sub_174F2-off_172F4
		dc.w sub_1745E-off_172F4
		dc.w sub_17498-off_172F4
sub_17304:
		tst.b	(byte_FFEEF8).w
		beq.s	loc_17310
		bset	#0,$C(a0)

loc_17310:
		move.w	#$D8,$10(a0)
		move.w	#$1D0,$14(a0)
		move.w	#5,2(a0)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		move.l	#off_125880,$20(a0)
		move.w	#0,4(a0)
		move.w	#$2400,$A(a0)
		move.b	#$A,$39(a0)
		rts

sub_1734A:
		lea	(word_FF9000).l,a1
		move.l	dword_FF9014-word_FF9000(a1),d1
		subi.l	#$180000,d1
		move.l	d1,$14(a0)
		move.l	$10(a1),d1
		move.l	d1,$10(a0)
		cmp.l	(player_pos_x).w,d1
		blt.s	loc_17374
		move.w	#2,4(a0)
		bra.s	loc_1737A

loc_17374:
		move.w	#3,4(a0)

loc_1737A:
		tst.w	(word_FF90E6).l
		bne.w	locret_173B8
		tst.b	$3B(a0)
		blt.s	loc_173A8
		move.b	$27(a0),d2
		move.w	#$FFFF,d0
		move.b	$3B(a0),$27(a0)
		jsr	sub_16550
		move.b	d2,$27(a0)
		subq.b	#1,$3B(a0)
		rts

loc_173A8:
		clr.b	$3B(a0)
		jsr	sub_18686
		jsr	sub_17584

locret_173B8:
		rts

sub_173BA:
		subq.w	#1,$26(a0)
		beq.s	loc_173EE
		lea	(word_FF9000).l,a1
		move.l	dword_FF9014-word_FF9000(a1),d1
		subi.l	#$180000,d1
		move.l	d1,$14(a0)
		move.l	$10(a1),d1
		move.l	d1,$10(a0)
		tst.w	(word_FF90E6).l
		bne.w	locret_17404
		jsr	sub_18686
		bra.s	locret_17404

loc_173EE:
		bset	#1,$D(a0)
		clr.w	6(a0)
		bset	#7,$E(a0)
		move.w	#1,2(a0)

locret_17404:
		rts

sub_17406:
		move.w	#$FFFF,d0
		jsr	sub_16550
		subq.w	#1,$26(a0)
		bge.s	loc_17420
		clr.w	$26(a0)
		move.w	#1,2(a0)

loc_17420:
		lea	(word_FF9000).l,a1
		move.l	dword_FF9014-word_FF9000(a1),d1
		subi.l	#$180000,d1
		move.l	d1,$14(a0)
		move.l	$10(a1),d1
		move.l	d1,$10(a0)
		rts

sub_1743E:
		subq.b	#1,$26(a0)
		bne.s	locret_1745C
		addq.w	#2,2(a0)
		moveq	#0,d0
		move.w	4(a0),d0
		move.b	#$1E,$26(a0)
		addq.w	#3,d0
		jmp	loc_B842

locret_1745C:
		rts

sub_1745E:
		subq.b	#1,$26(a0)
		bne.s	locret_17496
		move.b	#2,$26(a0)
		addi.w	#$BB8,(word_FF8F7A).w
		move.w	#$81,(word_FF8F72).w
		move.b	#1,(byte_FFEE76).w
		move.b	#1,(byte_FFEE77).w
		moveq	#$1A,d1
		jsr	(sub_105A).l
		st	(byte_FFEEF8).w
		st	(byte_FFEEE5).w
		addq.w	#1,2(a0)

locret_17496:
		rts

sub_17498:
		subq.b	#1,$26(a0)
		beq.s	loc_174EA
		lea	(word_FF9000).l,a1
		bset	#0,byte_FF900C-word_FF9000(a1)
		lea	(word_FF9100).l,a1
		bset	#0,byte_FF910C-word_FF9100(a1)
		lea	(word_FF9040).l,a1
		bset	#0,byte_FF904C-word_FF9040(a1)
		lea	(word_FF9080).l,a1
		bset	#0,byte_FF908C-word_FF9080(a1)
		lea	(word_FF9100).l,a1
		move.w	#2,d0

loc_174D8:
		adda.l	#$40,a1
		bset	#0,$C(a1)
		dbf	d0,loc_174D8
		rts

loc_174EA:
		bset	#0,$C(a0)
		rts

sub_174F2:
		tst.l	$1C(a0)
		bne.s	loc_17530
		jsr	sub_B9A8
		beq.w	locret_17582
		bclr	#1,$D(a0)
		move.w	#$81,(word_FF8F72).w
		move.b	#1,(byte_FFEE76).w
		move.b	#1,(byte_FFEE77).w
		moveq	#$20,d1
		jsr	(sub_105A).l
		bset	#1,$D(a0)
		move.l	#$6000,$1C(a0)

loc_17530:
		move.l	$14(a0),d0
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		cmpi.l	#$2200000,$14(a0)
		blt.s	locret_17582
		clr.b	(byte_FFEE64).w
		move.w	#$A500,$A(a0)
		bset	#1,$D(a0)
		move.l	#off_125992,$20(a0)
		clr.w	4(a0)
		clr.w	6(a0)
		clr.l	$1C(a0)
		move.w	#$D8,$10(a0)
		move.w	#$220,$14(a0)
		move.w	#1,2(a0)
		clr.w	(word_FF9026).l

locret_17582:
		rts

sub_17584:
		jsr	sub_B9B8
		bne.s	loc_17594
		jsr	loc_BA02
		beq.s	loc_1760A

loc_17594:
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_175B6
		subq.b	#1,$39(a0)
		move.w	#3,2(a0)
		move.w	#$F0,$26(a0)
		move.b	#$78,$3B(a0)
		bra.s	loc_175D2

loc_175B6:
		subq.b	#1,$39(a0)
		move.w	#2,2(a0)
		bclr	#1,$D(a0)
		move.w	#$F0,$26(a0)
		move.b	#$78,$3B(a0)

loc_175D2:
		tst.b	$39(a0)
		ble.s	loc_175DA
		rts

loc_175DA:
		move.w	#4,2(a0)
		move.b	#$64,$26(a0)
		move.b	#$95,(smps_cmd1).w
		clr.w	$2A(a0)
		move.w	$10(a0),d0
		sub.w	(player_pos_x).w,d0
		blt.w	loc_17602
		jmp	sub_B876

loc_17602:
		moveq	#5,d0
		jmp	loc_B842

loc_1760A:
		jmp	loc_B97A

nullsub_21:
		rts

sub_17612:
		lea	(off_1761E).l,a1
		jmp	jump_by_table1	; a0 = ?

off_1761E:	dc.w sub_17622-off_1761E
		dc.w sub_17652-off_1761E
sub_17622:
		jsr	sub_BC72
		move.l	#off_125992,$20(a0)
		moveq	#8,d0
		jsr	sub_CA8E
		cmpi.w	#$230,$14(a0)
		blt.w	loc_1764A
		moveq	#1,d0
		jmp	sub_B83E

loc_1764A:
		moveq	#6,d0
		jmp	sub_B83E

sub_17652:
		lea	(word_FF9000).l,a2
		moveq	#0,d2
		move.w	#$20,d2
		btst	#7,$3A(a0)
		beq.s	loc_1766A
		move.w	#$10,d2

loc_1766A:
		movea.l	#word_FF9140,a1
		btst	#1,$3A(a1)
		bne.s	loc_176C4
		btst	#2,$3A(a1)
		bne.w	loc_1771E
		btst	#7,$3A(a0)
		bne.s	loc_17696
		cmpi.w	#1,4(a0)
		bne.w	loc_1774E
		bra.s	loc_176AA

loc_17696:
		move.l	#$10000,$10(a0)
		move.l	#$10000,$14(a0)
		bra.w	loc_1774E

loc_176AA:
		move.l	$14(a2),d0
		addi.l	#$100000,d0
		move.l	d0,$14(a0)
		move.l	$10(a2),d0
		move.l	d0,$10(a0)
		bra.w	loc_1774E

loc_176C4:
		cmpi.w	#1,4(a0)
		beq.s	loc_176E8
		movea.l	a0,a1
		suba.l	#$40,a1
		move.w	$14(a2),d0
		move.w	$14(a1),d1
		sub.w	d2,d1
		sub.w	d0,d1
		cmpi.w	#0,d1
		bge.s	loc_176E8
		bra.s	loc_1774E

loc_176E8:
		cmpi.l	#$10000,$10(a0)
		bne.w	loc_17714
		cmpi.l	#$10000,$14(a0)
		bne.w	loc_17714
		move.l	$10(a2),$10(a0)
		move.l	$14(a2),$14(a0)
		addi.l	#0,$14(a0)

loc_17714:
		addi.l	#$25000,$14(a0)
		bra.s	loc_1774E

loc_1771E:
		lea	(word_FF9000).l,a2
		move.w	dword_FF9014-word_FF9000(a2),d0
		move.w	$14(a0),d1
		sub.w	d0,d1
		cmpi.w	#0,d1
		ble.s	loc_1773E
		subi.l	#$10000,$14(a0)
		bra.s	loc_1774E

loc_1773E:
		move.l	#$10000,$10(a0)
		move.l	#$10000,$14(a0)

loc_1774E:
		cmpi.w	#1,4(a0)
		bne.s	locret_1776C
		tst.w	(word_FF90E6).l
		bne.w	locret_1776C
		jsr	sub_18686
		jsr	sub_17CBE

locret_1776C:
		rts

sub_1776E:
		btst	#0,$3C(a0)
		bne.s	loc_177A8
		btst	#1,$3C(a0)
		bne.s	loc_177AE
		tst.b	$3B(a0)
		beq.s	loc_1779C
		move.w	#$FFFF,d0
		move.b	$27(a0),d2
		move.b	$3B(a0),$27(a0)
		jsr	sub_16550
		move.b	d2,$27(a0)

loc_1779C:
		lea	(off_177B4).l,a1
		jmp	jump_by_table1	; a0 = ?

loc_177A8:
		jmp	sub_17B2A

loc_177AE:
		jmp	sub_17BA8

off_177B4:	dc.w sub_177C4-off_177B4
		dc.w sub_1782C-off_177B4
		dc.w sub_1785A-off_177B4
		dc.w sub_178F2-off_177B4
		dc.w sub_1793C-off_177B4
		dc.w sub_17980-off_177B4
		dc.w sub_17A0C-off_177B4
		dc.w sub_17A56-off_177B4
sub_177C4:
		move.w	#$A400,$A(a0)
		move.l	#off_125AA0,$20(a0)
		move.l	#$1000000,$10(a0)
		move.l	#$D00000,$14(a0)
		move.w	#$FFFF,$26(a0)
		move.w	#$167,$28(a0)
		move.w	#0,$2A(a0)
		bset	#7,$C(a0)
		bset	#4,$C(a0)
		bset	#4,$D(a0)
		move.b	#$C,$39(a0)
		move.b	#5,$38(a0)
		bset	#0,$36(a0)
		bclr	#4,$E(a0)
		jsr	sub_B852
		move.w	#1,2(a0)
		rts

sub_1782C:
		addq.w	#1,$26(a0)

loc_17830:
		move.w	$26(a0),d0
		andi.w	#$FF,d0
		move.b	byte_1784E(pc,d0.w),d0
		bne.s	loc_17844
		clr.w	$26(a0)
		bra.s	loc_17830

loc_17844:
		move.w	d0,2(a0)
		jmp	sub_1776E

byte_1784E:	dc.b 6,	5, 2, 3, 2, 4, 2, 3, 5,	0, 0, 0
sub_1785A:
		subq.w	#1,$2A(a0)
		bgt.s	loc_178A6
		beq.s	loc_178CC
		bclr	#1,$D(a0)
		move.w	#$11,$2A(a0)
		clr.w	6(a0)
		clr.l	$1C(a0)
		clr.b	8(a0)
		jsr	sub_17CDA
		btst	#0,d0
		beq.s	loc_17896
		move.w	#2,4(a0)
		move.l	#$100000,$18(a0)
		bra.s	locret_178A4

loc_17896:
		move.w	#3,4(a0)
		move.l	#$FFF00000,$18(a0)

locret_178A4:
		rts

loc_178A6:
		move.b	$27(a0),d2
		move.b	$2B(a0),$27(a0)
		move.w	#$FFFF,d0
		jsr	sub_16550
		move.b	$27(a0),$2B(a0)
		move.b	d2,$27(a0)
		jsr	sub_18694
		rts

loc_178CC:
		bsr.w	sub_17A3E
		clr.w	6(a0)
		jsr	sub_B88A
		jsr	sub_18694
		clr.l	$18(a0)
		bset	#1,$D(a0)
		move.w	#1,2(a0)
		rts

sub_178F2:
		subq.w	#1,$2A(a0)
		beq.s	loc_17928
		bgt.s	locret_17926
		btst	#0,5(a0)
		bne.s	loc_1790A
		move.w	#$A,4(a0)
		bra.s	loc_17910

loc_1790A:
		move.w	#$B,4(a0)

loc_17910:
		clr.b	8(a0)
		move.w	#0,6(a0)
		bclr	#1,$D(a0)
		move.w	#$3B,$2A(a0)

locret_17926:
		rts

loc_17928:
		bset	#1,$D(a0)
		move.w	#1,2(a0)
		jsr	sub_18694
		rts

sub_1793C:
		subq.w	#1,$2A(a0)
		beq.s	loc_17972
		bgt.s	locret_17970
		btst	#0,5(a0)
		bne.s	loc_17954
		move.w	#$C,4(a0)
		bra.s	loc_1795A

loc_17954:
		move.w	#$D,4(a0)

loc_1795A:
		clr.b	8(a0)
		move.w	#0,6(a0)
		bclr	#1,$D(a0)
		move.w	#$3B,$2A(a0)

locret_17970:
		rts

loc_17972:
		bset	#1,$D(a0)
		move.w	#1,2(a0)
		rts

sub_17980:
		subq.w	#1,$2A(a0)
		beq.s	loc_179CE
		bgt.s	loc_179E6
		clr.b	8(a0)
		move.w	#$31,$2A(a0)
		jsr	sub_17CDA
		bclr	#1,$D(a0)
		move.w	#0,6(a0)
		btst	#0,d0
		beq.s	loc_179B4
		move.w	#6,4(a0)
		bra.w	loc_179BA

loc_179B4:
		move.w	#7,4(a0)

loc_179BA:
		movea.l	#word_FF9000,a1
		cmpi.w	#$B,2(a1)
		beq.s	loc_179E6
		addq.w	#2,4(a0)
		bra.s	loc_179E6

loc_179CE:
		bset	#1,$D(a0)
		move.w	#1,2(a0)
		bsr.w	sub_17A3E
		jsr	sub_18694
		rts

loc_179E6:
		move.b	$27(a0),d2
		move.b	$2B(a0),$27(a0)
		move.w	#$FFFF,d0
		jsr	sub_16550
		move.b	$27(a0),$2B(a0)
		move.b	d2,$27(a0)
		jsr	sub_18694
		rts

sub_17A0C:
		btst	#0,$3A(a0)
		bne.s	loc_17A2A
		tst.b	$3B(a0)
		beq.s	loc_17A20
		subq.b	#1,$3B(a0)
		rts

loc_17A20:
		bsr.s	sub_17A3E
		jsr	sub_17C34
		rts

loc_17A2A:
		bclr	#0,$3A(a0)
		clr.b	$3B(a0)
		bsr.s	sub_17A3E
		move.w	#1,2(a0)
		rts

sub_17A3E:
		move.b	#1,(cram_update_needed).w
		lea	(ram_palette_1).w,a2
		lea	(unk_FFF620).w,a1
		moveq	#7,d7

loc_17A4E:
		move.l	(a1)+,(a2)+
		dbf	d7,loc_17A4E
		rts

sub_17A56:
		subq.w	#1,$2A(a0)
		bgt.w	loc_17A6A
		beq.s	loc_17A72
		move.w	#8,$2A(a0)
		bsr.w	sub_17AA6

loc_17A6A:
		jsr	sub_AB26
		bra.s	locret_17AA4

loc_17A72:
		bsr.w	sub_17A3E
		addi.w	#$FA0,(word_FF8F7A).w
		move.w	#1,2(a0)
		lea	(word_FF9000).l,a1
		move.w	#$D,word_FF9002-word_FF9000(a1)
		move.b	#$F8,(smps_cmd1).w
		jsr	send_smps_cmd	; d0 = cmd
		move.w	#5,(word_FF8D20).w
		st	(byte_FFEE5E).w

locret_17AA4:
		rts

sub_17AA6:
		movem.l	a0-a6,-(sp)
		move.w	#7,(word_FFFC4A).w
		move.l	#word_17AEA,(dword_FFFC40).w
		lea	(dword_17AE6).l,a1
		move.l	(a1),(dword_FFFC44).w
		lea	(nemesis_enemy_tiles_70).l,a0
		move.w	(a0),d0
		andi.w	#$FFF,d0
		subq.w	#1,d0
		move.w	d0,(word_FFFC48).w
		lea	(dword_FF6000).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		movem.l	(sp)+,a0-a6
		rts

dword_17AE6:	dc.l $40000002
word_17AEA:	dc.w $FEEF, $FEEF, $FEEF, $FEEF, $FCCF,	$FCCF, $FCCF, $FCCF
		dc.w $F88F, $F88F, $F88F, $F88F, $F00F,	$F00F, $F00F, $F00F
		dc.w $E00E, $E00E, $E00E, $E00E, $C00C,	$C00C, $C00C, $C00C
		dc.w $8008, $8008, $8008, $8008, 0, 0, 0, 0
sub_17B2A:
		btst	#2,$3C(a0)
		bne.s	loc_17B66
		btst	#1,$D(a0)
		beq.s	loc_17B42
		bset	#7,$3C(a0)
		bra.s	loc_17B48

loc_17B42:
		bclr	#7,$3C(a0)

loc_17B48:
		bset	#1,$D(a0)
		bset	#2,$3C(a0)
		move.b	#$FA,$3E(a0)
		move.b	#3,$3F(a0)
		move.b	#3,$2C(a0)

loc_17B66:
		subq.b	#1,$3E(a0)
		beq.s	loc_17B7E
		subq.b	#1,$3F(a0)
		bne.s	locret_17BA6
		move.b	#3,$3F(a0)
		neg.b	$2C(a0)
		bra.s	locret_17BA6

loc_17B7E:
		btst	#7,$3C(a0)
		beq.s	loc_17B8E
		bset	#1,$D(a0)
		bra.s	loc_17B94

loc_17B8E:
		bclr	#1,$D(a0)

loc_17B94:
		bclr	#2,$3C(a0)
		clr.w	$3C(a0)
		clr.w	$3E(a0)
		clr.b	$2C(a0)

locret_17BA6:
		rts

sub_17BA8:
		move.w	$26(a0),d0
		move.w	$3E(a0),d1
		move.w	d1,$26(a0)
		move.w	d0,$3E(a0)
		btst	#2,$3C(a0)
		bne.s	loc_17BE8
		move.b	#$78,$27(a0)
		btst	#1,$D(a0)
		beq.s	loc_17BD6
		bset	#7,$3C(a0)
		beq.s	loc_17BDC

loc_17BD6:
		bclr	#7,$3C(a0)

loc_17BDC:
		bset	#1,$D(a0)
		bset	#2,$3C(a0)

loc_17BE8:
		move.w	#$FFFF,d0
		jsr	sub_16550
		subq.b	#1,$27(a0)
		bge.s	loc_17C22
		btst	#7,$3C(a0)
		beq.s	loc_17C08
		bset	#7,$3C(a0)
		beq.s	loc_17C0E

loc_17C08:
		bclr	#7,$3C(a0)

loc_17C0E:
		bclr	#2,$3C(a0)
		clr.w	$3C(a0)
		clr.w	$26(a0)
		move.b	#$78,$3B(a0)

loc_17C22:
		move.w	$26(a0),d0
		move.w	$3E(a0),d1
		move.w	d1,$26(a0)
		move.w	d0,$3E(a0)
		rts

sub_17C34:
		jsr	sub_B9B8
		beq.s	loc_17CB6
		jsr	loc_BA02
		beq.s	loc_17CB6
		move.w	a0,$30(a1)
		tst.b	$F(a0)
		bpl.s	loc_17C6C
		subq.b	#1,$39(a0)
		bset	#1,$3C(a0)
		lea	(word_FF9000).l,a1
		bset	#1,byte_FF903C-word_FF9000(a1)
		move.b	#$78,$3B(a0)
		bra.s	loc_17C88

loc_17C6C:
		subq.b	#1,$39(a0)
		bset	#0,$3C(a0)
		lea	(word_FF9000).l,a1
		bset	#0,byte_FF903C-word_FF9000(a1)
		move.b	#$78,$3B(a0)

loc_17C88:
		tst.b	$39(a0)
		beq.s	loc_17C90
		rts

loc_17C90:
		lea	(word_FF9000).l,a1
		move.w	#$E,word_FF9002-word_FF9000(a1)
		move.w	#7,2(a0)
		clr.w	$2A(a0)
		move.w	#6,d0
		lea	(word_FF9080).l,a1
		jmp	loc_17D5A

loc_17CB6:
		jmp	loc_B97A

nullsub_22:
		rts

sub_17CBE:
		jsr	sub_B9B8
		beq.s	loc_17CCC
		move.w	a0,$30(a1)
		rts

loc_17CCC:
		jsr	loc_BA02
		beq.s	locret_17CD8
		move.w	a0,$30(a1)

locret_17CD8:
		rts

sub_17CDA:
		clr.l	d0
		move.l	(player_pos_x).w,d1
		sub.l	$10(a0),d1
		beq.s	loc_17CF2
		bgt.s	loc_17CEE
		bset	#$11,d0
		bra.s	loc_17CF2

loc_17CEE:
		bset	#$10,d0

loc_17CF2:
		move.l	(player_pos_y).w,d2
		sub.l	$14(a0),d2
		beq.s	loc_17D08
		bgt.s	loc_17D04
		bset	#$12,d0
		bra.s	loc_17D08

loc_17D04:
		bset	#$13,d0

loc_17D08:
		swap	d0
		rts

sub_17D0C:
		btst	#0,$3C(a0)
		bne.s	loc_17D28
		btst	#1,$3C(a0)
		bne.s	loc_17D2E
		lea	(off_17D34).l,a1
		jmp	jump_by_table1	; a0 = ?

loc_17D28:
		jmp	sub_17B2A

loc_17D2E:
		jmp	sub_17BA8

off_17D34:	dc.w sub_17D76-off_17D34
		dc.w sub_17DEA-off_17D34
		dc.w sub_17E1C-off_17D34
		dc.w sub_17FCC-off_17D34
		dc.w sub_17FF2-off_17D34
		dc.w sub_18064-off_17D34
		dc.w sub_180D6-off_17D34
		dc.w sub_181C4-off_17D34
		dc.w sub_18244-off_17D34
		dc.w sub_182E4-off_17D34
		dc.w sub_18332-off_17D34
		dc.w sub_18354-off_17D34
		dc.w sub_17EF6-off_17D34
		dc.w sub_17D56-off_17D34
		dc.w nullsub_23-off_17D34
		dc.w sub_18354-off_17D34
nullsub_23:
		rts

sub_17D56:
		moveq	#1,d0
		movea.l	a0,a1

loc_17D5A:
		tst.w	0.w(a1)
		beq.s	loc_17D66
		bset	#0,$C(a1)

loc_17D66:
		adda.l	#$40,a1
		dbf	d0,loc_17D5A
		bra.w	sub_17A3E

nullsub_24:
		rts

sub_17D76:
		move.w	#$A500,$A(a0)
		move.l	#off_125CF6,$20(a0)
		move.w	#3,4(a0)
		move.w	#$FFFF,$26(a0)
		move.w	#0,$28(a0)
		move.w	#0,$2A(a0)
		bset	#4,$E(a0)
		bset	#4,$D(a0)
		bset	#7,$C(a0)
		lea	(word_FF9040).l,a1
		move.w	#$84,0.w(a1)
		move.l	#$E00000,$10(a0)
		move.l	#$D00000,$14(a0)
		subi.w	#$18,$14(a0)
		bset	#1,$D(a0)
		bset	#4,$C(a0)
		jsr	sub_B852
		move.w	#1,2(a0)
		rts

sub_17DEA:
		addq.w	#1,$26(a0)

loc_17DEE:
		move.w	$26(a0),d0
		move.b	byte_17E0C(pc,d0.w),d0
		bne.s	loc_17DFE
		clr.w	$26(a0)
		bra.s	loc_17DEE

loc_17DFE:
		move.w	d0,2(a0)
		clr.b	$3A(a0)
		jmp	sub_17D0C

byte_17E0C:	dc.b 3,	$F, 2, 5, $C, 4, 2, 5, $B, 6, 9, $A, 7,	7, 8, 0
sub_17E1C:
		subq.w	#1,$2A(a0)
		beq.w	loc_17ECE
		bgt.s	loc_17E30
		clr.b	8(a0)
		move.w	#$11,$2A(a0)

loc_17E30:
		lea	(stru_17EDE).l,a2
		movea.l	#word_FF9040,a1
		btst	#0,5(a1)
		bne.s	loc_17E72
		move.w	#6,4(a0)
		move.w	#7,6(a0)
		cmpi.w	#6,$2A(a0)
		ble.s	loc_17E6C
		cmpi.w	#$C,$2A(a0)
		ble.s	loc_17E66
		move.w	#0,d1
		bra.s	loc_17EA2

loc_17E66:
		move.w	#4,d1
		bra.s	loc_17EA2

loc_17E6C:
		move.w	#8,d1
		bra.s	loc_17EA2

loc_17E72:
		move.w	#7,4(a0)
		move.w	#1,6(a0)
		cmpi.w	#6,$2A(a0)
		ble.s	loc_17E9A
		cmpi.w	#$C,$2A(a0)
		ble.s	loc_17E94
		move.w	#$C,d1
		bra.s	loc_17EA2

loc_17E94:
		move.w	#$10,d1
		bra.s	loc_17EA2

loc_17E9A:
		move.w	#$14,d1
		move.w	#$FFDD,d2

loc_17EA2:
		move.w	$10(a1),d0
		add.w	(a2,d1.w),d0
		move.w	d0,$10(a0)
		move.w	$14(a1),d0
		add.w	2(a2,d1.w),d0
		move.w	d0,$14(a0)
		jsr	sub_B88A
		jsr	sub_18694
		jsr	sub_17CBE
		rts

loc_17ECE:
		clr.l	$18(a0)
		clr.l	$1C(a0)
		move.w	#1,2(a0)
		rts

stru_17EDE:	struc_58 9, $FFDD
		struc_58 $12, $FFDE
		struc_58 $14, $FFDD
		struc_58 0, $FFDD
		struc_58 $FFFE, $FFE1
		struc_58 $FFFE, $FFE1
sub_17EF6:
		subq.w	#1,$2A(a0)
		beq.w	loc_17FA4
		bgt.s	loc_17F0A
		clr.b	8(a0)
		move.w	#$11,$2A(a0)

loc_17F0A:
		lea	(stru_17FB4).l,a2
		movea.l	#word_FF9040,a1
		btst	#0,5(a1)
		bne.s	loc_17F4C
		move.w	#6,4(a0)
		move.w	#5,6(a0)
		cmpi.w	#6,$2A(a0)
		ble.s	loc_17F46
		cmpi.w	#$C,$2A(a0)
		ble.s	loc_17F40
		move.w	#0,d1
		bra.s	loc_17F78

loc_17F40:
		move.w	#4,d1
		bra.s	loc_17F78

loc_17F46:
		move.w	#8,d1
		bra.s	loc_17F78

loc_17F4C:
		move.w	#7,4(a0)
		move.w	#3,6(a0)
		cmpi.w	#6,$2A(a0)
		ble.s	loc_17F74
		cmpi.w	#$C,$2A(a0)
		ble.s	loc_17F6E
		move.w	#$C,d1
		bra.s	loc_17F78

loc_17F6E:
		move.w	#$10,d1
		bra.s	loc_17F78

loc_17F74:
		move.w	#$14,d1

loc_17F78:
		move.w	$10(a1),d0
		add.w	(a2,d1.w),d0
		move.w	d0,$10(a0)
		move.w	$14(a1),d0
		add.w	2(a2,d1.w),d0
		move.w	d0,$14(a0)
		jsr	sub_B88A
		jsr	sub_18694
		jsr	sub_17CBE
		rts

loc_17FA4:
		clr.l	$18(a0)
		clr.l	$1C(a0)
		move.w	#1,2(a0)
		rts

stru_17FB4:	struc_58 $FFFE, $FFDD
		struc_58 1, $FFDD
		struc_58 7, $FFE3
		struc_58 $FFF6, $FFE0
		struc_58 $FFF3, $FFDD
		struc_58 $FFE6, $FFE1
sub_17FCC:
		jsr	sub_18694
		jsr	sub_17CBE
		move.w	#1,2(a0)
		movea.l	#word_FF9040,a1
		bset	#0,$3A(a1)
		rts

sub_17FEC:
		jsr	sub_18694

sub_17FF2:
		subq.w	#1,$2A(a0)
		beq.s	loc_18042
		bgt.s	loc_18026
		clr.b	8(a0)
		move.l	#$6000,$18(a0)
		move.l	#$FFFEE000,$1C(a0)
		move.w	#7,4(a0)
		move.w	#0,6(a0)
		bclr	#1,$D(a0)
		move.w	#$3B,$2A(a0)

loc_18026:
		addi.l	#$9C3,$1C(a0)
		jsr	sub_B88A
		jsr	sub_18694
		jsr	sub_17CBE
		rts

loc_18042:
		clr.l	$18(a0)
		clr.l	$1C(a0)
		bset	#1,$D(a0)
		move.w	#1,2(a0)
		jsr	sub_18694
		jsr	sub_17CBE
		rts

sub_18064:
		subq.w	#1,$2A(a0)
		beq.s	loc_180B4
		bgt.s	loc_18098
		clr.b	8(a0)
		move.l	#$FFFFA000,$18(a0)
		move.l	#$FFFEE000,$1C(a0)
		move.w	#6,4(a0)
		move.w	#0,6(a0)
		bclr	#1,$D(a0)
		move.w	#$3B,$2A(a0)

loc_18098:
		addi.l	#$999,$1C(a0)
		jsr	sub_B88A
		jsr	sub_18694
		jsr	sub_17CBE
		rts

loc_180B4:
		clr.l	$18(a0)
		clr.l	$1C(a0)
		bset	#1,$D(a0)
		move.w	#1,2(a0)
		jsr	sub_18694
		jsr	sub_17CBE
		rts

sub_180D6:
		subq.w	#1,$2A(a0)
		bgt.s	loc_18132
		clr.b	8(a0)
		move.w	#$4B0,$2A(a0)
		bclr	#1,$D(a0)
		move.l	#$B00000,$14(a0)
		movea.l	#word_FF9040,a1
		btst	#0,5(a1)
		bne.s	loc_1811C
		move.w	#0,4(a0)
		move.l	#$64000,$18(a0)
		move.l	#0,$1C(a0)
		bra.w	loc_18132

loc_1811C:
		move.w	#1,4(a0)
		move.l	#$FFF9C000,$18(a0)
		move.l	#0,$1C(a0)

loc_18132:
		btst	#0,5(a0)
		beq.w	loc_18164
		cmpi.w	#$2A,$10(a0)
		bge.s	loc_1818A
		clr.l	$18(a0)
		clr.l	$1C(a0)
		move.w	6(a0),d0
		cmpi.w	#7,d0
		beq.s	loc_1819E
		cmpi.w	#0,d0
		beq.s	loc_1819E
		cmpi.w	#1,d0
		beq.s	loc_1819E
		bra.s	loc_1818A

loc_18164:
		cmpi.w	#$1D4,$10(a0)
		ble.s	loc_1818A
		clr.l	$18(a0)
		clr.l	$1C(a0)
		move.w	6(a0),d0
		cmpi.w	#3,d0
		beq.s	loc_1819E
		cmpi.w	#4,d0
		beq.s	loc_1819E
		cmpi.w	#5,d0
		beq.s	loc_1819E

loc_1818A:
		jsr	sub_B88A
		jsr	sub_18694
		jsr	sub_17CBE
		rts

loc_1819E:
		move.b	#$E4,(smps_cmd2).w
		jsr	sub_18694
		jsr	sub_17CBE
		bset	#1,$D(a0)
		move.w	#0,$2A(a0)
		move.w	#1,2(a0)
		rts

sub_181C4:
		subq.w	#1,$2A(a0)
		beq.s	loc_18222
		bgt.s	loc_181D2
		move.w	#$14,$2A(a0)

loc_181D2:
		subq.w	#1,$28(a0)
		bgt.s	loc_181F0
		cmpi.w	#2,4(a0)
		bge.s	loc_181E6
		addq.w	#2,4(a0)
		bra.s	loc_181EA

loc_181E6:
		subq.w	#2,4(a0)

loc_181EA:
		move.w	#1,$28(a0)

loc_181F0:
		move.w	$2A(a0),d0
		andi.w	#$B,d0
		cmpi.w	#3,d0
		bne.s	loc_1821A
		jsr	rand
		andi.w	#3,d0
		move.b	d0,$2C(a0)
		jsr	rand
		andi.w	#3,d0
		move.b	d0,$2D(a0)

loc_1821A:
		jsr	sub_17CBE
		rts

loc_18222:
		clr.b	$2C(a0)
		clr.b	$2D(a0)
		move.w	#0,$28(a0)
		move.w	#0,$2A(a0)
		move.w	#1,2(a0)
		jsr	sub_17CBE
		rts

sub_18244:
		subq.w	#1,$28(a0)
		bgt.s	loc_18262
		cmpi.w	#2,4(a0)
		bge.s	loc_18258
		addq.w	#2,4(a0)
		bra.s	loc_1825C

loc_18258:
		subq.w	#2,4(a0)

loc_1825C:
		move.w	#3,$28(a0)

loc_18262:
		subq.w	#1,$2A(a0)
		bge.s	loc_1827A
		move.w	#$384,$2A(a0)
		clr.l	$18(a0)
		move.l	#0,$1C(a0)

loc_1827A:
		move.w	4(a0),d0
		andi.w	#1,d0
		bne.s	loc_1828E
		subi.l	#$1700,$18(a0)
		bra.s	loc_18296

loc_1828E:
		addi.l	#$1700,$18(a0)

loc_18296:
		move.w	#$384,$2A(a0)
		movea.l	#word_FF9040,a1
		move.w	$10(a1),d0
		sub.w	$10(a0),d0
		bge.s	loc_182AE
		neg.w	d0

loc_182AE:
		cmpi.w	#$10,d0
		ble.s	loc_182C8
		jsr	sub_B88A
		jsr	sub_18694
		jsr	sub_17CBE
		rts

loc_182C8:
		clr.l	$18(a0)
		clr.l	$1C(a0)
		move.w	#0,$28(a0)
		move.w	#0,$2A(a0)
		move.w	#1,2(a0)
		rts

sub_182E4:
		moveq	#6,d0
		lea	(word_FF9040).l,a1

loc_182EC:
		adda.l	#(word_FF9080-word_FF9040),a1
		move.b	d0,$3A(a1)
		move.w	#$C500,$A(a1)
		move.w	#$B4,$2A(a1)
		move.w	#$85,0.w(a1)
		clr.l	$10(a1)
		bset	#4,$E(a1)
		move.l	#$FF0000,$14(a1)
		dbf	d0,loc_182EC
		move.w	#0,$2A(a0)
		move.b	#0,$3A(a1)
		move.w	#1,2(a0)
		rts

sub_18332:
		subq.w	#1,$2A(a0)
		bgt.s	loc_18346
		beq.s	loc_18340
		move.w	#$F0,$2A(a0)

loc_18340:
		move.w	#1,2(a0)

loc_18346:
		jsr	sub_18694
		jsr	sub_17CBE
		rts

sub_18354:
		subq.w	#1,$2A(a0)
		bgt.s	loc_1838A
		beq.w	loc_18426
		movea.l	a0,a1
		movea.l	#word_FF9040,a0
		jsr	sub_17CDA
		movea.l	a1,a0
		btst	#0,d0
		beq.s	loc_18378
		clr.w	d0
		bra.s	loc_1837C

loc_18378:
		move.w	#1,d0

loc_1837C:
		move.w	d0,4(a0)
		clr.b	8(a0)
		move.w	#$31,$2A(a0)

loc_1838A:
		cmpi.w	#$B,2(a0)
		bne.s	loc_183AC
		cmpi.w	#$31,$2A(a0)
		beq.s	loc_183D2
		cmpi.w	#$14,$2A(a0)
		beq.s	loc_183D6
		cmpi.w	#$A,$2A(a0)
		beq.s	loc_183DA
		bra.s	loc_183C4

loc_183AC:
		cmpi.w	#$31,$2A(a0)
		beq.s	loc_183DA
		cmpi.w	#$28,$2A(a0)
		beq.s	loc_183D6
		cmpi.w	#$1E,$2A(a0)
		beq.s	loc_183D2

loc_183C4:
		jsr	sub_18694
		jsr	sub_17CBE
		rts

loc_183D2:
		moveq	#0,d0
		bra.s	loc_183DC

loc_183D6:
		moveq	#$C,d0
		bra.s	loc_183DC

loc_183DA:
		moveq	#$18,d0

loc_183DC:
		btst	#0,5(a0)
		beq.s	loc_183E6
		addq.l	#6,d0

loc_183E6:
		movea.l	#word_FF9040,a1
		lea	(stru_1843A).l,a2
		adda.l	d0,a2
		move.w	$10(a1),d0
		add.w	0.w(a2),d0
		move.w	d0,$10(a0)
		move.w	$14(a1),d0
		add.w	2(a2),d0
		move.w	d0,$14(a0)
		move.w	4(a2),6(a0)
		jsr	sub_B88A
		jsr	sub_18694
		jsr	sub_17CBE
		rts

loc_18426:
		move.w	#1,2(a0)
		jsr	sub_18694
		jsr	sub_17CBE
		rts

stru_1843A:	struc_59 $FFEC, $FFB0,	6
		struc_59 $14, $FFB0, 2
		struc_59 $FFFC, $FFBD,	5
		struc_59 4, $FFBD, 1
		struc_59 $10, $FFED, 4
		struc_59 $FFF0, $FFED,	0
sub_1845E:
		subq.w	#1,$2A(a0)
		lea	(off_1846E).l,a1
		jmp	jump_by_table1	; a0 = ?

off_1846E:	dc.w sub_18482-off_1846E
		dc.w sub_184A8-off_1846E
word_18472:	dc.w $7C, $A8, $D4, $100, $12C,	$158, $184, $1B0
sub_18482:
		jsr	sub_BC72
		move.l	#off_125CF6,$20(a0)
		move.w	#4,4(a0)
		move.w	#1,2(a0)
		bset	#4,$C(a0)
		bset	#7,$C(a0)

sub_184A8:
		jsr	sub_185B8
		cmpi.w	#$FF,$14(a0)
		bge.s	loc_184C2
		subq.w	#1,$28(a0)
		bgt.s	loc_184BE
		bra.s	loc_18520

loc_184BE:
		bra.w	loc_185A0

loc_184C2:
		tst.w	$2A(a0)
		bgt.s	loc_184CC
		bra.w	loc_185A8

loc_184CC:
		jsr	rand
		andi.w	#$FFFF,d0
		cmpi.w	#$500,d0
		bls.s	loc_184E4
		move.w	#1,2(a0)
		rts

loc_184E4:
		moveq	#0,d0
		move.b	$3A(a0),d0
		clr.b	$3B(a0)
		add.w	d0,d0
		move.w	word_18472(pc,d0.w),d1
		jsr	rand
		andi.w	#$F,d0
		add.w	d1,d0
		move.w	d0,$10(a0)
		move.w	#0,$14(a0)
		move.w	#0,$28(a0)

loc_18510:
		move.l	#$17000,$1C(a0)
		clr.l	$18(a0)
		bra.w	loc_185A0

loc_18520:
		tst.b	$26(a0)
		beq.s	loc_1855E
		subq.b	#1,$26(a0)
		beq.s	loc_18550
		cmpi.w	#$E8,$10(a0)
		bge.s	loc_1853E
		move.l	#$FFFE0000,$18(a0)
		bra.s	loc_18546

loc_1853E:
		move.l	#$20000,$18(a0)

loc_18546:
		addi.l	#$42E8,$1C(a0)
		bra.s	loc_18588

loc_18550:
		clr.l	$18(a0)
		move.l	#$17000,$1C(a0)
		bra.s	loc_18588

loc_1855E:
		jsr	sub_185EE
		tst.w	d0
		beq.s	loc_18588
		move.b	#$E3,(smps_cmd2).w
		move.b	#$14,$26(a0)
		move.l	#$FFFE9000,$1C(a0)
		addq.b	#1,$3B(a0)
		move.w	$14(a0),d0
		move.w	d0,$3C(a0)

loc_18588:
		move.w	#0,$28(a0)
		jsr	sub_B88A
		jsr	sub_18686
		jsr	sub_17CBE

loc_185A0:
		move.w	#1,2(a0)
		rts

loc_185A8:
		bset	#0,$C(a0)
		clr.w	(dword_FF8F86).w
		clr.w	(dword_FF8F86+2).w
		rts

sub_185B8:
		tst.b	$3A(a0)
		beq.w	loc_185C2
		rts

loc_185C2:
		subq.b	#1,$27(a0)
		beq.s	loc_185DE
		bgt.s	locret_185DC
		move.b	#4,$27(a0)
		move.w	#4,(dword_FF8F86).w
		move.w	#0,(dword_FF8F86+2).w

locret_185DC:
		rts

loc_185DE:
		move.b	#4,$27(a0)
		neg.w	(dword_FF8F86).w
		neg.w	(dword_FF8F86+2).w
		rts

sub_185EE:
		movem.l	d1-d2/a1,-(sp)
		clr.l	d0
		lea	(stru_1864A).l,a1

loc_185FA:
		move.w	$14(a0),d1
		move.w	$10(a0),d2
		tst.w	(a1)
		beq.s	loc_18642
		sub.w	4(a1),d1
		bmi.s	loc_1863A
		cmpi.w	#5,d1
		bgt.s	loc_1863A
		cmp.w	0.w(a1),d2
		blt.s	loc_1863A
		cmp.w	2(a1),d2
		bgt.s	loc_1863A
		jsr	rand
		andi.w	#$FFFF,d0
		cmpi.w	#$F000,d0
		bge.s	loc_18636
		move.w	#1,d0
		bra.w	loc_18638

loc_18636:
		clr.w	d0

loc_18638:
		bra.s	loc_18644

loc_1863A:
		adda.l	#6,a1
		bra.s	loc_185FA

loc_18642:
		clr.w	d0

loc_18644:
		movem.l	(sp)+,d1-d2/a1
		rts

stru_1864A:	struc_60 $D0, $100, $40
		struc_60 $B0, $C0, $50
		struc_60 $110,	$120, $50
		struc_60 $90, $C0, $60
		struc_60 $110,	$140, $60
		struc_60 $70, $C0, $80
		struc_60 $110,	$160, $80
		struc_60 $50, $C0, $A0
		struc_60 $110,	$180, $A0
		struc_60 0, 0, 0
sub_18686:
		jsr	sub_B960
		jsr	loc_B97A
		rts

sub_18694:
		jsr	sub_B960
		bne.s	loc_186A4
		jsr	loc_B97A
		beq.s	locret_186AA

loc_186A4:
		move.w	#1,(word_FF8FAA).w

locret_186AA:
		rts

sub_186AC:
		tst.b	$36(a0)
		bne.s	loc_186DC
		cmpi.w	#1,2(a0)
		beq.s	loc_186C4
		bgt.s	locret_186DA

loc_186BC:
		jsr	sub_836E
		rts

loc_186C4:
		tst.b	(byte_FFEEF3).w
		beq.s	locret_186DA
		move.w	#1,6(a0)
		addq.w	#1,2(a0)
		move.b	#$C2,(smps_cmd2).w

locret_186DA:
		rts

loc_186DC:
		cmpi.w	#1,2(a0)
		beq.s	loc_186E8
		bgt.s	locret_186DA
		bra.s	loc_186BC

loc_186E8:
		tst.b	(byte_FFEEED).w
		beq.s	locret_186DA
		move.w	#1,6(a0)
		addq.w	#1,2(a0)
		move.b	#$C2,(smps_cmd2).w
		rts

sub_18700:
		lea	(off_1870C).l,a1
		jmp	jump_by_table1	; a0 = ?

off_1870C:	dc.w sub_18716-off_1870C
		dc.w sub_18742-off_1870C
		dc.w sub_18760-off_1870C
		dc.w sub_18772-off_1870C
		dc.w sub_1878C-off_1870C
sub_18716:
		move.w	#$23D4,$A(a0)
		move.l	#off_1222F2,$20(a0)
		move.b	#$1E,$26(a0)
		bset	#1,$D(a0)
		bset	#2,$D(a0)
		bset	#3,$D(a0)
		jmp	sub_B852

sub_18742:
		subq.b	#1,$26(a0)
		bne.s	locret_1875E
		move.b	#$5A,$26(a0)
		addq.w	#1,2(a0)
		bclr	#1,$D(a0)
		bclr	#2,$D(a0)

locret_1875E:
		rts

sub_18760:
		subq.b	#1,$26(a0)
		bne.s	locret_18770
		move.b	#$1E,$27(a0)
		addq.w	#1,2(a0)

locret_18770:
		rts

sub_18772:
		subq.b	#1,$27(a0)
		bne.s	loc_18782
		addq.w	#1,2(a0)
		move.b	#$A,$27(a0)

loc_18782:
		move.w	#$FFFF,d0
		jmp	sub_16550

sub_1878C:
		subq.b	#1,$27(a0)
		bne.s	loc_187AA
		bset	#0,$C(a0)
		move.w	#$83,(word_FF9000).w
		move.w	#$E0,(word_FF9010).w
		move.w	#$D0,(dword_FF9014).w

loc_187AA:
		move.b	#1,(cram_update_needed).w
		lea	(ram_palette_1).w,a2
		move.b	$27(a0),d1
		andi.b	#1,d1
		bne.s	loc_187CC
		lea	(unk_FFF620).w,a1
		moveq	#$17,d7

loc_187C4:
		move.l	(a1)+,(a2)+
		dbf	d7,loc_187C4
		rts

loc_187CC:
		moveq	#$2F,d7

loc_187CE:
		move.w	#$EEE,(a2)
		lea	2(a2),a2
		dbf	d7,loc_187CE
		rts

sub_187DC:
		lea	(off_187E8).l,a1
		jmp	jump_by_table1	; a0 = ?

off_187E8:	dc.w sub_187F0-off_187E8
		dc.w sub_1882A-off_187E8
		dc.w sub_18860-off_187E8
		dc.w sub_18890-off_187E8
sub_187F0:
		move.w	#$4471,$A(a0)
		move.l	#off_1249FC,$20(a0)
		move.b	#$C0,$26(a0)
		cmpi.w	#$B5,0.w(a0)
		bne.s	loc_1881A
		move.l	#$FFFFC000,$18(a0)
		jmp	sub_B852

loc_1881A:
		move.l	#$4000,$18(a0)
		moveq	#1,d0
		jmp	sub_B83E

sub_1882A:
		tst.b	$36(a0)
		beq.s	locret_1885E
		addq.w	#1,2(a0)
		move.b	#1,$2C(a0)
		lea	(unk_FF9F80).l,a1
		move.w	#$B7,0.w(a1)
		move.w	#$D0,$14(a1)
		move.w	#$100,$10(a1)
		move.b	#$93,(smps_cmd1).w
		jmp	send_smps_cmd	; d0 = cmd

locret_1885E:
		rts

sub_18860:
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		neg.b	$2C(a0)
		move.b	$26(a0),d0
		andi.b	#7,d0
		bne.s	loc_1887C
		move.b	#$C1,(smps_cmd2).w

loc_1887C:
		subq.b	#1,$26(a0)
		bhi.s	sub_18890
		addq.w	#1,2(a0)
		clr.b	$2C(a0)
		st	(byte_FF9FB6).l

sub_18890:
		move.b	#$B4,(byte_FFEE0B).w
		rts

sub_18898:
		lea	(off_188A4).l,a1
		jmp	jump_by_table1	; a0 = ?

off_188A4:	dc.w sub_188AC-off_188A4
		dc.w sub_188E8-off_188A4
		dc.w sub_188F4-off_188A4
		dc.w nullsub_25-off_188A4
sub_188AC:
		move.w	#$4564,$A(a0)
		move.l	#off_125330,$20(a0)
		lea	stru_188D8(pc),a1
		moveq	#1,d7

loc_188C0:
		movea.w	(a1)+,a2
		move.w	(a1)+,0.w(a2)
		move.w	(a1)+,$14(a2)
		move.w	(a1)+,$10(a2)
		dbf	d7,loc_188C0
		jmp	sub_B852

stru_188D8:	struc_61 unk_FF9FC0-M68K_RAM, $B9, $D0, $100
		struc_61 unk_FFA000-M68K_RAM, $B8, $B8, $100
sub_188E8:
		tst.b	$36(a0)
		beq.s	locret_188F2
		addq.w	#1,2(a0)

locret_188F2:
		rts

sub_188F4:
		tst.w	(word_FF8D20).w
		bne.s	locret_1890A
		addq.w	#1,2(a0)
		st	(byte_FFA036).l
		st	(byte_FF9FF6).l

locret_1890A:
		rts

nullsub_25:
		rts

sub_1890E:
		lea	(off_1891A).l,a1
		jmp	jump_by_table1	; a0 = ?

off_1891A:	dc.w sub_18920-off_1891A
		dc.w sub_1893C-off_1891A
		dc.w locret_1894C-off_1891A
sub_18920:
		move.w	#$4564,$A(a0)
		move.l	#off_125330,$20(a0)
		bset	#1,$D(a0)
		moveq	#1,d0
		jmp	sub_B83E

sub_1893C:
		tst.b	$36(a0)
		beq.s	locret_1894C
		addq.w	#1,2(a0)
		move.w	#1,6(a0)

locret_1894C:
		rts

sub_1894E:
		lea	(off_1895A).l,a1
		jmp	jump_by_table1	; a0 = ?

off_1895A:	dc.w sub_18966-off_1895A
		dc.w sub_18980-off_1895A
		dc.w sub_189A0-off_1895A
		dc.w sub_189BA-off_1895A
		dc.w sub_189FA-off_1895A
		dc.w locret_18A34-off_1895A
sub_18966:
		move.w	#$564,$A(a0)
		move.l	#off_125330,$20(a0)
		bset	#2,$D(a0)
		jmp	sub_B856

sub_18980:
		tst.b	$36(a0)
		beq.s	locret_1899E
		addq.w	#1,2(a0)
		bclr	#2,$D(a0)
		move.b	#$60,$26(a0)
		move.l	#$FFFFC000,$1C(a0)

locret_1899E:
		rts

sub_189A0:
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		subq.b	#1,$26(a0)
		bhi.s	locret_189B8
		addq.w	#1,2(a0)
		move.b	#$3C,$26(a0)

locret_189B8:
		rts

sub_189BA:
		subq.b	#1,$26(a0)
		bhi.s	locret_189F8
		addq.w	#1,2(a0)
		move.w	#$BA,(word_FFA040).l
		move.w	(player_pos_x).w,(word_FFA050).l
		move.w	(player_pos_y).w,(word_FFA054).l
		cmpi.w	#$100,(player_pos_x).w
		blt.s	loc_189EC
		move.b	#1,(byte_FFA076).l

loc_189EC:
		moveq	#0,d1
		lea	(word_FFA2C0).w,a1
		jmp	fill_ram_64_bytes ; d1 = dword

locret_189F8:
		rts

sub_189FA:
		addq.w	#1,2(a0)
		clr.b	(byte_FFEE5E).w
		bset	#4,(byte_FFA04D).l
		sf	(byte_FFEE64).w
		move.b	#1,(byte_FFEE76).w
		move.b	#1,(byte_FFEE77).w
		moveq	#$1F,d1
		jsr	(sub_104E).l
		jsr	(sub_1060).l
		jsr	(sub_4572).l
		move.w	#9,(init_step).w

locret_18A34:
		rts

sub_18A36:
		cmpi.w	#1,2(a0)
		beq.s	locret_18A68
		move.w	#$83C0,$A(a0)
		move.l	#off_124802,$20(a0)
		bset	#7,$C(a0)
		btst	#0,$36(a0)
		bne.s	loc_18A60
		jmp	sub_B852

loc_18A60:
		moveq	#1,d0
		jmp	sub_B83E

locret_18A68:
		rts

sub_18A6A:
		lea	off_18A74(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_18A74:	dc.w sub_18A7C-off_18A74
		dc.w sub_18AA0-off_18A74
		dc.w sub_18B96-off_18A74
		dc.w sub_18B96-off_18A74
sub_18A7C:
		move.w	a0,(word_FF9284).w
		moveq	#0,d0
		clr.b	(byte_FF9299).w
		clr.b	(byte_FF929E).w
		clr.b	(byte_FF92A0).w
		clr.w	(word_FF92A2).w
		clr.b	(byte_FF92A4).w
		move.b	#7,(byte_FF92A1).w
		bra.w	sub_199C8

sub_18AA0:
		bsr.w	sub_19A10
		cmpi.w	#3,2(a0)
		beq.s	locret_18AE2
		moveq	#0,d0
		movea.w	(word_FF9286).w,a1
		move.b	$2A(a1),d0
		add.w	d0,d0
		move.w	off_18AC0(pc,d0.w),d0
		jmp	off_18AC0(pc,d0.w)
off_18AC0:	dc.w sub_18AC8-off_18AC0
		dc.w sub_18AC8-off_18AC0
		dc.w sub_18AE4-off_18AC0
		dc.w sub_18AE4-off_18AC0

sub_18AC8:
		cmpi.w	#$100,(player_pos_x).w
		bcc.s	loc_18B00
		cmpi.w	#$B0,(player_pos_x).w
		bcc.s	sub_18B34
		cmpi.w	#$D0,(player_pos_y).w
		bcs.w	sub_18B74

locret_18AE2:
		rts

sub_18AE4:
		cmpi.w	#$DD,(player_pos_x).w
		bcs.s	loc_18B0C
		cmpi.w	#$12D,(player_pos_x).w
		bcs.s	loc_18B4C
		cmpi.w	#$D0,(player_pos_y).w
		bcs.w	loc_18B80
		rts

loc_18B00:
		movea.w	(word_FF9286).w,a1
		bset	#0,$2A(a1)
		bra.s	loc_18B16

loc_18B0C:
		movea.w	(word_FF9286).w,a1
		move.b	#4,$2A(a1)

loc_18B16:
		bsr.w	sub_192F6

sub_18B1A:
		movea.w	(word_FF928A).w,a1
		bset	#2,$D(a1)
		move.w	#1,2(a1)
		clr.b	$2A(a1)
		addq.w	#1,2(a0)
		rts

sub_18B34:
		move.w	#$150,$10(a0)
		move.w	#0,6(a0)
		movea.w	(word_FF9288).w,a1
		bset	#0,$2A(a1)
		bra.s	loc_18B62

loc_18B4C:
		move.w	#$8D,$10(a0)
		move.w	#3,6(a0)
		movea.w	(word_FF9288).w,a1
		bset	#1,$2A(a1)

loc_18B62:
		bsr.s	sub_18B1A
		movea.w	(word_FF9286).w,a1
		bset	#2,$D(a1)
		clr.b	$D(a0)
		rts

sub_18B74:
		movea.w	(word_FF928A).w,a1
		bset	#0,$2A(a1)
		bra.s	loc_18B8A

loc_18B80:
		movea.w	(word_FF928A).w,a1
		bset	#1,$2A(a1)

loc_18B8A:
		move.w	#1,2(a1)
		addq.w	#1,2(a0)
		rts
sub_18B96:
		bra.w	sub_19A10

sub_18B9A:
		lea	off_18BA4(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_18BA4:	dc.w sub_18BAE-off_18BA4
		dc.w sub_18BC0-off_18BA4
		dc.w sub_18C56-off_18BA4
		dc.w sub_18BE0-off_18BA4
		dc.w sub_18C7E-off_18BA4
sub_18BAE:
		move.w	a0,(word_FF9286).w
		moveq	#7,d0
		bsr.w	sub_199C8
		bclr	#2,$D(a0)
		rts

sub_18BC0:
		btst	#0,$2A(a0)
		beq.s	locret_18BDE
		bclr	#1,$D(a0)
		cmpi.w	#2,6(a0)
		bne.s	locret_18BDE
		moveq	#0,d0
		moveq	#3,d1
		bra.w	loc_18BFA

locret_18BDE:
		rts

sub_18BE0:
		btst	#2,$2A(a0)
		beq.s	locret_18BDE
		bclr	#1,$D(a0)
		cmpi.w	#5,6(a0)
		bne.s	locret_18BDE
		moveq	#2,d0
		moveq	#0,d1

loc_18BFA:
		move.b	#$D8,(smps_cmd2).w
		movea.w	(word_FF928C).w,a1
		bset	d0,$2A(a1)
		bclr	#2,$D(a1)
		movea.w	(word_FF928E).w,a1
		bset	d0,$2A(a1)
		bclr	#2,$D(a1)
		movea.w	(word_FF9290).w,a1
		bset	d0,$2A(a1)
		bclr	#2,$D(a1)
		movea.w	(word_FF9292).w,a1
		bset	d0,$2A(a1)
		bclr	#2,$D(a1)
		movea.w	(word_FF9294).w,a1
		bset	d0,$2A(a1)
		bclr	#2,$D(a1)
		addq.w	#1,2(a0)
		move.b	#6,$D(a0)
		move.w	d1,6(a0)
		rts

sub_18C56:
		cmpi.b	#$1F,$2B(a0)
		bne.w	locret_18C7C
		addq.w	#1,2(a0)
		move.w	#3,6(a0)
		move.b	#2,$2A(a0)
		move.w	#$8D,d0
		move.b	#1,(byte_FF9299).w
		bra.s	loc_18C9E

locret_18C7C:
		rts

sub_18C7E:
		cmpi.b	#$1F,$2B(a0)
		bne.s	locret_18C7C
		move.w	#1,2(a0)
		move.w	#0,6(a0)
		clr.b	$2A(a0)
		move.w	#$150,d0
		clr.b	(byte_FF9299).w

loc_18C9E:
		move.b	#$D9,(smps_cmd2).w
		clr.b	$2B(a0)
		move.w	d0,$10(a0)
		bclr	#2,$D(a0)
		movea.w	(word_FF9284).w,a1
		move.w	#1,2(a1)
		moveq	#2,d3
		move.w	#$90,d4
		movea.w	(word_FF928C).w,a1
		bset	d3,$D(a1)
		move.w	d0,$10(a1)
		move.w	d4,$14(a1)
		movea.w	(word_FF928E).w,a1
		bset	d3,$D(a1)
		move.w	d0,$10(a1)
		move.w	d4,$14(a1)
		movea.w	(word_FF9290).w,a1
		bset	d3,$D(a1)
		move.w	d0,$10(a1)
		move.w	d4,$14(a1)
		movea.w	(word_FF9292).w,a1
		bset	d3,$D(a1)
		move.w	d0,$10(a1)
		move.w	d4,$14(a1)
		movea.w	(word_FF9294).w,a1
		bset	d3,$D(a1)
		move.w	d0,$10(a1)
		move.w	d4,$14(a1)
		rts

sub_18D14:
		lea	off_18D1E(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_18D1E:	dc.w sub_18D3A-off_18D1E
		dc.w sub_1993A-off_18D1E
		dc.w sub_18D44-off_18D1E
		dc.w sub_18D48-off_18D1E
		dc.w sub_1997E-off_18D1E
		dc.w sub_19542-off_18D1E
		dc.w sub_19582-off_18D1E
		dc.w sub_1974A-off_18D1E
		dc.w sub_195BA-off_18D1E
		dc.w sub_195DE-off_18D1E
		dc.w sub_1974A-off_18D1E
		dc.w sub_1960C-off_18D1E
		dc.w sub_19636-off_18D1E
		dc.w sub_19756-off_18D1E
sub_18D3A:
		move.w	a0,(word_FF928C).w
		moveq	#2,d0
		bra.w	sub_199C8

sub_18D44:
		bsr.w	sub_19768

sub_18D48:
		tst.b	(byte_FF9299).w
		bne.s	loc_18D56
		bsr.w	sub_199A4
		bcs.s	locret_18D62
		bra.s	loc_18D5C

loc_18D56:
		bsr.w	sub_199AA
		bcs.s	locret_18D62

loc_18D5C:
		bset	#0,$2B(a1)

locret_18D62:
		rts

sub_18D64:
		lea	off_18D6E(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_18D6E:	dc.w sub_18D8A-off_18D6E
		dc.w sub_1993A-off_18D6E
		dc.w sub_18D94-off_18D6E
		dc.w sub_18D98-off_18D6E
		dc.w sub_1997E-off_18D6E
		dc.w sub_19542-off_18D6E
		dc.w sub_19582-off_18D6E
		dc.w sub_1974A-off_18D6E
		dc.w sub_19652-off_18D6E
		dc.w sub_19662-off_18D6E
		dc.w sub_1974A-off_18D6E
		dc.w sub_19676-off_18D6E
		dc.w sub_19680-off_18D6E
		dc.w sub_19756-off_18D6E
sub_18D8A:
		move.w	a0,(word_FF928E).w
		moveq	#3,d0
		bra.w	sub_199C8

sub_18D94:
		bsr.w	sub_19768

sub_18D98:
		movea.w	(word_FF928C).w,a1
		tst.b	(byte_FF9299).w
		bne.s	loc_18DB2
		cmpi.w	#$120,$10(a1)
		bcc.s	locret_18DC6
		bsr.w	sub_199A4
		bcs.s	locret_18DC6
		bra.s	loc_18DC0

loc_18DB2:
		cmpi.w	#$BD,$10(a1)
		bcs.s	locret_18DC6
		bsr.w	sub_199AA
		bcs.s	locret_18DC6

loc_18DC0:
		bset	#1,$2B(a1)

locret_18DC6:
		rts

sub_18DC8:
		lea	off_18DD2(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_18DD2:	dc.w sub_18DEE-off_18DD2
		dc.w sub_1993A-off_18DD2
		dc.w sub_18DF8-off_18DD2
		dc.w sub_18DFC-off_18DD2
		dc.w sub_1997E-off_18DD2
		dc.w sub_19542-off_18DD2
		dc.w sub_19582-off_18DD2
		dc.w sub_1974A-off_18DD2
		dc.w sub_19694-off_18DD2
		dc.w sub_196A4-off_18DD2
		dc.w sub_1974A-off_18DD2
		dc.w sub_196AC-off_18DD2
		dc.w sub_196B6-off_18DD2
		dc.w sub_19756-off_18DD2
sub_18DEE:
		move.w	a0,(word_FF9290).w
		moveq	#4,d0
		bra.w	sub_199C8

sub_18DF8:
		bsr.w	sub_19768

sub_18DFC:
		movea.w	(word_FF928E).w,a1
		tst.b	(byte_FF9299).w
		bne.s	loc_18E16
		cmpi.w	#$128,$10(a1)
		bcc.s	locret_18E2A
		bsr.w	sub_199A4
		bcs.s	locret_18E2A
		bra.s	loc_18E24

loc_18E16:
		cmpi.w	#$B5,$10(a1)
		bcs.s	locret_18E2A
		bsr.w	sub_199AA
		bcs.s	locret_18E2A

loc_18E24:
		bset	#2,$2B(a1)

locret_18E2A:
		rts

sub_18E2C:
		lea	off_18E36(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_18E36:	dc.w sub_18E52-off_18E36
		dc.w sub_1993A-off_18E36
		dc.w sub_18E5C-off_18E36
		dc.w sub_18E60-off_18E36
		dc.w sub_1997E-off_18E36
		dc.w sub_19542-off_18E36
		dc.w sub_19582-off_18E36
		dc.w sub_1974A-off_18E36
		dc.w sub_196BE-off_18E36
		dc.w sub_196CE-off_18E36
		dc.w sub_1974A-off_18E36
		dc.w sub_196E2-off_18E36
		dc.w sub_196EC-off_18E36
		dc.w sub_19756-off_18E36
sub_18E52:
		move.w	a0,(word_FF9292).w
		moveq	#5,d0
		bra.w	sub_199C8

sub_18E5C:
		bsr.w	sub_19768

sub_18E60:
		movea.w	(word_FF9290).w,a1
		tst.b	(byte_FF9299).w
		bne.s	loc_18E7A
		cmpi.w	#$138,$10(a1)
		bcc.s	locret_18E8E
		bsr.w	sub_199A4
		bcs.s	locret_18E8E
		bra.s	loc_18E88

loc_18E7A:
		cmpi.w	#$A5,$10(a1)
		bcs.s	locret_18E8E
		bsr.w	sub_199AA
		bcs.s	locret_18E8E

loc_18E88:
		bset	#3,$2B(a1)

locret_18E8E:
		rts

sub_18E90:
		lea	off_18E9A(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_18E9A:	dc.w sub_18EB6-off_18E9A
		dc.w sub_1993A-off_18E9A
		dc.w sub_18EC0-off_18E9A
		dc.w sub_18EC4-off_18E9A
		dc.w sub_1997E-off_18E9A
		dc.w sub_19542-off_18E9A
		dc.w sub_19582-off_18E9A
		dc.w sub_1974A-off_18E9A
		dc.w sub_19700-off_18E9A
		dc.w sub_19710-off_18E9A
		dc.w sub_1974A-off_18E9A
		dc.w sub_19728-off_18E9A
		dc.w sub_19732-off_18E9A
		dc.w sub_19756-off_18E9A
sub_18EB6:
		move.w	a0,(word_FF9294).w
		moveq	#6,d0
		bra.w	sub_199C8

sub_18EC0:
		bsr.w	sub_19768

sub_18EC4:
		movea.w	(word_FF9292).w,a1
		tst.b	(byte_FF9299).w
		bne.s	loc_18EDE
		cmpi.w	#$130,$10(a1)
		bcc.s	locret_18F02
		bsr.w	sub_199A4
		bcs.s	locret_18F02
		bra.s	loc_18EEC

loc_18EDE:
		cmpi.w	#$AD,$10(a1)
		bcs.s	locret_18F02
		bsr.w	sub_199AA
		bcs.s	locret_18F02

loc_18EEC:
		bset	#4,$2B(a1)
		bsr.w	sub_1997E
		movea.w	(word_FF9292).w,a0
		bra.w	sub_1997E

sub_18EFE:
		movea.w	(word_FF9294).w,a0

locret_18F02:
		rts

sub_18F04:
		lea	off_18F0E(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_18F0E:	dc.w sub_18F18-off_18F0E
		dc.w sub_18F60-off_18F0E
		dc.w sub_18FB8-off_18F0E
		dc.w sub_18FEE-off_18F0E
		dc.w sub_1901A-off_18F0E
sub_18F18:
		move.w	a0,(word_FF9288).w
		jsr	sub_BC72
		move.l	#off_1290DC,$20(a0)
		moveq	#0,d0
		jsr	sub_B83E
		move.b	#6,$D(a0)
		bset	#4,$E(a0)
		tst.b	(byte_FFEEED).w
		beq.s	locret_18F5E
		moveq	#9,d7
		lea	(word_FF9000).w,a1

loc_18F4A:
		bset	#0,byte_FF900C-word_FF9000(a1)
		lea	$40(a1),a1
		dbf	d7,loc_18F4A
		jmp	sub_82AA

locret_18F5E:
		rts

sub_18F60:
		btst	#1,$2A(a0)
		bne.s	loc_18F78
		btst	#0,$2A(a0)
		beq.s	locret_18FB6
		move.w	#$180,$10(a0)
		bra.s	loc_18F7E

loc_18F78:
		move.w	#$65,$10(a0)

loc_18F7E:
		move.w	#2,2(a0)
		bsr.w	sub_192F6
		move.w	#$A8,$14(a0)
		clr.b	$D(a0)
		moveq	#0,d0
		move.b	(byte_FF929E).w,d0
		addq.b	#1,(byte_FF929E).w
		bra.s	loc_18FA8

loc_18F9E:
		clr.b	(byte_FF929E).w
		moveq	#0,d0
		addq.b	#1,(byte_FF929E).w

loc_18FA8:
		lea	(byte_1953E).l,a1
		move.b	(a1,d0.w),(byte_FF9298).w
		bmi.s	loc_18F9E

locret_18FB6:
		rts

sub_18FB8:
		subq.b	#1,$26(a0)
		bhi.s	loc_18FCA
		move.b	#$1E,$26(a0)
		move.b	#$D6,(smps_cmd2).w

loc_18FCA:
		movea.w	(word_FF9284).w,a1
		cmpi.w	#2,6(a1)
		beq.s	loc_18FDE
		cmpi.w	#5,6(a1)
		bne.s	locret_18FEC

loc_18FDE:
		bset	#1,$D(a1)
		addq.w	#1,2(a0)
		clr.b	$26(a0)

locret_18FEC:
		rts

sub_18FEE:
		move.b	#$D7,(smps_cmd2).w
		move.b	#1,(byte_FF929A).w
		clr.b	(byte_FF929B).w
		clr.b	(byte_FF929C).w
		bsr.w	loc_19772
		moveq	#0,d2
		move.b	(byte_FF9298).w,d2
		add.w	d2,d2
		move.w	off_1908A(pc,d2.w),d2
		lea	off_1908A(pc,d2.w),a1
		move.l	a1,$3A(a0)

sub_1901A:
		moveq	#0,d2
		move.b	(byte_FF9298).w,d2
		lea	byte_1953A(pc),a2
		lea	byte_19538(pc),a3
		cmpi.w	#1,d2
		beq.s	loc_19032
		lea	byte_19534(pc),a2

loc_19032:
		add.w	d2,d2
		tst.b	(byte_FF9299).w
		bne.s	loc_19044
		move.w	off_1908E(pc,d2.w),d2
		lea	off_1908E(pc,d2.w),a1
		bra.s	loc_1904C

loc_19044:
		move.w	off_19092(pc,d2.w),d2
		lea	off_19092(pc,d2.w),a1

loc_1904C:
		bsr.w	sub_190C4	; a2 = ?
		bsr.w	sub_19C0E	; a1 = bytes array
		bcs.s	sub_19096
		clr.b	$2A(a0)
		move.b	#6,$D(a0)
		move.w	#1,2(a0)
		movea.w	(word_FF9284).w,a1
		move.w	#1,2(a1)
		move.b	#6,$D(a1)
		clr.w	6(a1)
		bsr.w	sub_192F6
		movea.w	(word_FF9286).w,a1
		bclr	#2,$D(a1)
		rts

off_1908A:	dc.w word_19420-off_1908A
		dc.w word_19470-off_1908A
off_1908E:	dc.w word_19378-off_1908E
		dc.w word_193C8-off_1908E
off_19092:	dc.w word_193CC-off_19092
		dc.w word_1941C-off_19092
sub_19096:
		movea.w	(word_FF928A).w,a1
		cmpi.w	#3,2(a1)
		bcc.s	locret_190C2
		cmpi.w	#$D0,(player_pos_y).w
		bcc.s	locret_190C2
		move.b	#1,$2A(a1)
		tst.b	(byte_FF9299).w
		beq.s	loc_190BC
		move.b	#2,$2A(a1)

loc_190BC:
		move.w	#3,2(a1)

locret_190C2:
		rts
; a2 = ?
; a3 = ?

sub_190C4:
		subq.b	#1,(byte_FF929A).w
		bne.s	loc_190EA
		moveq	#0,d0
		move.b	(byte_FF929B).w,d0
		move.b	(a2,d0.w),(byte_FF929A).w
		bmi.s	loc_190EA
		addq.b	#1,(byte_FF929B).w
		move.b	(byte_FF929C).w,d0
		move.b	(a3,d0.w),(byte_FF929D).w
		addq.b	#1,(byte_FF929C).w

loc_190EA:
		move.b	(byte_FF929D).w,d2
		rts

sub_190F0:
		lea	off_190FA(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_190FA:	dc.w sub_19104-off_190FA
		dc.w sub_1910E-off_190FA
		dc.w sub_19194-off_190FA
		dc.w sub_1910E-off_190FA
		dc.w sub_191F0-off_190FA
sub_19104:
		move.w	a0,(word_FF928A).w
		moveq	#1,d0
		bra.w	sub_199C8

sub_1910E:
		btst	#1,$2A(a0)
		bne.s	loc_1913A
		btst	#0,$2A(a0)
		beq.s	locret_19192
		move.w	#$150,$10(a0)
		move.w	#0,6(a0)
		cmpi.w	#3,2(a0)
		bne.s	loc_19154
		move.w	#$C,6(a0)
		bra.s	loc_19154

loc_1913A:
		move.w	#$8D,$10(a0)
		move.w	#6,6(a0)
		cmpi.w	#3,2(a0)
		bne.s	loc_19154
		move.w	#$12,6(a0)

loc_19154:
		cmpi.w	#3,2(a0)
		beq.s	loc_19164
		move.w	#2,2(a0)
		bra.s	loc_1916A

loc_19164:
		move.w	#4,2(a0)

loc_1916A:
		clr.b	$D(a0)
		move.w	#$90,$14(a0)
		bsr.w	sub_192F6
		movea.w	(word_FF9286).w,a1
		bset	#2,$D(a1)
		movea.w	(word_FF9284).w,a1
		bset	#2,$D(a1)
		move.w	#$B4,$28(a0)

locret_19192:
		rts

sub_19194:
		cmpi.w	#2,6(a0)
		beq.s	loc_191A4
		cmpi.w	#8,6(a0)
		bne.s	loc_191BA

loc_191A4:
		bset	#1,$D(a0)
		subq.w	#1,$28(a0)
		bne.s	locret_191EE
		addq.w	#1,6(a0)
		bclr	#1,$D(a0)

loc_191BA:
		cmpi.w	#5,6(a0)
		beq.s	loc_191CA
		cmpi.w	#$B,6(a0)
		bne.s	locret_191EE

loc_191CA:
		clr.b	$2A(a0)
		move.b	#6,$D(a0)
		move.w	#1,2(a0)
		movea.w	(word_FF9286).w,a1
		bclr	#2,$D(a1)
		movea.w	(word_FF9284).w,a1
		move.w	#1,2(a1)

locret_191EE:
		rts

sub_191F0:
		cmpi.w	#$E,6(a0)
		beq.s	loc_19200
		cmpi.w	#$14,6(a0)
		bne.s	loc_19216

loc_19200:
		bset	#1,$D(a0)
		subq.w	#1,$28(a0)
		bne.s	locret_19240
		addq.w	#1,6(a0)
		bclr	#1,$D(a0)

loc_19216:
		cmpi.w	#$11,6(a0)
		beq.s	loc_19226
		cmpi.w	#$17,6(a0)
		bne.s	locret_19240

loc_19226:
		clr.b	$2A(a0)
		move.b	#6,$D(a0)
		move.w	#1,2(a0)
		movea.w	(word_FF9284).w,a1
		bclr	#2,$D(a1)

locret_19240:
		rts

sub_19242:
		lea	off_1924C(pc),a1
		jmp	jump_by_table1	; a0 = ?

off_1924C:	dc.w sub_19252-off_1924C
		dc.w sub_1925C-off_1924C
		dc.w sub_192C6-off_1924C
sub_19252:
		move.w	a0,(word_FF9296).w
		moveq	#8,d0
		bra.w	sub_199C8

sub_1925C:
		btst	#0,$2A(a0)
		beq.s	locret_192C4
		addq.w	#1,2(a0)
		tst.b	(byte_FF9299).w
		bne.s	loc_1928A
		move.w	#$150,$10(a0)
		move.w	#0,6(a0)
		btst	#1,$2A(a0)
		beq.s	loc_192A4
		move.w	#$E,6(a0)
		bra.s	loc_192A4

loc_1928A:
		move.w	#$8D,$10(a0)
		move.w	#7,6(a0)
		btst	#1,$2A(a0)
		beq.s	loc_192A4
		move.w	#$15,6(a0)

loc_192A4:
		clr.b	$D(a0)
		move.w	#$90,$14(a0)
		movea.w	(word_FF9284).w,a1
		btst	#1,$2A(a0)
		beq.s	loc_192BE
		movea.w	(word_FF928A).w,a1

loc_192BE:
		bset	#2,$D(a1)

locret_192C4:
		rts

sub_192C6:
		tst.b	(byte_FF9299).w
		bne.s	loc_192DE
		cmpi.w	#6,6(a0)
		beq.s	loc_192EE
		cmpi.w	#$14,6(a0)
		beq.s	loc_192EE
		bra.s	locret_192F4

loc_192DE:
		cmpi.w	#$D,6(a0)
		beq.s	loc_192EE
		cmpi.w	#$1B,6(a0)
		bne.s	locret_192F4

loc_192EE:
		move.w	#1,2(a0)

locret_192F4:
		rts

sub_192F6:
		movea.w	(word_FF9296).w,a1
		bset	#2,$D(a1)
		clr.b	$2A(a1)
		move.w	#1,2(a1)
		rts

byte_1930C:	dc.b $24, $14, $11, $10, $F, $E, $D, $C, $B, $A, 9, 8, 7, 6, 5,	4, 3, 0, $E1, $E0
		dc.b $DF, $DE, $DD, $DC, $DB, $DA, $D9,	$D8, $D7, $D6, $D5, $D4, $D3, $D0, $C0,	0
byte_19330:	dc.b $40, $50, $53, $54, $55, $56, $57,	$58, $59, $5A, $5B, $5C, $5D, $5E, $5F,	$60, $61, $80, $83, $84
		dc.b $85, $86, $87, $88, $89, $8A, $8B,	$8C, $8D, $8E, $8F, $90, $91, $94, $A4,	0
word_19354:	dc.w $101, $101, $101, $101, $101, $101, $101, $101, $101
		dc.w $101, $101, $101, $101, $101, $101, $101, $101, $1FF
word_19378:	dc.w $D9DA, $DBDC, $DDDE, $DFE0, $E1E2,	$E3E4, $102, $304, $506, $708
		dc.w $90A, $B0C, $D0E, $F10, $1112, $1314, $1516, $4E4F, $5051,	$5253
		dc.w $5455, $5657, $5859, $5A5B, $5C5D,	$5E5F, $6061, $6263, $6481, $8283
		dc.w $8485, $8687, $8889, $8A8B, $8C8D,	$8E8F, $9091, $9293, $9495, $9600
word_193C8:	dc.w $E4E4, $6400
word_193CC:	dc.w $8B8A, $8988, $8786, $8584, $8382,	$8180, $6362, $6160, $5F5E, $5D5C
		dc.w $5B5A, $5958, $5756, $5554, $5352,	$5150, $4F4E, $1615, $1413, $1211
		dc.w $100F, $E0D, $C0B,	$A09, $807, $605, $403,	$201, $E3, $E2E1
		dc.w $E0DF, $DEDD, $DCDB, $DAD9, $D8D7,	$D6D5, $D4D3, $D2D1, $D0CF, $CE00
word_1941C:	dc.w $6464, $E400
word_19420:	dc.w $101, $101, $101, $101, $101, $120, $101, $101, $101, $101
		dc.w $101, $101, $101, $101, $101, $101, $101, $101, $101, $101
		dc.w $101, $101, $101, $101, $101, $101, $101, $101, $2301, $101
		dc.w $101, $101, $101, $101, $101, $101, $101, $101, $101, $1FF
word_19470:	dc.w $230, $33FF
byte_19474:	dc.b $20, $15, $10, $B,	6, $E0,	$D5, $D0, $CB, $C6, $12, $D2, $12, $D2,	$12, $D2
byte_19484:	dc.b $52, $92, $52, $92, $52, $92, $46,	$4B, $50, $55, $60, $86, $8B, $90, $95,	$A0
byte_19494:	dc.b $44, $4F, $54, $59, $5E, $84, $8F,	$94, $99, $9E, $52, $92, $52, $92, $52,	$92
byte_194A4:	dc.b $12, $D2, $12, $D2, $12, $D2, $1E,	$19, $14, $F, 4, $DE, $D9, $D4,	$CF, $C4
byte_194B4:	dc.b $40, $C0, $40, $C0
byte_194B8:	dc.b $40, $80, $C0, $40, $C0, 0
byte_194BE:	dc.b $40, 0, $C0, $40, $C0, 0
byte_194C4:	dc.b $C0, $40
byte_194C6:	dc.b $C0, 0, $40, 0
byte_194CA:	dc.b $C0, $80, $40, 0
word_194CE:	dc.w $101, $101, $101, $101, $50A, $303, $202, $101, $FF00
word_194E0:	dc.w $101, $202, $303, $A05, $101, $101, $101, $101, $FF00
word_194F2:	dc.w $101, $101, $101, $101, $50A, $303, $303, $201, $FF00
word_19504:	dc.w $102, $303, $303, $A05, $101, $101, $101, $101, $FF00
word_19516:	dc.w $50A, $404, $FF00
word_1951C:	dc.w $702, $704, $4FF
word_19522:	dc.w $402, $B03, $3FF
word_19528:	dc.w $50A, $FF00
word_1952C:	dc.w $702, $7FF
word_19530:	dc.w $402, $BFF
byte_19534:	dc.b 5,	$60, $FF, 0
byte_19538:	dc.b 9,	7
byte_1953A:	dc.b 2,	1, $FF,	0
byte_1953E:	dc.b 1,	0, $FF,	0
sub_19542:
		move.w	#$150,$10(a0)
		move.w	#2,6(a0)
		tst.b	(byte_FF9299).w
		beq.s	loc_19560
		move.w	#$8D,$10(a0)
		move.w	#3,6(a0)

loc_19560:
		move.w	#$88,$14(a0)
		bclr	#2,$D(a0)
		tst.b	(byte_FF929F).w
		beq.s	loc_19576
		addq.w	#2,2(a0)

loc_19576:
		addq.w	#1,2(a0)
		move.w	#$F0,$28(a0)
		rts

sub_19582:
		subq.w	#1,$28(a0)
		beq.s	loc_1959E
		move.b	#$FD,$2C(a0)
		btst	#0,$29(a0)
		bne.s	locret_1959C
		move.b	#3,$2C(a0)

locret_1959C:
		rts

loc_1959E:
		clr.b	$2C(a0)
		addq.w	#1,2(a0)
		move.w	#1,$28(a0)
		cmpa.w	(word_FF928C).w,a0
		bne.s	locret_195B8
		move.w	#$20,$28(a0)

locret_195B8:
		rts

sub_195BA:
		move.w	#$28,$28(a0)
		moveq	#0,d2
		move.b	(byte_FF92A0).w,d2
		add.w	d2,d2
		move.w	off_19608(pc,d2.w),d2
		lea	off_19608(pc,d2.w),a1
		move.l	a1,$3A(a0)
		bsr.w	loc_19772
		move.b	#$D,$26(a0)

sub_195DE:
		subq.b	#1,$26(a0)
		bhi.s	loc_195F0
		move.b	#$A,$26(a0)
		move.b	#$DA,(smps_cmd2).w

loc_195F0:
		lea	(byte_19474).l,a1
		tst.b	(byte_FF9299).w
		beq.w	loc_19686	; a1 = bytes array
		lea	(byte_19494).l,a1
		bra.w	loc_19686	; a1 = bytes array
off_19608:	dc.w word_194CE-off_19608
		dc.w word_194F2-off_19608

sub_1960C:
		tst.b	(byte_FF92A1).w
		beq.w	loc_1989E
		moveq	#0,d2
		move.b	(byte_FF92A0).w,d2
		addq.b	#1,(byte_FF92A0).w
		andi.b	#1,(byte_FF92A0).w
		add.w	d2,d2
		move.w	off_1964E(pc,d2.w),d2
		lea	off_1964E(pc,d2.w),a1
		move.l	a1,$3A(a0)
		bsr.w	loc_19772

sub_19636:
		lea	(byte_19484).l,a1
		tst.b	(byte_FF9299).w
		beq.w	loc_19686	; a1 = bytes array
		lea	(byte_194A4).l,a1
		bra.w	loc_19686	; a1 = bytes array
off_1964E:	dc.w word_194E0-off_1964E
		dc.w word_19504-off_1964E

sub_19652:
		move.w	#$27,$28(a0)
		move.l	#word_19516,d0
		bsr.w	loc_1976E	; d0 =>	$3A (words)

sub_19662:
		lea	(byte_194B4).l,a1

loc_19668:
		moveq	#7,d2		; a1 = bytes array
		bsr.w	sub_19C0E	; a1 = bytes array
		bcs.s	locret_19674
		addq.w	#1,2(a0)

locret_19674:
		rts

sub_19676:
		move.l	#word_19528,d0
		bsr.w	loc_1976E	; d0 =>	$3A (words)

sub_19680:
		lea	(byte_194C4).l,a1

loc_19686:
		moveq	#7,d2		; a1 = bytes array
		bsr.w	sub_19C0E	; a1 = bytes array
		bcs.s	locret_19692
		addq.w	#1,2(a0)

locret_19692:
		rts

sub_19694:
		move.w	#$27,$28(a0)
		move.l	#word_1951C,d0
		bsr.w	loc_1976E	; d0 =>	$3A (words)

sub_196A4:
		lea	(byte_194B8).l,a1
		bra.s	loc_19668	; a1 = bytes array

sub_196AC:
		move.l	#word_1952C,d0
		bsr.w	loc_1976E	; d0 =>	$3A (words)

sub_196B6:
		lea	(byte_194C6).l,a1
		bra.s	loc_19686	; a1 = bytes array

sub_196BE:
		move.w	#$27,$28(a0)
		move.l	#word_19522,d0
		bsr.w	loc_1976E	; d0 =>	$3A (words)

sub_196CE:
		lea	(byte_194B8).l,a1
		tst.b	(byte_FF9299).w
		beq.s	loc_19668	; a1 = bytes array
		lea	(byte_194BE).l,a1
		bra.s	loc_19668	; a1 = bytes array

sub_196E2:
		move.l	#word_19530,d0
		bsr.w	loc_1976E	; d0 =>	$3A (words)

sub_196EC:
		lea	(byte_194C6).l,a1
		tst.b	(byte_FF9299).w
		beq.s	loc_19686	; a1 = bytes array
		lea	(byte_194CA).l,a1
		bra.s	loc_19686	; a1 = bytes array

sub_19700:
		move.w	#$27,$28(a0)
		move.l	#word_19522,d0
		bsr.w	loc_1976E	; d0 =>	$3A (words)

sub_19710:
		lea	(byte_194BE).l,a1
		tst.b	(byte_FF9299).w
		beq.w	loc_19668	; a1 = bytes array
		lea	(byte_194B8).l,a1
		bra.w	loc_19668	; a1 = bytes array

sub_19728:
		move.l	#word_19530,d0
		bsr.w	loc_1976E	; d0 =>	$3A (words)

sub_19732:
		lea	(byte_194CA).l,a1
		tst.b	(byte_FF9299).w
		beq.w	loc_19686	; a1 = bytes array
		lea	(byte_194C6).l,a1
		bra.w	loc_19686	; a1 = bytes array

sub_1974A:
		subq.w	#1,$28(a0)
		bne.s	locret_19754
		addq.w	#1,2(a0)

locret_19754:
		rts

sub_19756:
		cmpa.w	(word_FF928C).w,a0
		bne.s	locret_19766
		bsr.w	sub_19782
		move.b	#$DB,(smps_cmd2).w

locret_19766:
		rts

sub_19768:
		move.l	#word_19354,d0

loc_1976E:
		move.l	d0,$3A(a0)

loc_19772:
		move.b	#1,$3E(a0)
		clr.b	$3F(a0)
		addq.w	#1,2(a0)
		rts

sub_19782:
		movea.w	(word_FF9284).w,a0
		move.w	#$90,$14(a0)
		move.b	#6,$D(a0)
		bset	#4,$E(a0)
		move.w	#2,2(a0)
		move.w	#$150,$10(a0)
		move.w	#0,6(a0)
		tst.b	(byte_FF9299).w
		beq.s	loc_197BC
		move.w	#$8D,$10(a0)
		move.w	#3,6(a0)

loc_197BC:
		movea.w	(word_FF9296).w,a0
		move.b	#6,$D(a0)
		bset	#4,$E(a0)
		move.w	#1,2(a0)
		clr.w	$2A(a0)
		movea.w	(word_FF928A).w,a0
		move.w	#$90,$14(a0)
		move.b	#6,$D(a0)
		bset	#4,$E(a0)
		move.w	#1,2(a0)
		clr.w	$2A(a0)
		movea.w	(word_FF9286).w,a0
		move.w	#$90,$14(a0)
		move.b	#2,$D(a0)
		bset	#4,$E(a0)
		move.w	#1,2(a0)
		move.w	#$150,$10(a0)
		move.w	#0,6(a0)
		clr.w	$2A(a0)
		move.b	#1,$2A(a0)
		tst.b	(byte_FF9299).w
		beq.s	loc_19846
		move.w	#3,2(a0)
		move.w	#$8D,$10(a0)
		move.w	#3,6(a0)
		move.b	#4,$2A(a0)

loc_19846:
		movea.w	(word_FF928C).w,a0
		bsr.s	sub_19862
		movea.w	(word_FF928E).w,a0
		bsr.s	sub_19862
		movea.w	(word_FF9290).w,a0
		bsr.s	sub_19862
		movea.w	(word_FF9292).w,a0
		bsr.s	sub_19862
		movea.w	(word_FF9294).w,a0

sub_19862:
		move.w	#$90,$14(a0)
		move.b	#6,$D(a0)
		bset	#4,$E(a0)
		clr.w	$2A(a0)
		move.w	#1,2(a0)
		move.w	#$150,$10(a0)
		move.w	#0,6(a0)
		tst.b	(byte_FF9299).w
		beq.s	locret_1989C
		move.w	#$8D,$10(a0)
		move.w	#1,6(a0)

locret_1989C:
		rts

loc_1989E:
		move.w	(word_FF92A2).w,d2
		add.w	d2,d2
		move.w	off_198AC(pc,d2.w),d2
		jmp	off_198AC(pc,d2.w)
off_198AC:	dc.w sub_198B2-off_198AC
		dc.w sub_198F6-off_198AC
		dc.w sub_1990C-off_198AC

sub_198B2:
		move.w	#7,(word_FFFC4A).w
		move.l	#word_17AEA,(dword_FFFC40).w
		move.l	#$78000001,(dword_FFFC44).w
		lea	(nemesis_enemy_tiles_40).l,a0
		move.w	(a0),d0
		andi.w	#$FFF,d0
		subq.w	#1,d0
		move.w	d0,(word_FFFC48).w
		lea	(dword_FF6000).l,a4
		jsr	(decompress_nemesis_to_ram).l ;	a0 = source
		movea.w	(word_FF928C).w,a0
		move.w	#7,$28(a0)
		addq.w	#1,(word_FF92A2).w
		rts

sub_198F6:
		subq.w	#1,$28(a0)
		bne.s	loc_19900
		addq.w	#1,(word_FF92A2).w

loc_19900:
		jsr	sub_AB26
		movea.w	(word_FF928C).w,a0
		rts

sub_1990C:
		moveq	#9,d7
		lea	(word_FF9284).w,a1

loc_19912:
		movea.w	(a1)+,a2
		move.b	#1,$C(a2)
		dbf	d7,loc_19912
		addi.w	#$3E8,(word_FF8F7A).w
		move.b	#$95,(smps_cmd1).w
		move.b	#$95,(smps_cmd1_new).w
		st	(byte_FFEEED).w
		jmp	send_smps_cmd	; d0 = cmd

sub_1993A:
		tst.b	(byte_FF9299).w
		bne.s	loc_1995E
		move.b	#1,$2B(a0)
		btst	#0,$2A(a0)
		beq.s	locret_1997C
		addq.w	#1,2(a0)
		bclr	#2,$D(a0)
		clr.w	6(a0)
		rts

loc_1995E:
		move.b	#2,$2B(a0)
		btst	#2,$2A(a0)
		beq.s	locret_1997C
		addq.w	#1,2(a0)
		bclr	#2,$D(a0)
		move.w	#1,6(a0)

locret_1997C:
		rts

sub_1997E:
		movea.w	(word_FF9286).w,a1
		cmpi.b	#$1F,$2B(a1)
		bne.s	locret_199A2
		move.w	#1,2(a0)
		tst.b	(byte_FF9299).w
		bne.s	loc_1999E
		bset	#1,$2A(a0)
		rts

loc_1999E:
		clr.b	$2A(a0)

locret_199A2:
		rts

sub_199A4:
		lea	byte_1930C(pc),a1
		bra.s	loc_199AE	; a1 = ?

sub_199AA:
		lea	byte_19330(pc),a1

loc_199AE:
		moveq	#8,d2		; a1 = ?
		bsr.w	sub_19C0E	; a1 = bytes array
		bcs.s	locret_199C6
		addq.w	#1,2(a0)
		clr.l	$1C(a0)
		clr.l	$18(a0)
		movea.w	(word_FF9286).w,a1

locret_199C6:
		rts

sub_199C8:
		move.w	d0,-(sp)
		jsr	sub_BC72
		move.l	#off_128DC6,$20(a0)
		move.w	(sp)+,d0
		jsr	sub_B83E
		bset	#4,$C(a0)
		move.b	#6,$D(a0)
		bset	#4,$E(a0)
		move.w	#$150,$10(a0)
		move.w	#$90,$14(a0)
		clr.w	$2A(a0)
		rts

sub_19A04:
		move.w	a0,$30(a1)
		movea.w	(word_FF9284).w,a0
		bra.w	loc_19BF8

sub_19A10:
		movea.w	(word_FF9288).w,a0
		btst	#2,$D(a0)
		bne.s	loc_19A30
		jsr	loc_B97A
		tst.b	d7
		bne.w	loc_19B1C

loc_19A28:
		jsr	loc_BA02
		bne.s	sub_19A04

loc_19A30:
		movea.w	(word_FF928C).w,a0
		btst	#2,$D(a0)
		bne.s	loc_19A78
		cmpi.w	#5,2(a0)
		bcc.s	loc_19A78
		jsr	sub_B960
		movea.w	(word_FF928E).w,a0
		jsr	sub_B960
		movea.w	(word_FF9290).w,a0
		jsr	sub_B960
		jsr	loc_B97A
		movea.w	(word_FF9292).w,a0
		jsr	sub_B960
		movea.w	(word_FF9294).w,a0
		jsr	sub_B960

loc_19A78:
		movea.w	(word_FF9296).w,a0
		btst	#2,$D(a0)
		bne.s	loc_19A9E
		jsr	sub_B960
		jsr	loc_BA02
		bne.w	loc_19B66
		jsr	sub_B9B8
		bne.w	sub_19A04

loc_19A9E:
		movea.w	(word_FF928A).w,a0
		btst	#2,$D(a0)
		bne.s	loc_19ACA
		jsr	sub_B960
		jsr	loc_B97A
		jsr	loc_BA02
		bne.w	loc_19B66
		jsr	sub_B9B8
		bne.w	sub_19A04

loc_19ACA:
		movea.w	(word_FF9286).w,a0
		btst	#2,$D(a0)
		bne.s	loc_19AEC
		jsr	sub_B960
		jsr	loc_B97A
		jsr	sub_B9B8
		bne.w	sub_19A04

loc_19AEC:
		movea.w	(word_FF9284).w,a0
		btst	#2,$D(a0)
		bne.s	loc_19B18
		jsr	sub_B960
		jsr	loc_B97A
		jsr	loc_BA02
		bne.w	loc_19B66
		jsr	sub_B9B8
		bne.w	sub_19A04

loc_19B18:
		bra.w	loc_19BF8

loc_19B1C:
		tst.b	(byte_FFEE09).w
		beq.w	loc_19A28
		move.b	#1,(byte_FF92A4).w
		movea.w	(word_FF9296).w,a2
		movea.w	(word_FF928A).w,a1
		btst	#2,$D(a1)
		beq.s	loc_19B5C
		movea.w	(word_FF9284).w,a1
		btst	#2,$D(a1)
		bne.w	loc_19A28
		cmpi.w	#2,2(a0)
		beq.w	loc_19A28
		move.b	#1,$2A(a2)
		bra.w	loc_19A28

loc_19B5C:
		move.b	#3,$2A(a2)
		bra.w	loc_19A28

loc_19B66:
		move.b	#1,(byte_FF929F).w
		tst.b	$F(a0)
		bmi.s	loc_19B76
		clr.b	(byte_FF929F).w

loc_19B76:
		bclr	#4,$E(a0)
		move.w	a0,$30(a1)
		moveq	#5,d0
		movea.w	(word_FF928C).w,a1
		move.w	d0,2(a1)
		movea.w	(word_FF928E).w,a1
		move.w	d0,2(a1)
		movea.w	(word_FF9290).w,a1
		move.w	d0,2(a1)
		movea.w	(word_FF9292).w,a1
		move.w	d0,2(a1)
		movea.w	(word_FF9294).w,a1
		move.w	d0,2(a1)
		movea.w	(word_FF9284).w,a1
		bset	#2,$D(a1)
		movea.w	(word_FF9286).w,a1
		bset	#2,$D(a1)
		movea.w	(word_FF9288).w,a1
		bset	#2,$D(a1)
		clr.w	$2A(a1)
		move.w	#1,2(a1)
		movea.w	(word_FF928A).w,a1
		bset	#2,$D(a1)
		clr.w	$2A(a1)
		move.w	#1,2(a1)
		bsr.w	sub_192F6
		movea.w	(word_FF9284).w,a0
		move.w	#3,2(a0)
		subq.b	#1,(byte_FF92A1).w

loc_19BF8:
		move.w	#1,(word_FF8FAA).w
		tst.b	(byte_FF92A4).w
		beq.s	locret_19C0C
		clr.w	(word_FF8FAA).w
		clr.b	(byte_FF92A4).w

locret_19C0C:
		rts
; a1 = bytes array

sub_19C0E:
		subq.b	#1,$3E(a0)
		bne.s	loc_19C66
		movea.l	$3A(a0),a2
		move.b	(a2)+,$3E(a0)
		bmi.s	loc_19C7C
		andi.l	#$FF,d2
		move.l	a2,$3A(a0)
		moveq	#0,d0
		moveq	#0,d3
		move.b	$3F(a0),d0
		move.b	(a1,d0.w),d0
		addq.b	#1,$3F(a0)
		moveq	#$24,d1
		move.b	d0,d3
		andi.w	#$3F,d0
		sub.b	d0,d1
		add.w	d0,d0
		move.w	word_19C82(pc,d0.w),d0
		lsl.l	d2,d0
		add.w	d1,d1
		move.w	word_19C82(pc,d1.w),d1
		lsl.l	d2,d1
		lsr.b	#6,d3
		add.b	d3,d3
		move.w	off_19C5E(pc,d3.w),d3
		jmp	off_19C5E(pc,d3.w)
off_19C5E:	dc.w sub_19CD0-off_19C5E
		dc.w sub_19CEA-off_19C5E
		dc.w sub_19CCC-off_19C5E
		dc.w sub_19CE6-off_19C5E

loc_19C66:
		move.l	$1C(a0),d0
		move.l	$18(a0),d1
		sub.l	d0,$14(a0)
		sub.l	d1,$10(a0)
		move	#1,ccr
		rts

loc_19C7C:
		clr.b	$3E(a0)
		rts

word_19C82:	dc.w 0,	$59, $B2, $10B,	$163, $1BB, $212, $267,	$2BC, $30F
		dc.w $361, $3B1, $400, $44C, $496, $4DE, $524, $567, $5A8, $5E5
		dc.w $620, $658, $68D, $6BF, $6ED, $718, $740, $764, $784, $7A1
		dc.w $7BA, $7CF, $7E0, $7EE, $7FA, $7FE, $800
sub_19CCC:
		neg.l	d0
		neg.l	d1

sub_19CD0:
		move.l	d0,$1C(a0)
		sub.l	d0,$14(a0)
		move.l	d1,$18(a0)
		sub.l	d1,$10(a0)
		move	#1,ccr
		rts

sub_19CE6:
		neg.l	d1
		bra.s	loc_19CEC

sub_19CEA:
		neg.l	d0

loc_19CEC:
		move.l	d0,$18(a0)
		sub.l	d0,$10(a0)
		move.l	d1,$1C(a0)
		sub.l	d1,$14(a0)
		move	#1,ccr
		rts

sub_19D02:
		moveq	#0,d4
		move.b	(byte_FFFF0D).w,d4
		lea	(word_FF8500).w,a4
		bsr.s	sub_19D26
		move.w	$24(a4),d0
		move.w	$2C(a4),d3
		move.w	d0,d2
		sub.w	d3,d2
		eor.w	d0,d3
		btst	#7,d3
		bne.w	sub_19D92	; d0 = ?
		rts

sub_19D26:
		move.w	$20(a4),d1
		move.w	$28(a4),d3
		move.w	d1,d2
		sub.w	d3,d2
		eor.w	d1,d3
		btst	#7,d3
		bne.s	loc_19D3C
		rts

loc_19D3C:
		lea	(unk_FF8000).w,a1
		move.w	(a1)+,d3
		lea	-2(a1,d3.w),a2
		tst.w	d2
		bmi.s	loc_19D50
		addi.w	#$180,d1
		bra.s	loc_19D54

loc_19D50:
		subi.w	#$71,d1

loc_19D54:
		bpl.s	loc_19D58
		rts

loc_19D58:
		andi.w	#$FF80,d1
		move.w	d1,d5
		move.w	$24(a4),d0
		andi.w	#$FF80,d0
		move.w	d0,d2
		asr.w	#7,d5
		cmp.b	1(a1),d5
		bcs.s	loc_19D72
		rts

loc_19D72:
		asr.w	#7,d2
		moveq	#4,d7
		subi.w	#$80,d0
		subq.w	#1,d2

loc_19D7C:
		tst.w	d2
		bmi.s	loc_19D86
		cmp.b	(a1),d2
		bcc.s	loc_19D86
		bsr.s	sub_19DE8	; d2 = ?

loc_19D86:
		addi.w	#$80,d0
		addq.w	#1,d2
		dbf	d7,loc_19D7C
		rts
; d0 = ?
; d2 = ?
; a4 = ?

sub_19D92:
		lea	(unk_FF8000).w,a1
		move.w	(a1)+,d3
		lea	-2(a1,d3.w),a2
		tst.w	d2
		bmi.s	loc_19DA6
		addi.w	#384,d0
		bra.s	loc_19DAA

loc_19DA6:
		subi.w	#113,d0

loc_19DAA:
		bpl.s	loc_19DAE
		rts

loc_19DAE:
		andi.w	#$FF80,d0
		move.w	d0,d2
		move.w	planea_start_y-word_FF8500(a4),d1
		andi.w	#$FF80,d1
		move.w	d1,d5
		asr.w	#7,d2
		cmp.b	(a1),d2
		bcs.s	loc_19DC6
		rts

loc_19DC6:
		asr.w	#7,d5
		moveq	#4,d7
		subi.w	#$80,d1
		subq.w	#1,d5

loc_19DD0:
		tst.w	d5
		bmi.s	loc_19DDC
		cmp.b	1(a1),d5
		bcc.s	loc_19DDC
		bsr.s	sub_19DE8	; d2 = ?

loc_19DDC:
		addi.w	#$80,d1
		addq.w	#1,d5
		dbf	d7,loc_19DD0
		rts
; d2 = ?
; d5 = index
; a1 = ?
; a2 = ?

sub_19DE8:
		movem.l	d2/d5/d7/a2,-(sp)
		moveq	#0,d3
		move.b	(a1),d3
		mulu.w	d3,d5
		add.w	d5,d2
		move.b	2(a1,d2.w),d3
		beq.w	loc_19E5C
		add.w	d3,d3
		move.w	-2(a2,d3.w),d3
		lea	(a2,d3.w),a2
		moveq	#0,d7
		move.b	(a2)+,d7

loc_19E0A:
		move.b	(a2)+,d3
		btst	d4,d3
		bne.s	loc_19E54
		btst	#5,d3
		beq.s	loc_19E1C
		tst.b	3(a2)
		beq.s	loc_19E54

loc_19E1C:
		lea	(word_FF9000).w,a3
		move.w	#$2F,d6
		jsr	get_available_object_slot(pc) ;	d6 = max look forward
		bcs.s	loc_19E54
		bset	#0,2(a2)
		bne.s	loc_19E54
		move.b	(a2)+,1(a3)
		move.b	(a2)+,$36(a3)
		move.w	a2,$2E(a3)
		lea	2(a2),a2
		move.b	(a2)+,$14(a3)
		move.b	(a2)+,$15(a3)
		move.b	(a2)+,$10(a3)
		move.b	(a2)+,$11(a3)
		bra.s	loc_19E58

loc_19E54:
		lea	8(a2),a2

loc_19E58:
		dbf	d7,loc_19E0A

loc_19E5C:
		movem.l	(sp)+,d2/d5/d7/a2
		rts

sub_19E62:
		moveq	#0,d4
		move.b	(byte_FFFF0D).w,d4
		move.l	#make_indexes(KOS_LEVEL_MAPS,$00,$00,$00),d0
		trap	#DECOMP_KOSINSKI_RAM ; do_decompress_kosinski_to_ram
		lea	(level_params1).w,a1
		adda.w	(a1),a1
		lea	(level_params2).w,a4
		adda.w	(a4),a4
		move.w	(level_main_index).w,d0
		add.w	d0,d0
		move.w	(level_sub_index).w,d1
		add.w	d1,d1
		adda.w	(a1,d0.w),a1
		adda.w	(a1,d1.w),a1
		adda.w	(a4,d0.w),a4
		adda.w	(a4,d1.w),a4
		lea	(unk_FF8000).w,a2
		moveq	#9,d7

loc_19E9E:
		jsr	copy_bytes_to_dest_128 ; a1 = source
		dbf	d7,loc_19E9E
		moveq	#0,d7
		move.b	(a4)+,d7
		bmi.s	loc_19EE4

loc_19EAE:
		move.b	(a4)+,d3
		btst	d4,d3
		bne.s	loc_19EDC
		lea	(objects_memory).w,a3
		move.w	#$F,d6
		jsr	get_available_object_slot(pc) ;	d6 = max look forward
		bcs.s	loc_19EDC
		move.b	(a4)+,1(a3)
		move.b	(a4)+,$36(a3)
		move.b	(a4)+,$14(a3)
		move.b	(a4)+,$15(a3)
		move.b	(a4)+,$10(a3)
		move.b	(a4)+,$11(a3)
		bra.s	loc_19EE0

loc_19EDC:
		lea	6(a4),a4

loc_19EE0:
		dbf	d7,loc_19EAE

loc_19EE4:
		lea	(word_FF8500).w,a4
		moveq	#0,d7

loc_19EEA:
		move.w	d7,-(sp)
		move.w	planea_start_x-word_FF8500(a4),d0
		add.w	d7,d0
		moveq	#$FFFFFFFF,d2
		jsr	sub_19D92(pc)	; d0 = ?
		move.w	(sp)+,d7
		addi.w	#$80,d7
		cmpi.w	#$280,d7
		bcs.s	loc_19EEA
		rts
; d6 = max look	forward

get_available_object_slot:
		tst.w	(a3)
		beq.s	locret_19F16
		lea	$40(a3),a3
		dbf	d6,get_available_object_slot ; d6 = max	look forward
		move	#$FF,ccr

locret_19F16:
		rts

kosinski_019F18:
    binclude "src/kosinski/data_019F18.bin"
    align 2, 0
		align 2, 0
nemesis_main_font:
    binclude "src/fonts/nemesis_main.bin"
    align 2, 0
nemesis_01CBEA:
    binclude "src/nemesis/data_01CBEA.bin"
    align 2, 0
enigma_01CF5A:
    binclude "src/enigma/data_01CF5A.bin"
    align 2, 0
enigma_01CFB6:
    binclude "src/enigma/data_01CFB6.bin"
    align 2, 0
nemesis_01D15A:
    binclude "src/nemesis/data_01D15A.bin"
    align 2, 0
off_1D66A:	dc.w byte_1D66E-off_1D66A
		dc.w byte_1D680-off_1D66A
byte_1D66E:	dc.b $A, $FF, 0, $1C, 0, $28, 0, $34, 0, $40, 0, $4C, 0, $58, 0, $64
		dc.b 0,	$70
byte_1D680:	dc.b 3,	4, 0, $6A, 0, $76, 0, $82, 0, $76, 0, $30, $30,	$30, $30, 0
		dc.b $E8, 6, 0,	0, $F8,	0, 0, $30, $30,	$30, $30, 0, $F0, 5, 0,	6
		dc.b $F8, 0, 0,	$30, $30, $30, $30, 0, $F0, 5, 0, $A, $F8, 0, 0, $30
		dc.b $30, $30, $30, 0, $F0, 5, 0, $E, $F8, 0, 0, $30, $30, $30,	$30, 0
		dc.b $F0, 5, 0,	$12, $F8, 0, 0,	$30, $30, $30, $30, 0, $F0, 5, 0, $16
		dc.b $F8, 0, 0,	$30, $30, $30, $30, 0, $F0, 5, 0, $1A, $F8, 0, 0, $30
		dc.b $30, $30, $30, 0, $F0, 5, 0, $1E, $F8, 0, 0, $55, $55, $55, $55, 0
		dc.b $F0, 5, 0,	$22, $F8, 0, 0,	$30, $30, $30, $30, 0, $F8, 0, 0, $26
		dc.b $FC, 0, 0,	$30, $30, $30, $30, 0, $F0, 5, 0, $27, $F8, 0
nemesis_01D70E:
    binclude "src/nemesis/data_01D70E.bin"
    align 2, 0
nemesis_01DAEC:
    binclude "src/nemesis/data_01DAEC.bin"
    align 2, 0
off_1E078:	dc.w byte_1E07A-off_1E078
byte_1E07A:	dc.b 3,	$FF, 0,	$A, 0, $16, 0, $22, 0, $2E, 0, $31, $31, $31, $31, 0
		dc.b 0,	$F, 0, 0, 0, 0,	0, $31,	$31, $31, $31, 0, 0, $F, 0, $10
		dc.b 0,	0, 0, $31, $31,	$31, $31, 0, 0,	$F, 0, $20, 0, 0, 0, $31
		dc.b $31, $31, $31, 0, 0, $F, 0, $30, 0, 0
nemesis_01E0B4:
    binclude "src/nemesis/data_01E0B4.bin"
    align 2, 0
off_1E20A:	dc.w byte_1E20E-off_1E20A
		dc.w byte_1E216-off_1E20A
byte_1E20E:	dc.b 2,	$FF, 0,	$28, 0,	$1C, 0,	$10
byte_1E216:	dc.b 2,	$FF, 0,	8, 0, $14, 0, $20, 0, $33, $33,	$33, $33, 0, $F5, 6
		dc.b 0,	0, $F8,	0, 0, $33, $33,	$33, $33, 0, $F5, 6, 0,	6, $F8,	0
		dc.b 0,	$33, $33, $33, $33, 0, $F5, 6, 0, $C, $F8, 0
nemesis_01E242:
    binclude "src/nemesis/data_01E242.bin"
    align 2, 0
off_1E2A4:	dc.w byte_1E2A6-off_1E2A4
byte_1E2A6:	dc.b 0,	$FF, 0,	4, 1, $2E, $2E,	$2E, $2E, 0, $E0, $F, 0, 0, $F0, $C0
		dc.b $F, 0, 0, $F0
nemesis_01E2BA:
    binclude "src/nemesis/data_01E2BA.bin"
    align 2, 0
off_1E42E:	dc.w byte_1E430-off_1E42E
byte_1E430:	dc.b 1,	$A, 0, 6, 0, $20, 3, $34, $34, $34, $34, 0, $D0, 0, 0, 0
		dc.b 0,	$D8, 4,	0, 1, 0, $E0, 9, 0, 3, 0, $F0, 1, 0, 9,	0
		dc.b 4,	$34, $34, $34, $34, 0, $D0, 0, 0, 0, 0,	$D8, 4,	0, $B, 0
		dc.b $E0, 8, 0,	$D, 0, $E8, 4, 0, $10, 0, $F0, 1, 0, $12, 0, 0
nemesis_enemy_tiles_46:
    binclude "src/enemies/46/nemesis_tiles.bin"
    align 2, 0
off_1E60E:	dc.w byte_1E610-off_1E60E
byte_1E610:	dc.b 2,	4, 0, 8, 0, $14, 0, $24, 0, $31, $31, $31, $31,	0, 0, $F, 0, 0,	0, 0
		dc.b 1,	$31, $31, $31, $31, 0, 0, $D, 0, 0, 0, $12, $D,	0, 8, 0, 1, $31, $31, $31
		dc.b $31, 0, 0,	$D, 0, 0, 0, $14, $D, 0, 8, 0
nemesis_01E644:
    binclude "src/nemesis/data_01E644.bin"
    align 2, 0
off_1E864:	dc.w byte_1E866-off_1E864
byte_1E866:	dc.b 1,	$FF, 0,	6, 0, $1C, 2, $36, $36,	$36, $36, 0, 0,	$F, 0, 0
		dc.b 0,	$20, 5,	0, $10,	0, $20,	5, 0, $10, $10,	0, 2, $36, $36,	$36
		dc.b $36, 0, 0,	$F, 0, $14, 0, $20, 5, 0, $24, 0, $20, 5, 8, $24
		dc.b $10, 0
nemesis_01E898:
    binclude "src/nemesis/data_01E898.bin"
    align 2, 0
off_1EFD2:	dc.w byte_1F000-off_1EFD2
		dc.w byte_1F008-off_1EFD2
		dc.w byte_1F010-off_1EFD2
		dc.w byte_1EFDC-off_1EFD2
		dc.w byte_1EFE0-off_1EFD2
byte_1EFDC:	dc.b 0,	$FF, 0,	8
byte_1EFE0:	dc.b 0,	$FF, 0,	$14, 1,	$37, $37, $37, $37, 0, $FC, $A,	0, 0, $E8, $FC
		dc.b $A, 0, 9, 0, 0, $38, $38, $38, $38, 0, 0, 0, 0, 0,	0, 0
byte_1F000:	dc.b 2,	4, 0, $18, 0, $2E, 0, $44
byte_1F008:	dc.b 2,	4, 0, $52, 0, $6C, 0, $86
byte_1F010:	dc.b 2,	4, $80,	$4A, $80, $64, $80, $7E, 2, $39, $39, $39, $39,	0, $FC,	9
		dc.b 0,	$31, $F4, $C, 9, 0, $37, $EC, $C, 5, 0,	$3D, 4,	0, 2, $39
		dc.b $39, $39, $39, 0, $FC, 9, 0, $31, $F4, $C,	9, 0, $41, $EC,	$C, 5
		dc.b 0,	$47, 4,	0, 2, $39, $39,	$39, $39, 0, $FC, 9, 0,	$31, $F4, $C
		dc.b 9,	0, $4B,	$EC, $C, 5, 0, $51, 4, 0, 3, $39, $39, $39, $39, 0
		dc.b $FD, 5, 0,	$12, $F3, $FD, 5, 0, $16, $E3, $D, 8, 0, $1A, $EB, $15
		dc.b 4,	0, $1D,	$F3, 3,	$39, $39, $39, $39, 0, $FD, 5, 0, $12, $F3, $FD
		dc.b 5,	0, $1F,	$E3, $D, 8, 0, $23, $EB, $15, 4, 0, $26, $F3, 3, $39
		dc.b $39, $39, $39, 0, $FD, 5, 0, $12, $F3, $FD, 5, 0, $28, $E3, $D, 8
		dc.b 0,	$2C, $EB, $15, 4, 0, $2F, $F3, 2, 0, $A, 0, $55, 0, 0, $A
		dc.b 0,	$5E, $18, 0
nemesis_enemy_tiles_34:
    binclude "src/enemies/34/nemesis_tiles.bin"
    align 2, 0
off_1F1B4:	dc.w byte_1F1B6-off_1F1B4
byte_1F1B6:	dc.b 2,	4, 0, 8, 0, $14, 0, $2E, 0, $35, $35, $35, $35,	0, 0, $F, 0, 0,	0, 0
		dc.b 3,	$35, $35, $35, $35, 0, 0, 3, 0,	0, $FC,	0, 3, 0, 4, 6, 0, 3, 0,	8
		dc.b $12, 0, 3,	0, $C, $1C, 3, $35, $35, $35, $35, 0, 0, 3, 0, 0, $F8, 0, 3, 0
		dc.b 4,	4, 0, 3, 0, 8, $14, 0, 3, 0, $C, $20
nemesis_enemy_tiles_29:
    binclude "src/enemies/29/nemesis_tiles.bin"
    align 2, 0
off_1F44C:	dc.w byte_1F44E-off_1F44C
byte_1F44E:	dc.b 2,	4, 0, 8, 0, $13, 0, $23, 0, $3A, $3A, $3A, $3A,	0, 0, $D
		dc.b 0,	$10, 0,	1, $3A,	$3A, $3A, $3A, 0, $FE, $C, 0, 8, 0, $A,	$C
		dc.b 0,	$C, 0, 1, $3A, $3A, $3A, $3A, 0, $FC, $C, 0, 8,	0, $C, $C
		dc.b 0,	$C, 0, 0
nemesis_01F482:
    binclude "src/nemesis/data_01F482.bin"
    align 2, 0
off_1F54A:	dc.w byte_1F54C-off_1F54A
byte_1F54C:	dc.b 0,	$FF, 0,	4, 0, $30, $30,	$30, $30, 0, $E0, 7, 0,	0, $F8,	0
nemesis_01F55C:
    binclude "src/nemesis/data_01F55C.bin"
    align 2, 0
off_1F8D6:	dc.w byte_1F8D8-off_1F8D6
byte_1F8D8:	dc.b 0,	$FF, 0,	4, 5, 5, 5, 5, 5, 0, $B0, $E, 0, 0, $E0, $B0
		dc.b $E, 8, 0, 0, $C8, $F, 0, $C, $E0, $C8, $F,	8, $C, 0, $E8, $E
		dc.b 0,	$1C, $E0, $E8, $E, 8, $1C, 0
nemesis_01F900:
    binclude "src/nemesis/data_01F900.bin"
    align 2, 0
off_1FB80:	dc.w byte_1FB82-off_1FB80
byte_1FB82:	dc.b 0,	$FF, 0,	4, 3, 5, 5, 5, 5, 0, $C0, $F, 0, 0, $E0, $C0
		dc.b $F, 8, 0, 0, $E0, $F, 0, $10, $E0,	$E0, $F, 8, $10, 0
nemesis_01FBA0:
    binclude "src/nemesis/data_01FBA0.bin"
    align 2, 0
off_1FD76:	dc.w byte_1FD78-off_1FD76
byte_1FD78:	dc.b 0,	$FF, 0,	4, 4, 0, 0, 0, 0, 0, $E8, 4, 0,	0, $E4,	$E8
		dc.b $C, 0, 2, 4, $F0, $D, 0, 6, $D4, $F0, $D, 0, $E, $F4, $F0,	9
		dc.b 0,	$16, $14, 0
nemesis_01FD9C:
    binclude "src/nemesis/data_01FD9C.bin"
    align 2, 0
off_1FECC:	dc.w byte_1FECE-off_1FECC
byte_1FECE:	dc.b 1,	$FF, 0,	6, 0, $11, 0, 7, 8, 7, 8, 0, 0,	$D, 0, 0
		dc.b $E0, 0, 0,	0, 0, 0, 0, $F0, 7, 0, 8, $F0
nemesis_01FEEA:
    binclude "src/nemesis/data_01FEEA.bin"
    align 2, 0
off_1FF3C:	dc.w byte_1FF40-off_1FF3C
		dc.w byte_1FF4A-off_1FF3C
byte_1FF40:	dc.b 3,	8, 0, $14, 0, $20, 0, $2C, 0, $20
byte_1FF4A:	dc.b 3,	8, 0, $2E, 0, $2E, 0, $2E, 0, $2E, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 1
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 2, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 3, 0,	0
nemesis_01FF84:
    binclude "src/nemesis/data_01FF84.bin"
    align 2, 0
off_2019C:	dc.w byte_201A0-off_2019C
		dc.w byte_201E2-off_2019C
byte_201A0:	dc.b 5,	$28, 0,	$E, 0, $28, 0, $E, 0, $E, 0, $E, 0, $E,	3, $32
		dc.b $32, $32, $32, 0, $D0, 8, 0, 0, 0,	$D8, 1,	0, 3, $10, $E8,	$A
		dc.b 0,	5, 0, $D8, 4, 0, $12, 0, 3, $32, $32, $32, $32,	0, $D0,	8
		dc.b 0,	0, 0, $D8, 1, 0, 3, $10, $E8, $A, 0, 5,	0, $D8,	4, 0
		dc.b $E, 0
byte_201E2:	dc.b 1,	$A, 0, 6, 0, $12, 0, $32, $32, $32, $32, 0, $E0, 4, 0, $14
		dc.b 0,	0, 0, $32, $32,	$32, $32, 0, $E0, 4, 0,	$10, 0,	0
nemesis_020200:
    binclude "src/nemesis/data_020200.bin"
    align 2, 0
off_204C2:	dc.w byte_204C6-off_204C2
		dc.w byte_20512-off_204C2
byte_204C6:	dc.b 4,	$1E, 0,	$C, 0, $2C, 0, $C, 0, $C, 0, $C, 4, $32, $32, $32
		dc.b $32, 0, $D0, $C, 0, 0, 0, $D8, 5, 0, 4, $10, $E8, 9, 0, 8
		dc.b 8,	$F8, $C, 0, $E,	0, $D8,	5, 0, $12, 0, 0, 4, $32, $32, $32
		dc.b $32, 0, $D0, $C, 0, 0, 0, $D8, 5, 0, 4, $10, $E8, 9, 0, 8
		dc.b 8,	$F8, $C, 0, $E,	0, $D8,	5, 0, $16, 0, 0
byte_20512:	dc.b 3,	$3C, 0,	$A, 0, $16, 0, $16, 0, $16, 0, 0, 0, 0,	0, 0
		dc.b $E8, 4, 0,	$1A, $F8, 0, 0,	0, 0, 0, 0, 0, $E8, 0, 0, $1C
		dc.b 0,	0
nemesis_020534:
    binclude "src/nemesis/data_020534.bin"
    align 2, 0
off_207EE:	dc.w byte_207F2-off_207EE
		dc.w byte_20816-off_207EE
byte_207F2:	dc.b 0,	$FF, 0,	4, 4, $3B, $3B,	$3B, $3B, 0, 0,	$D, 0, 0, 0, $10
		dc.b 0,	0, 8, 0, $10, 0, 0, 9, $18, $18, $B, 0,	$A, 8, $38, $C
		dc.b 0,	$16, 0,	0
byte_20816:	dc.b 1,	$1E, 0,	6, 0, $12, 0, 0, 0, 0, 0, 0, 0,	4, 0, $1A
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	4, 0, $1C, 0, 0
nemesis_020834:
    binclude "src/nemesis/data_020834.bin"
    align 2, 0
off_20D36:	dc.w byte_20D3A-off_20D36
		dc.w byte_20D4E-off_20D36
byte_20D3A:	dc.b 0,	$FF, 0,	4, 1, $1F, $1F,	$1F, $1F, 0, $E8, 1, 0,	0, 4, $F0
		dc.b 5,	0, 2, $F4
byte_20D4E:	dc.b 3,	$1E, 0,	$A, 0, $16, 0, $26, 0, $32, 0, $1A, $1E, $1B, $1E, 0
		dc.b $E0, $F, 0, 6, $F0, 0, 1, $1B, $1E, $1B, $1E, 0, $E0, 8, 0, $16
		dc.b $F8, $E8, $E, 0, $19, $F0,	0, $1C,	$1E, $1B, $1E, 0, $F0, $D, 0, $27
		dc.b $F0, 0, 0,	$1D, $1E, $1B, $1E, 0, $F0, $D,	0, $2D,	$F0, 0
nemesis_020D8C:
    binclude "src/nemesis/data_020D8C.bin"
    align 2, 0
off_20E88:	dc.w byte_20E8A-off_20E88
byte_20E8A:	dc.b 0,	$FF, 0,	4, 0, 6, 6, 6, 6, 0, $E8, $A, 0, 0, $F4, 0
nemesis_020E9A:
    binclude "src/nemesis/data_020E9A.bin"
    align 2, 0
off_214CA:	dc.w byte_214D0-off_214CA
		dc.w byte_2150A-off_214CA
		dc.w byte_2151E-off_214CA
byte_214D0:	dc.b 1,	8, 0, 6, 0, $20, 3, 0, 0, 0, 0,	0, $C8,	1, 0, $2E
		dc.b $FC, $E0, $D, 0, $30, $F0,	$D8, $C, 0, 0, $F0, $F0, $D, 0,	4, $F0
		dc.b 3,	0, 0, 0, 0, 0, $C8, 1, 0, $2E, $FC, $E0, $D, 0,	$38, $F0
		dc.b $D8, $C, 0, 0, $F0, $F0, $D, 0, 4,	$F0
byte_2150A:	dc.b 0,	$FF, 0,	4, 1, 0, 0, 0, 0, 0, $D8, $C, 0, $C, $F0, $E0
		dc.b $F, 0, $10, $F0
byte_2151E:	dc.b 0,	$FF, $80, 4, 1,	0, 0, 0, 0, 0, $E8, $E,	0, $20,	$EC, $F0
		dc.b 1,	0, $2C,	$C
off_21532:	dc.w byte_21586-off_21532
		dc.w byte_215B4-off_21532
		dc.w byte_215E2-off_21532
		dc.w byte_215F0-off_21532
		dc.w byte_215FE-off_21532
		dc.w byte_21612-off_21532
		dc.w byte_21626-off_21532
		dc.w byte_2162A-off_21532
		dc.w byte_2162E-off_21532
		dc.w byte_21634-off_21532
		dc.w byte_2163A-off_21532
		dc.w byte_21648-off_21532
		dc.w byte_21656-off_21532
		dc.w byte_21664-off_21532
		dc.w byte_21672-off_21532
		dc.w byte_2167A-off_21532
		dc.w byte_21688-off_21532
		dc.w byte_21682-off_21532
		dc.w byte_2168E-off_21532
		dc.w byte_2169A-off_21532
		dc.w byte_216A6-off_21532
		dc.w byte_216B0-off_21532
		dc.w byte_216BA-off_21532
		dc.w byte_216C2-off_21532
		dc.w byte_216CA-off_21532
		dc.w byte_216D4-off_21532
		dc.w byte_2158A-off_21532
		dc.w byte_215B8-off_21532
		dc.w byte_216F2-off_21532
		dc.w byte_216FC-off_21532
		dc.w byte_21706-off_21532
		dc.w byte_21710-off_21532
		dc.w byte_21726-off_21532
		dc.w byte_2172C-off_21532
		dc.w byte_2171A-off_21532
		dc.w byte_21720-off_21532
		dc.w byte_216DE-off_21532
		dc.w byte_216E8-off_21532
		dc.w byte_21732-off_21532
		dc.w byte_21748-off_21532
		dc.w byte_21756-off_21532
		dc.w byte_2175A-off_21532
byte_21586:	dc.b 0,	$FF, $81, $D8
byte_2158A:	dc.b $13, 8, $81, $EE, $82, 4, $81, $EE, $82, 4, $82, $1E, $82,	$34, $82, $1E, $82, $34, $82, $1E
		dc.b $82, $34, $82, $4E, $82, $4E, $82,	$68, $82, $82, $82, $68, $82, $82, $82,	$68, $82, $82, $82, $68
		dc.b $82, $82
byte_215B4:	dc.b 0,	$FF, 1,	$AA
byte_215B8:	dc.b $13, 8, 1,	$C0, 1,	$D6, 1,	$C0, 1,	$D6, 1,	$F0, 2,	6, 1, $F0, 2, 6, 1, $F0
		dc.b 2,	6, 2, $20, 2, $20, 2, $3A, 2, $54, 2, $3A, 2, $54, 2, $3A, 2, $54, 2, $3A
		dc.b 2,	$54
byte_215E2:	dc.b 5,	$FF, $82, $44, $82, $5A, $82, $74, $82,	$84, $82, $94, $82, $AA
byte_215F0:	dc.b 5,	$FF, 2,	$36, 2,	$4C, 2,	$66, 2,	$76, 2,	$86, 2,	$9C
byte_215FE:	dc.b 3,	$FF, $82, $9E, $82, $BE, $82, $D8, $82,	$F2, $83, 8, $83, $2C, $83, $46
		dc.b $83, $66, $81, $60
byte_21612:	dc.b 3,	$FF, 2,	$8A, 2,	$AA, 2,	$C4, 2,	$DE, 2,	$F4, 3,	$18, 3,	$32
		dc.b 3,	$52, 1,	$4C
byte_21626:	dc.b 0,	4, $83,	$72
byte_2162A:	dc.b 0,	4, 3, $6E
byte_2162E:	dc.b 1,	4, 3, $80, 3, $9A
byte_21634:	dc.b 1,	4, $83,	$7A, $83, $94
byte_2163A:	dc.b 5,	4, $83,	$A8, $83, $A8, $83, $BE, $83, $D4, $83,	$D4, $83, $BE
byte_21648:	dc.b 5,	4, 3, $9A, 3, $9A, 3, $B0, 3, $C6, 3, $C6, 3, $B0
byte_21656:	dc.b 5,	0, 3, $CE, 3, $F2, 4, $12, 4, $2C, 4, $56, 4, $70
byte_21664:	dc.b 5,	0, $83,	$C0, $83, $E4, $84, 4, $84, $1E, $84, $48, $84,	$62
byte_21672:	dc.b 2,	4, $84,	$74, $84, $8E, $84, $A8
byte_2167A:	dc.b 2,	4, 4, $6C, 4, $86, 4, $A0
byte_21682:	dc.b 1,	1, 4, $AE, 4, $CE
byte_21688:	dc.b 1,	1, $84,	$A8, $84, $C8
byte_2168E:	dc.b 4,	2, $84,	$E6, $84, $E6, $84, $E6, $85, 0, $85, $20
byte_2169A:	dc.b 4,	2, 4, $DA, 4, $DA, 4, $DA, 4, $F4, 5, $14
byte_216A6:	dc.b 3,	2, $85,	$28, $85, $28, $85, $28, $85, $3E
byte_216B0:	dc.b 3,	2, 5, $1E, 5, $1E, 5, $1E, 5, $34
byte_216BA:	dc.b 2,	3, $85,	$40, $85, $40, $85, $40
byte_216C2:	dc.b 2,	3, 5, $38, 5, $38, 5, $38
byte_216CA:	dc.b 3,	2, $85,	$30, $85, $30, $85, $30, $85, $46
byte_216D4:	dc.b 3,	2, 5, $26, 5, $26, 5, $26, 5, $3C
byte_216DE:	dc.b 3,	2, $85,	$1C, $85, $1C, $85, $1C, $85, $32
byte_216E8:	dc.b 3,	2, 5, $12, 5, $12, 5, $12, 5, $28
byte_216F2:	dc.b 3,	2, $85,	$38, $85, $38, $85, $38, $85, $4E
byte_216FC:	dc.b 3,	2, $85,	$38, 5,	$2E, 5,	$2E, 5,	$44
byte_21706:	dc.b 3,	2, $85,	$50, $85, $50, $85, $50, $85, $70
byte_21710:	dc.b 3,	2, 5, $46, 5, $46, 5, $46, 5, $66
byte_2171A:	dc.b 1,	4, $85,	$3C, $85, $5C
byte_21720:	dc.b 1,	4, 5, $36, 5, $56
byte_21726:	dc.b 1,	4, $85,	$66, $85, $80
byte_2172C:	dc.b 1,	4, 5, $60, 5, $7A
byte_21732:	dc.b 9,	8, 5, $8E, 5, $8E, 5, $8E, 5, $9E, 5, $AE, 5, $BE, 5, $BE, 5, $BE, 5, $D4
		dc.b 5,	$EE
byte_21748:	dc.b 5,	3, 0, $DE, 0, $F4, 1, $E, 1, $1E, 1, $2E, 1, $44
byte_21756:	dc.b 0,	$FF, 1,	$80
byte_2175A:	dc.b 0,	$FF, 3,	$D6, 3,	1, 1, 2, 2, 1, $D0, 8, 0, 0, $F0, $D8, $C, 0, 3, $F0
		dc.b $E0, 8, 0,	7, $F0,	$E8, $E, 0, $A,	$F0, 2,	1, 1, 2, 2, 2, $D0, 4, 0, 0
		dc.b $F6, $D8, 8, 0, 2,	$EE, $E0, $F, 0, 5, $EE, 0, 3, 1, 1, 2,	2, 3, $D0, 4
		dc.b 0,	0, $F6,	$D8, 8,	0, 2, $EE, $E0,	$F, 0, 5, $EE, $F8, 0, 0, $15, $E, 2, 1
		dc.b 1,	2, 2, 4, $D0, 4, 0, 0, $F6, $D8, 8, 0, 2, $EE, $E0, $F,	0, 5, $EE, 0
		dc.b 3,	1, 1, 2, 2, 5, $D0, 4, 0, 0, $F6, $D8, 8, 0, 2,	$EE, $E0, $F, 0, 5
		dc.b $EE, $F8, 0, 0, $15, $E, 3, 1, 1, 2, 2, 6,	$D0, 4,	0, 0, $F6, $D8,	$F, 0
		dc.b 2,	$EE, $F8, $C, 0, $12, $EE, $F8,	0, 0, $16, $E, 3, 1, 1,	2, 2, 7, $D0, 4
		dc.b 0,	0, $F6,	$D8, $F, 0, 2, $EE, $F8, $C, 0,	$12, $EE, $F8, 0, 0, $16, $E, 3, 1
		dc.b 1,	2, 2, 8, $D0, 4, 0, 0, $F6, $D8, $F, 0,	2, $EE,	$F8, $C, 0, $12, $EE, $F8
		dc.b 0,	0, $16,	$E, 2, 1, 1, 2,	2, 9, $D0, $F, 0, 0, $F0, $F0, 8, 0, $10, $F0
		dc.b $F8, $C, 0, $13, $F0, 0, 3, 1, 1, 2, 2, $A, $D0, $D, 0, 0,	$F2, $E0, 8, 0
		dc.b 8,	$FA, $E8, $C, 0, $B, $F2, $F0, 9, 0, $F, $F2, 1, 1, 1, 2, 2, $B, $D0, $F
		dc.b 0,	0, $F1,	$F0, 9,	0, $10,	$F1, 1,	1, 1, 2, 2, $C,	$D0, $F, 0, 0, $F1, $F0
		dc.b $D, 0, $10, $F1, 2, 1, 1, 2, 2, $D, $D0, $D, 0, 0,	$F1, $E0, 8, 0,	8, $F9
		dc.b $E8, $E, 0, $B, $F1, 0, 1,	1, 1, 2, 2, $E,	$D0, $A, 0, 0, $F2, $E8, $E, 0
		dc.b 9,	$F2, 4,	1, 1, 2, 2, $F,	$CD, 8,	0, 0, $F2, $D5,	$F, 0, 3, $EA, $F5, $C
		dc.b 0,	$13, $EA, $FD, 8, 0, $17, $F2, 5, $C, 0, $1A, $EA, 0, 3, 1, 1, 2, 2, $10
		dc.b $D1, 8, 0,	0, $F2,	$D9, $E, 0, 3, $EA, $F1, 8, 0, $F, $F2,	$F9, 4,	0, $12,	$F2
		dc.b 3,	9, 9, $A, $A, $11, $D0,	8, 0, 0, $F2, $D8, $E, 0, 3, $EA, $E8, 0, 0, $F
		dc.b $A, $F0, $C, 0, $10, $F2, 2, $B, $B, $C, $C, $12, $D0, 4, 0, 0, $F0, $D8, 8, 0
		dc.b 2,	$F0, $E0, $F, 0, 5, $F0, 0, 5, $D, $D, $E, $E, $3D, $D0, $D, 0,	0, $F6,	$E0
		dc.b $E, 0, 8, $EE, $E0, 0, 0, $14, $E,	$F8, 4,	0, $15,	$EE, $F8, 0, 0,	$17, 6,	0
		dc.b 0,	0, $18,	$EE, 3,	$F, $F,	$10, $10, $3E, $D1, 8, 0, 0, $FA, $D9, $E, 0, 3, $F2
		dc.b $F1, 8, 0,	$F, $FA, $F9, 4, 0, $12, $FA, 4, $F, $F, $10, $10, $3F,	$D0, 8,	0, 0
		dc.b $F8, $D8, $E, 0, 3, $F0, $E8, 0, 0, $F, $10, $F0, $C, 0, $10, $F8,	$F8, 4,	0, $14
		dc.b 8,	0, 3, $11, $11,	$12, $12, $40, $D0, 8, 0, 0, $F6, $D8, $E, 0, 3, $EE, $F0, 9
		dc.b 0,	$F, $F6, 0, 4, 0, $15, 6, 3, $F, $F, $10, $10, $41, $D0, 9, 0, 0, 0, $E0
		dc.b $D, 0, 6, 0, $F0, 8, 0, $E, 0, $F8, $C, 0,	$11, 0,	2, $13,	$13, $14, $14, $14
		dc.b $E0, 4, 0,	0, $EE,	$E8, $E, 0, 2, $E6, $F0, 1, 0, $E, 6, 0, 3, 3, 3, 3
		dc.b 3,	$15, $E8, 9, 0,	0, $F0,	$E8, 4,	0, 6, 8, $F0, 9, 0, 8, 8, $F8, $C, 0
		dc.b $E, $E8, 3, 3, 3, 3, 3, $16, $E8, 9, 0, 0,	$F0, $E8, 4, 0,	6, 8, $F0, 9
		dc.b 0,	8, 8, $F8, $C, 0, $E, $E8, 2, $15, $15,	$15, $15, $17, $D0, $F,	0, 0, $F0, $F0
		dc.b $C, 0, $10, $F0, $F8, 4, 0, $14, 0, 0, 2, $15, $15, $15, $15, $18,	$D0, 8,	0, 0
		dc.b $F8, $D8, $E, 0, 3, $F0, $F0, $D, 0, $F, $F0, 0, 2, $15, $15, $15,	$15, $19, $D0, $F
		dc.b 0,	0, $F0,	$F0, $C, 0, $10, $F0, $F8, 4, 0, $14, $F0, 0, 5, $21, $21, $22,	$22, $1A
		dc.b $D8, 8, 0,	0, $E3,	$E0, $D, 0, 3, $DB, $E0, 4, 0, $B, $FB,	$E8, $D, 0, $D,	$FB
		dc.b $F0, 8, 0,	$15, $E3, $F8, 0, 0, $18, $B, 4, $21, $21, $22,	$22, $1B, $D8, $A, 0, 0
		dc.b $DF, $E0, $A, 0, 9, $F7, $F0, 4, 0, $12, $E7, $F8,	8, 0, $14, $DF,	$F8, 4,	0, $17
		dc.b $F7, 0, 3,	$21, $21, $22, $22, $1C, $D8, $B, 0, 0,	$DD, $E0, 4, 0,	$C, $F5, $E8, $A
		dc.b 0,	$E, $F5, $F8, 8, 0, $17, $DD, 6, $21, $21, $22,	$22, $1D, $D0, 0, 0, 0,	$EB, $D8
		dc.b 4,	0, 1, $E3, $E0,	8, 0, 3, $E3, $E8, $D, 0, 6, $DB, $E8, 4, 0, $E, $FB, $F0
		dc.b $C, 0, $10, $FB, $F8, 8, 0, $14, $EB, 0, 3, $21, $21, $22,	$22, $1E, $D8, 4, 0, 0
		dc.b $E4, $E0, $D, 0, 2, $DC, $E8, 6, 0, $A, $FC, $F0, 9, 0, $10, $E4, 4, $21, $21, $22
		dc.b $22, $1F, $D8, 8, 0, 0, $DE, $E0, $D, 0, 3, $DE, $E8, 4, 0, $B, $FE, $F0, $D, 0
		dc.b $D, $EE, $F8, 0, 0, $15, $E, 0, 3,	0, 0, 0, 0, $20, $D8, $F, 0, 0,	$10, $E0
		dc.b 5,	0, $10,	0, $F0,	0, 0, $14, 8, $F8, 8, 0, $15, $10, 3, 0, 0, 0, 0, $21
		dc.b $D8, $F, 0, 0, $10, $E0, 0, 0, $10, 8, $E8, 5, 0, $11, 0, $F8, 8, 0, $15, $10
		dc.b 2,	0, 0, 0, 0, $22, $D8, $F, 0, 0,	8, $E0,	2, 0, $10, 0, $F8, 8, 0, $13
		dc.b 8,	0, 4, 1, 1, 2, 2, $23, $D0, $C,	0, 0, $D9, $D8,	$F, 0, 4, $D9, $D8, $A
		dc.b 0,	$14, $F9, $F0, 5, 0, $1D, $F9, $F8, 8, 0, $21, $E1, 0, 5, 1, 1,	2, 2, $24
		dc.b $D0, 3, 0,	0, $D9,	$D0, $F, 0, 4, $E1, $D8, 6, 0, $14, 1, $F0, $C,	0, $1A,	$D9
		dc.b $F0, 5, 0,	$1E, $F9, $F8, 8, 0, $22, $E1, 3, 1, 1,	2, 2, $25, $D0,	$B, 0, 0
		dc.b $EC, $E0, 5, 0, $C, 4, $F0, $D, 0,	$10, $E4, $F8, 0, 0, $18, 4, 4,	1, 1, 2
		dc.b 2,	$26, $D0, $C, 0, 0, $E0, $D8, 3, 0, 4, $E0, $D8, $E, 0,	8, $E8,	$F0, 9,	0
		dc.b $14, $E8, $F8, 4, 0, $1A, 0, 0, 4,	1, 1, 2, 2, $27, $D0, 9, 0, 0, $DE, $E0
		dc.b 8,	0, 6, $E6, $E8,	1, 0, 9, $DE, $E8, $E, 0, $B, $E6, $F8,	0, 0, $17, 6, 0
		dc.b 2,	$13, $13, $14, $14, $28, $E0, 4, 0, 0, $EE, $E8, $E, 0,	2, $E6,	$F0, 9,	0, $E
		dc.b 6,	0, 2, $13, $13,	$14, $14, $29, $E0, $C,	0, 0, $EF, $E8,	2, 0, 4, $E7, $E8, $E
		dc.b 0,	7, $EF,	0, 2, $16, $16,	$16, $16, $2D, $CD, $F,	0, 0, $EC, $E5,	0, 0, $10, $C
		dc.b $ED, $C, 0, $11, $F4, 0, 3, $16, $16, $16,	$16, $2E, $CD, 8, 0, 0,	$EC, $D5, $E, 0
		dc.b 3,	$EC, $DD, 1, 0,	$F, $C,	$ED, $C, 0, $11, $EC, 2, 1, 1, 2, 2, $31, $D0, $F
		dc.b 0,	0, $F0,	$F0, 8,	0, $10,	$F0, $F8, $C, 0, $13, $F0, 0, 2, 1, 1, 2, 2, $32
		dc.b $D8, 8, 0,	0, $F0,	$E0, $E, 0, 3, $F0, $F8, 8, 0, $F, $F0,	0, 4, $17, $17,	$18
		dc.b $18, $33, $D1, 8, 0, 0, $F2, $D9, $E, 0, 3, $EA, $D9, 5, 0, $F, $A, $E9, 0, 0
		dc.b $13, $A, $F1, $C, 0, $14, $F2, 0, 2, $19, $19, $19, $19, $34, $CC,	$F, 0, 0, $EA, $CC
		dc.b 3,	0, $10,	$A, $EC, $C, 0,	$14, $EA, 0, 3,	$20, $20, $20, $20, $35, $D8, 8, 0, 0
		dc.b $EC, $E0, $E, 0, 3, $E4, $F0, 0, 0, $F, 4,	$F8, $C, 0, $10, $EC, 3, $20, $20, $20
		dc.b $20, $36, $D8, 8, 0, 0, $EC, $E0, $E, 0, 3, $E4, $F0, 0, 0, $F, 4,	$F8, $C, 0
		dc.b $10, $EC, 1, 0, 0,	0, 0, $37, $F0,	$D, 0, 0, $EC, $F8, 0, 0, 8, $C, 1, 0
		dc.b 0,	0, 0, $38, $E8,	4, 0, 0, $F4, $F0, 9, 0, 2, $F4, 1, 0, 0, 0, 0,	$39
		dc.b $E8, 6, 0,	0, $F4,	$F0, 0,	0, 6, 4, 2, 0, 0, 0, 0,	$3A, $F0, $C, 0, 0
		dc.b $EC, $F8, 4, 0, 4,	$EC, $F8, 4, 0,	6, 4, 0, 3, 0, 0, 0, 0,	$3B, $E8, 4
		dc.b 0,	0, $F8,	$F0, $C, 0, 2, $F0, $F8, 0, 0, 6, $F0, $F8, 4, 0, 7, 0,	0, 0
		dc.b 0,	0, 0, $3C, $E8,	6
dword_21D28:	dc.l $F800
off_21D2C:	dc.l byte_21E30
		dc.l byte_220F0
		dc.l byte_22390
		dc.l byte_22650
		dc.l byte_228F0
		dc.l byte_22BB0
		dc.l byte_22E90
		dc.l byte_23170
		dc.l byte_23450
		dc.l byte_23730
		dc.l byte_239D0
		dc.l byte_23C90
		dc.l byte_23F90
		dc.l byte_24270
		dc.l byte_24510
		dc.l byte_248D0
		dc.l byte_24B50
		dc.l byte_24DD0
		dc.l byte_25070
		dc.l byte_253B0
		dc.l byte_255B0
		dc.l byte_257F0
		dc.l byte_25A30
		dc.l byte_25CF0
		dc.l byte_25FD0
		dc.l byte_26290
		dc.l byte_265B0
		dc.l byte_268D0
		dc.l byte_26C10
		dc.l byte_26EF0
		dc.l byte_271B0
		dc.l byte_27470
		dc.l byte_27770
		dc.l byte_27A70
		dc.l byte_27D30
		dc.l byte_281B0
		dc.l byte_28650
		dc.l byte_28970
		dc.l byte_28CF0
		dc.l byte_28FF0
		dc.l byte_29270
		dc.l 0
		dc.l 0
		dc.l 0
		dc.l byte_294D0
		dc.l byte_29770
		dc.l 0
		dc.l 0
		dc.l byte_29A10
		dc.l byte_29CF0
		dc.l byte_29F30
		dc.l byte_2A230
		dc.l byte_2A530
		dc.l byte_2A7B0
		dc.l byte_2AA30
		dc.l byte_2AB50
		dc.l byte_2AC50
		dc.l byte_2AD30
		dc.l byte_2AE30
		dc.l byte_2AF50
		dc.l byte_2B010
		dc.l byte_2B330
		dc.l byte_2B5B0
		dc.l byte_2B870
		dc.l byte_2BB50
byte_21E30:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $96, 0, 0, 9, $88, 0, 0, $99, $99
		dc.b 0,	7, $77,	$99, 0,	7, $77,	$77, 0,	0, $7F,	$FF, 0,	0, 0, 0, 6, $88, $88, $90
		dc.b $88, $97, $78, $89, $77, $99, $87,	$77, $99, $97, $77, $77, $97, $77, $96,	$68, $77, $76, $6C, $CF
		dc.b $79, $6F, $C1, $1C, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $96, $60, 0, 0
		dc.b $79, $68, $90, 0, $88, $88, $89, 0, $99, $68, $89,	$90, $DC, $F9, $99, 0, 0, 0, $F, $F7
		dc.b 0,	0, $F7,	$99, 0,	7, $99,	$FF, 0,	$99, $FF, $FF, 9, $FF, $FF, $FF, 9, $FF, $FF, $FF
		dc.b 0,	$9F, $FF, 0, 0,	0, 0, 0, $99, $FD, $CC,	$CD, $FD, $CD, $CC, $CC, $FC, $C1, $CC,	$CC
		dc.b $DC, $11, $CC, $CC, $DC, $C1, $CC,	$1F, $D1, $11, $CC, $FF, $7B, $BC, $1C,	$FF, $B7, $BB, $CC, $CB
		dc.b $D1, $D0, 0, 0, $D1, $D0, 0, 0, $D1, $C0, 0, 0, $D1, $C0, 0, 0, $D1, $F0, 0, 0
		dc.b $D1, $F7, 0, 0, $BB, $B0, 0, $88, $BB, $BB, $B8, $77, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $B0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, $22, 0, 0, 2, $34, 0, 0, $23, $22, 0, 2, $32, $23, $7B, $77, $BB,	$BB
		dc.b 7,	$BB, $77, $BB, 0, 7, $BB, $77, $23, $37, $9C, $17, $33,	$77, $9D, $C1, $43, $24, $77, $DC
		dc.b $34, $32, $27, $7D, $47, $74, $32,	$79, $BB, $B8, $87, $77, $BB, $B7, $77,	$70, $77, $70, 0, 0
		dc.b $30, 0, 0,	0, $92,	$90, 0,	0, $93,	$29, 0,	0, $17,	$32, $79, 0, $D1, $73, $27, $90
		dc.b 0,	2, $32,	$34, 0,	3, $42,	$34, 0,	3, $43,	$47, 0,	4, $34,	$47, $D, 0, $44, $47
		dc.b $DC, $D0, $D4, $47, $DC, $CD, $CC,	$DF, $DC, $CC, $C1, $CD, $DD, $C1, $11,	$1C, $D, $C1, $11, $11
		dc.b $D, $CC, $11, $11,	0, $DC,	$C1, $11, 0, $DC, $CC, $11, 0, $D, $CC,	$CC, 0,	$D, $DC, $CD
		dc.b 0,	0, $DD,	$D7, 0,	0, $D, $D7, 0, 0, 0, $D, 0, 0, 0, 7, 0,	0, 7, $7B
		dc.b 0,	7, $7B,	$BB, 0,	$7B, $BB, $B7, 7, $B8, $8B, $8B, 7, $88, $BB, $88, $77,	$97, $43, $27
		dc.b $79, $99, $74, $37, $79, $88, $99,	$32, $99, $88, $87, $32, $97, $98, $89,	$73, $77, $99, $88, $97
		dc.b $F9, $79, $99, $97, $FF, $7F, $F1,	$17, $DF, $FD, $11, $1C, $CD, $DD, $1C,	$1D, $1C, $D1, $DC, $DD
		dc.b $11, $CD, $DD, $DD, $11, $11, $CC,	$CC, $C1, $11, $11, $11, $DC, $11, $11,	$11, $7D, $CC, $CC, $CD
		dc.b $B8, $DD, $DD, $DD, $78, $8D, $DD,	$D7, $B8, $80, 0, 0, $88, 0, 0,	0, $80,	0, 7, $77
		dc.b $70, 0, 7,	$BB, $B8, $80, 7, $B8, $8B, $B8, $80, $78, $97,	$73, $32, $79, $79, $79, $32, $78
		dc.b $77, $79, $73, $F7, $77, $79, $77,	$F7, $99, $79, $77, $F7, $99, $97, $87,	$F9, $99, $97, $87, $F7
		dc.b $79, $77, $97, $77, $79, $79, $97,	$71, $77, $79, $99, $7D, $F7, $77, $97,	$70, $DF, $77, $77, 0
		dc.b $CC, $DD, 0, 0, $1C, $D0, 0, 0, $CD, $D0, 0, 0, $DD, 0, 0,	0, $D7,	$B0, 0,	0
		dc.b $7B, $88, 0, 0, 7,	$B8, 0,	0, $77,	$B8, 0,	0, $BB,	$80, 0,	0, $B7,	$7B, $B0, 0
		dc.b $88, $8B, $B8, $88, $8B, $88, $88,	$BB, 0,	0, 0, 0, 0, 0, 0, 0, $80, 0, 0,	0
		dc.b $80, 0, 0,	0, $78,	0, 0, 0, $77, 0, 0, 0, $7C, 0, 0, 0, $1C, 0, 0,	0
		dc.b $CD, 0, 0,	0, $D0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $80, 0, 0,	0
		dc.b $88, 0, 0,	0
byte_220F0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	8, $80,	0, 9, $98, $88,	$88, $98, $88, $98, $8F, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $88, $88, 0, 0, $8F, $FF, $80,	0
		dc.b $FF, $FF, $F8, 0, 0, 0, 0,	9, 0, 0, 0, $99, 0, 0, $F, $F9,	0, 0, $F, $FF
		dc.b 0,	0, $F, $FF, 0, 0, 0, $FF, 0, 0,	0, $99,	0, 0, 9, $FF, $99, $98,	$78, $FF
		dc.b $99, $97, $8F, $FF, $97, $78, $FF,	$DC, $77, $78, $C1, $1C, $77, $89, $1D,	$11, $99, $FD, $11, $D1
		dc.b $FF, $F1, $1C, $CD, $FF, $D1, $CC,	$CC, $FF, $FF, $FF, $80, $FF, $FF, $FF,	$80, $CD, $CF, $FF, $F8
		dc.b $CD, $1C, $FF, $F8, $CC, $C1, $FF,	$80, $1C, $D1, $D0, 0, $11, $1C, $C0, 0, $11, $1C, $C0,	0
		dc.b 0,	0, $9F,	$FF, 0,	9, $FF,	$FF, 0,	9, $FF,	$FF, 0,	9, $FF,	$FF, 0,	0, $99,	$9F
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 2
		dc.b 0,	0, 0, 2, 0, 0, 0, $F, 0, 0, 0, $F, $D, 0, $D, $DC, $DC,	$DD, $DC, $C1
		dc.b $DC, $CD, $C1, $11, $DC, $CC, $11,	$1F, $DD, $C1, $11, $1F, $D, $C1, $11, $11, $D,	$CC, $11, $11
		dc.b 0,	$DC, $C1, $11, 0, $DC, $CC, $11, 0, $D,	$CC, $CC, 0, $D, $DC, $CD, 0, 0, $DD, $DD
		dc.b 0,	0, $D, $D7, 0, 0, 0, $7B, 0, 0,	0, $B8,	0, 0, 0, $B8, 0, 0, $77, $BB
		dc.b 0,	$78, $87, $7B, 7, $88, $BB, $88, $FF, $D1, $CC,	$CC, $FF, $C1, $CC, $CF, $FF, $11, $CC,	$CF
		dc.b $FD, $B8, $8C, $CC, $F7, $8B, $BB,	$BB, 0,	7, $7B,	$BB, 0,	2, $27,	$7B, 2,	$23, $33, $22
		dc.b $23, $43, $43, $32, $34, $22, $24,	$33, $42, $22, $32, $44, $42, $33, $FF,	$32, $43, $3F, $77, $77
		dc.b $44, $F7, $99, $97, $CF, $79, $98,	$89, $77, $79, $79, $98, $F9, $98, $97,	$77, $F7, $99, $88, $97
		dc.b $FF, $79, $98, $89, $1F, $F7, $79,	$97, $11, $CF, $FF, $7D, $11, $11, $DF,	$F1, $C1, $1D, $11, $11
		dc.b $DC, $1D, $C1, $1C, $DD, $CC, $DC,	$CC, $77, $DD, $DD, $FF, $8B, $7D, $DD,	$DD, $B0, 0, 0,	0
		dc.b 0,	0, 0, 0, $80, 0, 0, 0, $B8, $80, 0, 0, $BB, $B8, $80, 0, $DC, $D1, $F7,	0
		dc.b $1D, $DF, $FB, $70, $FD, $BB, $B7,	8, $BB,	$BB, $B8, $87, $BB, $B8, $87, $77, $B8,	$87, $77, $70
		dc.b $B7, $70, 0, 0, $FD, $C1, $20, 0, $2F, $DC, $23, 0, $2F, $DC, $13,	$27, $23, $FD, $C3, $32
		dc.b $33, $7D, $C7, $33, $32, $79, $D7,	$97, $33, $27, $97, $99, $73, $39, $79,	$79, $97, $32, $97, $79
		dc.b $97, $32, $99, $79, $79, $73, $99,	$79, $79, $97, $99, $97, $77, $97, $99,	$77, $DD, $79, $97, $7D
		dc.b $11, $77, $77, $D0, $1C, $DF, $DD,	$D0, $CC, $DF, $DD, 0, $DD, $FD, $D0, 0, $FF, $77, 0, 0
		dc.b $D7, $B8, $80, 0, 0, $7B, $B8, $80, 0, 0, $7B, $B8, 0, 0, 0, $BB, 0, 0, 0,	$B7
		dc.b 0,	0, $BB,	$77, 0,	0, 0, 0, 0, 0, 0, 0, $88, 0, 0,	0, $77,	$B0, 0,	0
		dc.b $77, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, $79, 0, 0, 0, $27, $99, 0, 0, $24, $78, $90, 0, $72, $49, $89,	0
		dc.b $72, $47, $89, 0, $73, $47, $99, 0, $74, $77, $90,	0, $74,	$77, 0,	0, $C1,	$71, 0,	0
		dc.b $C1, $1C, 0, 0, $DC, $CD, 0, 0, $D, $D0, 0, 0, 0, 0, 0, 0,	$B, $BB, 0, 0
		dc.b $B7, $77, $BB, 0, $B7, $77, $77, $B0, $B7,	$77, $77, $70, $B7, $77, $77, $70, $77,	$77, $77, $70
		dc.b $77, $77, $77, 0, $77, $77, $70, 0, $77, $70, 0, 0
byte_22390:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	8, $80,	0, 9, $98, $88,	$88, $98, $88, $98, $8F, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $88, $88, 0, 0, $8F, $FF, $80,	0
		dc.b $FF, $FF, $F8, 0, 0, 0, 0,	9, 0, 0, 0, $99, 0, 0, $F, $F9,	0, 0, $F, $FF
		dc.b 0,	0, $F, $FF, 0, 0, 0, $FF, 0, 0,	0, $99,	0, 0, 9, $FF, $99, $98,	$78, $FF
		dc.b $99, $97, $8F, $FF, $97, $78, $FF,	$DC, $77, $78, $C1, $1C, $77, $89, $1D,	$11, $99, $FD, $11, $D1
		dc.b $FF, $F1, $1C, $CD, $FF, $D1, $CC,	$CC, $FF, $FF, $FF, $80, $FF, $FF, $FF,	$80, $CD, $CF, $FF, $F8
		dc.b $CD, $1C, $FF, $F8, $CC, $C1, $FF,	$80, $1C, $D1, $D0, 0, $11, $1C, $C0, 0, $11, $1C, $C0,	0
		dc.b 0,	0, $9F,	$FF, 0,	9, $FF,	$FF, 0,	9, $FF,	$FF, 0,	9, $FF,	$FF, 0,	0, $99,	$9F
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 2
		dc.b 0,	0, 0, 2, 0, 0, 0, $F, 0, 0, 0, $F, $D, 0, $D, $DC, $DC,	$DD, $DC, $C1
		dc.b $DC, $CD, $C1, $11, $DC, $CC, $11,	$1F, $DD, $C1, $11, $1F, $D, $C1, $11, $11, $D,	$CC, $11, $11
		dc.b 0,	$DC, $C1, $11, 0, $DC, $CC, $11, 0, $D,	$CC, $CC, 0, $D, $DC, $CD, 0, 0, $DD, $DD
		dc.b 0,	0, $D, $D7, 0, 0, 0, $7B, 0, 0,	0, $B8,	0, 0, 0, $B8, 0, 0, $77, $BB
		dc.b 0,	$78, $87, $7B, 7, $88, $BB, $88, $FF, $D1, $CC,	$CC, $FF, $C1, $CC, $CF, $FF, $11, $CC,	$CF
		dc.b $FD, $B8, $8C, $CC, $F7, $8B, $BB,	$BB, 0,	7, $7B,	$BB, 0,	2, $27,	$7B, 2,	$23, $33, $22
		dc.b $23, $43, $43, $32, $34, $22, $24,	$33, $42, $22, $32, $44, $42, $33, $FF,	$32, $43, $3F, $77, $77
		dc.b $44, $F7, $99, $97, $CF, $79, $98,	$89, $77, $79, $79, $98, $F9, $98, $97,	$77, $F7, $99, $88, $97
		dc.b $FF, $79, $98, $89, $1F, $F7, $79,	$97, $11, $CF, $FF, $7D, $11, $11, $DF,	$F1, $C1, $1D, $11, $11
		dc.b $DC, $1D, $C1, $1C, $DD, $CC, $DC,	$CC, $77, $DD, $DD, $FF, $8B, $7D, $DD,	$DD, $B0, 0, 0,	0
		dc.b 0,	0, 0, 0, $80, 0, 0, 0, $B8, $80, 0, 0, $BB, $B8, $80, 0, $DC, $D1, $F7,	0
		dc.b $1D, $DF, $FB, $70, $FD, $BB, $B7,	8, $BB,	$BB, $B8, $87, $BB, $B8, $87, $77, $B8,	$87, $77, $70
		dc.b $B7, $70, 0, 0, $FD, $C1, $20, 0, $2F, $DC, $23, 0, $2F, $DC, $13,	$27, $23, $FD, $C3, $32
		dc.b $33, $7D, $C7, $33, $32, $79, $D7,	$97, $33, $27, $97, $99, $73, $39, $79,	$79, $97, $32, $97, $79
		dc.b $97, $32, $99, $79, $79, $73, $99,	$79, $79, $97, $99, $97, $77, $97, $99,	$77, $DD, $79, $97, $7D
		dc.b $11, $77, $77, $D0, $1C, $DF, $DD,	$D0, $CC, $DF, $DD, 0, $DD, $FD, $D0, 0, $FF, $77, 0, 0
		dc.b $D7, $B8, $80, 0, 0, $7B, $B8, $80, 0, 0, $7B, $B8, 0, 0, 0, $BB, 0, 0, 0,	$BB
		dc.b 0,	0, $BB,	$BB, 0,	0, 0, 0, 0, 0, 0, 0, $88, 0, 0,	0, $77,	$B0, 0,	0
		dc.b $77, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, $79, 0, 0, 0, $27, $99, 0, 0, $24, $78, $90, 0, $72, $49, $89,	0
		dc.b $72, $47, $89, 0, $73, $47, $99, 0, $74, $77, $90,	0, $74,	$77, 0,	0, $C1,	$71, 0,	0
		dc.b $C1, $1C, 0, 0, $DC, $CD, 0, 0, $D, $D0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $8B, 0, $BB, $BB, $88, $BB, $77, $77, $B7,	$77, $77, $77, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $B0, 0, 0, 0, $7B, 0, 0, 0
		dc.b $70, 0, 0,	0
byte_22650:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	8, $80,	0, 9, $98, $88,	$88, $98, $88, $98, $8F, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $88, $88, 0, 0, $8F, $FF, $80,	0
		dc.b $FF, $FF, $F8, 0, 0, 0, 0,	9, 0, 0, 0, $99, 0, 0, $F, $F9,	0, 0, $F, $FF
		dc.b 0,	0, $F, $FF, 0, 0, 0, $FF, 0, 0,	0, $99,	0, 0, 9, $FF, $99, $98,	$78, $FF
		dc.b $99, $97, $8F, $FF, $97, $78, $FF,	$DC, $77, $78, $C1, $1C, $77, $89, $1D,	$11, $99, $FD, $11, $D1
		dc.b $FF, $F1, $1C, $CD, $FF, $D1, $CC,	$CC, $FF, $FF, $FF, $80, $FF, $FF, $FF,	$80, $CD, $CF, $FF, $F8
		dc.b $CD, $1C, $FF, $F8, $CC, $C1, $FF,	$80, $1C, $D1, $D0, 0, $11, $1C, $C0, 0, $11, $1C, $C0,	0
		dc.b 0,	0, $9F,	$FF, 0,	9, $FF,	$FF, 0,	9, $FF,	$FF, 0,	9, $FF,	$FF, 0,	0, $99,	$9F
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 2
		dc.b 0,	0, 0, 2, 0, 0, 0, $F, 0, 0, 0, $F, $D, 0, $D, $DC, $DC,	$DD, $DC, $C1
		dc.b $DC, $CD, $C1, $11, $DC, $CC, $11,	$1F, $DD, $C1, $11, $1F, $D, $C1, $11, $11, $D,	$CC, $11, $11
		dc.b 0,	$DC, $C1, $11, 0, $DC, $CC, $11, 0, $D,	$CC, $CC, 0, $D, $DC, $CD, 0, 0, $DD, $DD
		dc.b 0,	0, $D, $D7, 0, 0, 0, $7B, 0, 0,	0, $B8,	0, 0, 0, $B8, 0, 0, $77, $BB
		dc.b 0,	$78, $87, $7B, 7, $88, $BB, $88, $FF, $D1, $CC,	$CC, $FF, $C1, $CC, $F1, $FF, $11, $CC,	$FF
		dc.b $FD, $B8, $8C, $FF, $F7, $8B, $BB,	$BB, 0,	7, $7B,	$BB, 0,	2, $27,	$7B, 2,	$23, $33, $22
		dc.b $23, $43, $43, $32, $34, $22, $24,	$33, $42, $22, $32, $44, $42, $33, $FF,	$32, $43, $3F, $77, $77
		dc.b $44, $F7, $99, $97, $CF, $79, $98,	$89, $77, $79, $79, $98, $F9, $98, $97,	$77, $F7, $99, $88, $97
		dc.b $FF, $79, $98, $89, $1F, $F7, $79,	$97, $11, $CF, $FF, $7D, $11, $11, $DF,	$F1, $C1, $1D, $11, $11
		dc.b $DC, $1D, $C1, $1C, $DD, $CC, $DC,	$CC, $77, $DD, $DD, $FF, $8B, $7D, $DD,	$DD, $B0, 0, 0,	0
		dc.b 0,	0, 0, 0, $80, 0, 0, 0, $B8, $80, 0, 0, $BB, $B8, $80, 0, $DC, $1F, $C7,	0
		dc.b $CD, $FF, $CB, $70, $CD, $BB, $B7,	8, $BB,	$BB, $B8, $87, $BB, $B8, $87, $77, $B8,	$87, $77, $70
		dc.b $B7, $70, 0, 0, $FD, $C1, $20, 0, $2F, $DC, $23, 0, $2F, $DC, $13,	$27, $23, $FD, $C3, $32
		dc.b $33, $7D, $C7, $33, $32, $79, $D7,	$97, $33, $27, $97, $99, $73, $39, $79,	$79, $97, $32, $97, $79
		dc.b $97, $32, $99, $79, $79, $73, $99,	$79, $79, $97, $99, $97, $77, $97, $99,	$77, $DD, $79, $97, $7D
		dc.b $11, $77, $77, $D0, $1C, $DF, $DD,	$D0, $CC, $DF, $DD, 0, $DD, $FD, $D0, 0, $FF, $77, 0, 0
		dc.b $D7, $B8, $80, 0, 0, $7B, $B8, $80, 0, 0, $7B, $B8, 0, 0, 0, $BB, 0, 0, 0,	$B7
		dc.b 0,	0, $BB,	$77, 0,	0, 0, 0, 0, 0, 0, 0, $88, 0, 0,	0, $77,	$B0, 0,	0
		dc.b $77, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, $79, 0, 0, 0, $27, $99, 0, 0, $24, $78, $90, 0, $72, $49, $89,	0
		dc.b $72, $47, $89, 0, $73, $47, $99, 0, $74, $77, $90,	0, $74,	$77, 0,	0, $C1,	$71, 0,	0
		dc.b $C1, $1C, 0, 0, $DC, $CD, 0, 0, $D, $D0, 0, 0, 0, 0, 0, 0,	$B, $BB, 0, 0
		dc.b $B7, $77, $BB, 0, $B7, $77, $77, $B0, $B7,	$77, $77, $70, $B7, $77, $77, $70, $77,	$77, $77, $70
		dc.b $77, $77, $77, 0, $77, $77, $70, 0, $77, $70, 0, 0
byte_228F0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	8, $80,	0, 9, $98, $88,	$88, $98, $88, $98, $8F, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $88, $88, 0, 0, $8F, $FF, $80,	0
		dc.b $FF, $FF, $F8, 0, 0, 0, 0,	9, 0, 0, 0, $99, 0, 0, $F, $F9,	0, 0, $F, $FF
		dc.b 0,	0, $F, $FF, 0, 0, 0, $FF, 0, 0,	0, $99,	0, 0, 9, $FF, $99, $98,	$78, $FF
		dc.b $99, $97, $8F, $FF, $97, $78, $FF,	$DC, $77, $78, $C1, $1C, $77, $89, $1D,	$11, $99, $FD, $11, $D1
		dc.b $FF, $F1, $1C, $CD, $FF, $D1, $CC,	$CC, $FF, $FF, $FF, $80, $FF, $FF, $FF,	$80, $CD, $CF, $FF, $F8
		dc.b $CD, $1C, $FF, $F8, $CC, $C1, $FF,	$80, $1C, $D1, $D0, 0, $11, $1C, $C0, 0, $11, $1C, $C0,	0
		dc.b 0,	0, $9F,	$FF, 0,	9, $FF,	$FF, 0,	9, $FF,	$FF, 0,	9, $FF,	$FF, 0,	0, $99,	$9F
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 2
		dc.b 0,	0, 0, 2, 0, 0, 0, $F, 0, 0, 0, $F, $D, 0, $D, $DC, $DC,	$DD, $DC, $C1
		dc.b $DC, $CD, $C1, $11, $DC, $CC, $11,	$1F, $DD, $C1, $11, $1F, $D, $C1, $11, $11, $D,	$CC, $11, $11
		dc.b 0,	$DC, $C1, $11, 0, $DC, $CC, $11, 0, $D,	$CC, $CC, 0, $D, $DC, $CD, 0, 0, $DD, $DD
		dc.b 0,	0, $D, $D7, 0, 0, 0, $7B, 0, 0,	0, $B8,	0, 0, 0, $B8, 0, 0, $77, $BB
		dc.b 0,	$78, $87, $7B, 7, $88, $BB, $88, $FF, $D1, $CC,	$CC, $FF, $C1, $CC, $F1, $FF, $11, $CC,	$FF
		dc.b $FD, $B8, $8C, $FF, $F7, $8B, $BB,	$BB, 0,	7, $7B,	$BB, 0,	2, $27,	$7B, 2,	$23, $33, $22
		dc.b $23, $43, $43, $32, $34, $22, $24,	$33, $42, $22, $32, $44, $42, $33, $FF,	$32, $43, $3F, $77, $77
		dc.b $44, $F7, $99, $97, $CF, $79, $98,	$89, $77, $79, $79, $98, $F9, $98, $97,	$77, $F7, $99, $88, $97
		dc.b $FF, $79, $98, $89, $1F, $F7, $79,	$97, $11, $CF, $FF, $7D, $11, $11, $DF,	$F1, $C1, $1D, $11, $11
		dc.b $DC, $1D, $C1, $1C, $DD, $CC, $DC,	$CC, $77, $DD, $DD, $FF, $8B, $7D, $DD,	$DD, $B0, 0, 0,	0
		dc.b 0,	0, 0, 0, $80, 0, 0, 0, $B8, $80, 0, 0, $BB, $B8, $80, 0, $DC, $1F, $C7,	0
		dc.b $CD, $FF, $CB, $70, $CD, $BB, $B7,	8, $BB,	$BB, $B8, $87, $BB, $B8, $87, $77, $B8,	$87, $77, $70
		dc.b $B7, $70, 0, 0, $FD, $C1, $20, 0, $2F, $DC, $23, 0, $2F, $DC, $13,	$27, $23, $FD, $C3, $32
		dc.b $33, $7D, $C7, $33, $32, $79, $D7,	$97, $33, $27, $97, $99, $73, $39, $79,	$79, $97, $32, $97, $79
		dc.b $97, $32, $99, $79, $79, $73, $99,	$79, $79, $97, $99, $97, $77, $97, $99,	$77, $DD, $79, $97, $7D
		dc.b $11, $77, $77, $D0, $1C, $DF, $DD,	$D0, $CC, $DF, $DD, 0, $DD, $FD, $D0, 0, $FF, $77, 0, 0
		dc.b $D7, $B8, $80, 0, 0, $7B, $B8, $80, 0, 0, $7B, $B8, 0, 0, 0, $BB, 0, 0, 0,	$BB
		dc.b 0,	0, $BB,	$BB, 0,	0, 0, 0, 0, 0, 0, 0, $88, 0, 0,	0, $77,	$B0, 0,	0
		dc.b $77, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, $79, 0, 0, 0, $27, $99, 0, 0, $24, $78, $90, 0, $72, $49, $89,	0
		dc.b $72, $47, $89, 0, $73, $47, $99, 0, $74, $77, $90,	0, $74,	$77, 0,	0, $C1,	$71, 0,	0
		dc.b $C1, $1C, 0, 0, $DC, $CD, 0, 0, $D, $D0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $8B, 0, $BB, $BB, $88, $BB, $77, $77, $B7,	$77, $77, $77, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $B0, 0, 0, 0, $7B, 0, 0, 0
		dc.b $70, 0, 0,	0
byte_22BB0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 9, 0, 0, $99, $88, 0, 9, $88, $88, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $99, $99, 0, 0, $88, $89, $90,	0
		dc.b $88, $88, $77, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $9F
		dc.b 0,	0, 0, $9F, 0, 0, 0, 9, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 2, 0,	0, 0, 2
		dc.b 0,	0, 0, $F, 0, 0,	0, $F, $D, 0, $D, $DC, $DC, $DD, $DC, $C1, $DC,	$CD, $C1, $11
		dc.b $DC, $CC, $11, $1F, $DD, $C1, $11,	$1F, $D, $C1, $11, $11,	$D, $CC, $11, $11, 0, $DC, $C1,	$11
		dc.b 0,	$DC, $CC, $11, 0, $D, $CC, $CC,	0, $D, $DC, $CD, 0, 9, $89, $98, 0, $99, $99, $87
		dc.b $F, $F9, $97, $77,	$F, $FF, $77, $88, 0, $F7, $88,	$FF, 0,	$99, $FF, $FF, $99, $FF, $FF, $F1
		dc.b $FF, $FF, $FF, $CD, $FF, $FF, $FF,	$CC, $FF, $FF, $FD, $1D, $FF, $FF, $7B,	$C1, $99, $F7, $BB, $C1
		dc.b 0,	7, $B7,	$BB, 0,	0, $B, $78, 0, 2, $23, $37, 2, $23, $33, $22, $23, $43,	$43, $32
		dc.b $34, $22, $24, $33, $42, $22, $32,	$44, $42, $33, $FF, $32, $43, $3F, $77,	$77, $44, $F7, $99, $97
		dc.b $CF, $79, $98, $89, $77, $79, $79,	$98, $F9, $98, $97, $77, $F7, $99, $88,	$97, $FF, $79, $98, $89
		dc.b $1F, $F7, $79, $97, $11, $CF, $FF,	$7D, $11, $11, $DF, $F1, $C1, $1D, $11,	$11, $DC, $1D, $C1, $1C
		dc.b $87, $77, $77, $79, $77, $78, $99,	$99, $78, $89, $88, $89, $FF, $FF, $99,	$88, $FD, $DD, $DD, $98
		dc.b $11, $1C, $CC, $D1, $CC, $C1, $CC,	$1C, $DC, $C1, $1C, $1C, $CD, $CC, $11,	$CC, $DD, $DC, $11, $1F
		dc.b $CC, $DD, $88, $FF, $1C, $B8, $88,	$8F, $BB, $BB, $BB, $88, $BB, $BB, $B8,	$88, $88, $88, $77, $77
		dc.b $F7, $77, $77, $77, $2F, $DC, $23,	0, $2F,	$DC, $13, $27, $23, $FD, $C3, $32, $33,	$7D, $C7, $33
		dc.b $32, $79, $D7, $97, $33, $27, $97,	$99, $73, $39, $79, $79, $97, $32, $97,	$79, $97, $32, $99, $79
		dc.b $79, $73, $99, $79, $79, $97, $99,	$97, $77, $97, $99, $77, $DD, $79, $97,	$7D, $11, $77, $77, $D0
		dc.b $1C, $DF, $DD, $D0, $CC, $DF, $DD,	0, $90,	0, 0, 0, $89, 0, 0, 0, $98, $90, 0, 0
		dc.b $88, $89, 0, 0, $88, $89, 0, 0, $88, $89, 0, 0, $D9, $99, 0, 0, $C0, 0, 0,	0
		dc.b $C0, 0, 0,	0, $C0,	0, 0, 0, $C0, 0, 0, 0, $C7, 0, 0, 0, $B7, 0, 0,	0
		dc.b $88, 0, 0,	0, $77,	$80, 0,	0, $77,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $79, 0, 0,	0, $27,	$99, 0,	0, $24,	$78, $90, 0, $72, $49, $89, 0, $72, $47, $89, 0
		dc.b $73, $47, $99, 0, $74, $77, $90, 0, $74, $77, 0, 0, $C1, $71, 0, 0, $C1, $1C, 0, 0
		dc.b $DC, $CD, 0, 0, $D, $D0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $DD, $DD
		dc.b 0,	0, $D, $D7, 0, 0, 0, $7B, 0, 0,	0, $B8,	0, 0, 0, $B8, 0, 0, $77, $BB
		dc.b 0,	$78, $87, $7B, 7, $88, $BB, $88, $DD, $CC, $DC,	$CC, $77, $DD, $DD, $FF, $8B, $7D, $DD,	$DD
		dc.b $B0, 0, 0,	0, 0, 0, 0, 0, $80, 0, 0, 0, $B8, $80, 0, 0, $BB, $B8, $80, 0
		dc.b $DD, $FD, $D0, 0, $FF, $77, 0, 0, $D7, $B8, $80, 0, 0, $7B, $B8, $80, 0, 0, $7B, $B8
		dc.b 0,	0, 0, $BB, 0, 0, 0, $BB, 0, 0, $BB, $BB, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $8B, 0, $BB, $BB, $88,	$BB, $77, $77
		dc.b $B7, $77, $77, $77, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $B0, 0, 0, 0, $7B, 0, 0, 0, $70, 0, 0,	0
byte_22E90:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 9, 0, 0, $99, $88, 0, 9, $88, $88, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $99, $99, 0, 0, $88, $89, $90,	0
		dc.b $88, $88, $77, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $9F
		dc.b 0,	0, 0, $9F, 0, 0, 0, 9, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 2, 0,	0, 0, 2
		dc.b $C, $1C, 0, $F, $1C, $D0, 0, $F, $1C, $D0,	$D, $DC, $CC, $DD, $DC,	$C1, $DC, $CC, $C1, $11
		dc.b $DC, $CC, $11, $1F, $DD, $C1, $11,	$1F, $D, $C1, $11, $11,	$D, $CC, $11, $11, 0, $DC, $C1,	$11
		dc.b 0,	$DC, $CC, $11, 0, $D, $CC, $CC,	0, $D, $DC, $CD, 0, 9, $89, $98, 0, $99, $99, $87
		dc.b $F, $F9, $97, $77,	$F, $FF, $77, $88, 0, $F7, $88,	$FF, 0,	$99, $FF, $FF, $99, $FF, $FF, $F1
		dc.b $FF, $FF, $FF, $CD, $FF, $FF, $FF,	$CC, $FF, $FF, $FD, $1D, $FF, $FF, $7B,	$C1, $99, $F7, $BB, $C1
		dc.b 0,	7, $B7,	$BB, 0,	0, $B, $78, 0, 2, $23, $37, 2, $23, $33, $22, $23, $43,	$43, $32
		dc.b $34, $22, $24, $33, $42, $22, $32,	$44, $42, $33, $FF, $32, $43, $3F, $77,	$77, $44, $F7, $99, $97
		dc.b $CF, $79, $98, $89, $77, $79, $79,	$98, $F9, $98, $97, $77, $F7, $99, $88,	$97, $FF, $79, $98, $89
		dc.b $1F, $F7, $79, $97, $11, $CF, $FF,	$7D, $11, $11, $DF, $F1, $C1, $1D, $11,	$11, $DC, $1D, $C1, $1C
		dc.b $87, $77, $77, $79, $77, $78, $99,	$99, $78, $89, $88, $89, $FF, $FF, $99,	$88, $FD, $DD, $DD, $98
		dc.b $11, $1C, $CC, $D1, $CC, $C1, $CC,	$1C, $DC, $C1, $1C, $1C, $CD, $CC, $11,	$CC, $DD, $DC, $11, $1F
		dc.b $CC, $DD, $88, $FF, $1C, $B8, $88,	$8F, $BB, $BB, $BB, $88, $BB, $BB, $B8,	$88, $88, $88, $77, $77
		dc.b $F7, $77, $77, $77, $2F, $DC, $23,	0, $2F,	$DC, $13, $27, $23, $FD, $C3, $32, $33,	$7D, $C7, $33
		dc.b $32, $79, $D7, $97, $33, $27, $97,	$99, $73, $39, $79, $79, $97, $32, $97,	$79, $97, $32, $99, $79
		dc.b $79, $73, $99, $79, $79, $97, $99,	$97, $77, $97, $99, $77, $DD, $79, $97,	$7D, $11, $77, $77, $D0
		dc.b $1C, $DF, $DD, $D0, $CC, $DF, $DD,	0, $90,	0, 0, 0, $89, 0, 0, 0, $98, $90, 0, 0
		dc.b $88, $89, 0, 0, $88, $89, 0, 0, $88, $89, 0, 0, $D9, $99, 0, 0, $C0, 0, 0,	0
		dc.b $C0, 0, 0,	0, $C0,	0, 0, 0, $C0, 0, 0, 0, $C7, 0, 0, 0, $B7, 0, 0,	0
		dc.b $88, 0, 0,	0, $77,	$80, 0,	0, $77,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $79, 0, 0,	0, $27,	$99, 0,	0, $24,	$78, $90, 0, $72, $49, $89, 0, $72, $47, $89, 0
		dc.b $73, $47, $99, 0, $74, $77, $90, 0, $74, $77, 0, 0, $C1, $71, 0, 0, $C1, $1C, 0, 0
		dc.b $DC, $CD, 0, 0, $D, $D0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $DD, $DD
		dc.b 0,	0, $D, $D7, 0, 0, 0, $7B, 0, 0,	0, $B8,	0, 0, 0, $B8, 0, 0, $77, $BB
		dc.b 0,	$78, $87, $7B, 7, $88, $BB, $88, $DD, $CC, $DC,	$CC, $77, $DD, $DD, $FF, $8B, $7D, $DD,	$DD
		dc.b $B0, 0, 0,	0, 0, 0, 0, 0, $80, 0, 0, 0, $B8, $80, 0, 0, $BB, $B8, $80, 0
		dc.b $DD, $FD, $D0, 0, $FF, $77, 0, 0, $D7, $B8, $80, 0, 0, $7B, $B8, $80, 0, 0, $7B, $B8
		dc.b 0,	0, 0, $BB, 0, 0, 0, $BB, 0, 0, $BB, $BB, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $8B, 0, $BB, $BB, $88,	$BB, $77, $77
		dc.b $B7, $77, $77, $77, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $B0, 0, 0, 0, $7B, 0, 0, 0, $70, 0, 0,	0
byte_23170:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 9, 0, 0, $99, $88, 0, 9, $88, $88, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $99, $99, 0, 0, $88, $89, $90,	0
		dc.b $88, $88, $77, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $9F
		dc.b 0,	0, 0, $9F, 0, 0, 0, 9, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 2, 0,	0, 0, 2
		dc.b 0,	$DC, $1C, $F, $D, $1C, 0, $F, $D1, $CC,	$D, $DC, $DC, $CD, $DC,	$C1, $DC, $CC, $C1, $11
		dc.b $DC, $CC, $11, $1F, $DD, $C1, $11,	$1F, $D, $C1, $11, $11,	$D, $CC, $11, $11, 0, $DC, $C1,	$11
		dc.b 0,	$DC, $CC, $11, 0, $D, $CC, $CC,	0, $D, $DC, $CD, 0, 9, $89, $98, 0, $99, $99, $87
		dc.b $F, $F9, $97, $77,	$F, $FF, $77, $88, 0, $F7, $88,	$FF, 0,	$99, $FF, $FF, $99, $FF, $FF, $F1
		dc.b $FF, $FF, $FF, $CD, $FF, $FF, $FF,	$CC, $FF, $FF, $FD, $1D, $FF, $FF, $7B,	$C1, $99, $F7, $BB, $C1
		dc.b 0,	7, $B7,	$BB, 0,	0, $B, $78, 0, 2, $23, $37, 2, $23, $33, $22, $23, $43,	$43, $32
		dc.b $34, $22, $24, $33, $42, $22, $32,	$44, $42, $33, $FF, $32, $43, $3F, $77,	$77, $44, $F7, $99, $97
		dc.b $CF, $79, $98, $89, $77, $79, $79,	$98, $F9, $98, $97, $77, $F7, $99, $88,	$97, $FF, $79, $98, $89
		dc.b $1F, $F7, $79, $97, $11, $CF, $FF,	$7D, $11, $11, $DF, $F1, $C1, $1D, $11,	$11, $DC, $1D, $C1, $1C
		dc.b $87, $77, $77, $79, $77, $78, $99,	$99, $78, $89, $88, $89, $FF, $FF, $99,	$88, $FD, $DD, $DD, $98
		dc.b $11, $1C, $CC, $D1, $CC, $C1, $CC,	$1C, $DC, $C1, $1C, $1C, $CD, $CC, $11,	$CC, $DD, $DC, $11, $1F
		dc.b $CC, $DD, $88, $FF, $1C, $B8, $88,	$8F, $BB, $BB, $BB, $88, $BB, $BB, $B8,	$88, $88, $88, $77, $77
		dc.b $F7, $77, $77, $77, $2F, $DC, $23,	0, $2F,	$DC, $13, $27, $23, $FD, $C3, $32, $33,	$7D, $C7, $33
		dc.b $32, $79, $D7, $97, $33, $27, $97,	$99, $73, $39, $79, $79, $97, $32, $97,	$79, $97, $32, $99, $79
		dc.b $79, $73, $99, $79, $79, $97, $99,	$97, $77, $97, $99, $77, $DD, $79, $97,	$7D, $11, $77, $77, $D0
		dc.b $1C, $DF, $DD, $D0, $CC, $DF, $DD,	0, $90,	0, 0, 0, $89, 0, 0, 0, $98, $90, 0, 0
		dc.b $88, $89, 0, 0, $88, $89, 0, 0, $88, $89, 0, 0, $D9, $99, 0, 0, $C0, 0, 0,	0
		dc.b $C0, 0, 0,	0, $C0,	0, 0, 0, $C0, 0, 0, 0, $C7, 0, 0, 0, $B7, 0, 0,	0
		dc.b $88, 0, 0,	0, $77,	$80, 0,	0, $77,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $79, 0, 0,	0, $27,	$99, 0,	0, $24,	$78, $90, 0, $72, $49, $89, 0, $72, $47, $89, 0
		dc.b $73, $47, $99, 0, $74, $77, $90, 0, $74, $77, 0, 0, $C1, $71, 0, 0, $C1, $1C, 0, 0
		dc.b $DC, $CD, 0, 0, $D, $D0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $DD, $DD
		dc.b 0,	0, $D, $D7, 0, 0, 0, $7B, 0, 0,	0, $B8,	0, 0, 0, $B8, 0, 0, $77, $BB
		dc.b 0,	$78, $87, $7B, 7, $88, $BB, $88, $DD, $CC, $DC,	$CC, $77, $DD, $DD, $FF, $8B, $7D, $DD,	$DD
		dc.b $B0, 0, 0,	0, 0, 0, 0, 0, $80, 0, 0, 0, $B8, $80, 0, 0, $BB, $B8, $80, 0
		dc.b $DD, $FD, $D0, 0, $FF, $77, 0, 0, $D7, $B8, $80, 0, 0, $7B, $B8, $80, 0, 0, $7B, $B8
		dc.b 0,	0, 0, $BB, 0, 0, 0, $BB, 0, 0, $BB, $BB, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $8B, 0, $BB, $BB, $88,	$BB, $77, $77
		dc.b $B7, $77, $77, $77, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $B0, 0, 0, 0, $7B, 0, 0, 0, $70, 0, 0,	0
byte_23450:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9
		dc.b 0,	0, 0, $99, 0, 0, 7, $77, 0, 0, 7, $77, 0, 0, 0,	$7F, 0,	0, 0, $F
		dc.b 0,	0, 0, $F7, 0, 0, 7, $99, 0, 0, $99, $FF, 0, 9, $FF, $FF, 0, 9, $FF, $FF
		dc.b 0,	0, $9F,	$FF, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 3, 0, 0, 0, 2, 0,	0, 0, $23
		dc.b 0,	0, 0, $23, 0, 0, 0, $33, 0, 0, 0, $43, 0, 0, 0,	$44, 0,	0, $D, $C4
		dc.b 0,	0, $DC,	$CD, 0,	0, $DC,	$DC, 0,	0, 0, 0, 0, 0, 0, 0, 0,	6, $88,	$88
		dc.b $96, $88, $97, $78, $88, $77, $99,	$87, $99, $99, $97, $77, $99, $97, $77,	$96, $77, $77, $76, $6C
		dc.b $FF, $79, $6F, $C1, $F7, $99, $FD,	$CC, $99, $FD, $CD, $CC, $FF, $FC, $C1,	$CC, $FF, $DC, $11, $CC
		dc.b $FF, $DC, $C1, $CC, $FF, $D1, $11,	$CC, 0,	$7B, $BC, $1C, 0, $B7, $BB, $CC, 0, $7B, $77, $BB
		dc.b 0,	7, $BB,	$77, 0,	0, 7, $BB, 0, 3, $33, $37, 3, $32, $23,	$FF, $22, $34, $42, $33
		dc.b $34, $22, $34, $2F, $44, $22, $23,	$2F, $42, $33, $23, $F7, $42, $22, $3F,	$79, $34, $23, $4F, $77
		dc.b $33, $44, $4F, $F7, $44, $44, $F7,	$FF, $D4, $4F, $FF, $77, $1C, $DD, $DF,	$FF, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $90, 0, 0, 0, $89, 0, 0, 0, $77, $96, $60, 0, $77, $79, $68, $90
		dc.b $68, $88, $88, $89, $CF, $99, $68,	$89, $1C, $DC, $F9, $99, $CD, $D1, $D0,	0, $CC,	$D1, $D0, 0
		dc.b $CC, $D1, $C0, 0, $CC, $D1, $C0, 0, $1F, $D1, $F0,	0, $FF,	$D1, $F7, 0, $FF, $BB, $B0, 0
		dc.b $CB, $BB, $BB, $B8, $BB, $BB, $B8,	$87, $BB, $BB, $B7, $77, $77, $77, $70,	0, $9C,	$17, 0,	0
		dc.b $79, $CC, $70, 0, $22, $33, $17, 0, $F7, $77, $31,	$70, $79, $97, $7C, $90, $98, $89, $77,	$97
		dc.b $99, $88, $97, $77, $77, $78, $89,	$79, $F7, $99, $98, $99, $FF, $77, $99,	$99, $7F, $F7, $77, $97
		dc.b $79, $FF, $77, $77, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $90, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $88, 0, 0, 0, $77, $B0, 0, 0, $77, 0, 0, 0, $70, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 1, $CC, 0, 0, $11, $1C, $C0
		dc.b 0,	$CD, $11, $CC, $77, $CC, $11, $CD, $99,	$7D, $CC, $DD, $88, $97, $7D, $D0, $89,	$87, $F0, 0
		dc.b $97, $7F, 0, 0, $7F, $F0, 0, 0, $F0, 0, 0,	0, 0, $D, $CC, $C1, 0, $D, $CC,	$11
		dc.b 0,	$D, $CC, $11, 0, $D, $CC, $11, 0, $D, $DC, $11,	0, 0, $DC, $CC,	0, 0, $DD, $CC
		dc.b 0,	0, $77,	$7D, $11, $CC, $DD, $FF, $11, $11, $1C,	$DF, $11, $11, $11, $CD, $11, $11, $11,	$1C
		dc.b $11, $11, $11, $11, $CC, $CC, $11,	$11, $DD, $DC, $C1, $11, $DD, $DD, $DC,	$11, $79, $99, $FF, $FF
		dc.b $FF, $79, $99, $97, $FF, $FF, $77,	$7F, $DD, $FF, $FF, $FD, $CC, $DD, $DD,	$CD, $11, $CC, $CC, $CD
		dc.b $11, $11, $1C, $D0, $11, $CC, $CC,	$DB, 0,	7, $BB,	$77, 0,	$7B, $BB, $77, 7, $BB, $BB, $7B
		dc.b $7B, $BB, $88, $B7, $7B, $B8, $88,	$8B, $BB, $B8, $88, $BB, $BB, $8B, $B8,	$B8, $78, $88, $B8, $8B
		dc.b $D7, $BD, $DD, $CC, $77, $B8, $DD,	$DD, $77, $88, $DD, $DD, $B8, $80, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $B0, 0, 0, 0, $88, 0, 0, 0, $CC, $CC, $DD, $7B, $DD, $DD, $D7,	$7B
		dc.b $DD, $D0, 0, 7, 0,	0, 0, $77, 0, $77, $77,	$BB, 7,	$77, $BB, $BB, 7, $77, $BB, $B7
		dc.b 0,	$77, $77, $BB, $80, 0, 0, 0, $B8, 0, 0,	0, $B8,	0, 0, 0, $B8, 0, $B, $B0
		dc.b $BB, $B, $BB, $BB,	$B7, $BB, $BB, $B8, $7B, $BB, $BB, $B8,	$88, $8B, $B8, $80
byte_23730:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $99
		dc.b 0,	0, 7, $77, 0, 0, 7, $77, 0, 0, 0, $7F, 0, 0, 0,	$F, 0, 0, 0, $F7
		dc.b 0,	0, 7, $99, 0, 0, $99, $FF, 0, 9, $FF, $FF, 0, 9, $FF, $FF, 0, 0, $9F, $FF
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	6, $88,	$88, $96, $88, $97, $78, $88, $77, $99,	$87
		dc.b $99, $99, $97, $77, $99, $97, $77,	$96, $77, $77, $76, $6C, $FF, $79, $6F,	$C1, $F7, $99, $FD, $CC
		dc.b $99, $FD, $CD, $CC, $FF, $FC, $C1,	$CC, $FF, $DC, $11, $CC, $FF, $DC, $C1,	$CC, $FF, $D1, $11, $CC
		dc.b 0,	$7B, $BC, $1C, 0, $B7, $BB, $CC, 0, 0, 0, 0, $90, 0, 0,	0, $89,	0, 0, 0
		dc.b $77, $96, $60, 0, $77, $79, $68, $90, $68,	$88, $88, $89, $CF, $99, $68, $89, $1C,	$DC, $F9, $99
		dc.b $CD, $D1, $D0, 0, $CC, $D1, $D0, 0, $CC, $D1, $C0,	0, $CC,	$D1, $C0, 0, $1F, $D1, $F0, 0
		dc.b $FF, $D1, $F7, 0, $FF, $BB, $B0, 0, $CB, $BB, $BB,	$B8, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $90, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $88, 0, 0,	0, $77,	$B0, 0,	0, 0, $7B, $77,	$BB
		dc.b 0,	7, $BB,	$77, 0,	0, 7, $BB, 0, 0, 0, $7D, 0, 3, $37, $79, 3, $32, $22, $37
		dc.b $32, $23, $44, $23, $23, $43, $24,	$4F, $BB, $BB, $B8, $87, $BB, $BB, $B7,	$77, $77, $77, $70, 0
		dc.b $C1, $70, 0, 0, $DC, $19, 0, 0, $7D, $DC, $30, 0, $77, $DD, $C2, 0, $22, $77, $D2,	$90
		dc.b $77, 0, 0,	0, $70,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 3, 0,	0, 0, 3
		dc.b 0,	0, 0, 4, 0, 0, $DD, $D4, 0, $D,	$DD, 4,	0, $DD,	$CD, $DD, 0, $DC, $DC, $CD
		dc.b $D, $DC, $CC, $CC,	$34, $32, $22, $FD, $34, $32, $23, $97,	$34, $33, $3F, $77, $33, $44, $4F, $79
		dc.b $43, $33, $F7, $99, $44, $44, $FF,	$79, $D4, $47, $7F, $77, $DD, $D7, $77,	$F7, $D3, $27, $72, $79
		dc.b $77, $32, $D3, $79, $97, $72, $7D,	$79, $89, $73, $77, $11, $88, $77, $7D,	$11, $98, $99, $9D, $11
		dc.b $99, $98, $87, $DD, $79, $77, $77,	$F7, 0,	0, 0, 0, 0, $DD, 0, 0, $DD, $D1, $D0, 0
		dc.b $1D, $11, $D0, 0, $11, $DD, $D0, 0, $D1, $DD, 0, 0, $10, 0, 0, 0, 0, 0, 0,	0
		dc.b $D, $CC, $C1, $1C,	$D, $CC, $11, $11, $D, $CC, $11, $11, $D, $CC, $C1, $1C, 0, $DC, $CC, $CD
		dc.b 0,	$77, $77, $DB, 7, $77, $B7, $77, 7, $7B, $7B, $BB, 0, $7B, $B7,	$77, 0,	7, $BB,	$B8
		dc.b 0,	0, $7B,	$B8, 0,	0, $7B,	$BB, 0,	0, 7, $BB, 0, 0, 7, $BB, 0, 0, 7, $77
		dc.b 0,	0, 0, 0, $CC, $DD, $77,	$7F, $11, $DD, $D7, $77, $11, $1C, $DD,	$D7, $C1, $11, $11, $11
		dc.b $DC, $11, $11, $11, $8D, $C1, $11,	$11, $B8, $DC, $C1, $11, $B8, $DD, $DC,	$CC, $77, $DD, $DD, $DD
		dc.b $BB, $BB, $DD, $DD, $88, $BB, $B0,	0, $B8,	$8B, $B0, 7, $BB, $BB, 7, $7B, $BB, $B7, $77, $7B
		dc.b $77, 0, $7B, $BB, 0, 0, $77, $BB, $77, $77, $78, $77, $FF,	$FF, $77, $70, $77, $77, $77, $70
		dc.b $11, $1D, $D0, 0, $11, $1D, $D0, 0, $11, $CD, 0, 0, $CC, $D0, 0, 0, $CD, $D0, 0, 0
		dc.b $DD, $B0, 0, 0, $7B, $80, 0, 0, $7B, $80, 0, 0, $B8, 0, 0,	0, $B7,	$B0, 0,	0
		dc.b $77, $BB, $BB, $80, $BB, $BB, $BB,	$B8, $88, $8B, $B8, $80
byte_239D0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $77
		dc.b 0,	0, 0, $77, 0, 0, 0, 7, 0, 0, 0,	0, 0, 0, 0, $F,	0, 0, 0, $79
		dc.b 0,	0, 9, $9F, 0, 0, $9F, $FF, 0, 0, $9F, $FF, 0, 0, 9, $FF, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 2, 0, 0, 0, 3, 0,	0, 0, 3
		dc.b 0,	0, 0, 4, $C, $C0, 0, 4,	0, $CC,	0, 0, $D, $CC, $CD, $DD, $D, $CC, $DC, $CC
		dc.b $D, $DC, $C1, $C1,	$D, $DD, $C1, $11, 0, 0, $68, $88, 9, $68, $89,	$77, $98, $87, $79, $98
		dc.b $99, $99, $99, $77, $79, $99, $77,	$79, $77, $77, $77, $66, $FF, $F7, $96,	$FC, $FF, $79, $9F, $DC
		dc.b $79, $9F, $DC, $DC, $9F, $FF, $CC,	$1C, $FF, $FD, $C1, $1C, $FF, $FD, $CC,	$1C, $FF, $FD, $11, $1C
		dc.b $F0, 7, $BB, $C1, 0, $B, $7B, $BC,	0, 7, $B7, $7B,	0, 0, $7B, $B7,	0, 0, 0, $7B
		dc.b 0,	0, 3, $79, 0, $32, $27,	$79, 2,	$44, $23, $22, $23, $23, $43, $33, $32,	$22, $4F, $77
		dc.b $32, $22, $F7, $79, $33, $23, $F7,	$99, $43, $34, $F7, $98, $44, $44, $F7,	$98, $43, $34, $F7, $99
		dc.b $44, $44, $FF, $77, $CD, $D4, $4F,	$F7, $11, $CC, $DD, $F7, $11, $11, $CD,	$DF, $89, 0, 0,	0
		dc.b $88, $90, 0, 0, $77, $79, $66, 0, $77, $77, $96, $89, $66,	$88, $88, $88, $CC, $F9, $96, $88
		dc.b $11, $CD, $CF, $99, $CC, $DD, $1D,	0, $CC,	$CD, $1D, 0, $CC, $CD, $1C, 0, $CC, $CD, $1C, 0
		dc.b $C1, $FD, $1F, 0, $CF, $FD, $1F, $70, $CF,	$FB, $BB, 0, $CC, $BB, $BB, $BB, $BB, $BB, $BB,	$88
		dc.b $7B, $BB, $BB, $77, $B7, $77, $77,	0, $C1,	$70, 0,	0, $DC,	$19, 0,	0, $7D,	$D9, 0,	0
		dc.b $27, $D1, $72, 0, $72, $2D, $19, $20, $77,	$22, $79, $32, $97, $32, $79, $92, $99,	$73, $77, $93
		dc.b $89, $73, $79, $97, $88, $93, $77,	$97, $98, $97, $DD, $D9, $89, $7D, $D1,	$11, $77, $DD, $11, $11
		dc.b $F7, $DD, $D1, $11, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $90, 0, 0,	0, $99,	0, 0, 0, $90, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 8,	$80, 0,	0
		dc.b $87, $7B, 0, 0, $77, $70, 0, 0, $77, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $70, 0, 0, 0, $99, $7D, $11, $D0, $79,	$D1, $11, $1D, $77, $D1, $D1, $11
		dc.b $79, $9D, $DD, $11, $77, $77, $DD,	$DD, $77, $77, $70, 0, 0, $DD, $C1, $11, 0, $DD, $CC, $11
		dc.b 0,	$DD, $DC, $C1, 0, $DD, $DD, $CC, 0, $D,	$DD, $77, 0, $D, $DD, $77, 0, 0, $DD, $DD
		dc.b 0,	0, 0, $DD, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	7
		dc.b 0,	0, 0, $77, 0, 0, 0, $77, 0, 0, 0, 7, 0,	0, 0, 0, $11, $11, $1C,	$CD
		dc.b $1C, $BB, $11, $1C, $C7, $BB, $7B,	$BB, $BB, $87, $BB, $BB, $BB, $BB, $BB,	$BB, $77, $8B, $BB, $BB
		dc.b $77, $77, $8B, $BB, $DD, $D7, $78,	$B8, $D, $DD, $78, $80,	0, 0, $77, $70,	$77, $B7, $BB, $B0
		dc.b $77, $7B, $BB, 0, $77, $BB, $80, 0, $77, $BB, $B8,	$B0, $77, $7B, $B8, $88, 7, $77, $7B, $BB
		dc.b $D7, $DD, $1D, $11, $CC, $CD, $DD,	$DD, $11, $11, $CD, 0, $B8, $11, $CD, 0, $BB, $8C, $D0,	0
		dc.b $BB, $8D, 0, 0, $B8, $D0, 0, 0, $B0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $88, $BB, 0, 0
		dc.b $BB, $BB, 0, 0
byte_23C90:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 9, 0, 0, 0, $77, 0, 0, 0,	$77, 0,	0, 0, 7, 0, 0, 0, 0
		dc.b 0,	0, 0, $F, 0, 0,	0, $79,	0, 0, 9, $9F, 0, 0, $9F, $FF, 0, 0, $9F, $FF
		dc.b 0,	0, 9, $FF, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 2, 0,	0, 0, 3
		dc.b 0,	0, 0, 4, 0, 0, 0, 4, 0,	0, $DC,	$14, 0,	$D, $D1, 0, 0, $DD, $1C, $DD
		dc.b 0,	$DD, $11, $CC, 0, $DD, $C1, $CC, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $68, $88
		dc.b 9,	$68, $89, $77, $98, $87, $79, $98, $99,	$99, $99, $77, $79, $99, $77, $79, $77,	$77, $77, $66
		dc.b $FF, $F7, $96, $FC, $FF, $79, $9F,	$DC, $79, $9F, $DC, $DC, $9F, $FF, $CC,	$1C, $FF, $FD, $C1, $1C
		dc.b $FF, $FD, $CC, $1C, $FF, $FD, $11,	$1C, $F0, 7, $BB, $C1, 0, $B, $7B, $BC,	0, 7, $B7, $7B
		dc.b 0,	0, $7B,	$B7, 0,	0, 0, $7B, 0, 2, $33, $79, 2, $23, $37,	$79, $23, $34, $32, $F7
		dc.b $33, $23, $43, $22, $32, $2F, $77,	$73, $32, $F7, $79, $93, $43, $F7, $99,	$97, $44, $F7, $98, $89
		dc.b $44, $FF, $79, $88, $44, $3F, $F7,	$98, $C4, $7F, $F7, $99, $11, $1F, $7F,	$77, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $89, 0, 0, 0, $88, $90, 0, 0, $77, $79, $66, 0, $77, $77, $96,	$89
		dc.b $66, $88, $88, $88, $CC, $F9, $96,	$88, $11, $CD, $CF, $99, $CC, $DD, $1D,	0, $CC,	$CD, $1D, 0
		dc.b $CC, $CD, $1C, 0, $CC, $CD, $1C, 0, $C1, $FD, $1F,	0, $CF,	$FD, $1F, $70, $CF, $FB, $BB, 0
		dc.b $CC, $BB, $BB, $BB, $BB, $BB, $BB,	$88, $7B, $BB, $BB, $77, $B7, $77, $77,	0, $C1,	$70, 0,	0
		dc.b $DC, $19, $30, 0, $7D, $C9, $32, 0, $77, $D1, $73,	$20, $27, $9D, $17, $32, $32, $79, $77,	$33
		dc.b $33, $77, $97, $93, $93, $27, $77,	$97, $73, $27, $77, $97, $97, $39, $97,	$97, $89, $79, $99, $78
		dc.b $99, $79, $99, $78, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $90, 0, 0,	0, $99,	0, 0, 0, $90, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 8, $80, 0, 0, $87, $7B, 0, 0, $77, $70, 0, 0, $77, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	1, $11,	$10, 0,	$1D, $C1, $C1, 0, $C1, $DC, $D1
		dc.b 0,	$CC, $DD, $1C, $20, $7D, $CD, $DC, $27,	$77, $7C, $C0, $3F, $79, $97, $70, $7F,	$99, $97, $70
		dc.b $7F, $99, $77, 0, $7F, $97, $77, 0, $7F, $77, $70,	0, $D, $DD, $DC, $11, $D, $DD, $DC, $11
		dc.b $D, $DD, $DD, $C1,	$D, $DD, $DD, $CC, $D, $DD, $DD, $DC, 0, $DD, $DD, $DD,	0, $DD,	$DD, $DD
		dc.b 0,	$D, $DD, $DD, 0, 0, $DD, $DD, 0, $7B, $D, $DD, 7, $77, $B7, $7D, $77, $77, $B7,	$BB
		dc.b $77, $77, $78, $B0, $77, $77, $77,	$88, 7,	$77, $77, $77, 0, 7, $77, $77, $11, $11, $F7, $F7
		dc.b $11, $11, $CC, $D1, $11, $11, $CD,	$11, $11, $11, $1C, $DD, $C1, $11, $1C,	$CC, $CC, $11, $CC, $DD
		dc.b $DC, $CC, $CD, $7B, $DD, $DC, $CD,	$BB, $DD, $DD, $DD, $7B, $DD, $DD, $DD,	$D7, $DD, $DD, $DD, 0
		dc.b $70, 0, 0,	0, $B, $B0, 0, 0, $BB, $BB, $80, 0, $88, $88, $B0, 0, $77, $BB,	0, 0
		dc.b $11, $17, $99, $79, $11, $11, $77,	$99, $D1, $D1, $77, $99, $D1, $DC, $D7,	$79, $DD, $DC, $CD, $77
		dc.b $DC, $CC, $CD, 0, $8D, $CC, $D0, 0, $88, $8D, 0, 0, $BB, $88, 0, 0, $7B, $B8, $80,	0
		dc.b 0,	$7B, $88, $B, 0, 7, $B8, $8B, 0, $77, $78, $B8,	7, $7B,	$7B, $8B, 7, $7B, $BB, $BB
		dc.b 0,	$77, $77, $77, $77, $70, 0, 0, $77, 0, 0, 0, $97, 0, 0,	0, $77,	0, 0, 0
		dc.b $70, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $B8, $B8, $80, 0
		dc.b $BB, $BB, $8B, 0, $BB, $BB, $BB, $80, $BB,	$BB, $B8, $70, $BB, $BB, $B7, 0, $BB, $B7, $70,	0
		dc.b $77, $70, 0, 0, 0,	0, 0, 0
byte_23F90:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $99
		dc.b 0,	0, 7, $77, 0, 0, 7, $77, 0, 0, 0, $7F, 0, 0, 0,	$F, 0, 0, 0, $F7
		dc.b 0,	0, 7, $99, 0, 0, $99, $FF, 0, 9, $FF, $FF, 0, 9, $FF, $FF, 0, 0, $9F, $FF
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	6, $88,	$88, $96, $88, $97, $78, $88, $77, $99,	$87
		dc.b $99, $99, $97, $77, $99, $97, $77,	$96, $77, $77, $76, $6C, $FF, $79, $6F,	$C1, $F7, $99, $FD, $CC
		dc.b $99, $FD, $CD, $CC, $FF, $FC, $C1,	$CC, $FF, $DC, $11, $CC, $FF, $DC, $C1,	$CC, $FF, $D1, $11, $CC
		dc.b 0,	$7B, $BC, $1C, 0, $B7, $BB, $CC, 0, 0, 0, 0, $90, 0, 0,	0, $89,	0, 0, 0
		dc.b $77, $96, $60, 0, $77, $79, $68, $90, $68,	$88, $88, $89, $CF, $99, $68, $89, $1C,	$DC, $F9, $99
		dc.b $CD, $D1, $D0, 0, $CC, $D1, $D0, 0, $CC, $D1, $C0,	0, $CC,	$D1, $C0, 0, $1F, $D1, $F0, 0
		dc.b $FF, $D1, $F7, 0, $FF, $BB, $B0, 0, $CB, $BB, $BB,	$B8, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $90, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $88, 0, 0,	0, $77,	$B0, 0,	0, 0, $7B, $77,	$BB
		dc.b 0,	7, $BB,	$77, 0,	0, 7, $BB, 0, 0, 4, $7D, 0, 2, $34, $79, 0, $23, $23, $47
		dc.b 2,	$32, $22, $33, $23, $32, $44, $43, $BB,	$BB, $B8, $87, $BB, $BB, $B7, $77, $77,	$77, $70, 0
		dc.b $C1, $70, 0, 0, $DC, $17, 0, 0, $77, $D1, $70, 0, $77, $7D, $73, 0, $29, $77, $72,	$30
		dc.b $77, 0, 0,	0, $70,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	$C, 0, 0, 0, $CC, 0, 0,	$D, $CC, $C0, $D, $D, $CC, $DD,	$CC, $D, $DC, $C1, $C1
		dc.b $D, $DD, $C1, $11,	0, $DD,	$C1, $11, 0, $DD, $CC, $11, 0, $DD, $DC, $C1, 0, $DD, $DD, $CC
		dc.b 0,	$7D, $DD, $DC, 7, $7D, $DD, $DD, $77, $77, $DD,	$DD, $77, $77, $7B, $DD, $77, $77, $7B,	0
		dc.b $77, $77, $B0, 0, 7, $7B, $B0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $23, $24, $33, $FF, $33, $42, $2F,	$F7, $43, $32, $3F, $77
		dc.b 4,	$43, $3F, $79, $DD, $44, $47, $77, $CD,	$D4, $4F, $77, $11, $CD, $44, $F7, $11,	$1C, $CD, $DF
		dc.b $11, $11, $1C, $CD, $11, $11, $11,	$1C, $11, $11, $11, $11, $C1, $11, $11,	$11, $CC, $C1, $11, $CC
		dc.b $CC, $CC, $CC, $CD, $DD, $CC, $CC,	$DB, $DD, $DD, $DD, $BB, $DD, $DD, $DD,	$77, 0,	$D, $DD, $D0
		dc.b 0,	0, 0, 0, 0, 0, 0, 7, 0,	0, 7, $7B, 0, 0, $77, $BB, 0, 7, $77, $BB
		dc.b 0,	0, $77,	$77, $32, $27, $73, $20, $77, $32, $77,	$23, $99, $97, $27, $72, $98, $99, $37,	$73
		dc.b $99, $88, $97, $79, $99, $98, $99,	$77, $77, $99, $88, $77, $F7, $79, $98,	$87, $DF, $F7, $99, $89
		dc.b $CD, $DF, $77, $9D, $11, $1D, $FF,	$91, $11, $1C, $CD, $77, $CC, $CC, $DB,	$BB, $DD, $CD, 7, $BB
		dc.b $BD, $DD, 7, $7B, $BB, $D0, 0, $77, $BB, $80, 0, 0, $7B, $B8, 0, 0, $7B, $B8, 0, 0
		dc.b $BB, $87, $B, $88,	$BB, $7B, $BB, $BB, $BB, $BB, $BB, $B8,	$BB, $BB, $88, $BB, $BB, $BB, $BB, $80
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	1, $1D,	0, $70,	$DD, $11, $D0, $77, $D1, $11, $D0
		dc.b $77, $7D, $DD, 0, $77, $77, $D0, 0, $77, $70, 0, 0, $DD, $11, $1D,	0, $11,	$11, $11, $D0
		dc.b $1D, $11, $D1, $D0, $DD, $DD, $1D,	0, $BB,	$BD, $D0, 0, $BB, $B7, 0, 0, $B7, $70, 0, 0
		dc.b $70, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $B0, 0, 0, 0
		dc.b $88, 0, 0,	0, $88,	0, 0, 0, $B0, 0, 0, 0, 0, 0, 0,	0
byte_24270:	dc.b 0,	0, 0, 0, 0, 0, 9, $68, 0, 0, $98, $87, 0, 9, $99, $99, 0, $77, $79, $99
		dc.b 0,	$77, $77, $77, 0, 7, $FF, $F7, 0, 0, $FF, $79, 0, $F, $79, $9F,	0, $79,	$9F, $FF
		dc.b 9,	$9F, $FF, $FD, $9F, $FF, $FF, $FD, $9F,	$FF, $FF, $FD, 9, $FF, $F0, 7, 0, 0, 0,	$B
		dc.b 0,	0, 0, 7, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 3
		dc.b 0,	0, 0, $22, 0, 0, 2, $32, 0, 0, $33, $24, 0, 0, $33, $24, $68, $88, $89,	0
		dc.b $89, $77, $88, $90, $79, $98, $77,	$79, $99, $77, $77, $77, $77, $79, $66,	$88, $77, $66, $CC, $F9
		dc.b $96, $FC, $11, $CD, $9F, $DC, $CC,	$DD, $DC, $DC, $CC, $CD, $CC, $1C, $CC,	$CD, $C1, $1C, $CC, $CD
		dc.b $CC, $1C, $C1, $FD, $11, $1C, $CF,	$FD, $BB, $C1, $CF, $FB, $7B, $BC, $CC,	$BB, $B7, $7B, $BB, $BB
		dc.b $7B, $B7, $7B, $BB, 0, $7B, $B7, $77, 0, $F, $7D, $C1, $22, $37, $79, $DC,	$22, $33, $7F, $F7
		dc.b $44, $24, $33, $D7, $33, $43, $F3,	$22, $22, $3F, $77, $73, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $66, 0, 0,	0, $96,	$89, 0,	0, $88,	$88, $90, 0, $96, $88, $99, 0, $CF, $99, $90, 0
		dc.b $1D, 0, 0,	0, $1D,	0, 0, 0, $1C, 0, 0, 0, $1C, 0, 0, 0, $1F, 0, 0,	0
		dc.b $1F, $70, 0, 0, $BB, 0, 8,	$80, $BB, $BB, $87, $7B, $BB, $88, $77,	$70, $BB, $77, $77, 0
		dc.b $77, 0, 0,	0, 0, 0, 0, 0, $17, 0, 0, 0, $DC, $30, 0, 0, $9D, $D2, 0, 0
		dc.b $97, $9D, $20, 0, $27, $7D, $92, 0, 0, 0, $43, $42, 0, 0, $44, $32, 0, 0, 4, $43
		dc.b 0,	$DC, $D0, $44, 0, $D, $CC, 4, 0, $DC, $CC, $DD,	$D, $DC, $DD, $CC, $D, $CC, $CC, $CC
		dc.b $DD, $CC, $11, $11, $DC, $C1, $11,	$11, $DC, $C1, $11, $11, $DC, $C1, $11,	$11, $DD, $CC, $11, $11
		dc.b $D, $CC, $C1, $1C,	$D, $DC, $CC, $CD, 0, $DD, $DC,	$DB, 0,	0, $DD,	$7B, 0,	0, 0, $7B
		dc.b 0,	0, $77,	$BB, 0,	$77, $BB, $B8, 7, $BB, $BB, $8B, $77, $8B, $B7,	$7B, $77, $B8, $88, $88
		dc.b $77, $78, $8B, $B8, $22, $2F, $77,	$97, $32, $27, $98, $89, $22, $3F, $99,	$98, $43, $4F, $77, $79
		dc.b $44, $47, $79, $99, $D4, $47, $7F,	$79, $CD, $4F, $77, $F7, $CC, $DD, $FF,	$7F, $11, $CC, $DF, $F7
		dc.b $11, $11, $CD, $DF, $11, $11, $1C,	$CD, $11, $11, $11, $1C, $11, $11, $11,	$11, $C1, $11, $11, $11
		dc.b $DC, $11, $11, $CC, $BD, $CC, $CC,	$CD, $8D, $CC, $CD, $DD, $8D, $DD, $DD,	0, $80,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $B8, $88, 0, 0, $8B, $88, $80, 0, $88, $BB, 0, 0
		dc.b $32, $79, $92, 0, $72, $77, $93, $70, $73,	$77, $79, $90, $97, $77, $77, $7D, $89,	$79, $97, $71
		dc.b $99, $88, $99, $71, $79, $99, $97,	$D1, $F7, $99, $77, $DD, $7F, $F7, $77,	$D, $77, $77, $70, 0
		dc.b $DD, $D0, 0, 0, $CC, $D8, 0, 0, $1C, $DB, $80, 8, $CD, $7B, $B8, $B, $CD, 7, $B8, $BB
		dc.b $D0, 7, $BB, $7B, 0, 7, $BB, $7B, 0, $7B, $B7, $BB, 0, $7B, $BB, $BB, 0, $7B, $BB,	$B7
		dc.b 0,	7, $77,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $DD, 0, 0,	0, $11,	$D0, 0,	0, $11,	$D0, 0,	0
		dc.b $11, $D0, 0, 0, $1D, 0, 0,	0, $D0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 8,	$88, 0,	0, $8B,	$B8, 0,	0, $BB,	$BB, $80, 0, $BB, $BB, $80, 0, $BB, $BB, $B0, 0
		dc.b $BB, $BB, 0, 0, $BB, $B0, 0, 0, $B7, 0, 0,	0, $70,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
byte_24510:	dc.b 0,	0, 0, 0, 0, 0, 0, 8, 0,	0, $88,	$89, 0,	8, $99,	$99, 0,	$99, $99, $98
		dc.b 7,	$77, $99, $97, 7, $77, $77, $77, 0, $F7, $77, $78, 8, $89, 0, 0, $88, $88, $90,	0
		dc.b $97, $78, $89, 0, $98, $87, $77, $99, $87,	$77, $77, $79, $77, $98, $88, $88, $78,	$8C, $CF, $79
		dc.b $8F, $C1, $1C, $D7, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $90, 0, 0,	0
		dc.b $98, 0, 0,	0, $88,	$80, 0,	0, $88,	$89, 0,	0, $79,	$89, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 7, 0,	0, 0, 7
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $77
		dc.b 0,	0, 7, $99, 0, 0, $79, $79, 0, 0, $77, $78, 0, 7, $79, $89, 0, 7, $98, $89
		dc.b 0,	$79, $77, $89, 0, $77, $78, $99, 0, $79, $98, $99, 0, $79, $77,	$7F, 0,	$77, $C1, $11
		dc.b 0,	$7C, $11, $1C, 0, $DC, $11, $11, 0, $DC, $11, $11, 0, $D, $C1, $CC, 0, 0, $DD, $DD
		dc.b 0,	0, $DC,	$C1, 0,	0, $D, $C1, 0, 0, $D, $C1, 0, 0, $D, $C1, 0, 0,	0, $DC
		dc.b 0,	0, 0, $DC, 0, $F, $F7, $99, 0, 7, $99, $FD, 0, $79, $FF, $FC, 7, $7F, $FF, $DC
		dc.b $77, $FF, $FF, $DC, $FF, $FF, $FF,	$D1, 0,	0, 0, $7B, 2, $22, $77,	$B7, $23, $33, $27, $7B
		dc.b $77, $77, $32, $79, $99, $77, $32,	$99, $89, $97, $33, $29, $88, $99, $93,	$2F, $89, $99, $73, $27
		dc.b $89, $97, $33, $27, $99, $73, $32,	$99, $97, $33, $39, $79, $33, $F3, $99,	$79, $FF, $F7, $77, $79
		dc.b $F7, $77, $79, $98, $F7, $79, $99,	$89, $17, $99, $99, $99, $CC, $77, $77,	$77, $CC, $FF, $F7, $77
		dc.b $CD, $DD, $DF, $FF, $CD, $CC, $DD,	$DD, $11, $11, $CC, $CC, $11, $11, $11,	$11, $11, $11, $11, $11
		dc.b $11, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11, $FD, $CC, $CD,	$D1, $CD, $CC, $CC, $D1
		dc.b $C1, $CC, $CC, $D1, $11, $CC, $CC,	$D1, $C1, $CC, $1F, $D1, $11, $CC, $FF,	$D1, $BC, $1C, $FF, $BB
		dc.b $BB, $CC, $CB, $BB, $77, $BB, $BB,	$BB, $BB, $77, $BB, $BB, $77, $BB, $79,	$77, $8F, $F7, $77, $78
		dc.b $98, $9F, $77, $89, $FF, $F9, $F7,	$89, $F9, $89, $F7, $8F, $97, $98, $7F,	$9F, $99, $79, $7F, $99
		dc.b $89, $77, $8F, $99, $89, $97, $9F,	$99, $98, $99, $7F, $99, $98, $88, $9F,	$99, $89, $98, $9F, $99
		dc.b $99, $99, $9F, $77, $77, $77, $FD,	$FF, $FF, $FF, $DD, $DD, $DD, $DD, $CC,	$CC, $CC, $CC, $11, $11
		dc.b $11, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11, $11, $11, $11,	$1C, $11, $11, $11, $1C
		dc.b $D7, $99, 0, 0, $D7, $90, 0, 0, $C9, 0, 0,	0, $C0,	0, 0, 0, $F0, 0, 0, 0
		dc.b $F7, 0, 0,	0, $B0,	0, $88,	0, $BB,	$B8, $77, $B0, $B8, $87, $77, 0, $B7, $77, 0, 0
		dc.b $70, 0, 0,	0, $79,	0, 0, 0, $F9, $89, 0, 0, $F9, $98, $90,	0, $99,	$99, $80, 0
		dc.b $97, $99, $99, 0, $97, $99, $97, 0, $9F, $79, $7D,	$D0, $F7, $77, $DD, $CD, $9D, $DD, $DC,	$CD
		dc.b $9D, $1D, $C1, $CD, $7D, $C1, $DD,	$CD, $F0, $DC, $CC, $D0, $D0, $D, $DD, 0, $CD, 0, 0, 0
		dc.b $CD, 0, 0,	0, $CD,	0, 0, 0, $CD, 0, 0, 0, $CD, 0, 0, 0, $CD, 0, 0,	0
		dc.b $D0, 0, 0,	0, $D0,	0, 0, 0, 0, 0, 0, $D, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $C1, $CC, $C1, $11, $DC, $CD, $DC,	$11, $DD, $D7, $7D, $C1, $D, $77, $B7, $DC, 0, 7, $BB, $7D
		dc.b 0,	7, $7B,	$D, 0, 0, $78, 0, 0, 0,	$78, 0,	$11, $11, $11, $1C, $11, $11, $1C, $CD
		dc.b $11, $1C, $CD, $DD, $CC, $CD, $D7,	$B0, $DD, $D7, $77, $B0, $DD, $D0, $77,	$80, 0,	0, $77,	$80
		dc.b 0,	0, $77,	$80, $D0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $B8,	0
		dc.b 0,	0, $BB,	0, 0, 7, $BB, 0, 0, $7B, $B0, 0, 7, $7B, $B8, 0, 7, $B8, $88, $B0
		dc.b 7,	$BB, $88, $B0, 7, $BB, $88, $B0, 0, 0, $7B, $B0, 0, 0, $7B, $B0, 0, 0, $7B, 0
		dc.b 0,	$77, $BB, 0, 7,	$77, $BB, $80, 7, $B8, $88, $88, 7, $BB, $B8, $88, 0, $7B, $BB,	$88
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $B0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 7
		dc.b 0,	0, 0, 7, 7, $BB, $B8, $B0, 7, $BB, $B8,	$B0, 7,	$BB, $BB, $B0, $7B, $BB, $BB, $B0
		dc.b $7B, $BB, $BB, $B0, $7B, $BB, $BB,	$B0, $BB, $BB, $BB, 0, $BB, $BB, $B0, 0, 0, 7, $BB, $B8
		dc.b 0,	7, $BB,	$B8, 0,	0, $7B,	$BB, 0,	0, $7B,	$BB, 0,	0, $7B,	$BB, 0,	0, $7B,	$BB
		dc.b 0,	0, $7B,	$B0, 0,	7, $BB,	0, $B0,	0, 0, 0, $BB, 0, 0, 0, $BB, 0, 0, 0
		dc.b $BB, 0, 0,	0, $B0,	0, 0, 0, $B0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
byte_248D0:	dc.b 0,	0, 0, 0, 0, 0, 8, $89, 0, 0, $88, $88, 0, 8, $89, $99, 0, $99, $99, $97
		dc.b 7,	$79, $97, $77, 7, $77, $77, $77, $F, $F7, $77, $9F, 0, 0, 0, 0,	$99, $79, 0, 0
		dc.b $89, $97, $79, $98, $97, $77, $99,	$FF, $77, $DD, $FF, $FF, $7D, $11, $DF,	$FC, $9C, $11, $1D, $CC
		dc.b $D1, $DC, $C1, $D1, 0, 0, 0, 0, 0,	0, 0, 0, $88, $90, 0, 0, $FF, $89, 0, 0
		dc.b $FF, $90, 0, 0, $F9, 0, 0,	0, $F0,	0, 0, 0, $D0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9, 0, 0, 0, 9, 0,	0, 0, 3
		dc.b 0,	0, 0, $F3, 0, 0, 9, $97, 0, 9, $97, $77, 0, $99, $CC, $F7, 9, $9C, $CD,	$1C
		dc.b $99, $FD, $D1, $C1, $99, $9D, $C1,	$11, $F9, $9F, $DC, $CC, $F7, $7F, $FD,	$DD, $F, $77, $77, $7F
		dc.b 0,	$FF, $FF, $FF, 0, 0, 0,	$F, 0, 0, 0, $F, 0, 0, 0, $F, 0, 0, 0, $F
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, $F,	$99, $FD, 9, $99, $FF, $D1
		dc.b $9F, $FF, $FF, $D1, $FF, $FF, $FD,	$DC, $FF, $FF, $DD, $DC, $22, $FF, $FD,	$CC, $23, $32, $79, $D1
		dc.b $97, $33, $27, $7B, $99, $73, $32,	$7B, $79, $97, $32, $77, $C9, $99, $93,	$27, $11, $C9, $73, $27
		dc.b $CC, $C7, $33, $27, $FC, $D3, $32,	$97, $FD, $93, $39, $99, $33, $F3, $99,	$88, $FF, $77, $77, $99
		dc.b $F7, $79, $99, $98, $F7, $99, $99,	$89, $F7, $99, $99, $9F, $F7, $77, $FF,	$FD, $FF, $FF, $DD, $DC
		dc.b $DD, $DC, $11, $CD, $DD, $C1, $1C,	$DB, $1D, $CC, $CC, $11, $1D, $CC, $CC,	$11, $1D, $CC, $CC, $11
		dc.b $1C, $CC, $1F, $11, $1C, $CC, $FF,	$BB, $CC, $CC, $FF, $BB, $1D, $DC, $BB,	$BB, $88, $8B, $BB, $B8
		dc.b $BF, $F8, $88, $87, $7B, $FF, $FF,	$B7, $77, $BF, $FF, $FB, $77, $7B, $FF,	$FB, $77, $77, $BB, $B7
		dc.b $97, $77, $77, $7F, $77, $77, $77,	$99, $99, $77, $99, $98, $88, $98, $88,	$8F, $98, $99, $FF, $FD
		dc.b $FF, $FF, $DD, $D1, $DD, $DD, $11,	$11, $11, $11, $11, $11, $C1, $11, $11,	$11, $DC, $11, $11, $11
		dc.b $8D, $11, $11, $11, $D0, 0, 0, 0, $C0, 0, 0, 0, $C0, 0, 0,	0, $F0,	0, 0, 0
		dc.b $F7, 0, 0,	0, $B7,	0, 0, 0, $BB, $88, $80,	0, $88,	$77, $7B, 0, $70, 0, 0,	0
		dc.b $77, $C1, $C0, 0, $7C, $CC, $1C, 0, $7D, $CC, $C1,	$D0, $77, $DC, $C1, $10, $77, $7D, $CC,	$C0
		dc.b $9F, $D7, $DD, $D0, $8F, $DD, 0, 0, $FD, $1D, 0, 0, $D1, $11, $D0,	0, $11,	$11, $D0, 0
		dc.b $11, $11, $D0, 0, $11, $11, $D0, 0, $11, $11, $DB,	0, $11,	$11, $D8, $80, $11, $1D, $78, $80
		dc.b $D, $C1, $1C, $DB,	$D, $CC, $1C, $C7, 0, $DC, $C1,	$CC, 0,	$D, $DC, $CC, 0, 0, $77, $7B
		dc.b 0,	0, $7B,	$BB, 0,	0, $7B,	$B8, 0,	0, 7, $BB, $B8,	$11, $11, $11, $BB, $81, $11, $11
		dc.b $BB, $81, $11, $11, $7B, $81, $11,	$1C, $B8, $8C, $CC, $DD, $88, $DD, $DD,	0, $88,	$80, 0,	0
		dc.b $88, $88, 0, 0, $11, $CD, $78, $80, $1C, $D7, $B8,	$80, $1C, $D7, $B8, $88, $CD, $7B, $B8,	$88
		dc.b $D7, $7B, $88, $88, 7, $BB, $BB, $88, 0, 0, 0, $B8, 0, 0, 0, 0, 0,	0, 0, $7B
		dc.b 0,	0, 0, $7B, 0, 0, 0, 7, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $B8, $88, $80, 0, $BB, $88, $80, 0, $BB, $B8, $80,	0
		dc.b $7B, $88, $80, 0, $7B, $8B, 0, 0, $7B, $B0, 0, 0, $70, 0, 0, 0, 0,	0, 0, 0
byte_24B50:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 8, $89, 0, 0, $88, $88, 0, 8, $89, $99
		dc.b 0,	$99, $99, $97, 7, $79, $97, $77, 7, $77, $77, $77, 0, $F, $79, $90, 0, 0, $9F, $79
		dc.b $97, $79, $8F, $F7, $89, $97, $78,	$F7, $97, $77, $89, $FF, $77, $DD, $FF,	$FF, $7D, $11, $DF, $FC
		dc.b $9C, $11, $1D, $CC, 0, 0, 0, 0, $90, 0, 0,	0, $99,	0, 0, 0, $79, 0, 0, 0
		dc.b $77, 0, 0,	0, $FF,	0, 0, 0, $F0, 0, 0, 0, $F0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $9F, 0, 0, 9, $FF, 0, 0, 0, $9F
		dc.b 0,	0, 0, 3, 0, 0, 0, $F3, 0, 9, $CC, $F7, 0, $C, $CD, $1C,	0, $D, $D1, $C1
		dc.b 9,	$9D, $C1, $11, $99, $FF, $DC, $CC, $99,	$9F, $FD, $DD, $F9, $97, $FF, $79, $F7,	$77, $77, $77
		dc.b $F, $77, $77, $7F,	0, $FF,	$FF, $FF, 0, 0,	0, $F, 0, 0, 0,	$F, 0, 0, 0, $F
		dc.b 0,	0, 0, $F, 0, 0,	0, 0, 0, 0, 0, 0, $F, $F7, $77,	$77, 0,	$F, $F9, $99
		dc.b $99, $99, $9F, $D1, $FF, $FF, $FF,	$D1, $FF, $FF, $FD, $DC, $FF, $FF, $DD,	$DC, $22, $FF, $FD, $CC
		dc.b $23, $32, $79, $D1, $77, $33, $27,	$7B, $C9, $93, $32, $7B, $11, $C7, $32,	$77, $CC, $C9, $93, $27
		dc.b $FC, $D9, $73, $27, $FD, $97, $33,	$27, $99, $73, $32, $79, $79, $33, $39,	$79, $33, $F3, $77, $99
		dc.b $FF, $77, $79, $99, $F7, $99, $99,	$77, $F7, $99, $97, $DD, $F9, $99, $77,	$CD, $F7, $77, $FC, $DB
		dc.b $FF, $FF, $CD, $7B, $D, $CC, $CD, $7B, $D1, $DC, $C1, $D1,	$1D, $CC, $CC, $11, $1D, $CC, $CC, $11
		dc.b $1D, $CC, $CC, $11, $1C, $CC, $1F,	$11, $1C, $CC, $FF, $BB, $CC, $CC, $FF,	$BB, $1D, $DC, $BB, $BB
		dc.b $88, $8B, $BB, $B8, $BF, $F8, $88,	$87, $BF, $FF, $FB, $77, $7B, $FF, $FF,	$B7, $7B, $FF, $FF, $B7
		dc.b $7B, $FF, $FF, $B7, $77, $BB, $BB,	$7F, $97, $77, $7D, $CC, $97, $DD, $D1,	$11, $7D, $CC, $DD, $11
		dc.b $DC, $CC, $C8, $D1, $CC, $CC, $B8,	$D1, $DC, $11, $BB, $8D, $BD, $11, $BB,	$8C, $8D, $11, $BB, $B8
		dc.b $B8, $88, $BB, $B8, $D0, 0, 0, 0, $D0, 0, 0, 0, $C0, 0, 0,	0, $C0,	0, 0, 0
		dc.b $F0, 0, 0,	0, $F7,	0, 0, 0, $B7, 0, 0, 0, $BB, $88, $80, 0, $88, $77, $7B,	0
		dc.b $7C, $C0, 0, 0, $CC, $C1, $C0, 0, $DC, $CC, $1C, 0, $DD, $CC, $CC,	$D0, $7D, $DD, $CD, 0
		dc.b $77, $7D, $DD, 0, $DD, $D7, $BB, 0, $CC, $CC, $77,	$B0, $11, $11, $C7, $77, $11, $11, $1C,	$7B
		dc.b $11, $11, $1C, $DB, $11, $11, $11,	$CD, $11, $11, $11, $D1, $C1, $11, $11,	$1C, $8C, $11, $11, $1C
		dc.b $B, $88, 0, 0, $B8, $88, $88, $80,	$BB, $BB, $88, $88, $77, $7B, $BB, $B8,	$DD, $77, $77, $BB
		dc.b $CC, $D7, $77, 0, $DD, $77, $70, 0, $D7, $77, 0, 0, $D, $C1, $1C, $D7, 0, $DC, $11, $CD
		dc.b 0,	$D, $CC, $1C, 0, 0, $DD, $CC, 0, 0, 0, $DD, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, $7B, $BB, $B7,	$BB, $D7, $77, $7B, $7B, $CC, $CC, $CC,	$77, $11, $11, $11, $C7
		dc.b $CC, $CC, $CC, $CC, $DD, $DD, $DD,	$DD, 0,	0, 0, 0, 0, 0, 0, 0, $81, $11, $11, $CD
		dc.b $B8, $CC, $1C, $DD, $BB, $88, $CC,	$D7, $77, $BB, $DD, 0, $CC, $DD, 0, 0, $DD, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $77, $70, 0, 0, $77, 0, 0,	0, $70,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
byte_24DD0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $96, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 6,	$88, $88, $90
		dc.b $88, $97, $78, $89, 0, 0, 9, $88, 0, 0, $99, $99, 0, 7, $77, $99, 0, 7, $77, $77
		dc.b 0,	0, $7F,	$FF, 0,	0, $F, $F7, 0, 0, $F7, $99, 0, 7, $99, $FF, $77, $99, $87, $77
		dc.b $99, $97, $77, $77, $97, $77, $96,	$68, $77, $76, $6D, $D6, $79, $6F, $CC,	$CD, $99, $FC, $11, $1C
		dc.b $FD, $DC, $DD, $11, $FD, $CC, $11,	$D1, $96, $60, 0, 0, $79, $69, $90, 0, $88, $88, $90, 0
		dc.b $99, $68, $89, 0, $DD, $69, $89, 0, $C1, $D9, $99,	0, $CC,	$D1, 0,	0, $1D,	$1D, 0,	0
		dc.b 0,	7, $9F,	$FF, 0,	$79, $FF, $FF, 0, $9F, $FF, $FF, 0, $9F, $FF, $FF, 0, $F, $FF, $F0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 3, 0, 0, 0, $33, 0, 0, 3,	$32
		dc.b 0,	0, 3, $22, 0, $D, $DC, $32, 0, $DC, $CF, $77, $D, $CC, $F7, $99, $D, $C1, $F9, $97
		dc.b $DC, $C1, $F7, $99, $DC, $11, $F7,	$9F, $DC, $11, $D3, $7F, $DC, $11, $1D,	$3F, $DC, $11, $11, $DD
		dc.b $DC, $11, $1C, $CC, $D, $C1, $C8, $BC, $D,	$CC, $8B, $88, 0, $DD, $DB, $B8, 0, $D,	$D7, $BB
		dc.b 0,	$77, $77, $BB, 7, $B7, $BB, $BB, $7B, $BB, $77,	$7B, $7B, $B8, $BB, $BB, $7B, $88, $B8,	$8B
		dc.b $7B, $BB, $88, $88, $78, $8B, $B8,	$88, $DC, $C1, $1D, $DD, $DC, $C1, $DC,	$CD, $DD, $CC, $CC, $C1
		dc.b $D1, $1C, $C1, $1C, $7B, $B1, $1C,	$CB, $B7, $77, $BB, $BB, 7, $BB, $77, $BB, $32,	$37, $BB, $77
		dc.b $23, $99, $CC, $97, $37, $79, $9C,	$C9, $32, $27, $99, $1C, $33, $32, $77,	$99, $77, $32, $37, $77
		dc.b $77, $73, $29, $97, $7F, $F1, $1D,	$99, $FD, $1C, $D1, $D9, $D1, $11, $1C,	$D7, $D1, $1C, $C1, $D7
		dc.b $FD, $DC, $CD, $77, $FF, $FD, $D7,	$99, $F7, $97, $77, $98, $1F, $77, $99,	$98, $C1, $FF, $77, $99
		dc.b $81, $1D, $F7, $79, $8C, $1C, $DD,	$77, $8C, $CC, $CC, $CD, $D, $D7, $77, $7B, 0, 7, $7B, $77
		dc.b $80, 0, $7B, $BB, $80, 0, $7B, $BB, $88, 0, 7, $8B, $BB, $80, 7, $88, $11,	$1D, 0,	0
		dc.b $C1, $CD, 0, 0, $DD, $D7, 0, 0, $BB, $B0, 0, $88, $BB, $BB, $B8, $77, $BB,	$B8, $87, $77
		dc.b $BB, $B7, $77, $70, $77, $70, 0, 0, $30, 0, 0, 0, $92, 0, 0, 0, $73, $27, $97, $70
		dc.b $C7, $32, $98, $99, $99, $73, $29,	$87, $77, $93, $27, $9F, $97, $79, $32,	$7F, $99, $79, $32, $7D
		dc.b $99, $77, $73, $FF, $98, $97, $98,	$70, $88, $97, $98, $70, $98, $87, $88,	$70, $88, $97, $89, $70
		dc.b $89, $97, $87, $70, $89, $78, $87,	0, $77,	$99, $77, 0, $77, $77, $D0, 0, $DD, $CC, 0, 0
		dc.b $B8, 0, 0,	0, $B0,	0, 0, 0, $BB, $B0, 0, 0, $BB, $BB, $80,	0, $88,	$B8, $88, $80
		dc.b $B8, $88, $8B, $B8, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $B0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $70, 0, 0,	0, $7F,	$11, $DD, 0, $FC, $DC, $1D, $D0
		dc.b $C1, $DD, $DC, $D0, $C1, $D1, $1C,	$D0, $DC, $C1, $CC, 0, 0, $DD, $D0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $80, 0, 0,	0
byte_25070:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $77, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, $88, $99, 8, $88, $99, $77, $89,	$99, $99, $88, $99, $99, $88, $77
		dc.b $79, $99, $77, $79, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $90, 0, 0,	0
		dc.b $88, $90, 0, 0, $77, $79, $99, 0, $77, $77, $99, $80, $88,	$88, $88, $88, 0, 0, 0,	$77
		dc.b 0,	0, 0, $F, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $77,	0, 0, 7, $77
		dc.b 0,	0, $77,	$7F, 0,	0, $7F,	$FF, $77, $77, $77, $88, $77, $77, $88,	$FC, $FF, $79, $9F, $DC
		dc.b $79, $9F, $DC, $DC, $9F, $FF, $CC,	$1C, $FF, $FD, $C1, $1C, $FF, $FD, $CC,	$1C, $FF, $FD, $11, $1C
		dc.b $CC, $F7, $98, $88, $11, $CD, $77,	$98, $CC, $DD, $1D, $79, $CC, $CD, $1D,	$79, $CC, $CD, $1C, $90
		dc.b $CC, $CD, $1C, 0, $C1, $FD, $1F, 0, $CF, $FD, $1F,	0, $90,	0, 0, 0, $90, 0, 0, 0
		dc.b $90, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 3
		dc.b 0,	0, 0, $22, 0, 0, 2, $34, 0, 0, $23, $43, 0, 4, $33, $43, 0, 4, $32, $43
		dc.b 0,	4, $32,	$24, 0,	0, $43,	$33, 0,	0, 4, $44, 0, 0, 0, 4, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, $D, 0, 0, $C1, $CD, 0, 0, $C,	$1C, 0,	0, $D, $CC
		dc.b 0,	0, $D, $DC, 0, 0, 0, $D, 0, 0, 0, $D, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 7, 0, 0, 0, 7, 0,	0, 0, $7B
		dc.b 0,	0, 7, $7B, 0, 7, $77, $BB, 0, $77, $7B,	$80, 0,	0, 7, $77, 0, 0, 0, 0
		dc.b 3,	$23, $44, $44, $32, $22, $23, $44, $44,	$43, $42, $4F, $42, $22, $32, $F9, $33,	$32, $3F, $99
		dc.b $32, $33, $47, $79, $33, $34, $F7,	$77, $44, $44, $FF, $7F, $44, $4F, $7F,	$FF, $44, $4F, $F7, $77
		dc.b $4F, $FD, $FF, $F7, $DD, $CC, $CF,	$F7, $DC, $11, $11, $FF, $C1, $11, $11,	$1F, $C1, $11, $11, $11
		dc.b $11, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11, $C1, $11, $11,	$11, $CC, $CC, $11, $11
		dc.b $DD, $DD, $C1, $11, $D7, $7B, $DC,	$11, 7,	$B8, $DC, $CC, $7B, $8B, $DD, $DD, $B8,	$B0, 0,	0
		dc.b $BB, 0, 0,	0, $B0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b $70, 7, $BB, $C1, 0, $B, $7B, $BC,	0, 7, $B7, $7B,	$F0, $D, $7B, $B7, $77,	$7D, $D1, $7B
		dc.b $99, $77, $CC, 0, $88, $97, $79, $77, $99,	$89, $77, $79, $77, $98, $97, $98, $99,	$99, $98, $89
		dc.b $F7, $79, $99, $99, $FF, $77, $79,	$97, $9F, $F7, $77, $7F, $99, $9F, $FF,	$F9, $F7, $98, $99, $89
		dc.b $FF, $F7, $89, $F7, $1F, $FF, $FF,	$FF, $11, $1C, $CD, $DD, $11, $11, $1C,	$CC, $11, $11, $11, $1C
		dc.b $11, $11, $11, $1C, $11, $11, $11,	$CD, $11, $11, $1C, $CD, $11, $CC, $CD,	$D0, $CC, $DD, $D0, 0
		dc.b $DD, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $CF, $FB, $BB, $70, $CC, $BB, $BB,	$BB, $BB, $BB, $BB, $88
		dc.b $7B, $CC, $CC, $77, $B7, $C1, $1C,	$C0, $C, $D1, $11, $C0,	$7C, $C1, $1C, $C0, $97, $DC, $CC, $D0
		dc.b $89, $77, $DD, 0, $98, $7F, 0, 0, $97, $F0, 0, 0, $FF, 0, 0, 0, $F7, 0, 0,	0
		dc.b $77, 0, 0,	0, $77,	0, 0, 0, $F0, 0, 0, 0, $D0, 0, 0, 0, $DB, $88, $B0, 0
		dc.b $D7, $BB, $B8, 0, $D7, $77, $BB, $80, $D0,	0, $7B,	$80, 0,	0, $BB,	$80, 0,	$B, $B8, 0
		dc.b $77, $BB, $B0, 0, $7B, $BB, $B0, 0, $7B, $8B, $88,	0, 7, $B8, $88,	$80, 7,	$BB, $B8, $80
		dc.b 7,	$BB, $BB, $88, 0, $7B, $BB, $88, 0, $7B, $BB, $88, 0, $7B, $BB,	$B8, 8,	$80, 0,	0
		dc.b $87, $7B, 0, 0, $77, $70, 0, 0, $77, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$7B, $B8, $B0, 0, $7B, $B8, $B0, 7, $BB, $88, $B0
		dc.b 7,	$B8, $88, $80, $7B, $B8, $88, $80, $7B,	$88, $8B, $B0, $7B, $8B, $8B, 0, $7B, $B8, $B0,	0
		dc.b 0,	$7B, $BB, $BB, 0, $7B, $BB, $B0, 0, $7B, $B0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
byte_253B0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, $D, 0, 0,	$DD, $DC, 0, $DD, $CC, $C1, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $D, 0, 0, 0, $DC, $D0, 0, 0, $1C, $D0, 0, 0
		dc.b $CD, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$D, 0, 0, 0, $DC, 0, 0,	$D, $CC
		dc.b 0,	0, $D, $C1, 0, 0, $DC, $C1, 0, 0, $DC, $11, 0, $D, $CC,	$11, 0,	$D, $CC, $11
		dc.b 0,	$D, $CC, $11, 0, $D, $CC, $11, 0, $D, $CC, $11,	0, $D, $CC, $11, 0, 0, $DC, $C1
		dc.b 0,	0, $DC,	$CD, 0,	0, $D, $D7, 0, 0, $D, $78, 0, 0, 0, $7B, 0, 0, 0, 7
		dc.b 0,	0, 0, 7, 0, 0, 7, $77, 0, 7, $77, $BB, 0, $78, $87, $7B, 7, $88, $BB, $88
		dc.b $DD, $CC, $11, $11, $CC, $11, $11,	$CD, $11, $11, $DD, $D2, $11, $1D, $33,	$22, $11, $D3, $33, $34
		dc.b $11, $D4, $34, $33, $1D, $44, $44,	$22, $1D, $44, $43, $22, $1D, $44, $43,	$32, $11, $D4, $44, $33
		dc.b $11, $D4, $44, $44, $11, $1D, $47,	$77, $11, $D7, $79, $99, $1D, $FF, $99,	$99, $DD, $F9, $99, $97
		dc.b $DD, $79, $97, $77, $BD, $77, $99,	$99, $88, $D7, $79, $99, $BB, $8D, $77,	$99, $7B, $8F, $77, $77
		dc.b $BB, $F, $F7, $77,	$70, 0,	$FF, $FF, $B8, $80, 0, $FF, $BB, $B8, $80, 0, $CC, 0, 0, 0
		dc.b $11, $C0, 0, 0, $22, $23, $30, 0, $33, $33, $33, 0, $43, $22, $22,	$20, $44, $32, $22, $22
		dc.b $34, $33, $22, $22, $23, $43, $32,	$22, $22, $44, $33, $39, $33, $43, $33,	$99, $77, $44, $34, $99
		dc.b $97, $94, $34, $99, $99, $97, $44,	$97, $97, $97, $4F, $97, $77, $7F, $4F,	$77, $FF, $44, $FF, $F7
		dc.b $77, $FF, $FF, $F9, $9F, $CC, $11,	$F9, $FC, $11, $DD, $98, $FD, $C1, $1D,	$8D, $FD, $CC, $CC, $1D
		dc.b $FD, $DC, $CC, $CF, $FF, $DD, $DD,	$FB, $FF, $FF, $FF, $FB, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$88, $89, 0
		dc.b $88, $88, $88, $90, $99, $88, $77,	$79, $88, $77, $77, $77, $97, $79, $88,	$88, $77, $88, $D1, $19
		dc.b $77, $8D, $1D, $DC, $78, $DC, $1C,	$DC, $78, $DC, $11, $FD, $98, $D1, $CF,	$FD, $8D, $C1, $CF, $FD
		dc.b $8D, $1C, $CC, $CD, $D1, $1C, $CC,	$CD, $D1, $11, $CC, $CB, $11, $11, $CC,	$BB, $DB, $BB, $BB, $BB
		dc.b $B7, $77, $77, $BB, $7B, $BB, $BB,	$77, $90, 0, 0,	0, $99,	0, 0, 0, $88, $90, 0, 0
		dc.b $98, $80, 0, 0, $CF, $88, 0, 0, $1C, $98, 0, 0, $11, $99, 0, 0, $1F, 9, 0,	0
		dc.b $1F, 0, 0,	0, $1C,	0, 0, 0, $1C, $70, 0, 0, $BB, 0, 8, $80, $BB, $BB, $87,	$7B
		dc.b $BB, $88, $77, $70, $BB, $77, $77,	0, $77,	0, 0, 0
byte_255B0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9
		dc.b 0,	0, 0, $97, 0, 0, 9, $77, 0, 0, 7, $7F, 0, 0, $F, $FF, 0, 0, 0, $FC
		dc.b 0,	0, 0, $C, 0, 0,	0, $C1,	0, 0, 0, $C1, 0, 0, 0, $C1, 0, 0, 0, $C1
		dc.b 0,	$88, $87, $F1, 0, 0, 0,	0, 0, 0, 0, 0, 0, $99, $9F, $90, $99, $97, $F9,	0
		dc.b $97, $7F, $97, $99, $77, $7F, $99,	$88, $77, $FF, $97, $99, $FF, $FF, $F9,	$77, $FF, $DD, $FF, $99
		dc.b $1C, $D1, $1D, $FF, $11, $11, $11,	$1F, $11, $CC, $11, $1D, $1C, $CC, $C1,	$11, $1C, $CC, $C1, $11
		dc.b $1C, $CC, $C1, $1C, $1F, $1C, $C1,	$1C, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $88, 0, 0, 0, $88, $80, 0, 0, $99, $88, 0, 0, $99, $99, $90, 0
		dc.b $77, $99, $77, $9F, $99, $77, $77,	$92, $FF, $97, $77, $93, $FF, $F9, $99,	$22, $DF, $FF, $99, $FF
		dc.b $DF, $FF, $FF, $99, $D9, $FF, $FF,	$FF, $7F, $99, $99, $99, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $D, 0, 0, $DD, $DC
		dc.b 0,	$DD, $CC, $CC, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b $D, $D0, 0, 0, $DC, $CD, 0, 0, $11, $CD, 0, 0, $CC, $1C, $D0, 0, $D, $CC, $11, $11
		dc.b $FF, $FC, $11, $11, $22, $FF, $C1,	$11, $32, $2F, $FC, $11, $33, $22, $FF,	$C1, $99, $33, $FF, $C1
		dc.b $92, $23, $77, $FC, $33, $33, $97,	$FC, $33, $44, $77, $FC, $44, $47, $77,	$FC, $44, $97, $7F, $FD
		dc.b $49, $97, $7F, $DD, $99, $97, $7F,	$DC, $77, $77, $FD, $CC, $7F, $FF, $FD,	$DD, $FF, $FF, $FF, $FF
		dc.b $11, $11, $CD, 0, $11, $11, $CC, $D0, $11,	$11, $1C, $D0, $11, $11, $11, $CD, $11,	$11, $11, $CD
		dc.b $11, $11, $11, $CD, $11, $11, $11,	$CC, $11, $11, $11, $CC, $CC, $CC, $CB,	$88, $DD, $DC, $7B, $BB
		dc.b $7B, $8D, $7B, $8B, $7B, $8D, $78,	$BB, $D7, $B8, $8B, $B7, $C7, $7B, $B7,	$77, $FF, $77, $77, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $D0, 8, $88, $80, $D0, $8B, $BB, $B8, $88,	$BB, $BB, $BB
		dc.b $BB, $BB, $BB, $BB, $BB, $BB, $BB,	$B7, $7B, $BB, $B7, $77, $77, $77, $77,	$70, $77, $77, $77, 0
		dc.b $77, $77, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $D
		dc.b 0,	0, $DD,	$D1, 0,	$DD, $11, $11, $D, $C1,	$11, $DD, $DC, $1D, $1D, $CC, $C, $CD, $CD, $DC
		dc.b 8,	$FF, $87, $BB, $B, $FF,	$F8, $BB, $D1, $FF, $FF, $8B, $11, $11,	$1F, $FF, $DD, $D1, $11, $11
		dc.b $C1, $1C, $11, $C1, $1C, $D1, $1C,	$1C, $DD, $CC, $DD, $DD, $BF, $FC, $C1,	$77, $BB, $CC, $17, $79
		dc.b $BB, $77, $79, $88, $B7, $79, $88,	$89, $FF, $F9, $99, $99, $1C, $F7, $97,	$77, $CD, $F7, $7F, $FF
		dc.b $DF, $FF, $FF, $FF, $77, $7F, $FF,	$43, $88, $77, $FF, $44, $88, $88, $77,	$F3, $98, $88, $89, $33
		dc.b $77, $99, $93, $3F, $77, $77, $33,	$F9, $FF, $33, $FF, $77, $FF, $FF, $FF,	$FF
byte_257F0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 9, $99
		dc.b 0,	0, $99,	$77, 0,	0, $97,	$77, 0,	0, $77,	$FF, 0,	0, $7F,	$FF, 0,	0, $F, $FC
		dc.b 0,	0, 0, $C, 0, 0,	0, $C1,	0, 0, 0, $C1, 0, 0, 0, $C1, 0, 0, 0, $C1
		dc.b 0,	$88, $87, $F1, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $99,	$F9, 0,	0
		dc.b $77, $FF, $97, $99, $7F, $99, $99,	$88, $7F, $99, $77, $99, $FF, $F9, $97,	$77, $FF, $DD, $F9, $97
		dc.b $1C, $D1, $1D, $F9, $11, $11, $11,	$1F, $11, $CC, $11, $1D, $1C, $CC, $C1,	$11, $1C, $CC, $C1, $11
		dc.b $1C, $CC, $C1, $1C, $1F, $1C, $C1,	$1C, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $88, 0, 0, 0, $88, $80, 0, 0, $99, $88, 0, 0, $99, $99, $90, 0
		dc.b $77, $99, $77, $9F, $97, $77, $77,	$92, $F9, $97, $77, $93, $FF, $F9, $99,	$22, $DF, $FF, $FF, $9F
		dc.b $DF, $FF, $FF, $93, $D9, $FF, $F9,	$F3, $7F, $99, $9F, $F3, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $DD, 0, 0, 0, $DC, 0, 0, $DD, $DC
		dc.b 0,	$DD, $CC, $CC, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b $D0, 0, 0,	0, $CD,	$D0, 0,	0, $11,	$CD, 0,	0, $CC,	$1C, $D0, 0, $D, $CC, $11, $11
		dc.b $FF, $FC, $11, $11, $22, $FF, $C1,	$11, $32, $2F, $FC, $11, $33, $22, $FF,	$C1, $22, $33, $FF, $C1
		dc.b $22, $23, $77, $FC, $33, $33, $97,	$FC, $33, $44, $77, $FC, $44, $44, $77,	$FC, $44, $97, $7F, $FD
		dc.b $49, $97, $7F, $DD, $99, $97, $7F,	$DC, $77, $77, $FD, $CC, $7F, $FF, $FD,	$DD, $FF, $FF, $FF, $FF
		dc.b $11, $11, $CD, 0, $11, $11, $CC, $D0, $11,	$11, $1C, $D0, $11, $11, $11, $CD, $11,	$11, $11, $CD
		dc.b $11, $11, $11, $CD, $11, $11, $11,	$CC, $11, $11, $11, $CC, $CC, $CC, $CB,	$88, $DD, $DC, $7B, $BB
		dc.b $7B, $8D, $7B, $8B, $7B, $8D, $78,	$BB, $D7, $B8, $8B, $B7, $C7, $7B, $B7,	$77, $FF, $77, $77, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $D0, 8, $88, $80, $D0, $8B, $BB, $B8, $88,	$BB, $BB, $BB
		dc.b $BB, $BB, $BB, $BB, $BB, $BB, $BB,	$B7, $7B, $BB, $B7, $77, $77, $77, $77,	$70, $77, $77, $77, 0
		dc.b $77, $77, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $D
		dc.b 0,	0, $DD,	$D1, 0,	$DD, $11, $11, $D, $C1,	$11, $DD, $DC, $1D, $1D, $CC, $C, $CD, $CD, $DC
		dc.b 8,	$FF, $87, $BB, $B, $FF,	$F8, $BB, $D1, $FF, $FF, $8B, $11, $11,	$1F, $FF, $DD, $D1, $11, $11
		dc.b $C1, $1C, $11, $C1, $1C, $D1, $1C,	$1C, $DD, $CC, $DD, $DD, $BF, $FC, $C1,	$77, $BB, $CC, $17, $77
		dc.b $BB, $77, $77, $88, $B7, $77, $98,	$89, $FF, $F9, $99, $99, $1C, $F7, $99,	$97, $CD, $F7, $77, $77
		dc.b $DF, $FF, $FF, $FF, $77, $7F, $FF,	$43, $88, $77, $FF, $44, $88, $88, $77,	$F3, $98, $88, $89, $33
		dc.b $97, $99, $93, $3F, $77, $77, $33,	$F9, $FF, $33, $FF, $77, $FF, $FF, $FF,	$FF
byte_25A30:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9
		dc.b 0,	0, 0, 9, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 9, $99
		dc.b 0,	0, 9, $97, 0, 0, 9, $77, 0, 0, 0, 7, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9
		dc.b 0,	0, $D1,	$19, 0,	$D, $11, $99, 0, 1, $11, $79, 0, 1, $1D, $77, 0, $D, $DD, $D7
		dc.b 0,	0, 0, 0, 0, 0, 0, $B, 0, 0, 0, $B8, 0, 0, 0, $8B, 0, 0,	0, $8B
		dc.b 0,	$88, $8B, $8B, 8, $88, $BB, $8B, 0, 0, 8, $88, 0, $88, $97, $79, 8, $77, $98, $88
		dc.b $99, $98, $89, $99, $79, $99, $99,	$99, $77, $79, $99, $77, $97, $77, $77,	$77, 9,	$77, $77, $77
		dc.b $99, $77, $77, $77, $99, $99, $77,	$77, $77, $77, $77, $7D, $77, $77, $77,	$DD, $77, $70, $D, $DD
		dc.b 0,	0, 0, $DD, 0, 0, $43, $44, 0, 7, $32, $34, 0, $94, $32,	$33, 9,	$33, $32, $22
		dc.b $93, $32, $34, $22, $92, $23, $23,	$44, $72, $23, $22, $23, $72, $23, $22,	$22, $74, $33, $22, $23
		dc.b $74, $44, $33, $33, $77, $DF, $44,	$44, $DD, $DC, $FF, $FF, $BD, $DC, $CC,	$DD, $8B, $DC, $11, $11
		dc.b $BB, $BD, $C1, $11, $7B, $B7, $D1,	$11, $77, $7D, $C1, $11, $7D, $DC, $CC,	$11, $78, 0, 0,	0
		dc.b $88, $80, 0, 0, $99, $98, $90, 0, $99, $77, $79, $88, $77,	$77, $99, $99, $77, $99, $99, $88
		dc.b $99, $77, $99, $10, $77, $7D, $C1,	$C0, $7D, $CC, $C1, $C0, $DC, $CC, $C1,	$CF, $DC, $CC, $11, $F0
		dc.b $D7, $B1, $11, $F8, $D7, $7B, $11,	$BB, $DD, $77, $BB, $B8, $DD, $D7, $77,	$77, $33, $3F, $FF, $77
		dc.b $33, $32, $23, $F7, $22, $22, $23,	$BF, $22, $22, $42, $3F, $44, $44, $32,	$33, $22, $23, $33, $33
		dc.b $33, $33, $44, $44, $33, $44, $44,	$44, $44, $FC, $DD, $D4, $4F, $FD, $1C,	$CD, $FD, $DD, $C1, $1C
		dc.b $D1, $11, $11, $11, $11, $11, $11,	$CC, $11, $11, $1C, $CD, $11, $11, $11,	$1C, $11, $11, $11, $1C
		dc.b $11, $11, $11, $1C, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $C, $CD, 0, 0
		dc.b $8C, $1C, $1D, 0, $88, $11, $CC, 0, $F1, $11, $CC,	0, $FC,	$11, $CD, 0, $FC, $CC, $D0, 0
		dc.b $99, $97, $70, 0, $F9, $99, $77, 0, $88, $99, $77,	0, $B8,	$87, $77, 0, $88, $77, $77, 0
		dc.b $77, $77, $77, 0, $79, $77, $F0, 0, $77, $7F, $F0,	0, $77,	$7F, 0,	0, $FF,	$F0, 0,	0
		dc.b $FF, 0, 0,	0, $F0,	0, 0, 0, $F0, 0, 0, 0, $F0, 0, 0, 0, $F0, 0, 0,	0
		dc.b 0,	0, 0, 0, $D0, 0, 0, 0, $D0, 0, 0, 0, $D0, 0, 0,	0, $D0,	0, 0, 0
		dc.b $DD, 0, 0,	0, $CD,	0, 0, 0, $CD, 0, 0, 0, 8, $8B, $B7, $BB, $88, $88, $B7,	$BB
		dc.b $88, $8B, $BB, $7B, 0, 7, $BB, $BB, 0, 0, $77, $BB, 0, 0, 0, $77, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, $7D, $DC, $CC,	$11, $77, $DD, $CC, $CC, $B7, $7D, $DC,	$CC, $B7, $70, $DD, $CC
		dc.b $77, $70, 0, $DD, $77, $70, 0, 0, $77, 0, 0, 0, 0,	0, 0, 0, $11, $11, $11,	$1C
		dc.b $11, $11, $1C, $CC, $CC, $CC, $CC,	$CC, $CC, $CC, $CC, $CD, $DC, $CC, $CD,	$DD, $DD, $DD, $DD, $DB
		dc.b 0,	0, 0, $BB, 0, 0, 8, $88, $CD, 0, 0, 0, $CD, 0, 0, 0, $DD, 0, 0,	0
		dc.b $D7, 0, 0,	0, $77,	0, 0, 0, $70, 0, 0, 0, $70, 0, 0, 0, $BB, 0, 0,	0
		dc.b 0,	0, $B7,	$77, 0,	$B, $77, $77, 0, 7, $77, $77, 0, 7, $77, $77, 0, 7, $77, $77
		dc.b 0,	7, $77,	$77, 0,	0, $77,	$77, 0,	0, 7, $77, $BB,	0, 0, 0, $7B, $B0, 0, 0
		dc.b $77, $B0, 0, 0, $77, $B0, 0, 0, $77, $7B, 0, 0, $77, $77, $BB, 0, $77, $77, $7B, $B0
		dc.b $77, $77, $BB, 0
byte_25CF0:	dc.b 0,	0, 0, $88, 0, 8, $89, $77, 0, $87, $79,	$88, 9,	$99, $88, $99, $97, $99, $99, $99
		dc.b $97, $77, $99, $97, 9, $77, $77, $77, 0, $97, $77,	$77, $87, $80, 0, 0, $98, $88, 0, 0
		dc.b $89, $99, $89, 0, $99, $97, $77, $98, $97,	$77, $79, $99, $77, $79, $99, $98, $79,	$97, $79, $91
		dc.b $77, $77, $DC, $1C, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $80, 0, 0,	0
		dc.b $98, 0, 0,	0, $88,	$80, 0,	0, $FF,	$80, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, $99, 0, 0, 0, $99, 0, 0, 0, $97, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $D, $11, 0, 0,	$D1, $11, $11, 0, $D1, $11, $11, $90, $D1, $11,	$11, $99
		dc.b $D, $D1, $11, $99,	0, $D, $D7, $97, 0, 0, 7, $97, 0, 0, 0,	$77, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $77, $99,	$97, $77, $77, $99, $99, $97, $77
		dc.b $77, $77, $77, $77, $77, $77, $77,	$7D, $77, $77, $7D, $DD, 0, 7, $74, $DD, 0, $32, $34, $44
		dc.b 0,	$73, $23, $34, 9, $F3, $22, $33, $93, $33, $22,	$22, $38, $24, $32, $22, $22, $32, $44,	$33
		dc.b $22, $32, $22, $44, $23, $33, $22,	$22, $F4, $44, $43, $33, $FF, $44, $FF,	$DC, $F, $FF, $CD, $CC
		dc.b $D, $DC, $DD, $C1,	$DD, $CC, $DC, $C1, $DC, $CC, $CD, $C1,	$DC, $CC, $C1, $11, $DC, $C1, $11, $11
		dc.b $DC, $C1, $11, $11, $DC, $CC, $11,	$11, $77, $DC, $CC, $1C, $7D, $CC, $CC,	$1C, $DD, $CC, $C1, $1F
		dc.b $DD, $7B, $11, $1F, $DD, $77, $B1,	$1B, $DD, $D7, $7B, $BB, $DD, $DD, $77,	$77, $44, $44, $47, 0
		dc.b $33, $32, $2F, $90, $22, $22, $33,	$39, $22, $23, $42, $83, $33, $44, $23,	$22, $44, $22, $23, $22
		dc.b $22, $22, $33, $42, $33, $33, $44,	$4F, $DD, $FF, $44, $FF, $CD, $DC, $FF,	$F0, $1C, $DD, $CD, $D0
		dc.b $1C, $CD, $CC, $DD, $1C, $DC, $CC,	$CD, $11, $1C, $CC, $CD, $11, $11, $1C,	$CD, $11, $11, $1C, $CD
		dc.b $11, $11, $CC, $CD, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $88, $80, 0, 0
		dc.b $BB, $88, 0, 0, $88, $87, 0, 0, $77, $70, 0, 0, 0,	1, $11,	$D0, 0,	$11, $11, $1D
		dc.b 9,	$11, $11, $1D, $99, $11, $11, $1D, $99,	$11, $1D, $D0, $99, $7D, $DD, 0, $77, $70, 0, 0
		dc.b $77, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $77, 0, 0,	0
		dc.b 0,	0, 0, $78, 0, 0, 0, $B8, 0, 0, 0, $BB, 0, 0, 0,	$B, 0, 0, 0, 0
		dc.b 0,	8, $88,	$80, 0,	$88, $88, $8B, 0, $88, $8B, $BB, 0, $88, $8B, $B7, 0, $78, $88,	$77
		dc.b 0,	7, $77,	$77, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $DD, $CC, $C1,	$11, $7D, $DC, $CC, $CC, $87, $DD, $CC,	$CC, $B8, $7D, $DD, $CC
		dc.b $BB, $88, $7D, $DD, $7B, $B8, $B0,	0, $BB,	$77, $70, 0, $77, $77, $70, 0, $77, $77, 0, 0
		dc.b $77, $70, 0, 0, $70, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $11, $1C, $CC, $DD, $CC, $CC, $CD,	$D7, $CC, $CC, $DD, $78
		dc.b $CC, $DD, $D7, $8B, $DD, $D7, $88,	$BB, 0,	$B, $8B, $B7, 0, 7, $77, $BB, 0, 7, $77, $77
		dc.b 0,	0, $77,	$77, 0,	0, 7, $77, 0, 0, 0, 7, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $87, 0, 0, 0, $8B, 0, 0, 0
		dc.b $BB, 0, 0,	0, $B0,	0, 0, 0, 0, 0, 0, 0, 8,	$88, $80, 0, $B8, $88, $88, 0
		dc.b $BB, $B8, $88, 0, $7B, $B8, $88, 0, $77, $88, $87,	0, $77,	$77, $70, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
byte_25FD0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $DC, $C0, 0, $D1, $C1, $CD
		dc.b 0,	$CC, $11, $D1, 0, $CC, $11, $1F, 0, $DC, $11, $CF, 0, $D, $CC, $CF, 0, 7, $79, $99
		dc.b 0,	$77, $99, $97, 0, $77, $99, $97, 0, $77, $79, $99, 0, $77, $79,	$99, 0,	$77, $77, $99
		dc.b 0,	$F, $77, $97, 0, $F, $F7, $77, 0, 0, $F7, $77, 0, 0, $F, $FF, 0, 0, 0, $FF
		dc.b 0,	0, 0, $F, 0, 0,	0, $F, 0, 0, 0,	$F, 0, 0, 0, $F, 0, 0, 0, 0
		dc.b 0,	0, 0, $D, 0, 0,	0, $D, 0, 0, 0,	$D, 0, 0, 0, $D, 0, 0, 0, $DD
		dc.b 0,	0, 0, $DC, 0, 0, 0, $DC, 0, 0, 0, 8, 0,	0, $88,	$97, 0,	8, $77,	$98
		dc.b 0,	$99, $98, $89, 9, $79, $99, $99, 9, $77, $79, $99, 0, $97, $77,	$77, 0,	9, $77,	$77
		dc.b $77, $99, $77, $77, $79, $99, $99,	$77, $97, $77, $77, $77, $77, $77, $77,	$77, $77, $77, $70, $DD
		dc.b $99, $90, $77, $FD, $99, $74, $34,	$44, $77, $43, $23, $34, $74, $32, $23,	$33, $4B, $32, $22, $22
		dc.b $F3, $23, $22, $22, $33, $23, $33,	$33, $44, $43, $32, $22, $44, $44, $43,	$33, $44, $44, $44, $34
		dc.b $4D, $DD, $CF, $44, $DC, $C1, $DF,	$F4, $C1, $1C, $DD, $DF, $11, $11, $11,	$1D, $CC, $11, $11, $11
		dc.b $DC, $C1, $11, $11, $C1, $11, $11,	$11, $C1, $11, $11, $11, $C1, $11, $11,	$11, $88, $78, 0, 0
		dc.b $79, $88, $80, 0, $88, $99, $98, $90, $99,	$99, $77, $79, $99, $77, $77, $99, $77,	$77, $99, $99
		dc.b $77, $99, $77, $99, $77, $77, $7D,	$C1, $77, $7D, $CC, $C1, $77, $DC, $CC,	$C1, $7D, $DC, $CC, $11
		dc.b $DD, $D7, $B1, $11, $DD, $D7, $7B,	$11, $DD, $DD, $77, $BB, $4D, $DD, $D7,	$77, $44, $33, $70, 0
		dc.b $33, $23, $F9, 0, $22, $23, $33, $90, $22,	$33, $28, $39, $33, $32, $32, $29, $32,	$22, $32, $27
		dc.b $22, $22, $32, $27, $32, $22, $33,	$F7, $43, $33, $34, $47, $44, $43, $4D,	$77, $F4, $44, $CD, $DD
		dc.b $DD, $CC, $CD, $DB, $11, $11, $CD,	$B8, $11, $1C, $DB, $BB, $11, $1D, $7B,	$B7, $11, $1C, $D7, $77
		dc.b $11, $CC, $CD, $D7, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $88, 0, 0,	0
		dc.b $99, $80, 0, 0, $88, $88, 0, 0, $17, $78, 0, 0, $C0, 0, 0,	0, $C0,	0, 0, 0
		dc.b $C0, 0, 0,	0, $F0,	0, 0, 0, $F8, $88, 0, 0, $BB, $B8, $80,	0, $B8,	$88, $70, 0
		dc.b $77, $77, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b $90, 0, 0,	0, $91,	$1D, 0,	0, $99,	$11, $D0, 0, $97, $11, $10, 0, $77, $D1, $10, 0
		dc.b $7D, $DD, $D0, 0, 0, 0, 0,	0, $B0,	0, 0, 0, $8B, 0, 0, 0, $B8, 0, 0, 0
		dc.b $B8, 0, 0,	0, $B8,	$B8, $88, 0, $B8, $BB, $88, $80, 0, 0, 0, $DC, 0, 0, 0,	$DC
		dc.b 0,	0, 0, $DD, 0, 0, 0, $7D, 0, 0, 0, $77, 0, 0, 0,	7, 0, 0, 0, 7
		dc.b 0,	0, 0, $BB, $C1,	$11, $11, $11, $CC, $C1, $11, $11, $CC,	$CC, $CC, $CC, $DC, $CC, $CC, $CC
		dc.b $DD, $DC, $CC, $CD, $BD, $DD, $DD,	$DD, $BB, 0, 0,	0, $88,	$80, 0,	0, $11,	$CC, $CD, $D7
		dc.b $CC, $CC, $DD, $77, $CC, $CD, $D7,	$7B, $CC, $DD, 7, $7B, $DD, 0, 7, $77, 0, 0, 7,	$77
		dc.b 0,	0, 0, $77, 0, 0, 0, 0, $BB, $7B, $B8, $80, $BB,	$7B, $88, $88, $B7, $BB, $B8, $88
		dc.b $BB, $BB, $70, 0, $BB, $77, 0, 0, $77, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, $BB, 0, 0, $B, $B7, 0, 0,	$B, $77, 0, 0, $B, $77,	0, 0, $B7, $77
		dc.b 0,	$BB, $77, $77, $B, $B7,	$77, $77, 0, $BB, $77, $77, $77, $7B, 0, 0, $77, $77, $B0, 0
		dc.b $77, $77, $70, 0, $77, $77, $70, 0, $77, $77, $70,	0, $77,	$77, $70, 0, $77, $77, 0, 0
		dc.b $77, $70, 0, 0
byte_26290:	dc.b 0,	0, 0, 0, 0, 9, $99, $F8, 9, $97, $7F, $80, $97,	$77, $7F, $88, $77, $77, $F8, $77
		dc.b $77, $FF, $F9, $87, $F, $FF, $FF, $F8, 0, $FD, $DF, $FF, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, $77, $99, $88,	0, $99,	$88, $88, $80, $77, $99, $99, $88, $87,	$77, $99, $99
		dc.b $F8, $77, $77, $99, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $90, 0, 0,	0, $FF,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $B, $BB, 0, 0, $BF, $FF, 0, $CC, $BF, $FF
		dc.b $C, $DD, $BF, $FF,	$CD, $DC, $CB, $BF, $CD, $DC, $11, $CB,	$DD, $CD, $D1, $1D, $DD, $DD, $C1, $D0
		dc.b $D, $DD, $DD, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b 0,	$D1, $CD, $DC, 0, $11, $CC, $11, 0, $D1, $C1, $1D, 0, $C1, $C1,	$DC, $B0, $C1, $11, $DC
		dc.b $B0, $11, $1D, $CC, $FB, $FC, $DF,	$1C, $FF, $88, $BF, $FC, $BF, $F8, $BB,	$DC, $B, $BF, $F8, $BB
		dc.b 0,	$B, $FF, $FF, 0, $B, $F9, $9F, 0, $B, $F9, $FF,	0, $BF,	$9F, $FB, 0, $BF, $FF, $B0
		dc.b 0,	$BF, $FF, $B0, $1D, $87, $77, $FF, $DD,	$97, $77, $FF, $CC, $D9, $97, $FF, $CC,	$CD, $F8, $70
		dc.b $CC, $CC, $F8, $97, $CC, $C1, $C8,	$97, $CC, $11, $C8, $93, $CC, $11, $C9,	$32, $C1, $CC, $D9, $29
		dc.b $11, $CD, $33, $28, $B1, $17, $43,	$38, $FB, $77, $4F, $99, $B7, $74, $4F,	$79, $79, $94, $4F, $77
		dc.b 7,	$74, $44, $F7, 9, $94, $44, $4F, $FF, 0, 0, 0, $FF, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, $99, $22,	0, $99,	$88, $33, $99, $88, $88, $29, $88, $88,	$89, $88, $88, $99, $89
		dc.b $88, $99, $99, $97, $89, $99, $97,	$77, $89, $99, $97, $77, $88, $97, $77,	$7F, $99, $97, $77, $33
		dc.b $77, $77, $44, $43, $77, $7F, $44,	$99, $FF, $F4, $44, $79, 0, $D,	$DD, $DD, 0, $DD, $DC, $CC
		dc.b $99, $FD, $C1, $11, $88, $9F, $C1,	$CC, $88, $8F, $C1, $DD, $89, $99, $F1,	$11, $98, $97, $FC, $CC
		dc.b $97, $77, $FD, $DD, $D0, 0, 0, 0, $DD, 0, 0, 0, $CC, $D0, 0, 0, $1C, $D0, 0, 0
		dc.b $1C, $D0, 0, 0, $DD, 0, 0,	0, $DD,	0, 0, 0, 0, 0, 0, 0, $77, $FF, $FC, $DD
		dc.b $7F, $F1, $11, $CC, $F3, $11, $11,	$11, $33, $C1, $11, $11, $34, $C1, $11,	$11, $79, $FC, $11, $11
		dc.b $99, $FC, $11, $11, $99, $FC, $11,	$C1, $99, $FC, $1C, $DD, $9F, $FC, $CD,	$7B, $9F, $DC, $CD, $77
		dc.b $7F, $DC, $CC, $CD, $FD, $CC, $CD,	$D0, $FD, $DD, $D0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, $D, 0, $DD, 0, $CD, 0, $CC, $D0, $CD, 0, $11, $CC, $CD, 0, $11, $1C,	$D0, 0
		dc.b $11, $CD, $D0, $B,	$11, $CD, 0, 0,	$1C, $DD, 0, 0,	$DC, $D0, 0, 0,	$8D, $D0, 0, 0
		dc.b $B8, $80, 0, 8, $77, $B8, $88, $BB, 0, 7, $7B, $8B, 0, 0, 0, $7B, 0, 0, 0,	7
		dc.b 0,	0, 0, 0, 0, 0, $B, $BB,	0, 0, $BB, $BB,	0, $B, $BB, $7B, 0, $BB, $87, $BB
		dc.b $BB, $88, 0, $B, $BB, 0, 0, $B, 0,	0, 0, $B, 0, 0,	0, $B, 0, 0, 0,	$B
		dc.b 0,	0, 0, $BB, $88,	$88, 0,	$B, $BB, $BB, $88, 0, $BB, $BB,	$BB, $80, $BB, $BB, $BB, $B8
		dc.b $77, $BB, $BB, $BB, 0, $7B, $BB, $BB, $80,	0, 0, 0, $B8, 0, 0, 0, $BB, $80, 0, 0
		dc.b $BB, $80, 0, 0, $BB, $B8, 0, 0, $BB, $B8, 0, 0, $BB, $BB, $80, 0, $BB, $BB, $80, 0
		dc.b $BB, $BB, $80, 0, $BB, $BB, $B0, 0, $BB, $BB, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $88, 0, 0,	0, $B0,	0, 0, 0, $B0, 0, 0, 0, 0, $B, $BB, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, $9F, $43, $44, 0, $99, $F4,	$33, 0,	7, $7F,	$44, 0,	0, $FF,	$FF
		dc.b 0,	0, 0, $FF, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $44, $43, $47, $79
		dc.b $33, $34, $47, $99, $44, $44, $77,	$97, $77, $77, $79, $79, $FF, $FF, $FF,	$77, 0,	$FF, $FF, $FF
		dc.b 0,	0, $F, $FF, 0, 0, 0, 0,	0, 7, $BB, $BB,	0, 7, $BB, $B0,	0, $B, $BB, 0
		dc.b 0,	$B, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0
byte_265B0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $99
		dc.b 0,	$CC, $D9, $77, $C, $DD,	$77, $77, $CD, $DC, $7F, $FF, $CD, $DC,	$FF, $FF, $DD, $CD, $DF, $DD
		dc.b $DD, $DD, $CD, $1C, $D, $DD, $D1, $1C, 0, 0, $D, $1C, 0, 0, $C, $1C, 0, 0,	$C, $11
		dc.b 0,	0, 1, $11, 0, 0, $F, $CD, $88, 0, $B, $8B, $BB,	$8B, $BB, $7B, 7, $78, $8B, $BB
		dc.b $B, $B7, $78, $8B,	0, $B, $B7, $77, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $99, $99, $F8, $80, $97, $7F, $80,	0, $77,	$F8, $79, $98
		dc.b $77, $F8, $98, $88, $FF, $F8, $79,	$99, $FF, $F8, $77, $79, $FF, $FF, $88,	$77, $DD, $C1, $DF, $87
		dc.b $C1, $11, $1F, $F8, $11, $DD, $DC,	$FF, $1D, $CC, $1D, $DF, $1D, $CC, $C1,	$CD, $DC, $CC, $C1, $1C
		dc.b $F1, $CC, $C1, $1C, $FF, $CC, $C1,	$1C, $BD, $CC, $1C, $CD, $BB, $B1, $1C,	$D7, $BB, $BB, $B1, $F7
		dc.b $77, $7B, $B0, $F9, 0, 0, $F, $79,	0, 0, $99, $99,	0, 0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $80, 0, 0, 0, $88, 0, 0, 0
		dc.b $98, $80, 0, 0, $99, $99, 0, 0, $79, $9F, $F0, 0, $7F, $FF, $F0, 0, $7F, $FF, $F0,	0
		dc.b $88, $F0, 0, 0, $FF, $88, $80, 0, $FF, $FF, $F8, $82, $D9,	$9F, $FF, $F9, $D2, $29, $99, $92
		dc.b $D3, $22, $24, $44, $F3, $33, $44,	$33, $73, $33, $43, $32, $94, $34, $43,	$23, $94, $44, $43, $23
		dc.b $99, $F4, $43, $33, $99, $9F, $44,	$34, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $20, 0, 0, 0, $22, $20, 0, 0
		dc.b $32, $22, 0, 0, $33, $32, 0, 0, $22, $33, 0, 0, $22, $23, 0, 0, $33, $34, $77, $DD
		dc.b $33, $47, $77, $C8, $44, $79, $7F,	$CB, $47, $9F, $FC, $CD, $98, $7F, $CC,	$1C, $98, $7F, $C1, $11
		dc.b $89, $7F, $C1, $11, $99, $7F, $C1,	$11, $97, $FD, $CC, $11, $77, $FD, $CC,	$C1, $7F, $FD, $DC, $CC
		dc.b $FF, $BD, $DD, $DC, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $88,	$80, 0,	$B, $BB, $B8, 0, 8, $8B, $BB
		dc.b 0,	$B, $B8, $BB, 0, 7, $B8, $7B, 0, 7, $B8, $7B, $DD, $7B,	$80, 0,	$77, $BB, $8D, $DD
		dc.b $BB, $B8, $11, $11, $88, $C1, $11,	$11, $DC, $11, $11, $11, $11, $11, $11,	$1C, $11, $11, $11, $1C
		dc.b $11, $11, $11, $1C, $11, $11, $11,	$CC, $11, $11, $1C, $CD, $CC, $CC, $CC,	$CD, $CC, $CC, $CC, $D0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $88, 0, 0,	0, $BB,	$88, $80, 0, $BB, $BB, $B8, 0
		dc.b $BB, $BB, $BB, $80, $BB, $BB, $BB,	$B8, $BB, $BB, $BB, $B8, $DB, $BB, $BB,	0, $CB,	$BB, 0,	0
		dc.b $CD, $D0, 0, 0, $CD, 0, 0,	0, $CD,	0, 0, 0, $CD, 0, 0, 0, $D0, 0, 0, 0
		dc.b $D0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $98, $88
		dc.b 0,	0, $98,	$88, 0,	0, 9, $99, 0, 0, 9, $89, 0, 0, $99, $88, 0, 9, $98, $99
		dc.b 9,	$98, $89, $87, $99, $98, $98, $97, $99,	$77, $33, $4F, $98, $89, $34, $F7, $79,	$93, $34, $78
		dc.b $97, $73, $4F, $99, $97, $73, $4F,	$97, $77, $FF, $FF, $77, $77, $FF, $FF,	$F7, $77, $F0, 0, $FF
		dc.b 0,	0, $C, $C1, 0, 0, $C1, $1C, 0, 0, $CD, $DD, 0, $D, $11,	$CC, 0,	$D, $11, $11
		dc.b 0,	$D, $C1, $11, 0, 0, $DC, $CC, 0, 0, $D,	$DD, $CC, $78, $87, $97, $11, $C7, $77,	$7F
		dc.b $C1, $1C, $7F, $F0, $11, $1C, $D0,	0, $11,	$1C, $D0, 0, $11, $CD, 0, 0, $CC, $DD, 0, 0
		dc.b $DD, 0, 0,	0, $7F,	0, 0, 0, $F0, 0, 0, $BB, 0, 0, $B, $BB,	0, 0, $BB, $BB
		dc.b 0,	0, $7B,	$BB, 0,	0, $77,	$7B, 0,	0, 0, 7, 0, 0, 0, 0, $B, $7D, $DD, $DD
		dc.b 7,	$B0, $D, $DD, $B7, $BB,	0, 0, $BB, $7B,	$BB, 0,	$BB, $B7, $7B, $BB, $BB, $BB, $B7, $7B
		dc.b $77, $77, $70, 0, 0, 0, 0,	0, $DC,	$CC, $DD, 0, $DD, $DD, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
byte_268D0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $77, 0, 0, 0, $FF, 0, 0, 0, $F
		dc.b 0,	0, 0, $D, 0, 0,	0, 1, 0, 0, 0, $D, $B, $B0, 0, $C, $BF,	$FB, 0,	$C
		dc.b $BF, $FF, $B0, 1, $BF, $FF, $FB, $F, $B, $FF, $FF,	$B8, 0,	$BB, $FF, $FB, 0, 0, $BB, $BF
		dc.b 0,	0, 0, $B, 0, 0,	0, 0, 0, 0, 0, $B, 0, 0, 0, $BF, 0, 0, 0, $BF
		dc.b 0,	0, 0, $B, 0, $CC, $C0, 0, $C, $DD, $1C,	$C0, $C1, $CC, $11, $1C, $CC, $11, $11,	$11
		dc.b $DC, $C1, $11, $11, $CC, $11, $11,	$11, 0,	$CC, $C1, $1D, $C, $CD,	$CC, $11, $C, $DD, $C1,	$1C
		dc.b $D, $DD, $99, $99,	0, $99,	$97, $F8, $99, $77, $F8, $89, $77, $7F,	$89, $98, $77, $FF, $87, $79
		dc.b $FF, $FF, $F8, $77, $DD, $FF, $FF,	$88, $1C, $DD, $C1, $DF, $1C, $C1, $11,	$1F, $1C, $11, $DD, $DC
		dc.b $1C, $1D, $CC, $1D, $11, $1D, $CC,	$C1, $11, $DC, $CC, $C1, $CD, $F1, $CC,	$C1, $8B, $FF, $CC, $C1
		dc.b $8B, $BD, $CC, $1C, $FB, $BB, $B1,	$1C, $BF, $FF, $FB, $B1, $BF, $99, $FF,	$B0, $FF, $9F, $BB, 0
		dc.b $F9, $BB, 0, 0, $FB, 0, 9,	$99, $B0, 9, $99, $97, 9, $99, $88, $88, $99, $88, $99,	$99
		dc.b $97, $98, $99, $97, $D7, $77, $77,	$7F, $DF, $77, $FF, $FF, $DF, $FF, $FF,	0, 0, 0, 0, 0
		dc.b $D0, 0, 0,	0, $D0,	0, 0, 0, $77, $F8, $80,	0, $88,	$80, 0,	0, $98,	$80, 0,	0
		dc.b $88, $88, 0, 0, $99, $98, $80, 0, $79, $99, $99, 0, $77, $79, $9F,	$F0, $88, $7F, $FF, $F9
		dc.b $FF, $88, $88, $88, $FF, $FF, $FF,	$FF, $DF, $FF, $FF, $F3, $CD, $FF, $33,	$33, $1C, $DF, $43, $33
		dc.b $1C, $DF, $43, $33, $1C, $DF, $43,	$43, $CD, $F, $44, $43,	$D0, $FF, $F4, $44, 0, $F7, $7F, $F4
		dc.b 0,	$F7, $97, $7F, $F, $98,	$89, $77, $77, $98, $98, $77, $99, $88,	$98, $83, $88, $89, $79, $93
		dc.b $89, $97, $79, $34, $79, $77, $F7,	$34, $7F, $FF, $F3, $47, $FF, 0, 0, $FF, 0, 0, 0, $B
		dc.b 0,	0, 0, $BB, 0, 0, 0, 0, $99, $80, 0, 0, $88, 0, 0, 0, $FF, $20, 0, 0
		dc.b $F3, $22, $24, $BB, $22, $32, $2B,	$BB, $22, $23, $BB, $77, $33, $43, $B7,	$77, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $88, $88, $88, 0, $BB, $BB, $B8, $80, $77,	$7B, $88, $88
		dc.b $77, $B8, $B0, 0, $77, $B8, 0, 0, $33, $22, $B7, $77, $32,	$23, $3B, $77, $32, $33, $33, $B7
		dc.b $33, $33, $44, $47, $43, $34, $FF,	$FD, $33, $4F, $77, $DC, $33, $F9, $7F,	$CC, $34, $97, $7C, $DD
		dc.b $34, $77, $F8, $88, $49, $78, $88,	$B7, $97, $88, $B7, $77, $9F, $B8, $77,	$B8, $FF, $7B, $BB, $8B
		dc.b $FB, $B7, $77, $B8, $BB, $BB, $BB,	$8D, $BB, $BB, $B8, $DD, $BB, $BB, $B8,	$D, $BB, $BB, $80, 0
		dc.b $BB, $BB, $80, 0, 0, $B8, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $77, $BB, $80,	0, $77,	$7B, $8B, 0, $77, $7B, $8B, 0, $77, $7B, $8B, $DD
		dc.b $77, $7B, $8C, $CC, $17, $77, $81,	$11, $11, $77, $11, $11, $C1, $11, $11,	$11, $DC, $11, $11, $11
		dc.b $DC, $11, $11, $11, $BD, $C1, $11,	$11, $8D, $C1, $11, $11, $8D, $C1, $11,	$11, $DC, $11, $11, $1C
		dc.b $C1, $11, $1C, $CD, $CC, $CC, $CD,	$D0, $DD, $DD, $D0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 7, 0,	0, 7, $7F, 0, $F, $FF, $FF, $F,	$FF, $FF, $FF
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $DD, 0, $1C, 0
		dc.b $CC, $11, $C0, 0, $11, $1C, $D0, 0, $11, $CD, 0, 0, $11, $CD, 0, 0, $11, $CD, 0, 0
		dc.b $1C, $D0, 0, 0, $1C, $D0, 0, 0, $CD, $B0, 0, 0, $D7, $7B, 0, 0, 0,	$77, $B0, 0
		dc.b 0,	7, $7B,	0, 0, 7, $7B, $70, 0, 7, $77, $F7, 0, $77, $7F,	$F7, 7,	$77, $FF, $F7
		dc.b $77, $FF, $FF, $F7, $FF, $FF, $FF,	$70, $FF, $FF, $FF, 0, $FF, $FF, 0, 0, $CC, $C1, $11, $1D
		dc.b $D, $CC, $CC, $DD,	0, $DC,	$DD, $D0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $DF, $F0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, $BB, 0, 0, 0, $BB, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
byte_26C10:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	$CC, $DD, 0, $C, $DD, $11, $D0,	$CD, $DC, $C1, $1D, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	9, $99,	$F8, 9,	$99, $7F, $80, $99, $77, $7F, $88
		dc.b $97, $77, $F8, $77, $CD, $DC, $11,	$CD, $DD, $CD, $D1, $1D, $DD, $DD, $C1,	$D0, $D, $DD, $DD, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $77, $99, $88, 0, $99, $88, $88, $80, $77,	$FF, $F8, $97
		dc.b $7F, $FF, $FF, $F8, $F, $FD, $DF, $FF, 0, $D1, $CD, $DC, 0, $11, $CC, $11,	0, $D1,	$C1, $1D
		dc.b 0,	$C1, $C1, $1D, 0, $C1, $11, $DC, $77, $99, $99,	$88, $87, $77, $99, $99, $F8, $77, $77,	$99
		dc.b $1D, $87, $77, $FF, $11, $D8, $77,	$FF, $DD, $CD, $87, $FF, $C1, $DD, $F8,	$9F, $CC, $1C, $D8, $89
		dc.b 0,	0, 0, 0, $90, 0, 0, 0, $FF, 0, 0, 0, $FF, $20, 0, 0, $FF, $22, $20, 0
		dc.b $22, $32, $24, 0, $32, $33, $22, $40, $32,	$22, $23, $40, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 8, $80, 0, 0, $B, $B8, 0, $CC, $C0, $77, $C,	$DD, $11, $BB, $C1, $CC, $11, $1F
		dc.b $CC, $11, $1C, $CC, $DC, $C1, $11,	$1C, $DC, $11, $11, $11, $DC, $C1, $11,	$11, $D, $CC, $CC, $1D
		dc.b 0,	$DD, $DD, $DD, 0, 0, 0,	$FF, 0,	0, 0, $F, 0, 0,	0, 0, 0, $11, $11, $DC
		dc.b 0,	$FC, $DF, $1C, 0, $B8, $BF, $FC, $BB, $B7, $BB,	$DC, $88, $BB, $BB, $BB, $77, $88, $BB,	$BB
		dc.b $BB, $77, $77, $7B, $F0, 0, 9, $99, $F9, $99, $99,	$88, $D9, $88, $88, $98, $DF, $98, $99,	$99
		dc.b $DF, $99, $97, $97, $FF, $77, $77,	$FF, $FF, $FF, $FF, $FF, $FF, $FF, 0, 0, 0, 0, 0, 0
		dc.b $CC, $11, $CD, $89, $CC, $11, $CD,	$89, $CC, $11, $CD, $89, $C1, $CC, $D4,	$83, $11, $CD, $FF, $44
		dc.b $BB, $17, $7F, $FF, $BB, $99, $97,	$97, $88, $98, $89, $97, $99, $89, $99,	$73, $99, $97, $97, $F3
		dc.b $79, $7F, $F3, $3F, $FF, $FF, $F0,	0, $FF,	0, 0, 0, 0, 0, 0, 0, 0,	0, $80,	0
		dc.b 0,	7, $80,	0, $22,	$23, $23, $40, $22, $32, $33, $40, $33,	$23, $33, $4B, $33, $33, $34, $4B
		dc.b $43, $34, $4F, $FB, $F3, $47, $77,	$7B, $33, $F7, $77, $B7, $3F, $77, $BB,	$BB, $3F, $BB, $BB, $BB
		dc.b $F7, $BB, $BB, $BB, $FF, $F7, $BB,	$BB, 0,	$FF, $F7, $BB, 0, 0, $FF, $FD, 0, 0, 0,	$DD
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	$DD, $DD, $DD, $88, $CC, $CC, $DD, $BB,	$8C, $CC, $CC
		dc.b $87, $8C, $11, $11, $87, $B8, $C1,	$11, $BB, $78, $DC, $11, $BB, $7B, $8D,	$C1, $BB, $B7, $DD, $C1
		dc.b 0,	0, 0, 0, $DD, 0, 0, 0, $CC, $DD, 0, 0, $11, $CC, $CC, $D0, $11,	$1C, $CC, $CD
		dc.b $11, $CC, $CD, $D,	$11, $1C, $D0, 0, $11, $1C, $D0, 0, $BD, $DD, $DC, $11,	$BD, $CC, $11, $11
		dc.b $DC, $11, $11, $11, $DC, $11, $11,	$11, $DC, $11, $11, $CC, $DD, $CC, $CC,	$DD, $D, $DD, $DD, 0
		dc.b $7F, $70, 0, 0, $11, $1C, $D0, 0, $11, $CD, $B8, $8B, $11,	$CD, $77, $7B, $CC, $D0, 0, 7
		dc.b $DD, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $88, $BB
		dc.b 0,	8, $BB,	$BB, $88, $8B, $BB, $BB, $77, $77, $BB,	$BB, 0,	0, 7, $BB, 0, 0, 0, 7
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $BB, 0, 0, 0, $BB, $BB, $77, 0
		dc.b $B7, $77, $77, 0, $77, $77, $77, 0, $B7, $77, $77,	0, 7, $77, $70,	0, 0, $77, 0, 0
		dc.b 0,	$77, $B8, 0, 0,	$77, $7B, $80, 0, $77, $77, $B8, 0, 7, $77, $7B, 0, 0, $77, $77
		dc.b 0,	0, 0, $77, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 7, 0, 0, 0,	$F
		dc.b $88, 0, 0,	$FB, $B8, 0, $F, $BB, $B8, $BB,	$BB, $BB, $78, $8B, $BB, $80, $77, $88,	$88, 0
		dc.b 7,	$78, $80, 0, $FF, 0, 0,	0, $7B,	0, 0, 0, $B0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
byte_26EF0:	dc.b 0,	0, 0, 0, 0, $C,	$CD, $D0, 0, $CD, $D1, $1D, $C,	$DD, $C9, $99, $C, $D9,	$97, $7F
		dc.b $D, $97, $77, $F8,	9, $77,	$77, $F8, 7, $7F, $FF, $F8, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, $F8, 0, 0, 0, $80, 0, 0, 0, $77, $99, $88, 0, $99, $88, $88, $80
		dc.b $77, $99, $99, $88, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $B, $B0,	0, 0, $BF, $FB
		dc.b 0,	0, $BF,	$FF, 0,	0, $B, $BF, 0, 0, 0, $B, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $F, $FF, $FF, $FF,	0, $FD,	$DF, $FF, 0, $D1, $CD, $DC
		dc.b 0,	$11, $CC, $1D, 0, $D1, $C1, $DC, 0, $C1, $C1, $DC, 0, $C1, $11,	$DC, 0,	$11, $1D, $CC
		dc.b $B0, $FC, $DF, $1C, $BB, $88, $BF,	$FC, $FF, $B8, $BB, $BC, $BB, $FF, $BB,	$BB, 0,	$BB, $FF, $FF
		dc.b 0,	$B, $FF, $99, 0, 0, $B9, $9F, 0, 0, $B,	$FF, $87, $77, $99, $99, $F8, $87, $77,	$99
		dc.b $1D, $F8, $77, $FF, $DD, $FF, $87,	$FF, $CC, $CF, $F8, $8F, $CC, $CD, $FF,	$F8, $CC, $1C, $DF, $FF
		dc.b $CC, $11, $CD, $99, $CC, $11, $CD,	$24, $CC, $11, $CD, $43, $C1, $CC, $D4,	$42, $B1, $CD, $34, $42
		dc.b $BB, $17, $F3, $43, $FB, $9F, $FF,	$F4, $FB, $B7, $77, $77, $FF, $B7, $79,	$99, $90, 0, 0,	0
		dc.b $FF, 0, 0,	0, $FF,	0, 0, 0, $FF, 0, 0, 0, $20, 0, 0, 0, $88, $2F, $F0, 0
		dc.b $FF, $88, $88, $80, $FF, $FF, $FF,	$FB, $99, $99, $99, 0, $22, $23, $34, $BB, $23,	$33, $34, $77
		dc.b $33, $33, $44, $79, $33, $44, $F7,	$98, $33, $47, $79, $98, $33, $47, $99,	$88, $34, $F7, $98, $88
		dc.b $DD, $DD, $D0, 0, $8C, $CC, $CD, $DD, $7C,	$11, $1C, $CC, $97, $C1, $11, $11, $99,	$C1, $11, $11
		dc.b $98, $FC, $11, $11, $98, $FC, $11,	$11, $87, $FC, $11, $11, $7F, $C1, $11,	$11, $FF, $11, $11, $11
		dc.b $FC, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $CC, $CC, $CC, $CC,	$DD, $DD, $DD, $DD, $BB
		dc.b 0,	$7B, $80, 0, 7,	$B8, 0,	0, 7, $B8, $88,	0, 0, $77, $BB,	$88, 0,	7, $77,	$BB
		dc.b 0,	$BB, $BB, $BB, $BB, $BB, $BB, $B8, $BB,	$BB, $BB, $88, $BB, $B8, $88, 0, 0, 0, 0, 0
		dc.b 0,	$DD, $D0, 0, $DD, $CC, $DD, 0, $CC, $CD, 0, 0, $1C, $D0, 0, 0, $11, $CD, 0, 0
		dc.b $11, $CD, 0, 0, $11, $CD, 0, 0, $1C, $D0, 0, 0, $1C, $D0, 0, 0, $1C, $D0, 0, 0
		dc.b $CD, $70, 0, 0, $D7, $77, $77, $77, $77, $FF, $F7,	$77, $77, $FF, $FF, $70, $B7, $7F, $FF,	$70
		dc.b $B, $B7, $FF, 0, 0, $B, $B7, 0, $80, 0, 0,	0, $88,	0, 0, 0, $88, 0, 0, 0
		dc.b $80, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $B, $FF, 0, 0,	$B, $FF
		dc.b 0,	0, 0, $BF, 0, 0, 0, $BF, 0, 0, 0, $BF, 0, 0, 0,	$B, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 1, 0, 0, 0, $CD, 0, 0, $C, $11
		dc.b 0,	0, $C, $C1, 0, 0, $D, $CC, 0, 0, $D, $CC, 0, 0,	0, $DC,	$FF, $B0, $99, $97
		dc.b $FF, $B9, $98, $97, $FF, $B7, $88,	$97, $F9, $B7, $79, $97, $FB, 7, $98, $89, $B0,	$79, $88, $89
		dc.b 7,	$99, $89, $99, $79, $88, $98, $97, $77,	$79, $89, $77, $1C, $77, $97, $77, $D1,	$CC, $77, $7F
		dc.b $11, $1C, $F7, $FF, $11, $11, $CF,	$F0, $11, $11, $C0, 0, $11, $CC, $D0, 0, $CC, $CD, 0, 0
		dc.b $3F, $79, $89, $89, $FF, $79, $98,	$99, $FF, $F7, $89, $7F, $7F, $F7, $97,	$FF, $7F, $F7, $7F, $FC
		dc.b $7F, $F, $FF, $DD,	$7F, 0,	0, 0, $F0, 0, 0, 0, $F0, 0, 0, 0, $F0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $B, 0, $B, $BB, $BB
		dc.b 0,	0, $BB,	$BB
byte_271B0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, $CC, $DD, 0, $C, $DD, $11, $D0, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, $99, 0, 0, $99, $7F, 0, $99, $7F,	$88, 9,	$77, $F8, $99, $97, $7F, $F8, $77
		dc.b $7F, $FF, $FF, $87, 0, 0, 0, 0, 0,	0, 0, 0, $97, $7F, $88,	$88, $88, $88, 0, 0
		dc.b $99, $88, 0, 0, $88, $88, $80, 0, $99, $99, $88, 0, $77, $99, $99,	$90, $CD, $DC, $C1, $1D
		dc.b $CD, $DC, $11, $CD, $DD, $CD, $D1,	$1D, $DD, $DD, $C1, $D0, $D, $DD, $DD, 0, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	8, $80,	0, 0, $B, $B8, $BB, 0, 0, $77, $88
		dc.b 0,	0, $BB,	$77, 0,	0, 0, $BB, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b $FD, $DF, $FF, $F8, $D1, $CD, $DC,	$1D, $11, $CC, $11, $11, $D1, $C1, $1D,	$DD, $C1, $C1, $DC, $C1
		dc.b $C1, $11, $DC, $CC, $11, $1D, $CC,	$CC, $FC, $DF, $1C, $CC, $B8, $BF, $FC,	$CC, $B7, $BB, $DC, $C1
		dc.b $BB, $BB, $BB, $11, $88, $BB, $BB,	$BB, $77, $77, $77, $BB, 0, 0, 0, $F, 0, 0, 0, $F
		dc.b 0,	0, 0, 0, $87, $77, $99,	$FF, $F8, $87, $FF, $FF, $FF, $F8, $8F,	$FF, $CF, $FF, $F8, 0
		dc.b $DD, $FF, $FF, $88, $1C, $DF, $FF,	$FF, $11, $CD, $99, $99, $11, $CD, $22,	$29, $11, $CD, $22, $22
		dc.b $CC, $D2, $22, $24, $CD, $32, $34,	$43, $1F, $99, $FF, $32, $79, $98, $99,	$F2, $79, $99, $88, $89
		dc.b $F7, $97, $99, $88, $FF, $79, $99,	$98, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 8, $80, $88,	$88, $89, 0, $F9, $99, $90, 0, $99, 0, 0, 0, $99, $94, 0, 0
		dc.b $32, $23, $48, $88, $43, $33, $47,	$BB, $33, $33, $47, $77, $22, $34, $4F,	$99, $33, $34, $F7, $97
		dc.b $F4, $4F, $79, $99, $99, $FF, $79,	$97, $89, $97, $77, $97, $DD, $DD, 0, 0, $CC, $CC, $DD,	$D0
		dc.b $C1, $11, $CC, $CD, $7C, $11, $11,	$1C, $CC, $11, $11, $11, $7C, $11, $11,	$11, $7C, $11, $11, $11
		dc.b $FC, $11, $11, $11, 0, 0, 0, 0, 0,	$DD, $D0, 0, $DD, $DC, 0, 0, $CC, $CD, 0, 0
		dc.b $CC, $D0, 0, 0, $1C, $D0, 0, 0, $1C, $D0, 0, 0, $1C, $D0, 0, 0, $FF, $F7, $77, $79
		dc.b 0,	$FF, $F7, $79, 0, 0, $FF, $97, 0, 0, $F, $79, 0, 0, 0, $77, 0, 0, 0, $77
		dc.b 0,	0, 0, 7, 0, 0, 0, $D, 0, 0, 0, $DC, 0, 0, 0, $C1, 0, 0,	0, $CC
		dc.b 0,	0, 0, $CC, 0, 0, 0, $DC, 0, 0, 0, $D, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b $98, $89, $77, $9F, $98, $89, $97,	$7F, $98, $98, $97, $FD, $99, $98, $9F,	$DD, $77, $79, $89, $DD
		dc.b $FF, $FF, $F9, $DD, $DD, $DD, $F9,	$7D, $C1, $1D, $DF, $77, $11, $11, $DD,	$BB, $CC, $11, $1D, $D0
		dc.b $DD, $C1, $CD, $D0, $DC, $1C, $CD,	$D0, $11, $CC, $DD, $D0, $CC, $CD, $DD,	0, $DD,	$DD, 0,	0
		dc.b 0,	0, 0, 0, $FC, $11, $11,	$CC, $DC, $11, $1C, $DD, $CC, $11, $CD,	$8D, $CC, $CC, $D7, $B8
		dc.b $DC, $CC, $DD, $D7, $DD, $DD, $DD,	$D0, $DD, $DD, $D0, 0, $BB, $80, 0, 0, $BB, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, $BB, $BB, $1C, $D0, 0, 0, $CC, $D0, 0, 0, $DD, 0, 0, 0
		dc.b $80, 0, 0,	0, $B8,	0, 0, 0, $77, $88, 0, 0, 0, $7B, $80, 0, 0, 7, $B8, $B8
		dc.b 0,	0, $7B,	$8B, 0,	0, 7, $BB, 0, 0, 7, $77, 0, 0, 7, $77, 0, 0, $77, $BB
		dc.b 0,	$B, $BB, $88, $BB, $BB,	$B8, $88, $BB, $BB, $B8, $88, $80, 0, 0, 0, $B8, 0, 0, 0
		dc.b $BB, $80, 0, 0, $7B, $88, 0, 0, $B8, $88, 0, 0, $88, $80, 0, 0, $88, 0, 0,	0
		dc.b 0,	0, 0, 0
byte_27470:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 8, $89, 0, 0, $88, $88, 0, 8, $89, $99
		dc.b 0,	$99, $99, $97, 7, $79, $97, $77, 7, $77, $77, $79, 7, $FF, $77,	$9F, 0,	$F, $99, $FD
		dc.b 9,	$99, $FF, $D1, $9F, $FF, $FF, $D1, $FF,	$F9, $99, $DC, $99, $93, $D0, $DC, $22,	$FF, $FD, $DB
		dc.b $23, $33, $79, $BF, $77, $43, $27,	$BF, $9F, $F4, $32, $7B, $88, $9F, $42,	$77, $88, $99, $F3, $27
		dc.b $99, $89, $73, $27, $97, $79, $43,	$29, $77, $74, $42, $97, $77, $44, $39,	$99, $FF, $F4, $79, $88
		dc.b $FF, $77, $79, $89, $F7, $79, $98,	$79, $F7, $77, $97, $DD, $F7, $77, $77,	$CD, $F7, $77, $FC, $DB
		dc.b $FF, $FF, $CD, $7B, $D, $CC, $CD, $7B, 0, $99, $99, 0, 0, 9, $F7, $99, $97, $78, $9F, $77
		dc.b $89, $97, $9F, $77, $97, $77, $9F,	$FF, $77, $99, $FF, $FF, $99, $FD, $DF,	$FC, $FD, $11, $1D, $DC
		dc.b $11, $1C, $11, $11, $1D, $CC, $C1,	$11, $DC, $CC, $C1, $11, $DC, $CC, $CC,	$11, $DC, $CC, $1F, $11
		dc.b $1C, $CC, $FF, $BB, $B1, $CC, $FF,	$BB, $FB, $CC, $CB, $BB, $FF, $BB, $BB,	$BB, $FF, $FF, $BB, $BF
		dc.b $BF, $FF, $BF, $F0, $BF, $FF, $BF,	0, $7B,	$FF, $BF, 0, $97, $BB, $77, $F0, $79, $77, $77,	$7F
		dc.b $79, $77, $7D, $CC, $97, $77, $D1,	$11, $77, $DD, $DD, $11, $DD, $CC, $C8,	$D1, $C1, $11, $B8, $D1
		dc.b $DC, $11, $BB, $8D, $BD, $11, $BB,	$8C, $8D, $11, $BB, $B8, $B8, $88, $BB,	$B8, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $90, 0, 0, 0, $79, 0, 0, 0, $77, 0, 0,	0, $FF,	0, 0, 0
		dc.b $FF, 0, 0,	$C, $F0, 0, 0, $CD, $D0, 7, $7C, $11, $D7, $77,	$FC, $DD, $C9, $77, $D7, $CD
		dc.b $C9, $97, $FD, $7C, $F7, $79, $7F,	$77, $F7, $78, $87, $70, $B7, $8F, $FB,	0, $B8,	$FF, $FB, 0
		dc.b $8F, $FF, $F0, 0, $FF, $F0, 0, 0, 0, 0, 0,	$B, 0, $BB, $B0, $B, $B, $88, $8B, $B7
		dc.b $78, $77, $78, $B7, $77, $70, $B, $77, $DD, $DD, $B, $77, $CC, $CC, $D7, $77, $11,	$11, $C7, $77
		dc.b $11, $11, $1C, $77, $11, $11, $1C,	$D0, $11, $11, $11, $CD, $11, $11, $11,	$D1, $C1, $11, $11, $1C
		dc.b $8C, $11, $11, $1C, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $11, 0, 0,	0, $D1,	$10, 0,	0, $1D,	$11, 0,	0
		dc.b $1D, $C1, 0, 0, $DD, $CC, 0, 0, $C1, $D0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $B, $88, 0, 0, $B8, $88, $88, $80,	$BB, $BB, $88, $88
		dc.b $77, $7B, $BB, $B8, $77, $77, $77,	$BB, $77, $77, $77, 0, $77, $77, $70, 0, $77, $77, 0, 0
		dc.b $77, $70, 0, 0, $77, 0, 0,	0, $70,	0, 0, 0, 0, 0, 0, 0, $DD, 0, 0,	0
		dc.b $CC, $D0, 0, 0, $DD, 0, 0,	0, $D0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 1, $11, 0, $C, $1D, $11,	0, $CC,	$DC, $11, 0, $DC, $DC, $DC
		dc.b 0,	$DD, $DD, $DC, 0, $D, $1C, $CC,	0, 0, $DC, $77,	0, 0, 7, $77, 0, 0, 7, $77
		dc.b 0,	0, 0, $77, 0, 0, 0, 7, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9, $10, 0, 0, $9F, $10, 0, 0, 9
		dc.b $10, 0, 0,	3, $C9,	0, 0, $33, $99,	$90, 3,	$37, $78, $89, $77, $99, $77, $98, $99,	$98
		dc.b $77, $79, $88, $89, $77, $77, $77,	$89, $77, $77, $77, $77, $77, $77, $77,	$77, 0,	$77, $77, $77
		dc.b 0,	0, $34,	$FF, 0,	0, 3, $4F, 0, 0, 0, $F,	0, 0, 0, $F, 0,	0, 0, $F
		dc.b 0,	0, 0, $F, 0, 0,	0, 0, 0, 0, 0, 0, $D, $C1, $1C,	$D7, 0,	$DC, $11, $CD
		dc.b 0,	$D, $CC, $1C, 0, 0, $DD, $CC, 0, 0, 0, $DD, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, $7B, $BB, $B7,	$BB, $D7, $77, $7B, $7B, $CC, $CC, $CC,	$77, $11, $11, $11, $C7
		dc.b $CC, $CC, $CC, $CC, $DD, $DD, $DD,	$DD, 0,	0, 0, 0, 0, 0, 0, 0, $81, $11, $11, $CD
		dc.b $B8, $CC, $1C, $DD, $BB, $88, $CC,	$D0, $77, $BB, $DD, 0, $CC, $DD, 0, 0, $DD, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0
byte_27770:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 8, $89, 0, 0, $88, $88, 0, 8, $89, $99
		dc.b 0,	$99, $99, $97, 7, $79, $97, $77, 7, $77, $77, $99, $F, $FF, $99, $FF, 0, 9, $FF, $FD
		dc.b 0,	$9F, $FF, $D1, $99, $FF, $FF, $D1, $FF,	$99, $99, $DC, $99, $23, $D0, $DC, $22,	$FF, $FD, $DB
		dc.b $23, $33, $79, $BF, $77, $73, $27,	$BF, $98, $94, $32, $7B, $99, $87, $42,	$77, $89, $89, $93, $27
		dc.b $87, $98, $73, $27, $97, $79, $43,	$29, $77, $74, $32, $97, $77, $43, $39,	$99, $FF, $F3, $79, $99
		dc.b $FF, $77, $79, $99, $F7, $79, $99,	$79, $F7, $77, $97, $DD, $F7, $77, $77,	$CD, $F7, $77, $FC, $DB
		dc.b $FF, $FF, $CD, $7B, $D, $CC, $CD, $7B, $99, $99, $90, 0, 9, $F7, $79, $90,	$97, $9F, $77, $79
		dc.b $89, $99, $F7, $77, $97, $79, $FF,	$F7, $77, $9F, $FF, $FF, $99, $FD, $DF,	$FC, $FD, $11, $1D, $DC
		dc.b $11, $1C, $11, $11, $1D, $CC, $C1,	$11, $DC, $CC, $C1, $11, $DC, $CC, $CC,	$11, $DC, $CC, $1F, $11
		dc.b $1C, $CC, $FF, $BB, $B1, $CC, $FF,	$BB, $FB, $CC, $CB, $BB, $FF, $BB, $BB,	$BB, $FF, $FF, $BB, $BF
		dc.b $BF, $FF, $BF, $F0, $BF, $FF, $BF,	0, $7B,	$FF, $BF, 0, $97, $BB, $77, $F0, $79, $77, $77,	$7F
		dc.b $79, $77, $7D, $CC, $97, $77, $D1,	$11, $77, $DD, $DD, $11, $DD, $CC, $C8,	$D1, $C1, $11, $B8, $D1
		dc.b $DC, $11, $BB, $8D, $BD, $11, $BB,	$8C, $8D, $11, $BB, $B8, $B8, $88, $BB,	$B8, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $90, 0, 0,	0, $79,	0, 0, 0, $F7, 0, 0, 0
		dc.b $FF, 0, 0,	$C, $F0, 0, 0, $CD, $D0, 7, $7C, $11, $D7, $77,	$FC, $DD, $C9, $77, $D7, $CD
		dc.b $C9, $97, $FD, $7C, $F7, $79, $7F,	$77, $F7, $78, $87, $70, $B7, $8F, $FB,	0, $B8,	$FF, $FB, 0
		dc.b $8F, $FF, $F0, 0, $FF, $F0, 0, 0, 0, 0, 0,	$B, 0, $BB, $B0, $B, $B, $88, $8B, $B7
		dc.b $78, $77, $78, $B7, $77, $70, $B, $77, $DD, $DD, $B, $77, $CC, $CC, $D7, $77, $11,	$11, $C7, $77
		dc.b $11, $11, $1C, $77, $11, $11, $1C,	$D0, $11, $11, $11, $CD, $11, $11, $11,	$D1, $C1, $11, $11, $1C
		dc.b $8C, $11, $11, $1C, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $11, 0, 0,	0, $D1,	$10, 0,	0, $1D,	$11, 0,	0
		dc.b $1D, $C1, 0, 0, $DD, $CC, 0, 0, $C1, $D0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $B, $88, 0, 0, $B8, $88, $88, $80,	$BB, $BB, $88, $88
		dc.b $77, $7B, $BB, $B8, $77, $77, $77,	$BB, $77, $77, $77, 0, $77, $77, $70, 0, $77, $77, 0, 0
		dc.b $77, $70, 0, 0, $77, 0, 0,	0, $70,	0, 0, 0, 0, 0, 0, 0, $DD, 0, 0,	0
		dc.b $CC, $D0, 0, 0, $DD, 0, 0,	0, $D0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9, 0, 0, 0, $99, 0, 0, 7,	$73
		dc.b 0,	$77, $77, $33, 0, 0, 0,	0, 0, 0, 0, 7, 0, 0, 7,	$79, 0,	0, 7, $99
		dc.b 0,	0, $77,	$77, 0,	0, $7F,	$FF, 0,	0, $FC,	$11, 0,	0, $D1,	$CD, 0,	$D, $C1, $11
		dc.b 0,	$D, $CC, $11, 0, $D, $CD, $DD, 0, 0, $DC, $CC, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $77, $79, $99, $37, $79, $99, $98,	$98, $98, $88, $89, $88
		dc.b $99, $89, $99, $99, $77, $89, $99,	$79, $F7, $99, $79, $79, $1F, $77, $77,	$77, $11, 0, $77, $77
		dc.b $D1, 0, $34, $FF, $1C, 0, 3, $4F, $C0, 0, 0, $F, 0, 0, 0, $F, 0, 0, 0, $F
		dc.b 0,	0, 0, $F, 0, 0,	0, 0, 0, 0, 0, 0, $D, $C1, $1C,	$D7, 0,	$DC, $11, $CD
		dc.b 0,	$D, $CC, $1C, 0, 0, $DD, $CC, 0, 0, 0, $DD, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, $7B, $BB, $B7,	$BB, $D7, $77, $7B, $7B, $CC, $CC, $CC,	$77, $11, $11, $11, $C7
		dc.b $CC, $CC, $CC, $CC, $DD, $DD, $DD,	$DD, 0,	0, 0, 0, 0, 0, 0, 0, $81, $11, $11, $CD
		dc.b $B8, $CC, $1C, $DD, $BB, $88, $CC,	$D0, $77, $BB, $DD, 0, $CC, $DD, 0, 0, $DD, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0
byte_27A70:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 8, $89, 0, 0, $88, $88, 0, 8, $89, $99
		dc.b 0,	$99, $99, $97, 7, $79, $97, $77, 7, $77, $77, $77, 7, $F7, $77,	$77, 0,	$F, $F7, $99
		dc.b $99, $99, $99, $D1, $FF, $FF, $FF,	$D1, $9F, $FF, $99, $DC, $39, $99, $D0,	$DC, $22, $FF, $FD, $DB
		dc.b $24, $43, $79, $BF, $77, $73, $27,	$BF, $99, $94, $32, $7B, $88, $87, $42,	$77, $88, $88, $93, $27
		dc.b $99, $78, $73, $27, $89, $77, $43,	$29, $88, $74, $32, $97, $97, $44, $49,	$99, $7F, $F4, $79, $99
		dc.b $FF, $77, $79, $99, $F7, $79, $99,	$79, $F7, $77, $97, $DD, $F7, $77, $77,	$CD, $F7, $77, $FC, $DB
		dc.b $FF, $FF, $CD, $7B, $D, $CC, $CD, $7B, 0, 9, $99, $90, 0, 0, $9F, $79, $97, $77, $9F, $F7
		dc.b $89, $97, $79, $F7, $97, $77, $99,	$FF, $77, $99, $FF, $FF, $79, $FD, $DF,	$FC, $9D, $11, $1D, $DC
		dc.b $91, $1C, $11, $11, $1D, $CC, $C1,	$11, $DC, $CC, $C1, $11, $DC, $CC, $CC,	$11, $DC, $CC, $1F, $11
		dc.b $1C, $CC, $FF, $BB, $B1, $CC, $FF,	$BB, $FB, $CC, $CB, $BB, $FF, $BB, $BB,	$BB, $FF, $FF, $BB, $BF
		dc.b $BF, $FF, $BF, $F0, $BF, $FF, $BF,	0, $7B,	$FF, $BF, 0, $97, $BB, $77, $F0, $79, $77, $77,	$7F
		dc.b $79, $77, $7D, $CC, $97, $DD, $D1,	$11, $7D, $CC, $DD, $11, $DC, $CC, $C8,	$D1, $CC, $CC, $B8, $D1
		dc.b $DC, $11, $BB, $8D, $BD, $11, $BB,	$8C, $8D, $11, $BB, $B8, $B8, $88, $BB,	$B8, 0,	0, 0, 0
		dc.b $90, 0, 0,	0, $79,	0, 0, 0, $77, 0, 0, 0, $77, 0, 0, 0, $FF, 0, 0,	0
		dc.b $F0, 0, 0,	$C, $F0, 0, 0, $CD, $D0, 7, $7C, $11, $D7, $77,	$FC, $DD, $C9, $77, $D7, $CD
		dc.b $C9, $97, $FD, $7C, $F7, $79, $7F,	$77, $F7, $78, $87, $70, $B7, $8F, $FB,	0, $B8,	$FF, $FB, 0
		dc.b $8F, $FF, $F0, 0, $FF, $F0, 0, 0, 0, 0, 0,	$B, 0, $BB, $B0, $B, $B, $88, $8B, $B7
		dc.b $78, $77, $78, $B7, $77, $70, $B, $77, $DD, $DD, $B, $77, $CC, $CC, $D7, $77, $11,	$11, $C7, $77
		dc.b $11, $11, $1C, $77, $11, $11, $1C,	$D0, $11, $11, $11, $CD, $11, $11, $11,	$D1, $C1, $11, $11, $1C
		dc.b $8C, $11, $11, $1C, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $11, 0, 0,	0, $D1,	$10, 0,	0, $1D,	$11, 0,	0
		dc.b $1D, $C1, 0, 0, $DD, $CC, 0, 0, $C1, $D0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $B, $88, 0, 0, $B8, $88, $88, $80,	$BB, $BB, $88, $88
		dc.b $77, $7B, $BB, $B8, $77, $77, $77,	$BB, $77, $77, $77, 0, $77, $77, $70, 0, $77, $77, 0, 0
		dc.b $77, $70, 0, 0, $77, 0, 0,	0, $70,	0, 0, 0, 0, 0, 0, 0, $DD, 0, 0,	0
		dc.b $CC, $D0, 0, 0, $DD, 0, 0,	0, $D0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 9, 0, 0, 0, $9F, 0, 0, 0,	9, 0, 0, 0, 0, 0, $11, $11, 3
		dc.b $C, $C1, $11, $13,	$C, $D1, $CC, $17, $C, $CC, $11, $19, $C, $CD, $CC, $19, $FF, $CC, $C1,	$98
		dc.b $7F, $F7, $79, $77, $77, $79, $88,	$78, $77, $77, $98, $89, $77, $77, $99,	$89, $77, $77, $79, $89
		dc.b 7,	$77, $77, $77, 0, $77, $77, $F,	0, 0, 0, $F, 0,	0, 0, $F, 0, 0,	0, $F
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $D, $C1, $1C, $D7,	0, $DC,	$11, $CD, 0, $D, $CC, $1C
		dc.b 0,	0, $DD,	$CC, 0,	0, 0, $DD, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b $7B, $BB, $B7, $BB, $D7, $77, $7B,	$7B, $CC, $CC, $CC, $77, $11, $11, $11,	$C7, $CC, $CC, $CC, $CC
		dc.b $DD, $DD, $DD, $DD, 0, 0, 0, 0, 0,	0, 0, 0, $81, $11, $11,	$CD, $B8, $CC, $1C, $DD
		dc.b $BB, $88, $CC, $D0, $77, $BB, $DD,	0, $CC,	$DD, 0,	0, $DD,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0
byte_27D30:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $33
		dc.b 0,	0, 3, $33, 0, 3, $33, $42, 0, 3, $44, $44, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 3, $33, $30, 0, $32, $22, $20,	$38, $23, $22, $22, $88, $22, $22, $29,	$99
		dc.b $33, $22, $77, $99, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $88, $99, $77, $80
		dc.b $88, $88, $99, $77, $99, $99, $77,	$78, $99, $77, $78, $8F, $77, $77, $8F,	$FF, 0,	0, 0, 0
		dc.b 0,	$88, $88, 0, 9,	$8F, $FF, $80, $98, $FF, $FF, $F9, $8F,	$FF, $FF, $F9, $9F, $FF, $FF, $90
		dc.b $FF, $FF, $F9, 0, $FF, $FF, $90, 0, 0, 4, $44, $44, 0, 4, $43, $22, 0, $44, $43, $22
		dc.b 0,	$44, $33, $32, 0, $44, $34, $22, 0, $44, $24, $43, 0, $44, $32,	$23, 0,	4, $44,	$32
		dc.b 0,	4, $44,	$43, 0,	0, $44,	$44, 0,	0, 0, $44, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 9, 1,	$D0, 0,	9, $C, $1C, $DD, 7, 0, $CC, $1C, $DC
		dc.b 0,	$C, $11, $1C, 0, $DC, $11, $1C,	$D, $C1, $11, $11, $D1,	$11, $11, $11, $11, $D,	$C1, $11
		dc.b 0,	$DC, $10, $D1, 0, $D1, 0, $DC, 0, $11, 0, $C1, 0, 0, 0,	1, $43,	$22, $77, $77
		dc.b $43, $32, $77, $77, $24, $32, $27,	$77, $23, $42, $33, $77, $23, $32, $33,	$78, $33, $22, $23, $9F
		dc.b $32, $29, $99, $FF, $23, $9F, $FF,	$FF, $39, $FF, $FF, $FF, $39, $FF, $FF,	$FF, $33, $9F, $FF, $F3
		dc.b $44, $4F, $33, $37, 0, $FF, $FF, $77, 0, 0, 9, $97, 0, 0, $98, $87, 0, 0, $98, $77
		dc.b 0,	$99, $88, $97, 9, $88, $87, $77, $98, $89, $97,	$7F, $88, $97, $77, $7F, $99, $79, $77,	$F0
		dc.b $77, $77, $77, $F0, $77, $77, $FF,	0, $CC,	$7F, $F0, 0, $CC, $FF, 0, 0, $1C, 0, 0,	0
		dc.b $10, 0, 0,	$B, $10, 0, 0, $B7, $C0, 0, 0, $B7, 0, 0, $B, $77, 0, 0, $B, $77
		dc.b 0,	0, 7, $77, $77,	$78, $D1, $CD, $77, $79, $DD, $11, $79,	$9D, $CC, $D1, $8F, $DC, $11, $CD
		dc.b $FF, $CC, $DD, $1D, $FC, $1C, $CC,	$D1, $FC, $11, $CC, $CD, $FC, $11, $CC,	$CD, $FD, $CC, $1C, $CB
		dc.b $FF, $DC, $1B, $B7, $32, $31, $B7,	$FF, $44, $27, $B7, $7F, $74, $32, $7B,	$77, $74, $32, $7B, $77
		dc.b $74, $32, $47, $B7, $44, $33, $47,	$B7, $4F, $33, $F9, $7B, $F3, $3F, $78,	$99, $FF, $F7, $99, $88
		dc.b 0,	$F7, $79, $88, 0, $F, $79, $98,	0, 0, $F7, $99,	0, 0, $F7, $77,	0, 0, 7, $77
		dc.b 0,	0, $F, $77, 0, 0, 0, $F7, $BB, $B0, 0, $FF, $77, $7B, 0, 0, $77, $77, $B0, 0
		dc.b $77, $77, $7B, 0, $77, $77, $77, $B0, $77,	$77, $77, $7B, $DC, $10, 0, 0, $CC, $11, $BB, $BB
		dc.b $1C, $1B, $77, $77, $1C, $1B, $77,	$77, $11, $B7, $77, $77, $D1, $B7, $77,	$77, $DB, $77, $77, $77
		dc.b $B7, $77, $77, $7B, $77, $77, $7B,	$B0, $7F, $7B, $B4, $77, $FF, $F7, $32,	$47, $9B, $BB, $B3, $24
		dc.b $79, $99, $9B, $32, $77, $7B, $7F,	$32, $77, $7B, $7F, $34, $77, $7B, $77,	$FF, $BB, $B7, $79, $77
		dc.b $77, $79, $79, $88, $99, $88, $97,	$99, $97, $99, $89, $7D, $79, $79, $9D,	$CC, $78, $77, $DC, $11
		dc.b $89, $7D, $C1, $11, $97, $DC, $11,	$11, $7D, $CC, $11, $11, $FD, $C1, $11,	$11, $FD, $C1, $11, $11
		dc.b $FD, $C1, $11, $11, $D, $C1, $1C, $CC, 0, $DC, $CD, $DD, 0, $D, $DB, $88, 0, $B, $88, $B7
		dc.b 0,	0, 0, 0, $B0, 0, 0, 0, $7B, 0, 0, 0, $7B, 0, 0,	0, $7B,	0, 0, 0
		dc.b $7B, 0, 0,	0, $B0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 9, $99, $98,	$99, $98, $88
		dc.b $99, $88, $88, $88, $77, $99, $79,	$99, $47, $77, $77, $77, $4F, $F7, $77,	$FF, $FF, $FF, $FF, 0
		dc.b 0,	0, 0, 0, $70, 0, 0, 0, $97, 0, 0, 0, $79, $77, 1, 0, $DD, $DC, $CD, $D1
		dc.b $CC, $CC, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11, $11, $11, $11,	$11, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $C, 0, 0, 0, $C1
		dc.b 0,	0, $C, $17, 0, 0, $C1, $17, $89, $99, $C1, $77,	$88, $88, $91, $77, $99, $88, $9B, $77
		dc.b $97, $99, $7B, $77, $77, $77, $77,	$BB, $FF, $FF, $70, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $10, 0, 0, 8, $DD, $11, 0, $8B
		dc.b $C1, $10, $B8, $BB, $11, $1B, $BB,	$77, $11, $11, $B7, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $C0, 0, $CC, 0, $1C, $C, $1C, 0, $77, $71, $C0, 0, $77, $77, $77, 0
		dc.b $77, $77, $77, $70, $77, $77, $77,	$70, $77, $77, $77, $70, $77, $77, $77,	$77, $77, $77, $77, $77
		dc.b $77, $77, $77, $77, $B7, $77, $77,	$77, $B, $77, $77, $77,	0, $B7,	$77, $77, 0, $BB, $77, $77
		dc.b 0,	$8B, $B7, $7B, 8, $BB, $BB, $B0, $8B, $B7, $70,	0, $BB,	$70, 0,	0, $77,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $11, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11
		dc.b $11, $11, $11, $11, $11, $11, $11,	$11, $C1, $11, $11, $11, $DC, $11, $11,	$11, $DC, $11, $11, $11
		dc.b $CC, $C1, $11, $1C, $DD, $11, $DD,	$11, 0,	1, $10,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $11, $11, $D0,	0, $11,	$1C, $D0, 0
		dc.b $11, $1C, $D0, $1D, $11, $CD, $CC,	$D0, $1C, $1C, $1C, $D0, $11, $11, $CD,	0, $11,	$CC, $D0, 0
		dc.b $CC, $D1, $10, 0, $DD, 0, 0, 0, $10, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 7, $77
		dc.b 0,	0, 7, $77, 0, 0, 7, $77, 0, 0, 0, $77, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $77, $77, $77, $77, $77, $77, $77,	$77, $77, $77, $77, $77
		dc.b $77, $77, $77, $77, 7, $77, $77, $77, 0, 0, 7, $77, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $7B, $B8, $B7, $7D, $77, $B7, $70,	$D, $77, $70, 0, 0, $77, $70, 0, 0, $77, 0, 0, 0
		dc.b $70, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
byte_281B0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 3, $33, 0, 0, $33, $32
		dc.b 0,	$33, $33, $22, 0, $34, $44, $44, 0, $44, $44, $44, 0, $44, $42,	$24, 4,	$44, $32, $22
		dc.b 4,	$44, $33, $22, 4, $44, $32, $22, 4, $42, $44, $33, 4, $43, $22,	$33, 0,	$44, $33, $23
		dc.b 0,	$44, $33, $33, 0, 4, $44, $43, 0, 0, 4,	$43, 0,	0, 0, 4, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $D, $D0, 0, 9, $D1, $DD, $DD, 9, $DC, $1C,	$DD, $DD
		dc.b $D, $CC, $1C, $DC,	0, $DC,	$11, $1C, 0, 0,	0, 0, 0, 0, 0, 0, $33, $33, 0, 8
		dc.b $22, $20, 3, 8, $32, $22, $80, 8, $22, $22, 8, $88, $32, $2F, $F9,	$99, $32, $2F, $FF, $99
		dc.b $2F, $FF, $FF, $FF, $42, $2F, $FF,	$FF, $34, $23, $FF, $FF, $32, $23, $44,	$F7, $33, $33, $44, $77
		dc.b $34, $44, $F9, $98, $F9, $99, $9F,	$FF, $9F, $FF, $FF, $F1, $9F, $FF, $FF,	$FF, $39, $FF, $FF, $FF
		dc.b $49, $FF, $FF, $FF, $F, $9F, $FF, $F7, 0, $FF, $FF, $77, 0, 0, 9, $77, 0, $99, $98, $97
		dc.b 0,	9, $88,	$97, $99, $99, $89, $77, $88, $88, $99,	$7F, $98, $89, $99, $7F, $98, $97, $97,	$FF
		dc.b $79, $99, $77, $FF, $77, $77, $77,	$F0, $DD, $77, $FF, $F0, $CC, $DF, 0, 0, 0, 0, 0, 0
		dc.b 0,	9, 0, 0, 0, $99, $90, 0, $89, $99, $97,	$80, $88, $88, $99, $79, $99, $99, $77,	$79
		dc.b $77, $77, $78, $8F, $77, $77, $88,	$8F, $78, $88, $D8, $8D, $78, $79, $DD,	$11, $78, $9D, $CC, $D1
		dc.b $8F, $DC, $11, $CD, $8F, $CC, $DD,	$1D, $8C, $1C, $CC, $D1, $1C, $11, $1C,	$1D, $11, $11, $CC, $CD
		dc.b $FD, $CC, $1C, $CB, $FF, $DC, $1B,	$B7, $23, $71, $B7, $FF, $32, $37, $B7,	$7F, $73, $24, $7B, $F7
		dc.b $73, $24, $77, $B7, $73, $24, $47,	$7B, $F3, $34, $F7, $7B, $F3, $34, $F7,	$77, $F3, $3F, $79, $97
		dc.b $FF, $F7, $77, $88, $F0, $F7, $79,	$98, $FF, $F, $77, $79,	0, 0, $F7, $79,	0, $F, $FF, $77
		dc.b 0,	0, $F, $77, 0, 0, 0, 0,	0, 0, $88, 0, 9, $88, $F8, 0, $98, $FF,	$F8, $89
		dc.b $99, $8F, $FF, $F9, $98, $FF, $FF,	$FF, $FF, $FF, $FF, $99, $FF, $FF, $99,	$90, $DC, $10, 0, $BB
		dc.b $CC, $11, $1B, $B7, $1C, $11, $1B,	$77, $1C, $11, $B7, $77, $11, $11, $B7,	$77, $D1, $1B, $77, $77
		dc.b $DB, $DB, $77, $77, $BB, $B7, $77,	$77, $77, $77, $7B, $BB, $7F, $7B, $BF,	$77, $BB, $BB, $33, $27
		dc.b $9B, $BB, $33, $32, $79, $9B, $B3,	$33, $77, $BB, $7F, $32, $77, $77, $BF,	$34, $77, $7B, $B7, $FF
		dc.b $BB, $B7, $78, $77, $77, $79, $79,	$89, $99, $77, $77, $CD, $88, $98, $97,	$D1, $89, $79, $9D, $CC
		dc.b $97, $CD, $DC, $11, $77, $D1, $C1,	$11, $77, $DC, $11, $11, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $90, 0, 0, 0, $90, 0, 0, 0
		dc.b 0,	0, 0, 0, $BB, 0, 0, 0, $7B, $B0, 0, 0, $77, $B0, 0, 0, $77, $B0, 0, 0
		dc.b $77, $B0, 0, 0, $77, $B0, 0, 0, $7B, 9, 0,	7, $B0,	$79, 0,	$79, $97, $98, $77, $99
		dc.b $99, $88, $99, $88, $77, $99, $88,	$99, $77, $79, $99, $77, $27, $77, $77,	$77, $4F, $FF, $F7, $FF
		dc.b $FF, $FF, $FF, $FF, $F, $F0, $F, $F0, $70,	$F, 0, $F, $77,	$C, 0, $D1, $77, $D1, $DC, $CD
		dc.b $DD, $DC, $CC, $CC, $CC, $CC, $11,	$CC, $11, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $C, 0, 0, 0,	$C, $C0, 0, 0, $C, $CC
		dc.b $90, 0, $C, $C1, $90, 0, $C, $17, $97, 0, $C1, $17, $89, $79, $C1,	$77, $98, $98, $91, $77
		dc.b $99, $89, $7B, $77, $79, $77, $7B,	$77, $77, $77, $77, $77, $FF, $FF, $77,	$77, $FF, $F0, 0, 7
		dc.b $F, $F0, 0, 7, 0, $F, 0, 0, 0, 0, 0, 0, 0,	0, 0, 8, $C0, 1, $10, $88
		dc.b $DD, $11, $11, $8B, $C1, $11, $B8,	$BB, $11, $11, $BB, $77, $11, $11, $BB,	$D0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $CC, 0, $C, 0,	$CC, $C0, $CC, $C0, $CC, $CC, $1C, 0, $77, $71,	$C0, 0
		dc.b $77, $77, $70, 0, $77, $77, $70, $77, $77,	$77, $77, $77, $77, $77, $77, $70, $77,	$77, $77, $77
		dc.b $77, $77, $77, $70, $77, $77, $77,	$77, $77, $77, $77, $77, $77, $77, $77,	$70, $77, $77, $77, $77
		dc.b 0,	$77, $77, $77, 8, $8B, $BB, $70, 8, $BB, $BB, 7, $8B, $B7, $B0,	0, $BB,	$B7, 0,	0
		dc.b $B7, $B0, 0, 0, $B0, 0, 0,	0, 0, 0, 0, 0, $D, $DC,	$11, $1C, $DD, $C1, $11, $11
		dc.b $D1, $11, $11, $11, $11, $DD, $C1,	$11, $DD, $DC, $1D, $D1, $D, $D1, $D0, $DC, $D,	$11, $D0, $C1
		dc.b 0,	$DD, 0,	$D1, $CC, $D0, 0, 0, $1C, $D0, 0, $B, $1D, 0, 0, $B, $1D, 0, 0,	$B7
		dc.b $CD, 0, $BB, $B7, $D0, 0, $B, $77,	$D0, 0,	$B, $77, $D0, 7, $77, $77, 0, 0, $FF, $FF
		dc.b $BB, $B, 0, $FF, $BB, $BB,	0, $FF,	$77, $7B, $BB, 0, $77, $77, $BB, 0, $77, $77, $7B, 0
		dc.b $77, $77, $77, $BB, $77, $77, $77,	$7B, $7D, $CC, $11, $11, $C1, $C1, $11,	$11, $FD, $C1, $11, $11
		dc.b $FD, $C1, $11, $11, $D1, $D1, $1C,	$CC, $CD, $DC, $CB, $DD, 0, $BD, $DB, $88, 0, $B, $88, $B7
		dc.b $11, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11
		dc.b $C1, $11, $11, $11, $DC, $11, $11,	$11, $DC, $11, $11, $11, $CC, $C1, $11,	$11, $D1, $1C, $1C, $C1
		dc.b $1D, $D, $1D, $D, 0, 0, $10, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $11, $11, $11,	$D0, $11, $1C, $11, $11, $11, $11, $1D,	0, $11,	$11, $1D, 0
		dc.b $11, $11, $1C, 0, $11, $11, $C1, $C0, $11,	$C0, 0,	0, $C1,	$1D, 0,	0, 0, $D1, 0, 0
		dc.b $D0, 0, 0,	0, $C0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $77,	$77, 0,	0, $77,	$77, 0,	7, $77,	$77
		dc.b 0,	0, 0, $77, 0, 0, 0, 7, 0, 0, 0,	7, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b $77, $77, $77, $77, $77, $77, $77,	$77, $77, $77, $77, $77, $77, $77, $77,	$77, $77, $77, $77, $77
		dc.b 0,	7, $77,	$77, 0,	0, $70,	0, 0, 0, 0, 0, $7B, $B8, $B7, $BD, $77,	$B7, $B0, 0
		dc.b $77, $70, 0, 0, $77, $70, 0, 0, $77, $77, 0, 0, $77, 0, 0,	0, $70,	0, 0, 0
		dc.b 0,	0, 0, 0
byte_28650:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $96, 0, 0, 9,	$88
		dc.b 0,	0, $99,	$99, 0,	7, $77,	$99, 0,	7, $77,	$77, 0,	0, $7F,	$FF, 0,	0, $F, $F7
		dc.b 0,	0, $F7,	$99, 0,	7, $99,	$FF, 0,	$99, $FF, $FF, 9, $FF, $FF, $FF, 9, $FF, $FF, $FF
		dc.b 0,	$9F, $FF, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, $22, 0, 0, 2,	$32, 0,	0, $23,	$23, 0,	2, $3F,	$77
		dc.b 0,	$F, $77, $99, 0, $F7, $99, $88,	$F, $79, $88, $89, $F, $99, $99, $99, 7, $98, $97, $77
		dc.b $79, $98, $88, $97, $77, $77, $98,	$97, 0,	0, 0, 0, 0, 0, 0, 0, 6,	$88, $88, $90
		dc.b $88, $97, $78, $89, $77, $99, $87,	$77, $99, $97, $77, $77, $97, $77, $96,	$68, $77, $76, $6C, $CF
		dc.b $79, $6F, $C1, $1C, $99, $FD, $1D,	$D1, $FD, $CD, $CC, $CD, $FC, $C1, $CC,	$CD, $DC, $11, $CC, $CD
		dc.b $DC, $C1, $CC, $1F, $D1, $11, $CC,	$FF, $7B, $BC, $1C, $FF, $B7, $BB, $CC,	$CB, $7B, $77, $BB, $BB
		dc.b 7,	$BB, $77, $BB, 0, 7, $BB, $77, $23, $37, $9C, $17, $32,	$23, $DD, $C1, $22, $4F, $FD, $CD
		dc.b $33, $33, $79, $D1, $7F, $43, $27,	$9D, $97, $F4, $33, $79, $89, $7F, $32,	$77, $97, $77, $42, $79
		dc.b $77, $77, $42, $77, $77, $74, $33,	$79, $74, $43, $37, $79, $FF, $44, $77,	$79, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $96, $60, 0, 0, $79, $68, $90,	0
		dc.b $88, $88, $89, 0, $99, $68, $89, $90, $DC,	$F9, $99, 0, $D1, $D0, 0, 0, $11, $D0, 0, 0
		dc.b $11, $C0, 0, 0, $11, $C0, 0, 0, $D1, $F0, 0, 0, $D1, $F7, 0, 0, $BB, $B0, 0, $88
		dc.b $BB, $BB, $B8, $77, $BB, $B8, $87,	$77, $BB, $B7, $77, $70, $77, $70, 0, 0, $30, 0, 0, 0
		dc.b $92, $90, 0, 0, $37, $79, 0, 0, $73, $27, $79, 0, $17, $32, $77, $90, $D7,	$43, $37, $79
		dc.b $97, $94, $27, $79, $77, $97, $47,	$79, $97, $97, $74, $77, $97, $97, $74,	$77, $89, $78, $77, $77
		dc.b $89, $78, $77, $F7, $B0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, $FF, 0, $D, $DF, $FD,	0, 0, $F, $DC, $D, $C7,	$FF, $C1
		dc.b $D, $D1, $7F, $DC,	$77, $DC, $77, $FD, $D7, $BD, $97, $FF,	$DB, $BB, $99, $FC, $D7, $B9, $1C, 0
		dc.b $77, $7C, $C0, 0, $F0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, $F, $C0,	$FD, $DD, $DD, $DD, $FC, $CC, $CC, $CC,	$F1, $11, $11, $11
		dc.b $FC, $CC, $CC, $CC, $FD, $DD, $DD,	$DD, $FD, $DD, $DD, $DD, $FF, $FF, $FF,	$FF, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $DD, 0, 0, $D, $11
		dc.b 0,	0, $D, $DC, 0, 0, 0, $C1, 0, 0,	$C, $10, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 7, 0,	0, 7, $B8, 0, 0, $B8, $BB, $DD,	$F7, $79, $7D
		dc.b $CD, $DF, $F7, $7C, $C1, $1C, $D7,	$7C, $1D, $11, $D7, $C1, 0, $DC, $DD, $C1, 0, $DC, $DD,	$C1
		dc.b 0,	$D, $DC, $CC, 0, $D, $DC, $CD, 0, 0, $DD, $DB, 0, 0, 7,	$88, 0,	7, $B8,	$BB
		dc.b 0,	$7B, $8B, 0, 7,	$B8, $80, 0, $7B, $88, $BB, 0, $B8, $88, $8B, $B0, $B7,	$7B, $B7, $7B
		dc.b $DF, $F7, $77, $77, $CD, $DF, $F7,	$97, $1C, $CD, $DF, $F7, $11, $1C, $CD,	$DF, $11, $11, $1C, $CC
		dc.b $11, $11, $11, $11, $C1, $11, $11,	$11, $DD, $11, $11, $11, $BB, $DC, $CC,	$CD, $BB, $DD, $DD, $DD
		dc.b 0,	$D, $DD, $D0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b $BB, 0, 0,	0, $99,	$79, $77, $FF, $77, $99, $7F, $F0, $77,	$97, $70, 0, $FF, $D7, $70, 0
		dc.b $CC, $DD, 0, 0, $1C, $DD, 0, 0, $1C, $D7, 0, 0, $CD, $D7, $B0, 0, $DD, $7B, $8B, 0
		dc.b $D0, 7, $B8, 0, 0,	0, $7B,	$80, 0,	0, $7B,	$80, 0,	0, $7B,	$8B, 0,	0, $7B,	$88
		dc.b 0,	7, $88,	$88, 0,	$78, $8B, $7B, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $88, $B0, 0, 0, $BB, $88, $B0, 0, $88, $B7, $B8, $8B
byte_28970:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 8, $88, 0, 0, $89, $99
		dc.b 0,	9, $99,	$99, 0,	$77, $79, $99, 0, $77, $77, $77, 0, $F,	$FF, 0,	0, $F, $FF, $FF
		dc.b $88, $88, $FF, $FF, $88, $88, $FF,	$FF, $99, $88, $7F, $FF, $88, $77, $FF,	$FF, $77, $79, $CF, $FC
		dc.b $77, $8F, $CC, $FF, 0, 0, 0, 0, 0,	0, 0, $DD, $F0,	0, $DD,	$DC, $F0, 0, $DC, $C0
		dc.b $FF, $D, $C0, 0, $FF, $D, $C0, 0, $FF, $D,	0, $D, $1F, $D,	0, $DC,	0, 0, 0, 0
		dc.b $DD, 0, 0,	0, $CC,	$DD, 0,	0, 0, $C, $D0, 0, 0, 0,	0, 0, $D, $DD, $DD, 0
		dc.b $DC, $CC, $DC, $D0, $C0, $DD, $DD,	$CD, 0,	$F, $F7, $77, 0, 0, $FF, $79, $90, $F, $F9, $9F
		dc.b $9F, $F9, $9F, $FF, $F9, $9F, $FF,	$FD, $F, $FF, $FF, $FD,	0, $F, $FF, $FD, 0, 0, 0, 7
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, $FF, 0, 0, $F, $77, 0, 0, $F7, $79, 0, 0, $F7, $98
		dc.b 0,	0, $F7,	$88, 0,	0, $77,	$99, 0,	0, $77,	$77, 0,	0, $DD,	$D7, 0,	$D, $11, $CC
		dc.b 0,	$D, $1C, $CD, 0, $D, $1C, $DD, 0, $D, $C1, $1C,	0, 0, $DC, $CD,	0, 0, $D, $DC
		dc.b 0,	0, 0, $DD, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $88, $FC, $1C, $CC
		dc.b $9F, $DC, $11, $CD, $DC, $D1, $D1,	$11, $CC, $11, $1D, $11, $C1, $1D, $DC,	$D1, $CC, $11, $CD, $DC
		dc.b $D1, $C1, $11, $CD, $7B, $BC, $11,	$1C, 7,	$BB, $CC, $CB, $D, $77,	$BB, $BB, 0, $DC, $77, $BB
		dc.b 0,	$D, $CC, $77, 0, $32, $22, $FF,	$FF, $23, $33, $33, $77, $77, $7F, $43,	$99, $99, $77, $F4
		dc.b $98, $88, $97, $7F, $88, $98, $89,	$77, $97, $79, $97, $77, $89, $77, $77,	$74, $97, $77, $7F, $43
		dc.b $77, $7F, $F4, $44, $CC, $FF, $F, $77, $DF, $F0, $F, $F7, $C0, $D,	$D, $C0, $D1, 0, $D, $D
		dc.b $DC, 0, $D0, $DC, $CD, $C0, $D0, $D0, $1D,	$C0, $DD, 0, $CC, $C0, $DD, 0, $D1, $C0, $D, $D
		dc.b $BB, $B0, $D, $D, $7B, $BB, 0, $DC, $B7, $BB, 7, $DD, $BB,	$BB, $BB, $7D, $BB, $BB, $B8, $88
		dc.b $FF, $B8, $8B, $BB, $79, $D1, $73,	$27, $27, $9D, $17, $32, $43, $79, $D7,	$77, $32, $77, $97, $99
		dc.b $42, $79, $77, $99, $47, $79, $97,	$77, $37, $99, $89, $77, $77, $98, $89,	$97, $79, $99, $98, $99
		dc.b $77, $79, $98, $89, $77, $77, $99,	$99, $DD, $CC, $CC, $D0, $CC, 0, 0, $CD, 0, 0, 0, $C
		dc.b 0,	$D, $DD, $D0, $D, $DC, $CC, $CD, $DC, $C1, $11,	$1C, $CC, $1C, $CC, $C1, $C1, $CC, 0, $C
		dc.b $71, $CD, $DD, 0, $17, $DF, $FF, $D0, $C7,	$70, 0,	$FD, $D9, $70, 0, $FD, $B9, $90, 0, $F
		dc.b $91, $C0, 0, $F, $7C, 0, 0, $F, $37, 0, 0,	0, $77,	$70, 0,	0, $97,	$70, 0,	0
		dc.b $97, $77, 0, 0, $97, $77, 0, 0, $79, $87, $F0, 0, $79, $87, $D0, 0, $77, $9D, $DD,	0
		dc.b $9D, $DC, $CC, $D0, 0, 0, 0, 0, 0,	0, 0, 0, $D0, 0, 0, 0, $D0, 0, 0, 0
		dc.b $DD, 0, 0,	0, $CD,	0, 0, 0, $1C, $D0, 0, 0, $C1, $D0, 0, 0, $CC, $CD, 0, 0
		dc.b $C, $1D, 0, 0, $C,	$1C, $D0, 0, $DD, $C1, $DF, $C0, $D0, $C1, $1D,	$D0, $DD, $CC, $1C, $C0
		dc.b $DD, $C, $1C, $C0,	$FD, $DC, $C1, $10, $FD, $DD, $CC, $C0,	$F, $DD, $DD, $C0, 0, $FF, $DD,	$D0
		dc.b 0,	0, $FF,	$F0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b $FF, $F0, $D, $FF,	$CC, 0,	$DD, $DD, 0, 0,	$DD, $CC, $C0, 0, $D, $C1, 0, 0, $D, $C1
		dc.b 0,	0, $D, $DC, 0, 0, 0, $DC, 0, 0,	0, $D, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $B, $B8, 0, $77, $B8, $8B, $B, $8B, $88, $88
		dc.b $8B, $BB, $77, $BB, $F7, $77, $77,	$DD, $FF, $77, $DD, $CC, $DD, $DD, $CC,	$11, $CC, $CC, $11, $11
		dc.b $11, $11, $11, $11, $11, $11, $11,	$11, $CC, $CC, $C1, $11, $DC, $CD, $DD,	$11, $DD, $B8, $BD, $DC
		dc.b 0,	$7B, $8B, $DD, 0, $7B, $8B, $DD, $BB, $B8, $BB,	0, $88,	$BB, 0,	0, $77,	0, 0, 0
		dc.b $BB, 0, 0,	0, $77,	$BB, $B0, 0, $DC, $C1, $1C, $D0, $C1, $11, $11,	$CD, $11, $11, $11, $CD
		dc.b $11, $11, $11, $CD, $11, $11, $11,	$CD, $11, $11, $11, $CD, $11, $11, $1C,	$C0, $11, $11, $CC, $D7
		dc.b $CC, $CC, $CD, $7B, $DD, $DD, $D7,	$B8, $DD, $D0, 0, $7B, 0, 0, 0,	7, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 7, 0,	0, 0, $78, 0, 0, 0, 0, $B0, 0, 0, 0
		dc.b $8B, 0, 0,	0, $B8,	$B0, 0,	0, $7B,	$8B, 0,	0, $7B,	$88, $88, $B0, $88, $88, $BB, $88
		dc.b $8B, $7B, $88, $B7, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $B0, 0, 0,	0, $B8,	$8B, $B0, 0
byte_28CF0:	dc.b 0,	$DC, $CD, 0, $D, $C1, $1C, $CD,	$DD, $DC, $C1, $1C, $DD, $DD, $DC, $C1,	$FF, $DD, $DD, $C8
		dc.b $DD, $FF, $DD, $99, 0, 0, $77, $77, 0, 0, $F, $77,	0, 0, 0, $FF, 0, 0, 0, $F
		dc.b $99, 0, 0,	$F9, $F, $99, $99, $9F,	0, $FF,	$FF, $FF, 0, 0,	$FF, $FF, 0, 0,	0, $FF
		dc.b 0,	0, 0, 0, $F, $FF, $FF, $F0, 0, 0, $FF, $FF, $DD, 8, $88, $FF, $88, $88,	$88, $8F
		dc.b $99, $99, $98, $87, $99, $98, $87,	$7F, $99, $97, $77, $9C, $77, $77, $78,	$FC, $77, $78, $8F, $C1
		dc.b $F7, $99, $FD, $C1, $99, $FD, $CD,	$1D, $FF, $FC, $C1, $11, $FF, $DC, $11,	$DD, $FF, $DC, $C1, $1C
		dc.b $FF, $DD, $1C, $11, 0, $77, $BB, $C1, 0, 0, 0, 0, $F0, 0, 0, 0, $FF, $F0, 0, 0
		dc.b $FF, $FF, 0, 0, $FF, $FF, 0, 0, $FF, $FF, $F0, 0, $FF, $CF, $F0, 0, $CF, $F1, $F0,	0
		dc.b $CC, $CC, $C0, 0, $1C, $DD, $10, 0, $11, $1D, $C0,	0, $D1,	$1C, $DC, 0, $CD, $11, $DC, 0
		dc.b $DD, $CC, $CC, 0, $1C, $DD, $1C, 0, $11, $CB, $BB,	0, 0, 0, $7B, $BC, 0, 0, $D7, $7B
		dc.b 0,	0, $D, $C7, 0, 0, 0, $DC, 0, 0,	3, $22,	0, 0, $32, $33,	0, $F, $F9, $77
		dc.b 0,	$F7, $98, $89, $CC, $B7, $BB, $B0, $BB,	$BB, $7B, $B0, $7B, $BB, $BB, $BB, $C7,	$7B, $BB, $BB
		dc.b $2F, $FF, $FB, $88, $33, $37, $9D,	$17, $F4, $32, $79, $D1, $7F, $43, $37,	$9D, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $B0, 0, 0, 0, $88, $80, 0, 0, $B0, 0, 0, 0, $32, $70, 0, 0
		dc.b $73, $27, 0, 0, $77, $73, $70, 0, 0, 0, 0,	0, 0, 0, 0, 7, 0, $10, 0, $79
		dc.b 0,	$D1, $10, $79, $CC, $CD, $D1, $D7, 0, $DD, $DD,	$CD, $C, $DD, $DD, $D1,	0, 0, $DD, $D1
		dc.b 0,	0, 0, $C, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 7, $79, $88, $88, $79,	$99, $88, $99
		dc.b $98, $99, $99, $97, $88, $89, $77,	$77, $98, $99, $77, $77, $79, $77, $7F,	$FF, $77, $FF, $F0, 0
		dc.b $FF, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$D, 0, 0, 0, $D, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 7, $7B
		dc.b 0,	7, $B8,	$B8, 0,	$B8, $BB, $B7, $97, $F3, $27, $79, $77,	$74, $27, $77, $77, $74, $47, $97
		dc.b $77, $43, $77, $98, $44, $34, $77,	$99, $44, $47, $79, $99, $F7, $77, $77,	$79, $FF, $77, $77, $77
		dc.b $DF, $FF, $77, $77, $DD, $DF, $F7,	$7D, $DC, $CD, $DD, $DC, $DC, $1C, $CC,	$C1, $DC, $11, $11, $11
		dc.b $DD, $C1, $11, $11, $D, $CC, $CC, $CC, 0, $DD, $CC, $DD, 0, $D, $DB, $8B, 0, 0, 7,	$B8
		dc.b 0,	0, 7, $B8, 0, $B, $BB, $8B, $BB, $88, $8B, $B0,	$88, $B7, $70, 0, $88, $8B, $B0, 0
		dc.b $7B, $B7, $7B, $BB, $79, $97, $77,	0, $79,	$99, $77, 0, $77, $79, $77, $70, $97, $79, $77,	$70
		dc.b $89, $77, $98, $7F, $98, $97, $98,	$7D, $89, $97, $79, $DD, $79, $99, $DD,	$CC, $7D, $DD, $CC, $11
		dc.b $DC, $CC, $11, $11, $C1, $11, $11,	$11, $11, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11
		dc.b $11, $11, $11, $11, $D1, $11, $11,	$1C, $DD, $CC, $CC, $CC, $BD, $DD, $DD,	$DD, $BD, $DD, $DD, 0
		dc.b $B0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $D0, 0, 0, 0, $CD, 0, 0, 0, $CD, 0, 0,	0, $1C,	$D0, 0,	0
		dc.b $1C, $D0, 0, 0, $1C, $D0, 0, 0, $1C, $D0, 0, 0, $1C, $D0, 0, 0, $CC, 0, 0,	0
		dc.b $CD, $70, 0, 0, $D7, $B0, 0, 0, $7B, $8B, 0, 0, 7,	$B8, $B0, 0, 0,	$7B, $8B, 0
		dc.b 0,	7, $B8,	$B0, 0,	7, $B8,	$88, 0,	$78, $88, $8B, 7, $88, $B7, $B8, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $8B, 0, 0,	0
		dc.b $B8, $8B, 0, 0, $8B, $7B, $88, $BB
byte_28FF0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, $D, 0, 0,	$DD, $DC, 0, $DD, $CC, $C1, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $D, 0, 0, 0, $DC, $D0, 0, 0, $1C, $D0, 0, 0
		dc.b $CD, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$D, 0, 0, 0, $DC, 0, 0,	$D, $CC
		dc.b 0,	0, $D, $C1, 0, 0, $DC, $C1, 0, 0, $DC, $11, 0, $D, $CC,	$11, 0,	$D, $CC, $11
		dc.b 0,	$D, $CC, $11, 0, $D, $CC, $11, 0, $D, $CC, $11,	0, $D, $CC, $11, 0, 0, $DC, $C1
		dc.b 0,	0, $DC,	$CD, 0,	0, $D, $D7, 0, 0, $D, $78, 0, 0, 0, $7B, 0, 0, 0, 7
		dc.b 0,	0, 0, 7, 0, 0, 7, $77, 0, 7, $77, $BB, 0, $78, $87, $7B, 7, $88, $BB, $88
		dc.b $DD, $CC, $11, $11, $CC, $11, $11,	$CD, $11, $11, $DD, $D2, $11, $1D, $33,	$22, $11, $D3, $33, $34
		dc.b $11, $D4, $34, $33, $1D, $44, $44,	$22, $1D, $44, $43, $22, $1D, $44, $43,	$32, $11, $D4, $44, $33
		dc.b $11, $D4, $44, $44, $11, $1D, $47,	$77, $11, $D7, $79, $99, $1D, $FF, $99,	$99, $DD, $F9, $99, $97
		dc.b $DD, $79, $97, $77, $BD, $77, $99,	$99, $88, $D7, $79, $99, $BB, $8D, $77,	$99, $7B, $8F, $77, $77
		dc.b $BB, $F, $F7, $77,	$70, 0,	$FF, $FF, $B8, $80, 0, $FF, $BB, $B8, $80, 0, $CC, 0, 0, 0
		dc.b $11, $C0, 0, 0, $22, $23, $30, 0, $33, $33, $33, 0, $43, $22, $22,	$20, $44, $32, $22, $22
		dc.b $34, $33, $22, $22, $23, $43, $32,	$22, $22, $44, $33, $39, $33, $43, $33,	$99, $77, $44, $34, $99
		dc.b $97, $94, $34, $99, $99, $97, $44,	$97, $97, $97, $4F, $97, $77, $7F, $4F,	$77, $FF, $44, $FF, $F7
		dc.b $77, $FF, $FF, $F9, $9F, $CC, $11,	$F9, $FC, $11, $DD, $98, $FD, $C1, $1D,	$8D, $FD, $CC, $CC, $1D
		dc.b $FD, $DC, $CC, $CF, $FF, $DD, $DD,	$FB, $FF, $FF, $FF, $FB, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$88, $89, 0
		dc.b $88, $88, $88, $90, $99, $88, $77,	$79, $88, $77, $77, $77, $97, $79, $88,	$88, $77, $88, $D1, $19
		dc.b $77, $8D, $1D, $DC, $78, $DC, $1C,	$DC, $78, $DC, $11, $FD, $98, $D1, $CF,	$FD, $8D, $C1, $CF, $FD
		dc.b $8D, $1C, $CC, $CD, $D1, $1C, $CC,	$CD, $D1, $11, $CC, $CB, $11, $11, $CC,	$BB, $DB, $BB, $BB, $BB
		dc.b $B7, $77, $77, $BB, $7B, $BB, $BB,	$77, $90, 0, 0,	0, $99,	0, 0, 0, $88, $90, 0, 0
		dc.b $98, $80, 0, 0, $CF, $88, 0, 0, $1C, $98, 0, 0, $11, $99, 0, $D, $1F, 9, 0, 0
		dc.b $1F, 0, $D, $C7, $1C, $FF,	$7D, $D1, $1C, $7F, $D7, $DC, $BB, $FF,	$D8, $8D, $BB, $BB, $87, $7B
		dc.b $BB, $88, $77, $79, $BB, $77, $77,	$7C, $77, $FF, $FF, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, $FF, $FD, $DD, $DF,	$FD, $FC, $CC
		dc.b $F, $DC, $F1, $11,	$FF, $C0, $FC, $CC, $7F, $DC, $FD, $DD,	$77, $FD, $FD, $DD, $97, $FF, $FF, $FF
		dc.b $99, $FC, 0, 0, $1C, 0, 0,	0, $C0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $F, $C0, 0, 0,	$DD, $DD, 0, 0
		dc.b $CC, $CC, 0, 0, $11, $11, 0, 0, $CC, $CC, 0, 0, $DD, $DD, 0, 0, $DD, $DD, 0, 0
		dc.b $FF, $FF, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
byte_29270:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, $DD, 0, $D, $DD, $C1, $D,	$DC, $CC, $1C, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $D0, 0, 0,	0, $CD,	0, 0, 0, $CD, 0, 0, $D1
		dc.b $D0, 0, 0,	$D1, 0,	0, 0, 0, 0, 0, 0, $C0, 0, 0, $D, $DC, 0, $D, $D1, $1D
		dc.b $D, $D1, $1D, $DC,	$D1, $1D, $DC, $C1, $1D, $DC, $C1, $1C,	$FC, $C1, $1C, $CD, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $D0, 0, 0,	0, $CD,	0, 0, 0, $1C, 0, 0, 0
		dc.b $CD, $D0, 0, 0, $DD, $DE, 0, 0, 0,	0, 0, $D, 0, 0,	0, $DC,	0, 0, $D, $C1
		dc.b 0,	0, $DC,	$C1, 0,	0, $DC,	$11, 0,	$D, $CC, $11, 0, $D, $C1, $11, 0, $DC, $C1, $11
		dc.b 0,	$DC, $C1, $11, 0, $DC, $C1, $11, 0, $DC, $C1, $11, 0, $DC, $C1,	$11, 0,	$DC, $C1, $11
		dc.b 0,	$D, $CC, $11, 0, $D, $CC, $DD, 0, 0, $DD, $7D, 0, 0, $D7, $8B, 0, 0, 7,	$B8
		dc.b 0,	0, 0, $7B, 0, 0, 0, $77, 0, 0, $77, $7B, 0, $77, $7B, $B7, 7, $88, $77,	$BB
		dc.b $78, $8B, $B8, $8B, $DC, $C1, $11,	$1C, $C1, $11, $1C, $D1, $11, $1D, $DD,	$22, $11, $D3, $32, $23
		dc.b $1D, $33, $33, $44, $1D, $43, $43,	$34, $D4, $44, $42, $23, $D4, $44, $32,	$22, $D4, $44, $33, $22
		dc.b $1D, $44, $43, $33, $1D, $44, $44,	$47, $11, $D4, $77, $79, $1D, $77, $99,	$99, $DF, $F9, $99, $99
		dc.b $DF, $99, $99, $77, $D7, $99, $77,	$7F, $D7, $79, $99, $97, $8D, $77, $99,	$99, $B8, $D7, $79, $9F
		dc.b $B8, $F7, $77, $7F, $B0, $FF, $77,	$7F, 0,	$F, $FF, $FF, $88, 0, $F, $FF, $BB, $88, 0, $F
		dc.b $C0, 0, 0,	$F, $1C, 0, $D,	$DF, $22, $33, 0, $F, $33, $33,	$30, $7F, $32, $22, $22, $78
		dc.b $43, $22, $22, $28, $43, $32, $22,	$28, $34, $33, $22, $28, $24, $43, $33,	$98, $34, $33, $39, $99
		dc.b $74, $43, $49, $99, $79, $43, $49,	$99, $99, $74, $49, $77, $79, $74, $F9,	$77, $77, $F4, $F7, $79
		dc.b $F4, $4F, $FF, $79, $7F, $FF, $FF,	$9F, $FC, $C1, $1F, $9D, $C1, $1D, $D9,	$8D, $DC, $11, $D8, $DD
		dc.b $DC, $CC, $C1, $D7, $DD, $CC, $CC,	$F7, $FD, $DD, $DF, $FF, $FF, $FF, $FF,	$FF, $DF, $1C, $CD, $DD
		dc.b $CF, $FD, $DD, $DD, $C1, $FF, $DD,	$EE, $DC, $CF, $FE, $11, $7F, $FF, $F0,	$FF, $99, $7F, $FF, 0
		dc.b $88, $8F, $FF, $FF, $88, $88, $FF,	$FF, $88, $88, $FF, $FF, $99, $88, $7F,	$FF, $88, $77, $FF, $FF
		dc.b $77, $79, $CF, $FC, $77, $8F, $CC,	$FF, $88, $FC, $C, $CC,	$9F, $D1, $11, $CD, $DC, $D1, $D1, $11
		dc.b $CC, $11, $1D, $11, $C1, $1D, $DC,	$D1, $CC, $11, $CD, $D1, $D0, $C1, $11,	$CD, $7B, $BC, $11, $1C
		dc.b $B7, $BB, $CC, $CB, $7B, $77, $BB,	$BB, $F7, $BB, $B7, $77, $DD, $E1, $10,	0, $EE,	$11, $F0, 0
		dc.b $11, $FF, 0, 0, $FF, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b $F0, 0, 0,	0, $F0,	0, 0, 0, $FF, 0, 0, 0, $FF, 0, 0, 0, $FF, 0, 0,	0
		dc.b $F, 0, 0, 0, $C0, 0, 0, 0,	$D0, 0,	0, 0, $DC, 0, 0, 0, $CD, 0, 0, 0
		dc.b $1D, 0, 0,	0, $11,	$10, 0,	0, $D0,	$C0, 0,	0, $BB,	$B0, 0,	$BB, $7B, $BB, $BB, $B0
		dc.b $BB, $BB, $77, $70, $77, $77, 0, 0
byte_294D0:	dc.b 0,	0, $F, $FF, 0, 0, 0, $FF, 0, 0,	8, $9F,	0, 0, $88, $9F,	0, 9, $89, $9F
		dc.b 0,	9, $97,	$FF, 0,	$99, $79, $FF, 0, $77, $79, $FF, 0, $77, $79, $FF, 0, $77, $79,	$FF
		dc.b 0,	7, $9F,	$FF, 0,	9, $FF,	$FF, 0,	9, $FF,	$FF, 0,	$9F, $FF, $FF, 0, $9F, $FF, $F3
		dc.b 0,	$9F, $FF, $F3, 0, 9, $CC, 7, 0,	$C, $CD, $1C, 0, $D, $D1, $C1, 9, $9D, $C1, $11
		dc.b $99, $FF, $DC, $CC, $99, $9F, $FD,	$DD, $F9, $97, $FF, $79, $F7, $77, $77,	$77, $F, $77, $77, $7F
		dc.b 0,	$FF, $FF, $FF, 0, 0, 0,	$F, 0, 0, 0, $F, 0, 0, 0, $F, 0, 0, 0, $F
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $FF, $FF, 0, 0, $FF, $FF, $FF, 0, $FF, $FD, $DF, $FD
		dc.b $FF, $D1, $11, $DD, $FF, $D1, $11,	$11, $FD, $11, $D1, $F1, $FC, $1D, $CF,	$FD, $D1, $1D, $CF, $FC
		dc.b $DC, $1D, $CC, $CC, $DC, $11, $CC,	$CC, $DC, $11, $1C, $CC, $DC, $C1, $11,	$C8, $FD, $11, $BB, $BB
		dc.b $FF, $1B, $7B, $B7, $22, $1B, $77,	$7B, $23, $37, $BB, $BB, $77, $43, $77,	$7F, $C9, $94, $32, $FC
		dc.b $11, $C7, $42, $7F, $CC, $C9, $93,	$27, $FC, $D9, $73, $27, $FD, $97, $43,	$27, $99, $74, $32, $77
		dc.b $79, $44, $37, $99, $44, $43, $79,	$89, $FF, $77, $78, $99, $F7, $79, $99,	$79, $F7, $79, $97, $DD
		dc.b $F7, $77, $77, $CD, $F7, $77, $FC,	$DB, $FF, $FF, $CD, $7B, $D, $CC, $CD, $7B, 0, 0, 0, $D
		dc.b $DD, 0, 0,	$D, $11, $D0, 0, $D, $11, $1D, 0, $D, $1D, $1D,	0, $D, $1D, $FD, 8, $88
		dc.b $11, $DC, $8B, $BB, $D1, $B8, $BB,	$BB, $CB, $B8, $BB, $BB, $BB, $87, $BB,	$BB, $B8, $7B, $BB, $BB
		dc.b $8B, $7B, $BB, $BB, $B7, $BB, $BB,	$B0, $7B, $BB, $BB, 0, $BC, $CB, 0, 0, $C1, $10, 0, 0
		dc.b $C1, $10, 0, 9, $11, $79, 0, $99, $C7, $79, $90, $99, $F7,	$98, $79, $99, $97, $78, $79, $77
		dc.b $89, $79, $89, $77, $78, $79, $97,	$7F, $79, $77, $7D, $CC, $97, $DD, $D1,	$11, $7D, $CC, $DD, $11
		dc.b $DC, $CC, $C8, $D1, $CC, $CC, $B8,	$D1, $DC, $11, $BB, $8D, $BD, $11, $BB,	$8C, $8D, $11, $BB, $B8
		dc.b $B8, $88, $BB, $B8, $C1, $CD, $DF,	0, $C1,	$CD, $DF, 0, $C1, $CD, $DF, 0, $C1, $CD, $DF, 0
		dc.b $CF, $FD, $DF, 0, $88, $CF, $DF, 0, $BB, $8F, $DF,	0, $BB,	$BF, $FF, 0, $BB, $BF, $DF, 0
		dc.b $BB, $F1, $CF, 0, $B7, $DD, $1C, 0, $77, $B7, $D1,	0, $1B,	$BB, $71, 0, $1B, $BB, $71, 0
		dc.b $CD, $B7, $71, 0, $C1, $77, $11, 0, $DC, $11, $C0,	0, $9D,	$DD, $F0, 0, $77, $77, $F0, 0
		dc.b $97, $77, $F0, 0, $77, $7F, 0, 0, $77, $7F, 0, 0, $77, $F0, 0, 0, $DD, $D7, $BB, 0
		dc.b $CC, $CC, $77, $B0, $11, $11, $C7,	$77, $11, $11, $1C, $7B, $11, $11, $1C,	$DB, $11, $11, $11, $CD
		dc.b $11, $11, $11, $D1, $C1, $11, $11,	$1C, $8C, $11, $11, $1C, $B, $88, 0, 0,	$B8, $88, $88, $80
		dc.b $BB, $BB, $88, $88, $77, $7B, $BB,	$B8, $DD, $77, $77, $BB, $CC, $D7, $77,	0, $DD,	$77, $70, 0
		dc.b $D7, $77, 0, 0, $D, $C1, $1C, $D7,	0, $DC,	$11, $CD, 0, $D, $CC, $1C, 0, 0, $DD, $CC
		dc.b 0,	0, 0, $DD, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $7B, $BB, $B7, $BB
		dc.b $D7, $77, $7B, $7B, $CC, $CC, $CC,	$77, $11, $11, $11, $C7, $CC, $CC, $CC,	$CC, $DD, $DD, $DD, $DD
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $81, $11, $11, $CD, $B8, $CC, $1C,	$DD, $BB, $88, $CC, $D7
		dc.b $77, $BB, $DD, 0, $CC, $DD, 0, 0, $DD, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b $77, $70, 0, 0, $77, 0, 0,	0, $70,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
byte_29770:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 8
		dc.b 0,	0, 0, $99, 0, 0, 7, $77, 0, 0, 7, $77, 0, 0, 0,	$FF, 0,	0, 0, $FF
		dc.b 0,	8, $88,	$8F, $88, $88, $88, $8F, $99, $99, $98,	$87, $99, $98, $87, $7F, $99, $97, $77,	$9C
		dc.b $77, $77, $78, $FC, $F0, 0, 0, 0, $FF, $F0, 0, 0, $FF, $FF, 0, 0, $FF, $FF, 0, 0
		dc.b $FF, $FF, $F0, 0, $FF, $FF, $F0, 0, $FF, $CF, $F0,	0, $CF,	$F1, $F0, 0, 0,	0, 0, $F7
		dc.b 0,	0, 0, $F, 0, 9,	0, $FF,	0, 9, $FF, $99,	0, $F, $99, $FF, 0, 0, $FF, $FF
		dc.b 0,	0, 0, $FF, 0, 0, 0, $BB, 0, $B,	$B7, $77, 0, $B7, $77, $77, 0, $B7, $77, $77
		dc.b 0,	$B7, $77, $77, 0, $B, $77, $77,	0, $FF,	$B7, $77, 0, $F7, $7B, $77, $F,	$F7, $97, $BB
		dc.b $F, $79, $89, $77,	$F, $78, $97, $77, $F, $79, $98, $97, $F, $77, $98, $89, 0, $F7, $99, $97
		dc.b 0,	$FF, $77, $77, 0, $1F, $F7, $7D, 0, $D1, $17, $7D, $77,	$78, $8F, $C1, $77, $99, $FD, $C1
		dc.b $99, $FD, $CD, $1D, $FF, $FC, $C1,	$11, $FF, $DC, $11, $DD, $FF, $DC, $C1,	$1C, $FF, $DD, $1C, $11
		dc.b $B3, $77, $BB, $C1, $7B, $7B, $7B,	$BC, $7B, $77, $B7, $7B, $7B, $F2, $7B,	$B7, $7B, $43, $2B, $8B
		dc.b $77, $B4, $32, $77, $77, $7B, $42,	$79, $77, $77, $B3, $79, $77, $77, $B4,	$99, $7B, $BB, $47, $7D
		dc.b $7B, $BB, $DD, $DC, $F7, $B8, $BC,	$C1, $77, $7B, $8B, $11, $7D, $D7, $B8,	$BC, $DD, $CC, $7B, $8B
		dc.b $DC, $C1, $CB, $B8, $DC, $11, $CD,	$BB, $CC, $CC, $10, 0, $1C, $DD, $10, 0, $11, $1D, $C1,	0
		dc.b $D1, $1C, $D1, 0, $CD, $11, $D1, 0, $DD, $CC, $CC,	0, $1C,	$DD, $1C, 0, $11, $CB, $BB, 0
		dc.b $CC, $B7, $BB, $B0, $BB, $BB, $7B,	$B0, $7B, $BB, $BB, $BB, $B7, $7B, $BB,	$BB, $79, $79, $BB, $88
		dc.b $77, $99, $97, $77, $77, $79, $99,	$77, $77, $77, $79, $77, $DD, $DD, $DD,	$77, $CC, $CC, $CC, $DD
		dc.b $11, $11, $11, $CC, $11, $11, $11,	$11, $CC, $11, $11, $11, $DD, $C1, $11,	$11, $BB, $DC, $11, $11
		dc.b $8B, $DC, $11, $11, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $DC, $1C, $DD,	$F0, $DC, $1C, $DD, $F0, $DC, $1C, $DD,	$F0, $DC, $1C, $DD, $F0
		dc.b $DC, $FF, $DD, $F0, $B1, $CC, $FD,	$F0, $88, $8D, $FD, $F0, $BF, $FF, $FF,	$F0, $FC, $FF, $FD, $F0
		dc.b $F1, $FF, $1C, $F0, $7F, $7D, $D1,	$C0, $77, $7B, $7D, $10, $F1, $BB, $B7,	$10, $DF, $BB, $B7, $18
		dc.b $CD, $7B, $78, $8B, $CD, $D8, $8B,	$B7, $1C, $DB, $B7, $70, $1C, $D7, $7F,	0, $1C,	$CD, $7F, 0
		dc.b 0,	$B, $BB, $B0, $B, $BB, $BB, $BB, $BB, $77, $77,	$77, $B7, $77, $77, $77, $77, $77, $77,	$70
		dc.b $77, $77, $77, $70, 7, $77, $77, $70, 7, $77, $77,	$70, 7,	$77, $77, $70, $88, $77, $77, $70
		dc.b $BB, $B7, $77, $70, $77, 0, $77, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $CC, $CD, $D1,	$DD, 0,	$DD, $DD, $CD, $C, $DD,	$DD, $D1, 0, 0,	$DD, $D1
		dc.b 0,	0, 0, $C, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $DC, $11,	$1C, $DB
		dc.b $DC, $11, $11, $CD, $DD, $C1, $11,	$1C, $DD, $DC, $11, $11, 0, $DD, $CC, $C1, 0, 0, $DD, $CC
		dc.b 0,	0, 0, $DD, 0, 0, 0, 0, $BD, $C1, $11, $11, $DC,	$11, $11, $11, $C1, $11, $11, $11
		dc.b $11, $11, $11, $11, $11, $11, $1C,	$CC, $CC, $CC, $CD, $DD, $DD, $DD, $D0,	0, 0, 0, 0, 0
		dc.b $1C, $DC, $D0, 0, $11, $CC, $D0, 0, $11, $CC, $D0,	0, $CC,	$DD, 0,	0, $DD,	$D0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
byte_29A10:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $98,	$88, 0,	9, $88,	$98, 0,	$98, $89, $9F
		dc.b 0,	$98, $9F, $FF, 0, $98, $9F, $FF, 9, $89, $9F, $FF, 9, $97, $FF,	$FD, $99, $79, $FF, $FD
		dc.b $77, $79, $FF, $FD, $77, $79, $FF,	$FD, $77, $79, $FF, $FD, 7, $9F, $FF, $FD, 9, $FF, $FF,	$FF
		dc.b 9,	$9F, $FF, $FF, 0, $9F, $FF, $FF, 0, $99, $FF, $FF, 0, 0, $99, $FF, 0, 0, 0, $99
		dc.b 0,	0, 0, $22, 0, 0, 2, $44, 0, 0, $24, $22, 0, 2, $42, $23, 0, 2, $42, $3F
		dc.b 0,	3, $42,	$3F, 0,	3, $43,	$F7, 0,	3, $34,	$F7, $D, 0, $33, $F7, $DC, $D0,	$D4, $F7
		dc.b $DC, $CD, $CC, $DF, $DC, $CC, $C1,	$CD, 0,	0, 0, 0, 0, 9, $99, $88, $98, $88, $88,	$88
		dc.b $88, $88, $89, $99, $FF, $FF, $FF,	$DD, $FD, $DF, $FD, $11, $D1, $11, $DD,	$11, $D1, $11, $11, $1D
		dc.b $11, $D1, $F1, $1D, $1D, $CF, $FD,	$11, $1D, $CF, $FC, $D1, $1D, $CC, $CC,	$CB, $11, $CC, $CC, $B8
		dc.b $11, $1C, $CC, $B8, $D1, $11, $88,	$B7, $FD, $BB, $B7, $77, $FD, $77, $77,	$77, $FF, $F7, $77, $DC
		dc.b $FF, $F0, $FD, $C1, $22, $37, $7F,	$D1, $33, $77, $97, $DD, $43, $2F, $79,	$9D, $3F, $32, $27, $77
		dc.b $F7, $77, $32, $79, $77, $77, $33,	$27, $79, $99, $73, $37, $79, $88, $79,	$32, $99, $98, $87, $32
		dc.b $77, $99, $88, $73, $79, $99, $88,	$97, $F7, $77, $79, $97, $FF, $7F, $F1,	$17, 0,	0, $D, $C1
		dc.b $90, 0, $D, $C1, $89, 0, $D, $C1, $90, 0, $D, $C1,	0, 0, $D, $CF, $D0, 0, $D, $1C
		dc.b $1D, 0, $D, $1D, $1D, 0, $88, $8F,	$FD, $88, $BB, $B8, $D8, $BB, $77, $7B,	$8B, $77, $77, $7B
		dc.b $87, $77, $77, $77, $77, $77, $77,	$7B, $77, $77, $77, $1B, $77, $77, $70,	$CD, $77, $70, 0, $C1
		dc.b $70, 0, 0,	$DC, $70, 0, 0,	$D, $C0, 0, 0, $99, $10, 0, 0, $98, $1C, $97, 9, $98
		dc.b $11, $29, $97, $99, $D1, $32, $99,	$77, $D1, $73, $27, $99, $97, $73, $32,	$97, $79, $79, $32, $77
		dc.b $77, $79, $73, $7F, $77, $79, $77,	$FF, $99, $79, $77, $F0, $99, $97, $87,	$F0, $99, $97, $87, $F0
		dc.b $79, $77, $97, $70, $CD, $DF, 0, 0, $CD, $DF, 0, 0, $CD, $DF, 0, 0, $CD, $DF, 0, 0
		dc.b $FD, $DF, 0, 0, $CF, $DF, 0, 0, $DF, $DF, 0, 0, $FF, $FF, 0, 0, $FF, $DF, 0, 0
		dc.b $F1, $CF, 0, 0, $DD, $1C, 0, 0, $B7, $D1, 0, 0, $BB, $71, 0, 0, $BB, $71, 0, 0
		dc.b $B7, $71, 0, 0, $77, $11, 0, 0, $11, $C0, 0, 0, $DD, $77, 0, 0, $77, $77, 0, 0
		dc.b $98, $97, 0, 0, $89, $77, 0, 0, $97, $77, 0, 0, $99, $77, 0, 0, $97, $70, 0, 0
		dc.b $77, 0, 0,	0, $7F,	0, 0, 0, $F0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $DD, $C1, $11,	$1C, $D, $C1, $11, $11
		dc.b $D, $CC, $11, $11,	0, $DC,	$C1, $11, 0, $DC, $CC, $11, 0, $D, $CC,	$CC, 0,	$D, $DC, $CD
		dc.b 0,	0, $DD,	$D7, $DF, $FD, $11, $1C, $CD, $DD, $1C,	$1D, $1C, $D1, $DC, $DD, $11, $CD, $DD,	$DD
		dc.b $11, $11, $CC, $CC, $C1, $11, $11,	$11, $DC, $11, $11, $11, $7D, $CC, $CC,	$CD, $79, $79, $97, $70
		dc.b $77, $79, $99, $70, $F7, $77, $97,	$70, $DF, $77, $77, 0, $CC, $DD, 0, 0, $1C, $D0, 0, 0
		dc.b $CD, $D0, 0, 0, $DD, 0, 0,	0, 0, 0, $D, $D7, 0, 0,	0, $D, 0, 0, 0,	7
		dc.b 0,	0, 7, $7B, 0, 7, $7B, $BB, 0, $7B, $BB,	$B7, 7,	$B8, $8B, $8B, 7, $88, $BB, $88
		dc.b $B8, $DD, $DD, $DD, $78, $8D, $DD,	$D7, $B8, $80, 0, 0, $88, 0, 0,	0, $80,	0, 7, $77
		dc.b $70, 0, 7,	$BB, $B8, $80, 7, $B8, $8B, $B8, $80, $78, $D7,	$B0, 0,	0, $7B,	$88, 0,	0
		dc.b 7,	$B8, 0,	0, $77,	$B8, 0,	0, $BB,	$80, 0,	0, $B7,	$7B, $B0, 0, $88, $8B, $B8, $88
		dc.b $8B, $88, $88, $BB, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $80, 0, 0,	0, $88,	0, 0, 0
byte_29CF0:	dc.b 0,	0, 0, 0, 0, 0, 0, 8, 0,	0, 0, $89, 0, 0, 9, $99, 0, 0, $77, $79
		dc.b 0,	0, $77,	$77, 0,	0, 7, $77, 0, 0, 0, $77, 0, $88, $88, $89, $88,	$88, $88, $88
		dc.b $99, $99, $88, $77, $99, $88, $77,	$77, $99, $77, $79, $88, $77, $77, $88,	$99, $77, $88, $FC, $CC
		dc.b $79, $9F, $D1, $11, 0, 0, 0, 0, $90, 0, 0,	0, $79,	$90, 0,	0, $77,	$99, $80, 0
		dc.b $88, $89, $98, 0, $99, $88, $88, $90, $99,	$99, $88, $89, $CC, $C9, $98, $89, 0, 0, 0, $79
		dc.b 0,	0, 9, $9F, 0, 0, 9, $FF, 0, 0, $9F, $FF, 0, 0, $9F, $FF, 0, 0, $9F, $FF
		dc.b 0,	0, $9F,	$FF, 0,	0, 9, $90, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, $DD
		dc.b 0,	0, $DD,	$CF, 0,	$D, $CC, $F7, 0, $DC, $CF, $79,	0, $DC,	$1F, $98, $D, $CC, $1F,	$79
		dc.b $D, $C1, $1F, $79,	$D, $C1, $1D, $37, $D, $C1, $11, $D3, $D, $C1, $11, $1D, $D, $C1, $11, $CC
		dc.b 0,	$DC, $1C, $DD, 0, $DC, $CD, $8B, 0, $D,	$C8, $B8, $9F, $DC, $DD, $D1, $FF, $CC,	$1C, $DD
		dc.b $FD, $C1, $11, $CD, $FD, $CC, $1C,	$DD, $FD, $11, $CD, $11, $FD, $11, $C1,	$1C, 0,	$11, $1C, $CC
		dc.b 0,	$DB, $BB, $BB, 0, $B7, $77, $7B, 3, $3B, $BB, $B7, $33,	$22, $7D, $C1, $33, $33, $27, $7D
		dc.b $77, $73, $27, $77, $97, $77, $37,	$99, $77, $FF, $11, $D9, $8F, $D1, $CD,	$1D, $FD, $11, $11, $CD
		dc.b $FD, $11, $CC, $1D, $FF, $DD, $CC,	$D7, $DF, $FF, $DD, $79, $CF, $79, $77,	$77, $C1, $F7, $77, $99
		dc.b $DC, $1F, $F7, $79, $8C, $11, $DF,	$FF, $1C, $1D, $99, $99, $1C, $1D, $19,	$90, $1C, $1D, $10, 0
		dc.b $D1, $1D, $C0, $DC, $DD, $DC, 0, $DC, $CB,	$BB, 0,	$D8, $BB, $BB, $BB, $87, $BB, $BB, $88,	$77
		dc.b $BB, $BB, $77, $77, $77, $77, 0, $D1, $77,	$32, 0,	$FF, $17, $73, $20, $FC, $DC, $D7, $32,	$F1
		dc.b $79, $C9, $32, $FF, $97, $9D, $93,	$27, $99, $7D, $93, $27, $77, $99, $77,	$3F, $77, $77, $97, $97
		dc.b $77, $77, $97, $97, $97, $77, $77,	$97, $99, $79, $77, $97, $99, $79, $87,	$77, $77, $79, $87, $70
		dc.b $97, $79, $77, $70, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $1C, $DD, $F0, 0
		dc.b $1C, $DD, $F0, 0, $8C, $DD, $F0, 0, $7B, $DD, $F0,	0, $7F,	$DD, $F0, 0, $CC, $FD, $F0, 0
		dc.b $DD, $FD, $F0, 0, $FF, $FF, $F0, 0, $FF, $FD, $F0,	0, $FF,	$1C, $F0, 0, $7D, $D1, $C0, 0
		dc.b $7B, $7D, $10, 0, $BB, $B7, $10, 0, $BB, $B7, $10,	0, $DB,	$77, $10, 0, $17, $71, $10, 0
		dc.b $C1, $1C, 0, 0, $DD, $D0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, $DD,	$BB, 0,	0, 0, $7B, 0, 7, $77, $7B, 0, $7B, $7B,	$BB, 7,	$BB, $B7, $77
		dc.b 7,	$BB, $8B, $BB, 7, $B8, $8B, $88, 0, $7B, $B8, $88, $88,	$C1, $CD, $DD, $B8, $CC, $CD, $DD
		dc.b $B8, $DD, $DD, $DD, $B0, 0, $77, $77, $BB,	0, $77,	$B7, $B8, $80, 7, $BB, $B8, $88, 7, $BB
		dc.b $88, $80, 0, $78, $FF, $FF, $77, 0, $DD, $BB, 0, 0, $7B, $B8, 0, 0, $BB, $80, 0, 0
		dc.b $7B, 0, 0,	0, $BB,	$BB, 0,	0, $BB,	$BB, $B8, 0, $B8, $8B, $88, $88
byte_29F30:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 8, $89, 0, 0, $88, $88, 0, 8, $89, $99
		dc.b 0,	$99, $99, $97, 7, $79, $97, $77, 7, $77, $77, $77, 0, $F, $FF, $F0, 0, 0, $9F, $FF
		dc.b $97, $78, $9F, $FF, $89, $97, $79,	$FF, $97, $77, $99, $FF, $77, $DD, $FF,	$FF, $7D, $11, $DF, $FC
		dc.b $9C, $11, $1D, $CC, 0, 0, 0, 0, $F0, 0, 0,	0, $FF,	0, 0, 0, $FF, 0, 0, 0
		dc.b $FF, 0, 0,	0, $FF,	0, 0, 0, $F0, 0, 0, 0, $F0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $9F, 0, 0, 9, $FF, 0, 0, 0, $9F
		dc.b 0,	0, 0, 3, 0, 0, 0, $F3, 0, 9, $CC, $F7, 0, $C, $CD, $1C,	0, $D, $D1, $C1
		dc.b 9,	$9D, $C1, $11, $99, $FF, $DC, $CC, $99,	$9F, $FD, $DD, $F9, $97, $FF, $79, $F7,	$77, $77, $77
		dc.b $F, $77, $77, $7F,	0, $FF,	$FF, $F4, 0, 0,	0, $F, 0, 0, 0,	$F, 0, 0, 0, $F
		dc.b 0,	0, 0, $F, 0, 0,	0, 0, 0, 0, 0, 0, $F, $F7, $77,	$77, 0,	$F, $79, $99
		dc.b $99, $99, $9F, $D1, $FF, $FF, $FF,	$D1, $FF, $FF, $FD, $DC, $FF, $FF, $DD,	$DC, $22, $FF, $FD, $CC
		dc.b $23, $32, $79, $D1, $77, $43, $27,	$7B, $C9, $94, $32, $7B, $11, $C7, $42,	$77, $CC, $C9, $93, $27
		dc.b $FC, $D9, $73, $27, $FD, $97, $43,	$29, $99, $74, $32, $97, $79, $44, $39,	$99, $44, $44, $79, $99
		dc.b $44, $77, $79, $99, $F7, $79, $99,	$79, $F7, $77, $97, $DD, $F7, $77, $77,	$CD, $F7, $77, $FC, $DB
		dc.b $FF, $FF, $CD, $7B, $D, $CC, $CD, $7B, $D1, $DC, $C1, $D1,	$1D, $CC, $CC, $11, $1D, $CC, $CC, $11
		dc.b $1D, $CC, $CC, $11, $1C, $CC, $1F,	$11, $1C, $CC, $FF, $BB, $CC, $CC, $FF,	$BB, $1D, $DC, $BB, $BB
		dc.b $88, $8B, $BB, $B8, $BF, $F8, $88,	$87, $BF, $FF, $FB, $77, $7B, $FF, $FF,	$B7, $7B, $FF, $FF, $B7
		dc.b $9B, $FF, $FF, $B7, $79, $BB, $BB,	$7F, $79, $77, $7D, $CC, $97, $DD, $D1,	$11, $7D, $CC, $DD, $11
		dc.b $DC, $CC, $C8, $D1, $CC, $CC, $B8,	$D1, $DC, $11, $BB, $8D, $BD, $11, $BB,	$8C, $8D, $11, $BB, $B8
		dc.b $B8, $88, $BB, $B8, $D0, 0, 0, 0, $D0, 0, 0, 0, $C0, 0, 0,	0, $C0,	0, 0, 0
		dc.b $F0, 0, 0,	0, $F7,	0, 0, 0, $B7, 0, 0, 7, $BB, $88, $87, $99, $88,	$77, $7B, $99
		dc.b $77, $99, $99, $77, $79, $99, $99,	$77, $77, $97, $97, $77, $77, $97, $77,	$77, $77, $77, $77, 0
		dc.b $77, $7D, $DD, 0, $DD, $D7, $BB, 0, $CC, $CC, $77,	$B0, $11, $11, $C7, $77, $11, $11, $1C,	$7B
		dc.b $11, $11, $1C, $DB, $11, $11, $11,	$CD, $11, $11, $11, $D1, $C1, $11, $11,	$1C, $8C, $11, $11, $1C
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $FF, 0, $D, $DF, $FD, 0, 0, $F, $DC
		dc.b $D, $C7, $FF, $C1,	$7D, $D1, $7F, $DC, $77, $DC, $77, $FD,	$D7, $BD, $97, $FF, $DB, $BB, $99, $FC
		dc.b $D7, $B9, $1C, 0, $77, $7C, $C0, 0, $F0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $FF,	$C0, $FD, $DD, $DD, $DD, $FC, $CC, $CC,	$CC
		dc.b $F1, $11, $11, $11, $FC, $CC, $CC,	$CC, $FD, $DD, $DD, $DD, $FD, $DD, $DD,	$DD, $FF, $FF, $FF, $FF
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $B, $88, 0, 0, $B8, $88, $88, $80,	$BB, $BB, $88, $88
		dc.b $77, $7B, $BB, $B8, $DD, $77, $77,	$BB, $CC, $D7, $77, 0, $DD, $77, $70, 0, $D7, $77, 0, 0
		dc.b $D, $C1, $1C, $D7,	0, $DC,	$11, $CD, 0, $D, $CC, $1C, 0, 0, $DD, $CC, 0, 0, 0, $DD
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $7B, $BB, $B7,	$BB, $D7, $77, $7B, $7B
		dc.b $CC, $CC, $CC, $77, $11, $11, $11,	$C7, $CC, $CC, $CC, $CC, $DD, $DD, $DD,	$DD, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $81, $11, $11,	$CD, $B8, $CC, $1C, $DD, $BB, $88, $CC,	$D7, $77, $BB, $DD, 0
		dc.b $CC, $DD, 0, 0, $DD, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $77,	$70, 0,	0
		dc.b $77, 0, 0,	0, $70,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0
byte_2A230:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 8
		dc.b 0,	0, 0, $99, 0, 0, 7, $77, 0, 0, 7, $77, 0, 0, 0,	$F7, 0,	0, 0, $F
		dc.b 0,	9, 0, $FF, 0, 9, $FF, $99, 0, $F, $99, $FF, 0, 0, $FF, $FF, 0, 0, 0, $FF
		dc.b 0,	0, 0, $BB, 0, $B, $B7, $77, 0, $B7, $77, $77, 0, $B7, $77, $77,	0, $B7,	$77, $77
		dc.b 0,	$B, $77, $77, 0, $FF, $B7, $77,	0, $F7,	$9B, $77, $F, $F7, $99,	$BB, $F, $79, $88, $77
		dc.b $F, $79, $98, $97,	$F, $79, $89, $97, $F, $79, $89, $77, 0, $F9, $89, $77,	0, $FF,	$98, $97
		dc.b 0,	$1F, $F7, $7D, 0, $D1, $17, $7D, 0, 0, 0, $FF, 0, 0, 0,	$FF, 0,	8, $88,	$8F
		dc.b $88, $88, $88, $8F, $99, $99, $98,	$87, $99, $98, $87, $7F, $99, $97, $77,	$9C, $77, $77, $78, $FC
		dc.b $77, $78, $8F, $C1, $77, $99, $FD,	$C1, $99, $FD, $CD, $1D, $FF, $FC, $C1,	$11, $FF, $DC, $11, $DD
		dc.b $FF, $DC, $C1, $1C, $FF, $DD, $1C,	$11, $B3, $77, $BB, $C1, $7B, $7B, $7B,	$BC, $7B, $77, $B7, $7B
		dc.b $7B, $F2, $7B, $B7, $7B, $73, $2B,	$8B, $77, $BF, $32, $77, $77, $7B, $32,	$79, $77, $77, $B3, $79
		dc.b $77, $77, $B7, $99, $7B, $BB, $77,	$7D, $7B, $BB, $DD, $DC, $F7, $B8, $BC,	$C1, $77, $7B, $8B, $11
		dc.b $7D, $D7, $B8, $BC, $DD, $CC, $7B,	$8B, $DC, $C1, $CB, $B8, $DC, $11, $CD,	$BB, $F0, 0, 0,	0
		dc.b $FF, $F0, 0, 0, $FF, $FF, 0, 0, $FF, $FF, 0, 0, $FF, $FF, $F0, 0, $FF, $FF, $F0, 0
		dc.b $FF, $CF, $F0, 0, $CF, $F1, $F0, 0, $CC, $CC, $10,	$DD, $1C, $DD, $10, 0, $11, $1D, $C1, 7
		dc.b $D1, $1C, $D1, $D7, $CD, $11, $D1,	$FC, $DD, $CC, $CC, $FC, $1C, $DD, $1C,	$FD, $11, $CB, $BB, $DD
		dc.b $CC, $B7, $BB, $BD, $BB, $BB, $7B,	$B0, $7B, $BB, $BB, $BB, $B7, $7B, $BB,	$BB, $79, $79, $BB, $88
		dc.b $77, $99, $97, $77, $77, $79, $99,	$77, $77, $77, $79, $77, $DD, $DD, $DD,	$77, $CC, $CC, $CC, $DD
		dc.b $11, $11, $11, $CC, $11, $11, $11,	$11, $CC, $11, $11, $11, $DD, $C1, $11,	$11, $BB, $DC, $11, $11
		dc.b $8B, $DC, $11, $11, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $F, 0, 0, 0, $DD
		dc.b 0,	0, $DD,	$CC, 0,	$DD, $CC, $11, $F, $CC,	$11, $CC, $FD, $F1, $CC, $DD, $FC, $FF,	$DD, $DD
		dc.b $FC, $1F, $FD, $DF, $FD, $CC, $FF,	$F0, $B7, $FF, $FF, 0, $11, $97, $70, 0, $D9, $97, $70,	0
		dc.b $7B, $B7, $70, 0, $D7, $77, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $B0, 0, 0, 0
		dc.b $88, $80, 0, 0, $B0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, $70,	0, 0, 0
		dc.b $70, 0, 0,	0, $F0,	0, 0, 0, $DF, 0, 0, 8, $CD, $70, 8, $8B, $CD, $D8, $8B,	$B7
		dc.b $1C, $DB, $B7, $70, $1C, $D7, $70,	0, $1C,	$CD, 0,	0, 0, 0, 0, 0, $C0, 0, 0, 0
		dc.b $DD, 0, 0,	0, $CC,	$D0, 0,	0, $11,	$C0, 0,	0, $CC,	$DD, 0,	0, $DD,	$DD, $F0, 0
		dc.b $DD, $DF, 0, 0, $DF, $F0, 0, 0, $F0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	$B, $BB, $B0
		dc.b $B, $BB, $BB, $BB,	$BB, $77, $77, $77, $B7, $77, $77, $77,	$77, $77, $77, $70, $77, $77, $77, $70
		dc.b 7,	$77, $77, $70, 7, $77, $77, $70, 7, $77, $77, $70, $88,	$77, $77, $70, $BB, $B7, $77, $70
		dc.b $77, 0, $77, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b $CC, $CD, $D1, $DD, 0, $DD, $DD, $CD, $C, $DD, $DD, $D1, 0, 0, $DD, $D1, 0, 0, 0, $C
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $DC, $11, $1C,	$DB, $DC, $11, $11, $CD
		dc.b $DD, $C1, $11, $1C, $DD, $DC, $11,	$11, 0,	$DD, $CC, $C1, 0, 0, $DD, $CC, 0, 0, 0,	$DD
		dc.b 0,	0, 0, 0, $BD, $C1, $11,	$11, $DC, $11, $11, $11, $C1, $11, $11,	$11, $11, $11, $11, $11
		dc.b $11, $11, $1C, $CC, $CC, $CC, $CD,	$DD, $DD, $DD, $D0, 0, 0, 0, 0,	0, $1C,	$DC, $D0, 0
		dc.b $11, $CC, $D0, 0, $11, $CC, $D0, 0, $CC, $DD, 0, 0, $DD, $D0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0
byte_2A530:	dc.b 0,	0, 0, $99, 0, 0, $99, $88, 0, 9, $88, $89, 0, $99, $99,	$87, 7,	$99, $99, $78
		dc.b $77, $79, $97, $9F, $77, $77, $77,	$9C, $F7, $77, $79, $91, $99, 8, $88, $80, $88,	$88, $77, $78
		dc.b $88, $77, $77, $77, $87, $77, $77,	$77, $FF, $FF, $FF, $77, $FD, $DC, $CD,	$FF, $CC, $11, $11, $DF
		dc.b $11, $11, $F1, $1F, 0, 0, 0, 0, 0,	0, 0, 0, $80, 0, 0, 0, $78, 0, 0, 0
		dc.b $78, 0, 0,	0, $77,	$80, 0,	0, $F7,	$80, 0,	0, $F8,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9, 0, 0, 0, $97, 0, 0, 0,	$97
		dc.b 0,	0, 0, $97, 0, 0, 0, 9, 0, 0, 0,	4, 0, 0, 0, $47, 0, 0, 3, $77
		dc.b 0,	0, $34,	$77, 0,	0, $37,	$79, 0,	0, $27,	$77, 0,	2, $24,	$77, 0,	2, $34,	$47
		dc.b 0,	2, $23,	$44, 0,	3, $23,	$34, 0,	4, $33,	$34, 0,	4, $44,	$44, 0,	0, $44,	$44
		dc.b 0,	0, 4, $44, 0, 0, 0, 4, 0, 0, 0,	0, $F, $79, $9F, $1F, 9, $97, $7F, $1F
		dc.b $97, $7F, $FD, $1F, $7F, $FF, $FD,	$1C, $FF, $FF, $FC, $1C, $7F, $FF, $F1,	$11, $77, $77, $DB, $88
		dc.b $99, $77, $78, $BB, $23, $32, $79,	$7B, $77, $43, $27, $77, $98, $94, $32,	$77, $88, $87, $42, $77
		dc.b $98, $88, $89, $99, $99, $88, $88,	$89, $99, $99, $99, $79, $77, $79, $79,	$79, $47, $77, $77, $77
		dc.b $44, $4F, $FF, $FF, $44, $FF, $FF,	$77, $4F, $F7, $77, $79, $F7, $77, $77,	$DD, $F7, $77, $77, $CD
		dc.b $F7, $77, $FC, $DB, $FF, $FF, $CD,	$7B, $1C, $11, $FF, $CC, $FC, $C1, $CC,	$C1, $FC, $C1, $1C, $C1
		dc.b $CC, $CC, $1C, $CC, $CC, $CC, $11,	$CC, $CC, $CC, $1B, $BB, $CC, $CB, $BB,	$BB, $BB, $BB, $BB, $B8
		dc.b $BB, $BB, $BB, $8F, $7B, $88, $88,	$FB, $77, $77, $77, $7D, $77, $79, $98,	$97, $99, $88, $88, $87
		dc.b $88, $99, $98, $97, $99, $99, $77,	$77, $77, $77, $7F, $7F, $7F, $7F, $7D,	$CC, $77, $DD, $D1, $11
		dc.b $7D, $CC, $DD, $11, $DC, $CC, $C8,	$D1, $CC, $CC, $B8, $D1, $DC, $11, $BB,	$8D, $BD, $11, $BB, $8C
		dc.b $8D, $11, $BB, $B8, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $70, 0, 0,	0
		dc.b $B7, 0, 0,	0, $B0,	0, 0, 0, $88, $81, 0, 0, $FF, $F8, $10,	0, $FF,	$81, $11, 0
		dc.b $BB, $11, $1C, 0, $C1, $11, $CC, 0, $DC, $CC, $D0,	0, $DD,	$DD, $1C, 0, $DD, $CC, $CC, $D0
		dc.b $7D, $DD, $CD, 0, $77, $7D, $DD, 0, $DD, $D7, $BB,	0, $CC,	$CC, $77, $B0, $11, $11, $C7, $77
		dc.b $11, $11, $1C, $7B, $11, $11, $1C,	$DB, $11, $11, $11, $CD, $11, $11, $11,	$D1, $C1, $11, $11, $1C
		dc.b 0,	0, 0, 0, $B, $88, 0, 0,	$B8, $88, $88, $80, $BB, $BB, $88, $88,	$77, $7B, $BB, $B8
		dc.b $DD, $77, $77, $BB, $CC, $D7, $77,	0, $DD,	$77, $70, 0, $D, $CC, $CD, $7B,	$D, $C1, $1C, $D7
		dc.b 0,	$DC, $11, $CD, 0, $D, $CC, $1C,	0, 0, $DD, $CC,	0, 0, 0, $DD, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $B8, $88, $BB,	$B8, $7B, $BB, $B7, $BB, $D7, $77, $7B,	$7B, $CC, $CC, $CC, $77
		dc.b $11, $11, $11, $C7, $CC, $CC, $CC,	$CC, $DD, $DD, $DD, $DD, 0, 0, 0, 0, $8C, $11, $11, $1C
		dc.b $81, $11, $11, $CD, $B8, $CC, $1C,	$DD, $BB, $88, $CC, $D7, $77, $BB, $DD,	0, $CC,	$DD, 0,	0
		dc.b $DD, 0, 0,	0, 0, 0, 0, 0, $D7, $77, 0, 0, $77, $70, 0, 0, $77, 0, 0, 0
		dc.b $70, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
byte_2A7B0:	dc.b 0,	0, 0, $99, 0, 0, $99, $88, 0, $99, $88,	$89, 9,	$99, $99, $88, 9, $99, $99, $87
		dc.b $77, $99, $77, $9F, $77, $77, $79,	$7C, $F7, $77, $97, $F1, $99, $90, 0, 0, $88, $88, $88,	$88
		dc.b $88, $77, $77, $77, $77, $77, $77,	$77, $FF, $FF, $FF, $77, $FD, $DC, $CD,	$FF, $CC, $11, $11, $DF
		dc.b $11, $11, $F1, $1F, 0, 0, 0, 0, 0,	0, 0, 0, $88, 0, 0, 0, $77, $80, 0, 0
		dc.b $77, $78, 0, 0, $77, $78, 0, 0, $F7, $78, 0, 0, $F7, $80, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, 9
		dc.b 0,	0, 0, 9, 0, 0, 0, 0, 0,	0, 0, 4, 0, 0, 0, $47, 0, 0, 3,	$77
		dc.b 0,	0, $34,	$77, 0,	0, $37,	$79, 0,	0, $27,	$77, 0,	2, $24,	$77, 0,	2, $34,	$47
		dc.b 0,	2, $23,	$44, 0,	3, $23,	$34, 0,	4, $33,	$34, 0,	4, $44,	$44, 0,	0, $44,	$44
		dc.b 0,	0, 4, $44, 0, 0, 0, 4, 0, 0, 0,	0, $F, $79, $9F, $1F, $F, $97, $7F, $1F
		dc.b 9,	$7F, $FD, $1F, $9F, $FF, $FD, $1C, $FF,	$FF, $FC, $1C, $7F, $FF, $F1, $11, $77,	$77, $DB, $88
		dc.b $99, $77, $78, $BB, $23, $32, $79,	$7B, $77, $43, $27, $77, $98, $94, $32,	$77, $88, $87, $42, $77
		dc.b $98, $88, $89, $99, $99, $88, $88,	$89, $99, $99, $99, $79, $77, $79, $79,	$79, $47, $77, $77, $77
		dc.b $44, $4F, $FF, $FF, $44, $FF, $FF,	$77, $4F, $F7, $77, $79, $F7, $77, $77,	$DD, $F7, $77, $77, $CD
		dc.b $F7, $77, $FC, $DB, $FF, $FF, $CD,	$7B, $1C, $11, $FF, $CC, $FC, $C1, $CC,	$C1, $FC, $C1, $1C, $C1
		dc.b $CC, $CC, $1C, $CC, $CC, $CC, $11,	$CC, $CC, $CC, $1B, $BB, $CC, $CB, $BB,	$BB, $BB, $BB, $BB, $B8
		dc.b $BB, $BB, $BB, $8F, $7B, $88, $88,	$FB, $77, $77, $77, $7D, $77, $79, $98,	$97, $99, $88, $88, $87
		dc.b $88, $99, $98, $97, $99, $99, $77,	$77, $77, $77, $7F, $7F, $7F, $7F, $7D,	$CC, $77, $DD, $D1, $11
		dc.b $7D, $CC, $DD, $11, $DC, $CC, $C8,	$D1, $CC, $CC, $B8, $D1, $DC, $11, $BB,	$8D, $BD, $11, $BB, $8C
		dc.b $8D, $11, $BB, $B8, $88, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, $70, 0, 0, 0
		dc.b $B7, 0, 0,	0, $B0,	0, 0, 0, $88, $81, 0, 0, $FF, $F8, $10,	0, $FF,	$81, $11, 0
		dc.b $BB, $11, $1C, 0, $C1, $11, $CC, 0, $DC, $CC, $D0,	0, $DD,	$DD, $1C, 0, $DD, $CC, $CC, $D0
		dc.b $7D, $DD, $CD, 0, $77, $7D, $DD, 0, $DD, $D7, $BB,	0, $CC,	$CC, $77, $B0, $11, $11, $C7, $77
		dc.b $11, $11, $1C, $7B, $11, $11, $1C,	$DB, $11, $11, $11, $CD, $11, $11, $11,	$D1, $C1, $11, $11, $1C
		dc.b 0,	0, 0, 0, $B, $88, 0, 0,	$B8, $88, $88, $80, $BB, $BB, $88, $88,	$77, $7B, $BB, $B8
		dc.b $DD, $77, $77, $BB, $CC, $D7, $77,	0, $DD,	$77, $70, 0, $D, $CC, $CD, $7B,	$D, $C1, $1C, $D7
		dc.b 0,	$DC, $11, $CD, 0, $D, $CC, $1C,	0, 0, $DD, $CC,	0, 0, 0, $DD, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $B8, $88, $BB,	$B8, $7B, $BB, $B7, $BB, $D7, $77, $7B,	$7B, $CC, $CC, $CC, $77
		dc.b $11, $11, $11, $C7, $CC, $CC, $CC,	$CC, $DD, $DD, $DD, $DD, 0, 0, 0, 0, $8C, $11, $11, $1C
		dc.b $81, $11, $11, $CD, $B8, $CC, $1C,	$DD, $BB, $88, $CC, $D7, $77, $BB, $DD,	0, $CC,	$DD, 0,	0
		dc.b $DD, 0, 0,	0, 0, 0, 0, 0, $D7, $77, 0, 0, $77, $70, 0, 0, $77, 0, 0, 0
		dc.b $70, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
byte_2AA30:	dc.b 0,	0, 0, 0, 0, 0, $E, 0, 0, 0, $E,	$EE, 0,	0, $E, $EE, 0, 0, $E, $EE
		dc.b 0,	0, $E, $EE, 0, 0, 0, $EE, 0, 0,	0, $7E,	0, 0, $77, $77,	7, $77,	$77, $77
		dc.b $77, $77, $77, $70, $77, $7B, $B0,	0, $77,	$BB, $BB, 0, $77, $BB, $77, $77, 7, $7B, $BB, $BB
		dc.b 0,	$77, $BB, $BB, 0, 0, 0,	0, 0, 0, 0, $E,	$EE, $EE, $EE, $ED, $EE, $DD, $DD, $DC
		dc.b $EE, $DD, $CC, $C1, $EE, $DC, $C1,	$11, $EE, $DD, $CC, $11, $EE, $ED, $DC,	$CC, $EE, $EE, $DD, $DD
		dc.b $E, $EE, $EE, $EE,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0
		dc.b $BB, 0, 0,	0, $B0,	0, 0, 0, 0, 0, $11, 0, $EE, $C1, $11, $11, $DD,	$CC, $DE, $D1
		dc.b $CC, $CD, $EB, $BB, $1C, $DE, $77,	$7B, $11, $CD, $E7, $77, $11, $CC, $CE,	$EE, $CC, $DD, $DE, 0
		dc.b $DD, $EE, $E0, 0, $EE, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $B0, 0, 0, 0, $BB, 0, 0, 0, $7B, $BB, 0, 0, $77, $7B, $B0, 0
		dc.b 0,	$77, $BB, 0, 0,	7, $7B,	$B0, 0,	0, $77,	$BB, 0,	0, $7B,	$BB, 0,	0, $7B,	$BB
		dc.b 0,	0, $7B,	$BB, 0,	0, 7, $BB, 0, 0, 0, $77, 0, 0, 0, 7, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $B0, 0, 0, 0, $BB, 0, 0, 0, $BB, $BB, 0, 0, $BB, $BB, $B0, $77
		dc.b $BB, $BB, $77, $77, $77, $77, $77,	$70
byte_2AB50:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $EE, 0, 0, $E, $EE
		dc.b 0,	0, $E, $EE, 0, 0, $EE, $EE, 0, 0, $EE, $EE, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, $E0, 0, 0, 0, $EE, 0, 0, 0, $EE, $EE, 0, 0, $EE, $EE, $E0, 0
		dc.b $ED, $DD, $EE, 0, 0, 0, $EE, $EE, 0, $77, $EE, $EE, 7, $77, $7E, $EE, $77,	$77, $7E, $EE
		dc.b $77, $77, $77, $EE, $77, $77, $77,	$77, 7,	$77, $77, $7B, 0, $B7, $77, $B0, 0, $B,	$BB, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $DC, $CC, $DE, $EE, $DC, $C1, $1D,	$DD, $DC, $C1, $11, $CD
		dc.b $ED, $C1, $1C, $DE, $ED, $CC, $1C,	$DE, $EE, $DD, $DD, $DE, 0, $EE, $EE, $EE, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 7, 0,	0, 0, $7B, 0, 0, 0, $7B, 0, 0, 0, $7B
		dc.b 0,	0, 0, $7B, 0, 0, 0, $77, 0, 0, 0, 7, $EE, $ED, $DD, 0, $DD, $D1, $11, 0
		dc.b $EE, $DC, $10, 0, $77, $ED, $C0, 0, $7B, $BE, 0, 0, $7B, $B0, 0, 0, $E7, $B0, 0, 0
		dc.b 7,	$BB, 0,	0, $77,	$BB, 0,	0, $7B,	$B7, 0,	0, $B7,	$7B, 0,	0, $BB,	$BB, 0,	0
		dc.b $BB, $BB, 0, 0, $BB, $BB, $B0, $77, $BB, $BB, $B7,	$77, $77, $77, $77, $70
byte_2AC50:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	$EE, 0,	0, 0, $EE, $E0,	0, 0, $EE, $EE,	0, 7, $EE, $EE,	$EE, $77, $EE, $EE, $DD
		dc.b $77, $EE, $EE, $DE, $77, $7E, $EE,	$E7, $77, $7E, $EE, $E7, 7, $77, $EE, $E7, 0, 0, $E, $EE
		dc.b 0,	0, 0, 0, 0, 0, 0, 7, 0,	0, 0, $7B, 0, 0, 7, $BB, 0, 0, 7, $BB
		dc.b 0,	0, 7, $BB, 0, 0, 7, $BB, 0, 0, 7, $BB, 0, 0, 0,	$77, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, $E, $EE, $EE,	$EE, $ED, $DD, $DD, $DD, $D1, $ED, $CC,	$11, $1D
		dc.b $7E, $DC, $CD, $DE, $BB, $ED, $DE,	$E7, $BB, $EE, $E7, $77, $7B, $B0, $77,	$77, $77, $B0, 0, $77
		dc.b $77, $B0, 0, 0, $BB, $70, 0, 0, $77, $B0, 0, 0, $BB, $B0, 0, 0, $BB, $B0, 0, 0
		dc.b $BB, $BB, 7, $70, $BB, $BB, $77, $70, $77,	$77, $77, 0, $D0, 0, 0,	0, $D7,	0, 0, 0
		dc.b $BB, $B0, 0, 0, $BB, $BB, $B0, 0, $BB, $BB, $B0, 0, $7B, $BB, 0, 0, $77, $77, 0, 0
		dc.b $77, 0, 0,	0
byte_2AD30:	dc.b 0,	0, $E0,	0, 0, 0, $EE, $EE, 0, 0, $EE, $EE, 0, 0, $EE, $BB, 0, 0, $E7, $7B
		dc.b 0,	0, $EE,	$77, 0,	0, $E, $7B, 0, 0, 7, $7B, 0, 0,	0, $DD,	$EE, $ED, $DD, $CC
		dc.b $EE, $DC, $CC, $11, $EE, $DC, $C1,	$11, $BE, $DC, $CC, $11, $BE, $DD, $CC,	$CC, $BE, $ED, $DD, $CC
		dc.b $EE, $EE, $ED, $DD, $DD, $DD, $D0,	0, $CC,	$11, $CD, $D0, $11, $1C, $DE, $ED, $11,	$CD, $EB, $BB
		dc.b $11, $CD, $E7, $7B, $11, $CD, $DE,	$77, $DD, $DE, $EE, 0, $EE, $E0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $B0, 0, 0, 0, $7B, $B0, 0, 0
		dc.b $77, $BB, 0, 0, 7,	$7B, $B0, 0, 0,	0, $77,	$BB, 0,	7, $BB,	$B7, 0,	$7B, $B7, $7B
		dc.b 0,	$7B, $BB, $BB, 0, $7B, $BB, $BB, 0, $7B, $BB, $BB, 0, $77, $BB,	$BB, 0,	7, $77,	$77
		dc.b $EE, $EE, $EE, $EE, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $B0, $77, 0, 0, $B7, $77, 0, 0, $77, $70, 0, 0, 0,	$77, $B0, 0, 0,	$77, $BB, 0
		dc.b 0,	$77, $BB, $B0, 0, $7B, $BB, $BB, 0, $7B, $BB, $BB, 0, 7, $BB, $B7, 0, 0, $7B, $BB
		dc.b 0,	0, 7, $BB, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b $B0, 0, 0,	0, $77,	$70, 0,	0, $BB,	$BB, $B0, 0, $BB, $BB, 0, 0
byte_2AE30:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, $E0, 0, 0, $E, $EE, 0, 0,	$E, $EE, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $E0, 0, 0,	0
		dc.b $EE, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	7
		dc.b 0,	0, 0, $7B, 0, 0, 7, $BB, 0, 0, $7B, $BB, 0, 7, $BB, $BB, 0, 0, $E, $EE
		dc.b 0,	0, $EE,	$EE, $77, 0, $EE, $EE, $B7, $70, $EE, $EE, $BB,	$77, $E7, $BE, $7B, $B7, $7B, $BE
		dc.b $B7, $BB, $BB, $EE, $BB, $77, $70,	0, $EE,	$E0, 0,	0, $EE,	$EE, $DD, $DD, $EE, $DD, $DC, $CC
		dc.b $ED, $DC, $CC, $11, $ED, $CC, $CC,	$11, $ED, $CC, $CC, $C1, $EE, $DD, $DD,	$CC, $EE, $EE, $ED, $DD
		dc.b 0,	0, 0, 0, $DD, $DD, $10,	0, $CC,	$C1, $10, 0, $11, $11, $10, 0, $1C, $CC, 0, 0
		dc.b $CD, $DD, 0, 0, $DE, $E0, 0, 0, $EB, $B0, 0, 0, 0,	$7B, $BB, $BB, 7, $BB, $BB, $BB
		dc.b $7B, $BB, $BB, $B0, $7B, $BB, $BB,	$B0, $7B, $BB, $BB, $B0, 7, $BB, $BB, 0, 0, $7B, $BB, 0
		dc.b 0,	0, 0, 0, 0, $E,	$EE, $EE, 0, 0,	7, $77,	0, 0, $77, $BB,	0, 0, $77, $BB
		dc.b 0,	0, $7B,	$BB, 0,	0, $7B,	$BB, 0,	0, 7, $BB, 0, 0, 0, $7B, $77, $BB, 0, 0
		dc.b $BB, $B7, 0, 0, $77, $70, 0, 0, $B0, 0, 0,	0, $BB,	0, 0, 0, $77, $77, 0, 0
		dc.b $BB, $BB, $BB, 0, $BB, $BB, $B0, 0
byte_2AF50:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b $E, 0, 0, 0, $EE, $E0, 0, 0, $EE, $EE, 0, 0, $EE, $EE, $EB, $BE, $EE, $EE,	$77, $BB
		dc.b $E, $77, $77, $7B,	7, $BB,	$B7, $7B, $7B, $BB, $7B, $BB, $7B, $BB,	$B7, $77, $7B, $BB, $BB, $B7
		dc.b $7B, $BB, $BB, $B0, $77, $BB, $BB,	$B0, 0,	$77, $BB, $B7, 0, 0, $77, $77, 0, 0, $77, $BB
		dc.b 0,	0, $77,	$BB, 0,	0, $77,	$BB, 0,	0, 7, $7B, 0, 0, 0, $77, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 1, $11, $DC, $C1, $11, $11, $DD,	$C1, $11, $10, $DD, $CC, $11, $D0
		dc.b $7D, $CC, $CD, 0, $7D, $DD, $DD, 0, $DD, $DD, $D0,	0, $EE,	$E0, 0,	0, $7B,	$B0, 0,	0
		dc.b $77, $BB, 0, 0, $BB, $B7, 0, 0, $77, $70, 0, 0, $B0, 0, 0,	0, $BB,	0, 0, 0
		dc.b $77, $70, $77, 0, $BB, $B7, $77, 0, $77, $77, $70,	0
byte_2B010:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $77
		dc.b 0,	0, 0, $77, 0, 0, 0, $F,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $77
		dc.b 0,	0, 7, $77, 0, 0, $77, $7F, 0, 0, $7F, $FF, 0, 0, 7, $77, 0, 0, 0, 0
		dc.b 0,	0, 4, $44, 0, 0, $88, $99, 8, $88, $99,	$77, $89, $99, $99, $88, $99, $99, $88,	$77
		dc.b $79, $99, $77, $79, $77, $77, $77,	$88, $77, $77, $88, $FC, $FF, $79, $9F,	$DC, $79, $9F, $DC, $DC
		dc.b $9F, $FF, $CC, $1C, $FF, $FD, $C1,	$1C, $FF, $FD, $CC, $1C, $FF, $FD, $11,	$1C, $70, 7, $BB, $C1
		dc.b 0,	$B, $7B, $BC, $44, 7, $B7, $7B,	$90, 0,	0, 0, $88, $90,	0, 0, $77, $79,	$99, 0
		dc.b $77, $77, $99, $80, $88, $88, $88,	$88, $CC, $F7, $98, $88, $11, $CD, $77,	$98, $CC, $DD, $1D, $79
		dc.b $CC, $CD, $1D, $79, $CC, $CD, $1C,	$90, $CC, $CD, $1C, 0, $C1, $FD, $1F, 0, $CF, $FD, $1F,	0
		dc.b $CF, $FB, $BB, $70, $CC, $BB, $BB,	$BB, $BB, $BB, $BB, $88, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $90, 0, 0, 0, $90, 0, 0, 0
		dc.b $90, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 8, $80, 0, 0, $87, $7B, 0, 0, $77, $70, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 3, 0, 0, 0, 4, 0,	0, 0, 4
		dc.b 0,	0, 0, 4, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, $D, 0, 0, $C1, $CD, 0, 0, $C,	$1C, 0,	0, $D, $CC
		dc.b 0,	0, $D, $DC, 0, 0, 0, $D, 0, 0, 0, $D, 0, 0, 0, 0, 0, 0,	0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 7, 0, 4, $42, $44, 4, $22, $44, $2F
		dc.b $42, $33, $24, $F9, $33, $33, $2F,	$99, $33, $33, $47, $79, $43, $34, $F7,	$77, $44, $44, $FF, $7F
		dc.b $44, $4F, $7F, $FF, 4, $4F, $F7, $77, 0, $FD, $FF,	$F7, $DD, $CC, $CF, $F7, $DC, $11, $11,	$FF
		dc.b $C1, $11, $11, $1F, $C1, $11, $11,	$11, $11, $11, $11, $11, $11, $11, $11,	$11, $11, $11, $11, $11
		dc.b $C1, $11, $11, $11, $CC, $CC, $11,	$11, $DD, $DD, $C1, $11, $D7, $7B, $DC,	$11, 7,	$BB, $DC, $CC
		dc.b $7B, $BB, $DD, $DD, $BB, $B0, 0, 0, $44, $4D, $7B,	$B7, $77, $44, $D1, $7B, $99, $74, $CC,	0
		dc.b $88, $97, $79, $77, $99, $89, $77,	$79, $77, $98, $97, $98, $99, $99, $98,	$89, $F7, $79, $99, $99
		dc.b $FF, $77, $79, $97, $9F, $F7, $77,	$7F, $99, $9F, $FF, $F9, $F7, $98, $99,	$89, $FF, $F7, $89, $F7
		dc.b $1F, $FF, $FF, $FF, $11, $1C, $CD,	$DD, $11, $11, $1C, $CC, $11, $11, $11,	$1C, $11, $11, $11, $1C
		dc.b $11, $11, $11, $CD, $11, $11, $1C,	$CD, $11, $CC, $CD, $D0, $CC, $DD, $D0,	0, $DD,	0, 0, 0
		dc.b 0,	0, 0, 0, $7B, $CC, $CC,	$77, $B7, $C1, $1C, $C0, $C, $D1, $11, $C0, $7C, $C1, $1C, $C0
		dc.b $97, $DC, $CC, $D0, $89, $77, $DD,	0, $98,	$7F, 0,	0, $97,	$F0, 0,	0, $FF,	0, 0, 0
		dc.b $F7, 0, 0,	0, $77,	0, 0, 0, $77, 0, 0, 0, $F0, 0, 0, 0, $D0, 0, 0,	0
		dc.b $DB, $BB, $B0, 0, $D7, $BB, $BB, 0, $D7, $77, $BB,	$B0, $D0, 0, $7B, $B0, 0, 0, $BB, $B0
		dc.b 0,	$B, $BB, 0, $77, $BB, $B0, 0, $7B, $BB,	$B0, 0,	$7B, $BB, $BB, 0, 7, $BB, $BB, $B0
		dc.b $77, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 7, 0,	0, 0, $7B
		dc.b 0,	0, 7, $7B, 0, 7, $77, $BB, 0, $77, $7B,	$B0, 0,	$7B, $BB, $B0, 0, $7B, $BB, $B0
		dc.b 7,	$BB, $BB, $B0, $BB, 0, 0, 0, $B0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 7,	$BB, $BB, $B0
		dc.b 7,	$BB, $BB, $BB, 0, $7B, $BB, $BB, 0, $7B, $BB, $BB, 0, $7B, $BB,	$BB, 0,	$7B, $BB, $BB
		dc.b 0,	$7B, $BB, $B0, 0, $7B, $B0, 0, 7, $BB, $BB, $B0, $7B, $BB, $BB,	$B0, $7B, $BB, $BB, $B0
		dc.b $7B, $BB, $BB, 0, $7B, $BB, $B0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
byte_2B330:	dc.b 0,	0, 0, 0, 0, 0, 8, $89, 0, 0, $88, $88, 0, 8, $89, $99, 0, $99, $99, $97
		dc.b 7,	$79, $97, $77, 7, $77, $77, $77, $F, $F7, $77, $9F, 0, 0, 0, 0,	$99, $79, 0, 0
		dc.b $89, $97, $79, $98, $97, $77, $99,	$FF, $77, $DD, $FF, $FF, $7D, $11, $DF,	$FC, $9C, $11, $1C, $CC
		dc.b $D1, $1C, $CD, $C1, 0, 0, 0, 0, 0,	0, 0, 0, $88, $90, 0, 0, $FF, $89, 0, 0
		dc.b $FF, $90, 0, 0, $F9, 0, 0,	0, $F0,	0, 0, 0, $D0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 9, 0, 0, 0, 9, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, $44, 0, 0, 4,	$44, 0,	0, 4, $43, 0, 0, $44, $F7
		dc.b 0,	0, $4F,	$79, 0,	0, $4F,	$99, 0,	0, $4F,	$79, 0,	0, $4F,	$79, 0,	0, $4F,	$37
		dc.b 0,	0, 4, $F3, 0, 0, 0, $4F, 0, 0, 0, $F, 0, 0, 0, $F, 0, 0, 0, $F
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, $F,	$99, $FD, 9, $99, $FF, $D1
		dc.b $9F, $FF, $FF, $D1, $FF, $FF, $FD,	$DC, $FF, $FF, $DD, $DC, 0, $FF, $FD, $CC, $44,	$37, $7D, $D1
		dc.b $44, $77, $77, $DB, $33, $22, $77,	$7B, $33, $33, $27, $77, $77, $73, $23,	$77, $97, $77, $32, $99
		dc.b $77, $FF, $11, $D9, $9F, $D1, $CD,	$1D, $FD, $11, $11, $CD, $FD, $11, $CC,	$1D, $FF, $DD, $CC, $D7
		dc.b $FF, $FF, $DD, $79, $F7, $99, $99,	$89, $F7, $99, $99, $9F, $F7, $77, $FF,	$FD, $FF, $FF, $DD, $DC
		dc.b $DD, $DC, $11, $CD, $DD, $C1, $1C,	$DB, $11, $CC, $CC, $D1, $11, $CC, $CC,	$D1, $11, $CC, $CC, $D1
		dc.b $11, $CC, $1F, $D1, $11, $CC, $FF,	$BB, $11, $CC, $FF, $BB, $BB, $1C, $BB,	$BB, $BB, $BB, $BB, $BB
		dc.b $BF, $FB, $BB, $B7, $7B, $FF, $FF,	$B7, $77, $BF, $FF, $FB, $77, $7B, $FF,	$FB, $97, $77, $BB, $B7
		dc.b $97, $77, $77, $7F, $77, $77, $77,	$99, $79, $77, $99, $98, $78, $98, $88,	$8F, $98, $99, $FF, $FD
		dc.b $FF, $FF, $DD, $D1, $DD, $DD, $11,	$11, $11, $11, $11, $11, $C1, $11, $11,	$11, $DC, $11, $11, $11
		dc.b $BD, $11, $11, $11, $D0, 0, 0, 0, $C0, 0, 0, 0, $C0, 0, 0,	0, $F0,	0, 0, 0
		dc.b $F7, 0, 0,	0, $B7,	0, 0, 0, $BB, $88, $80,	0, $B8,	$77, $7B, 0, $70, 0, 0,	0
		dc.b $77, $C1, $C0, 0, $7C, $CC, $1C, 0, $7D, $CC, $C1,	$D0, $77, $DC, $C1, $10, $77, $7D, $CC,	$C0
		dc.b $9F, $D7, $DD, $D0, $8F, $DD, 0, 0, $FD, $1D, 0, 0, $D1, $11, $D0,	0, $11,	$11, $D0, 0
		dc.b $11, $11, $D0, 0, $11, $11, $D0, 0, $11, $11, $DB,	0, $11,	$11, $DB, $B0, $11, $1D, $7B, $B0
		dc.b $D, $C1, $1C, $DB,	$D, $CC, $1C, $C7, 0, $DC, $C1,	$CC, 0,	$D, $DC, $CC, 0, 0, $77, $7B
		dc.b 0,	0, $7B,	$BB, 0,	0, $7B,	$B7, 0,	0, 7, $BB, $BB,	$11, $11, $11, $BB, $B1, $11, $11
		dc.b $BB, $B1, $11, $11, $7B, $B1, $11,	$1C, $BB, $BC, $CC, $DD, $BB, $DD, $DD,	0, $77,	$B0, 0,	0
		dc.b $BB, $BB, 0, 0, $11, $CD, $7B, $B0, $1C, $D7, $BB,	$BB, $1C, $D7, $BB, $BB, $CD, $7B, $BB,	$BB
		dc.b $D7, $7B, $BB, $BB, 7, $BB, $BB, $BB, 0, 0, 0, $BB, 0, 0, 0, 0, 0,	0, 0, $7B
		dc.b 0,	0, 0, $7B, 0, 0, 0, $7B, 0, 0, 7, $BB, 0, 0, 7,	$BB, 0,	0, $7B,	$BB
		dc.b 0,	7, $BB,	0, 0, 0, 0, 0, $BB, $BB, 0, 0, $BB, $BB, 0, 0, $BB, $BB, 0, 0
		dc.b $BB, $B0, 0, 0, $BB, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
byte_2B5B0:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 8, $89, 0, 0, $88, $88, 0, 8, $89, $99
		dc.b 0,	$99, $99, $97, 7, $79, $97, $77, 7, $77, $77, $77, 0, $F, $79, $90, 0, 0, $9F, $79
		dc.b $97, $79, $8F, $F7, $89, $97, $78,	$F7, $97, $77, $89, $FF, $77, $DD, $FF,	$FF, $7D, $11, $DF, $FC
		dc.b $DC, $11, $1D, $CC, 0, 0, 0, 0, $90, 0, 0,	0, $99,	0, 0, 0, $79, 0, 0, 0
		dc.b $77, 0, 0,	0, $FF,	0, 0, 0, $F0, 0, 0, 0, $F0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 9, 0,	0, 0, $9F, 0, 0, 9, $FF, 0, 0, 0, $9F
		dc.b 0,	0, 0, 4, 0, 0, 4, $44, 0, 0, 4,	$47, 0,	9, $9D,	$1C, 9,	$99, $D1, $C1
		dc.b $99, $9D, $C1, $11, $99, $FF, $DC,	$CC, $99, $9F, $FD, $DD, $F9, $97, $FF,	$79, $F7, $77, $77, $77
		dc.b $F, $77, $77, $77,	0, $FF,	$FF, $77, 0, 0,	$44, $4F, 0, 0,	4, $4F,	0, 0, 0, $4F
		dc.b 0,	0, 0, 4, 0, 0, 0, 0, 0,	0, 0, 0, $F, $F7, $77, $77, 0, $F, $F9,	$9D
		dc.b $99, $99, $9F, $DC, $FF, $FF, $FF,	$DC, $FF, $FF, $FD, $DC, $FF, $FF, $DD,	$DC, $43, $FF, $FD, $CC
		dc.b $33, $32, $79, $D1, $77, $33, $27,	$7B, $C9, $93, $32, $7B, $11, $C7, $32,	$77, $CC, $C9, $93, $27
		dc.b $FC, $D9, $73, $27, $FD, $97, $33,	$27, $99, $73, $32, $79, $79, $43, $39,	$79, $44, $44, $77, $99
		dc.b $44, $77, $79, $99, $F7, $99, $99,	$77, $77, $99, $97, $DD, $F9, $99, $77,	$CD, $F7, $77, $FC, $DB
		dc.b $FF, $FF, $CD, $7B, $D, $CC, $CD, $7B, $DC, $1C, $CC, $D1,	$C1, $CC, $CC, $D1, $11, $CC, $CC, $D1
		dc.b $11, $CC, $CC, $D1, $11, $CC, $1F,	$D1, $11, $CC, $FF, $BB, $C1, $CC, $FF,	$BB, $BB, $1C, $BB, $BB
		dc.b $BB, $BB, $BB, $BB, $BF, $FB, $BB,	$B7, $BF, $FF, $FB, $77, $7B, $FF, $FF,	$B7, $7B, $FF, $FF, $B7
		dc.b $7B, $FF, $FF, $B7, $77, $BB, $BB,	$7F, $97, $77, $7D, $CC, $97, $DD, $D1,	$11, $7D, $CC, $11, $11
		dc.b $DC, $11, $11, $11, $CC, $11, $11,	$11, $DC, $11, $11, $11, $BD, $C1, $11,	$11, $8D, $CC, $BB, $81
		dc.b $B8, $88, $8B, $B8, $D0, 0, 0, 0, $D0, 0, 0, 0, $C0, 0, 0,	0, $C0,	0, 0, 0
		dc.b $F0, 0, 0,	0, $F7,	0, 0, 0, $B7, 0, 0, 0, $BB, $88, $80, 0, $B8, $77, $7B,	0
		dc.b $7C, $C0, 0, 0, $CC, $C1, $C0, 0, $DC, $CC, $1C, 0, $DD, $CC, $CC,	$D0, $7D, $DD, $CD, 0
		dc.b $70, $D, $DD, 0, $DD, $DD,	0, 0, $CC, $CC,	$D0, 0,	$11, $11, $CD, 0, $11, $11, $1C, $D0
		dc.b $11, $11, $1C, $DD, $11, $11, $11,	$C1, $11, $11, $11, $11, $11, $11, $11,	$11, $CC, $11, $11, $1C
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $DD, 0, 0,	0
		dc.b $1C, $D0, 0, 0, $CD, 0, 0,	0, $D0,	0, 0, 0, $D, $C1, $1C, $D7, 0, $DC, $11, $CD
		dc.b 0,	$D, $CC, $1C, 0, 0, $DD, $CC, 0, 0, 0, $DD, 0, 0, 0, 0,	0, 0, 0, 0
		dc.b 0,	0, 0, 0, $7B, $BB, $BB,	$BB, $D7, $77, $BB, $7B, $CC, $CB, $77,	$BB, $11, $1C, $BB, $BB
		dc.b $CC, $CC, $BB, $BB, $DD, $DD, $BB,	$BB, 0,	0, $BB,	$BB, 0,	$B, $BB, $B0, $81, $11,	$11, $CD
		dc.b $B8, $CC, $1C, $DD, $BB, $CC, $CC,	$D0, $BB, $BD, $DD, 0, $BB, $BD, $D0, 0, $BB, $BD, $70,	$B
		dc.b $BB, $7B, $B0, $77, 0, $77, $B7, $77, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $BB, $BB, 0, 0, $77, $BB, $B0, 0, $77, $77, $BB, 0
		dc.b 0,	7, $B7,	$77, 0,	7, $77,	$77, 0,	7, $77,	$77, 0,	7, $77,	$70, 0,	0, $77,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, $77, $77, $BB,	0, $77,	$70, 0,	0
		dc.b $70, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0
byte_2B870:	dc.b 0,	0, 0, 0, 0, 0, 8, $89, 0, 8, $89, $99, 0, $89, $99, $98, 9, $99, $99, $89
		dc.b $77, $79, $99, $77, $77, $77, $77,	$77, $F, $77, $77, $99,	0, 0, 0, $99, $90, 0, 9, $77
		dc.b $77, $98, $99, $77, $99, $77, $89,	$F7, $77, $78, $9F, $F7, $7D, $DF, $FF,	$FF, $D1, $1D, $FF, $CF
		dc.b $C1, $11, $DC, $CF, 0, 0, 0, 0, $90, 0, 0,	0, $79,	0, 0, 0, $79, 0, 0, 0
		dc.b $77, 0, 0,	0, $F7,	0, 0, 0, $70, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, $77, 0, 0, 0,	$7F
		dc.b 0,	0, 0, 0, 0, 0, 0, 4, 0,	0, 0, $44, 0, 9, $99, $F7, 0, $99, $9D,	$1C
		dc.b 9,	$9D, $D1, $C1, $99, $7D, $C1, $11, $79,	$77, $DC, $CC, $79, $9F, $FD, $DD, $F7,	$97, $FF, $79
		dc.b $F, $77, $77, $77,	0, $F, $FF, $77, 0, 0, 4, $FF, 0, 0, 4,	$4F, 0,	0, 4, $4F
		dc.b 0,	0, 0, $44, 0, 0, 0, 0, 0, 0, 0,	0, 0, $FF, $79,	$9F, 0,	$79, $9F, $DC
		dc.b 7,	$9F, $FF, $CC, $77, $FF, $FD, $C1, $7F,	$FF, $FD, $CC, $FF, $FF, $FD, $11, $F, $FF, $F7, $BB
		dc.b $42, $FF, $FD, $7B, $44, $32, $79,	$B7, $77, $33, $27, $9B, $C9, $93, $32,	$97, $11, $C7, $32, $98
		dc.b $CC, $C9, $93, $F9, $FC, $D9, $73,	$7F, $FD, $97, $33, $7F, $99, $73, $32,	$99, $79, $33, $39, $99
		dc.b $33, $F3, $77, $98, $FF, $77, $79,	$98, $77, $77, $99, $89, $77, $99, $98,	$99, $F7, $99, $99, $DD
		dc.b $F9, $97, $DD, $CC, $F9, $77, $CC,	$11, $11, $CC, $CD, $1D, $1C, $CC, $CD,	$1D, $1C, $CC, $CD, $1C
		dc.b $1C, $CC, $CD, $1C, $1C, $C1, $FD,	$1F, $1C, $CF, $FD, $1F, $C1, $CF, $FB,	$BB, $BC, $CC, $BB, $BB
		dc.b $7B, $BB, $BB, $BB, $B7, $FB, $BB,	$BB, $7B, $BF, $FF, $77, $FF, $7B, $FF,	$B7, $89, $F7, $BB, $BF
		dc.b $FF, $9F, $78, $9F, $98, $99, $F8,	$F9, $79, $87, $F9, $F9, $97, $97, $7F,	$99, $97, $78, $DD, $DD
		dc.b $99, $DD, $CC, $CC, $8D, $CC, $11,	$11, $DC, $11, $11, $11, $C1, $11, $11,	$11, $11, $11, $11, $11
		dc.b $11, $11, $11, $11, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, $70, 0, 0, 0, 0, 8, $80, 0, $BB, $87, $7B, 0, $88, $77, $70, 0
		dc.b $77, $70, 0, 0, 0,	0, 0, 0, $90, 0, 0, 0, $98, $90, 0, 0, $99, $89, 0, 0
		dc.b $99, $98, 0, 0, $79, $99, $90, 0, $79, $99, $70, 0, $D7, $97, $DD,	0, $CD,	$DD, $DC, $D0
		dc.b $11, $CD, $CC, $D0, $11, $1C, $DC,	$D0, $11, $1C, $DC, $D0, $11, $11, $CD,	0, $11,	$11, $CD, 0
		dc.b 7,	$FC, $1C, $CC, $F, $C1,	$CD, $BB, 0, $11, $D7, $BB, $D,	$C1, $D7, $BB, $D, $C1,	$1D, $77
		dc.b 0,	$DC, $11, $CC, 0, $DD, $CC, $DD, 0, $D,	$DB, $BB, 0, 0,	$B, $7B, 0, 0, 7, $B7
		dc.b 0,	0, 7, $7B, 0, 0, 0, $7B, 0, 0, 0, $7B, 0, 0, 0,	7, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $11, $11, $11,	$11, $CC, $11, $11, $11, $BC, $11, $11,	$11, $BB, $11, $11, $11
		dc.b $BB, $B1, $11, $11, $7B, $BB, $11,	$11, $7B, $BB, $11, $11, $7B, $B7, $11,	$CC, $BB, $77, $CC, $DD
		dc.b $77, $BB, $DD, $DD, $BB, $BB, $B0,	0, $BB,	$BB, $BB, $B0, $BB, $BB, $77, $7B, $BB,	$B7, $77, $70
		dc.b $7B, $77, $77, 0, 7, $77, 0, 0, $11, $11, $CD, 0, $11, $11, $CD, 0, $11, $11, $CD,	$D0
		dc.b $11, $11, $CD, $CD, $11, $11, $1C,	$CD, $11, $11, $CC, $D0, $11, $CC, $DD,	0, $CC,	$DD, $B0, 0
		dc.b $DD, $DB, $BB, 0, 0, $7B, $BB, 0, 0, 7, $BB, 0, 0,	7, $BB,	$B0, 0,	0, $7B,	$B0
		dc.b 0,	0, $7B,	$B0, 0,	7, $7B,	$B0, 0,	$7B, $7B, $B0, 0, $7B, $BB, $B0, 0, $7B, $BB, $BB
		dc.b 0,	$7B, $BB, $BB, 0, $77, $BB, $BB, 0, 7, $77, $77, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $BB, 0, 0,	0
		dc.b $77, $77, $70, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
byte_2BB50:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, $96
		dc.b 0,	0, 9, $88, 0, 0, $99, $99, 0, 7, $77, $99, 0, 7, $77, $77, 0, 0, $7F, $FF
		dc.b 0,	0, $F, $F7, 0, 0, $F7, $99, 0, 7, $99, $FF, 0, 7, $9F, $FF, 0, $79, $FF, $FF
		dc.b 0,	$9F, $FF, $FF, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 6, $88, $88,	$90
		dc.b $88, $97, $78, $89, $77, $99, $87,	$77, $99, $97, $77, $77, $97, $77, $96,	$68, $77, $76, $6D, $D6
		dc.b $79, $6F, $CC, $CD, $99, $FC, $11,	$1C, $FD, $DC, $DD, $11, $FD, $CC, $11,	$D1, $DC, $C1, $1D, $DD
		dc.b $DC, $C1, $DC, $CD, $DD, $CC, $CC,	$C1, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $96, $60, 0, 0, $79, $69, $90, 0, $88, $88, $90, 0
		dc.b $99, $68, $89, 0, $DD, $69, $89, 0, $C1, $D9, $99,	0, $CC,	$D1, 0,	0, $1D,	$1D, 0,	0
		dc.b $11, $1D, 0, 0, $C1, $CD, 0, 0, $DD, $D7, 0, 0, 0,	$9F, $FF, $FF, 0, $F, $FF, $F0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 3, 0, 0, 0, $33, 0, 0, 3,	$32
		dc.b 0,	0, 3, $22, 0, $D, $DC, $32, 0, $DC, $CF, $77, $D, $CC, $F7, $99, $D, $C1, $F9, $97
		dc.b $DC, $C1, $F7, $99, $DC, $11, $F7,	$9F, $DC, $11, $D3, $7F, $DC, $11, $1D,	$3F, $D1, $1C, $C1, $1C
		dc.b $7B, $B1, $1C, $CB, $B7, $77, $BB,	$BB, 7,	$BB, $77, $BB, $32, $37, $BB, $77, $23,	$99, $CC, $97
		dc.b $37, $79, $9C, $C9, $32, $27, $99,	$1C, $33, $32, $77, $99, $77, $32, $37,	$77, $77, $73, $29, $97
		dc.b $7F, $F1, $1D, $99, $FD, $1C, $D1,	$D9, $D1, $11, $1C, $D7, $D1, $1C, $C1,	$D7, $FD, $DC, $CD, $77
		dc.b $BB, $B0, 0, $88, $BB, $BB, $B8, $77, $BB,	$B8, $87, $77, $BB, $B7, $77, $70, $77,	$70, 0,	0
		dc.b $30, 0, 0,	0, $92,	0, 0, 0, $73, $27, $97,	$70, $C7, $32, $98, $99, $99, $73, $29,	$87
		dc.b $77, $93, $27, $9F, $97, $79, $32,	$7F, $99, $79, $32, $7D, $99, $77, $73,	$FF, $98, $97, $98, $70
		dc.b $88, $97, $98, $70, 0, 0, 0, 0, $B0, 0, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $70, 0, 0,	0
		dc.b $7F, $11, $DD, 0, $FC, $DC, $1D, $D0, $C1,	$DD, $DC, $D0, $C1, $D1, $1C, $D0, $DC,	$C1, $CC, 0
		dc.b 0,	$DD, $D0, 0, 0,	0, 0, 0, $DC, $11, $11,	$DD, $DC, $11, $1C, $CC, $D, $C1, $CB, $BC
		dc.b $D, $CC, $BB, $BB,	0, $DD,	$DB, $BB, 0, $D, $D7, $BB, 0, $77, $77,	$BB, 7,	$B7, $BB, $BB
		dc.b $FF, $FD, $D7, $99, $F7, $97, $77,	$98, $1F, $77, $99, $98, $C1, $FF, $77,	$99, $B1, $1D, $F7, $79
		dc.b $BC, $1C, $DD, $77, $BC, $CC, $CC,	$CC, $DD, $CC, $CC, $CD, $98, $87, $88,	$70, $88, $97, $89, $70
		dc.b $89, $97, $87, $70, $89, $78, $87,	0, $77,	$99, $77, 0, $77, $77, $D0, 0, $DD, $CC, 0, 0
		dc.b $BB, $D0, 0, 0, $7B, $BB, $77, $7B, $7B, $BB, $BB,	$BB, $7B, $BB, $BB, $BB, $7B, $BB, $BB,	$BB
		dc.b $7B, $BB, $BB, $BB, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $D, $DD, $DD, $77
		dc.b $B0, 0, $7B, $BB, $B0, 0, $7B, $BB, $BB, 0, 7, $BB, $BB, $B0, 7, $BB, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, $B0, 0, 0,	0, $BB,	$B0, 0,	0, $BB,	$BB, $B0, 0
		dc.b $BB, $BB, $BB, $B0, $BB, $BB, $BB,	$BB, 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0, $B0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0
off_2BDF0:	dc.w byte_2BDF8-off_2BDF0
		dc.w byte_2BE04-off_2BDF0
		dc.w byte_2BE10-off_2BDF0
		dc.w byte_2BE1C-off_2BDF0
byte_2BDF8:	dc.b 3,	1, 0, $30, 0, $3C, 0, $48, 0, $3C, 0, $54
byte_2BE04:	dc.b 3,	1, $80,	$24, $80, $30, $80, $3C, $80, $30, $80,	$48
byte_2BE10:	dc.b 3,	1, 0, $48, 0, $54, 0, $60, 0, $54, 0, $6C
byte_2BE1C:	dc.b 3,	1, $80,	$3C, $80, $48, $80, $54, $80, $48, $80,	$60, 0,	$2B, $2B, $2C
		dc.b $2C, 0, $F8, $D, 0, 0, 0, 0, 0, $2B, $2B, $2C, $2C, 0, $F8, $D
		dc.b 0,	8, 0, 0, 0, $2B, $2B, $2C, $2C,	0, $F8,	$D, 0, $10, 0, 0
		dc.b 0,	$28, $28, $29, $29, 0, $F8, 5, 0, $18, 0, 0, 0,	$2D, $2D, $2D
		dc.b $2D, 0, 0,	7, 0, $1C, $F8,	0, 0, $2D, $2D,	$2D, $2D, 0, 0,	7
		dc.b 0,	$24, $F8, 0, 0,	$2D, $2D, $2D, $2D, 0, 0, 7, 0,	$2C, $F8, 0
		dc.b 0,	$23, $23, $24, $24, 0, 0, 5, 0,	$34, $F8, 0
off_2BE88:	dc.w byte_2BE8A-off_2BE88
byte_2BE8A:	dc.b 2,	8, 0, 8, 0, $14, 0, $20, 0, $25, $25, $25, $25,	0, $FC,	0
		dc.b 0,	0, $FC,	0, 0, $25, $25,	$25, $25, 0, $FC, 0, 0,	1, $FC,	0
		dc.b 0,	$25, $25, $25, $25, 0, $FC, 0, 0, 2, $FC, 0
off_2BEB6:	dc.w byte_2BEBE-off_2BEB6
		dc.w byte_2BEC6-off_2BEB6
		dc.w byte_2BECE-off_2BEB6
		dc.w byte_2BED6-off_2BEB6
byte_2BEBE:	dc.b 2,	8, $80,	$1E, $80, $2A, $80, $36
byte_2BEC6:	dc.b 2,	8, 0, $16, 0, $22, 0, $2E
byte_2BECE:	dc.b 2,	8, 0, $3E, 0, $4A, 0, $26
byte_2BED6:	dc.b 1,	8, 0, $1E, 0, $2A, 0, $25, $25,	$25, $25, 0, $FC, 0, 0,	0
		dc.b $FC, 0, 0,	$26, $26, $26, $26, 0, $F8, 5, 0, 1, $F8, 0, 0,	$27
		dc.b $27, $27, $27, 0, $F4, $A,	0, 5, $F4, 0, 0, $27, $27, $27,	$27, 0
		dc.b $F4, $A, 0, $E, $F4, 0, 0,	$25, $25, $25, $25, 0, $FC, 0, 0, $17
		dc.b $FC, 0, 0,	$26, $26, $26, $26, 0, $F8, 5, 0, $18, $F8, 0
nemesis_02BF24:
    binclude "src/nemesis/data_02BF24.bin"
    align 2, 0
nemesis_02C1E6:
    binclude "src/nemesis/data_02C1E6.bin"
    align 2, 0
nemesis_02C23C:
    binclude "src/nemesis/data_02C23C.bin"
    align 2, 0
enigma_02C3B8:
    binclude "src/enigma/data_02C3B8.bin"
    align 2, 0
enigma_02C470:
    binclude "src/enigma/data_02C470.bin"
    align 2, 0
enigma_02C572:
    binclude "src/enigma/data_02C572.bin"
    align 2, 0
nemesis_02C68E:
    binclude "src/nemesis/data_02C68E.bin"
    align 2, 0
nemesis_02CD86:
    binclude "src/nemesis/data_02CD86.bin"
    align 2, 0
nemesis_02D2BA:
    binclude "src/nemesis/data_02D2BA.bin"
    align 2, 0
nemesis_02D6EE:
    binclude "src/nemesis/data_02D6EE.bin"
    align 2, 0
nemesis_030566:
    binclude "src/nemesis/data_030566.bin"
    align 2, 0
enigma_030598:
    binclude "src/enigma/data_030598.bin"
    align 2, 0
enigma_030620:
    binclude "src/enigma/data_030620.bin"
    align 2, 0
nemesis_030946:
    binclude "src/nemesis/data_030946.bin"
    align 2, 0
enigma_0315A2:
    binclude "src/enigma/data_0315A2.bin"
    align 2, 0
enigma_0315D4:
    binclude "src/enigma/data_0315D4.bin"
    align 2, 0
enigma_031608:
    binclude "src/enigma/data_031608.bin"
    align 2, 0
enigma_031616:
    binclude "src/enigma/data_031616.bin"
    align 2, 0
nemesis_031620:
    binclude "src/nemesis/data_031620.bin"
    align 2, 0
nemesis_031BF8:
    binclude "src/nemesis/data_031BF8.bin"
    align 2, 0
nemesis_031E84:
    binclude "src/nemesis/data_031E84.bin"
    align 2, 0

enigma_032200:
    binclude "src/enigma/data_032200.bin"
    align 2, 0
enigma_0325F2:
    binclude "src/enigma/data_0325F2.bin"
    align 2, 0
enigma_032802:
    binclude "src/enigma/data_032802.bin"
    align 2, 0
kosinski_032B4C:
    binclude "src/kosinski/data_032B4C.bin"
    align 2, 0
kosinski_03320C:
    binclude "src/kosinski/data_03320C.bin"
    align 2, 0
kosinski_03335C:
    binclude "src/kosinski/data_03335C.bin"
    align 2, 0
kosinski_0338FC:
    binclude "src/kosinski/data_0338FC.bin"
    align 2, 0
kosinski_033A1C:
    binclude "src/kosinski/data_033A1C.bin"
    align 2, 0
kosinski_033DCC:
    binclude "src/kosinski/data_033DCC.bin"
    align 2, 0
enigma_033F3C:
    binclude "src/enigma/data_033F3C.bin"
    align 2, 0
enigma_03439E:
    binclude "src/enigma/data_03439E.bin"
    align 2, 0
enigma_034420:
    binclude "src/enigma/data_034420.bin"
    align 2, 0
enigma_034486:
    binclude "src/enigma/data_034486.bin"
    align 2, 0
enigma_0344CE:
    binclude "src/enigma/data_0344CE.bin"
    align 2, 0
kosinski_0345C0:
    binclude "src/kosinski/data_0345C0.bin"
    align 2, 0
kosinski_0348A0:
    binclude "src/kosinski/data_0348A0.bin"
    align 2, 0
kosinski_034980:
    binclude "src/kosinski/data_034980.bin"
    align 2, 0
kosinski_034BB0:
    binclude "src/kosinski/data_034BB0.bin"
    align 2, 0
kosinski_034FE0:
    binclude "src/kosinski/data_034FE0.bin"
    align 2, 0
kosinski_035170:
    binclude "src/kosinski/data_035170.bin"
    align 2, 0
enigma_035200:
    binclude "src/enigma/data_035200.bin"
    align 2, 0
enigma_03535C:
    binclude "src/enigma/data_03535C.bin"
    align 2, 0
enigma_035474:
    binclude "src/enigma/data_035474.bin"
    align 2, 0
enigma_035688:
    binclude "src/enigma/data_035688.bin"
    align 2, 0
kosinski_035772:
    binclude "src/kosinski/data_035772.bin"
    align 2, 0
kosinski_035A62:
    binclude "src/kosinski/data_035A62.bin"
    align 2, 0
kosinski_035AE2:
    binclude "src/kosinski/data_035AE2.bin"
    align 2, 0
kosinski_035FC2:
    binclude "src/kosinski/data_035FC2.bin"
    align 2, 0
kosinski_036052:
    binclude "src/kosinski/data_036052.bin"
    align 2, 0
kosinski_036382:
    binclude "src/kosinski/data_036382.bin"
    align 2, 0
kosinski_0364E2:
    binclude "src/kosinski/data_0364E2.bin"
    align 2, 0
kosinski_036752:
    binclude "src/kosinski/data_036752.bin"
    align 2, 0
kosinski_036BD2:
    binclude "src/kosinski/data_036BD2.bin"
    align 2, 0
kosinski_036ED2:
    binclude "src/kosinski/data_036ED2.bin"
    align 2, 0
kosinski_036F02:
    binclude "src/kosinski/data_036F02.bin"
    align 2, 0
enigma_036FA2:
    binclude "src/enigma/data_036FA2.bin"
    align 2, 0
enigma_037368:
    binclude "src/enigma/data_037368.bin"
    align 2, 0
enigma_037500:
    binclude "src/enigma/data_037500.bin"
    align 2, 0
enigma_037672:
    binclude "src/enigma/data_037672.bin"
    align 2, 0
kosinski_037856:
    binclude "src/kosinski/data_037856.bin"
    align 2, 0
kosinski_037D46:
    binclude "src/kosinski/data_037D46.bin"
    align 2, 0
kosinski_037E66:
    binclude "src/kosinski/data_037E66.bin"
    align 2, 0
kosinski_0385C6:
    binclude "src/kosinski/data_0385C6.bin"
    align 2, 0
kosinski_0386D6:
    binclude "src/kosinski/data_0386D6.bin"
    align 2, 0
kosinski_038876:
    binclude "src/kosinski/data_038876.bin"
    align 2, 0
kosinski_038C46:
    binclude "src/kosinski/data_038C46.bin"
    align 2, 0
kosinski_038E26:
    binclude "src/kosinski/data_038E26.bin"
    align 2, 0
enigma_038F76:
    binclude "src/enigma/data_038F76.bin"
    align 2, 0
enigma_0392F6:
    binclude "src/enigma/data_0392F6.bin"
    align 2, 0
enigma_0394D2:
    binclude "src/enigma/data_0394D2.bin"
    align 2, 0
kosinski_03951A:
    binclude "src/kosinski/data_03951A.bin"
    align 2, 0
kosinski_039B5A:
    binclude "src/kosinski/data_039B5A.bin"
    align 2, 0
kosinski_039BBA:
    binclude "src/kosinski/data_039BBA.bin"
    align 2, 0
kosinski_039DDA:
    binclude "src/kosinski/data_039DDA.bin"
    align 2, 0
kosinski_03A5CA:
    binclude "src/kosinski/data_03A5CA.bin"
    align 2, 0
kosinski_03A70A:
    binclude "src/kosinski/data_03A70A.bin"
    align 2, 0
enigma_03A77A:
    binclude "src/enigma/data_03A77A.bin"
    align 2, 0
enigma_03AAA8:
    binclude "src/enigma/data_03AAA8.bin"
    align 2, 0
kosinski_03ACDA:
    binclude "src/kosinski/data_03ACDA.bin"
    align 2, 0
kosinski_03B06A:
    binclude "src/kosinski/data_03B06A.bin"
    align 2, 0
kosinski_03B19A:
    binclude "src/kosinski/data_03B19A.bin"
    align 2, 0
kosinski_03B33A:
    binclude "src/kosinski/data_03B33A.bin"
    align 2, 0
kosinski_03B4CA:
    binclude "src/kosinski/data_03B4CA.bin"
    align 2, 0
kosinski_03B7EA:
    binclude "src/kosinski/data_03B7EA.bin"
    align 2, 0
kosinski_03BBAA:
    binclude "src/kosinski/data_03BBAA.bin"
    align 2, 0
kosinski_03BDBA:
    binclude "src/kosinski/data_03BDBA.bin"
    align 2, 0
kosinski_03BE9A:
    binclude "src/kosinski/data_03BE9A.bin"
    align 2, 0
enigma_03BF4A:
    binclude "src/enigma/data_03BF4A.bin"
    align 2, 0
enigma_03C1AA:
    binclude "src/enigma/data_03C1AA.bin"
    align 2, 0
enigma_03C27C:
    binclude "src/enigma/data_03C27C.bin"
    align 2, 0
enigma_03C2EA:
    binclude "src/enigma/data_03C2EA.bin"
    align 2, 0
kosinski_03C388:
    binclude "src/kosinski/data_03C388.bin"
    align 2, 0
kosinski_03C528:
    binclude "src/kosinski/data_03C528.bin"
    align 2, 0
kosinski_03C6A8:
    binclude "src/kosinski/data_03C6A8.bin"
    align 2, 0
kosinski_03CB88:
    binclude "src/kosinski/data_03CB88.bin"
    align 2, 0
kosinski_03CCF8:
    binclude "src/kosinski/data_03CCF8.bin"
    align 2, 0
kosinski_03CE58:
    binclude "src/kosinski/data_03CE58.bin"
    align 2, 0
kosinski_03CF58:
    binclude "src/kosinski/data_03CF58.bin"
    align 2, 0
kosinski_03D428:
    binclude "src/kosinski/data_03D428.bin"
    align 2, 0
kosinski_03D5A8:
    binclude "src/kosinski/data_03D5A8.bin"
    align 2, 0
kosinski_03D6C8:
    binclude "src/kosinski/data_03D6C8.bin"
    align 2, 0
kosinski_03D778:
    binclude "src/kosinski/data_03D778.bin"
    align 2, 0
enigma_03D978:
    binclude "src/enigma/data_03D978.bin"
    align 2, 0
enigma_03DCD4:
    binclude "src/enigma/data_03DCD4.bin"
    align 2, 0
enigma_03DDF2:
    binclude "src/enigma/data_03DDF2.bin"
    align 2, 0
enigma_03DFC6:
    binclude "src/enigma/data_03DFC6.bin"
    align 2, 0
enigma_03E184:
    binclude "src/enigma/data_03E184.bin"
    align 2, 0
enigma_03E2A6:
    binclude "src/enigma/data_03E2A6.bin"
    align 2, 0
kosinski_03E446:
    binclude "src/kosinski/data_03E446.bin"
    align 2, 0
kosinski_03F0F6:
    binclude "src/kosinski/data_03F0F6.bin"
    align 2, 0
kosinski_03F196:
    binclude "src/kosinski/data_03F196.bin"
    align 2, 0
kosinski_03F316:
    binclude "src/kosinski/data_03F316.bin"
    align 2, 0
kosinski_03F486:
    binclude "src/kosinski/data_03F486.bin"
    align 2, 0
kosinski_03FA36:
    binclude "src/kosinski/data_03FA36.bin"
    align 2, 0
kosinski_03FC66:
    binclude "src/kosinski/data_03FC66.bin"
    align 2, 0
kosinski_03FD76:
    binclude "src/kosinski/data_03FD76.bin"
    align 2, 0
enigma_100000:
    binclude "src/enigma/data_100000.bin"
    align 2, 0
enigma_10012A:
    binclude "src/enigma/data_10012A.bin"
    align 2, 0
enigma_1002E4:
    binclude "src/enigma/data_1002E4.bin"
    align 2, 0
enigma_100514:
    binclude "src/enigma/data_100514.bin"
    align 2, 0
kosinski_100594:
    binclude "src/kosinski/data_100594.bin"
    align 2, 0
kosinski_101294:
    binclude "src/kosinski/data_101294.bin"
    align 2, 0
kosinski_101924:
    binclude "src/kosinski/data_101924.bin"
    align 2, 0
kosinski_101A64:
    binclude "src/kosinski/data_101A64.bin"
    align 2, 0
kosinski_101E44:
    binclude "src/kosinski/data_101E44.bin"
    align 2, 0
kosinski_1025B4:
    binclude "src/kosinski/data_1025B4.bin"
    align 2, 0
kosinski_102744:
    binclude "src/kosinski/data_102744.bin"
    align 2, 0
		align 2, 0
nemesis_102A00:
    binclude "src/nemesis/data_102A00.bin"
    align 2, 0
nemesis_1034B4:
    binclude "src/nemesis/data_1034B4.bin"
    align 2, 0
nemesis_1039F6:
    binclude "src/nemesis/data_1039F6.bin"
    align 2, 0
nemesis_1041EA:
    binclude "src/nemesis/data_1041EA.bin"
    align 2, 0
nemesis_104370:
    binclude "src/nemesis/data_104370.bin"
    align 2, 0
nemesis_10593E:
    binclude "src/nemesis/data_10593E.bin"
    align 2, 0
nemesis_1061D6:
    binclude "src/nemesis/data_1061D6.bin"
    align 2, 0
nemesis_1068A0:
    binclude "src/nemesis/data_1068A0.bin"
    align 2, 0
nemesis_106A34:
    binclude "src/nemesis/data_106A34.bin"
    align 2, 0
nemesis_106FC4:
    binclude "src/nemesis/data_106FC4.bin"
    align 2, 0
nemesis_1071D4:
    binclude "src/nemesis/data_1071D4.bin"
    align 2, 0
nemesis_107AFA:
    binclude "src/nemesis/data_107AFA.bin"
    align 2, 0
nemesis_10812A:
    binclude "src/nemesis/data_10812A.bin"
    align 2, 0
nemesis_108C16:
    binclude "src/nemesis/data_108C16.bin"
    align 2, 0
nemesis_1092BC:
    binclude "src/nemesis/data_1092BC.bin"
    align 2, 0
nemesis_1093E6:
    binclude "src/nemesis/data_1093E6.bin"
    align 2, 0
nemesis_10A2AE:
    binclude "src/nemesis/data_10A2AE.bin"
    align 2, 0
nemesis_10A810:
    binclude "src/nemesis/data_10A810.bin"
    align 2, 0
nemesis_10AFDC:
    binclude "src/nemesis/data_10AFDC.bin"
    align 2, 0
nemesis_10B5B8:
    binclude "src/nemesis/data_10B5B8.bin"
    align 2, 0
nemesis_10C436:
    binclude "src/nemesis/data_10C436.bin"
    align 2, 0
nemesis_10CADC:
    binclude "src/nemesis/data_10CADC.bin"
    align 2, 0
nemesis_10CF40:
    binclude "src/nemesis/data_10CF40.bin"
    align 2, 0
nemesis_10D6A0:
    binclude "src/nemesis/data_10D6A0.bin"
    align 2, 0
nemesis_10DE54:
    binclude "src/nemesis/data_10DE54.bin"
    align 2, 0
nemesis_10E9E4:
    binclude "src/nemesis/data_10E9E4.bin"
    align 2, 0
nemesis_10ED2A:
    binclude "src/nemesis/data_10ED2A.bin"
    align 2, 0
nemesis_10F300:
    binclude "src/nemesis/data_10F300.bin"
    align 2, 0
nemesis_10F6B4:
    binclude "src/nemesis/data_10F6B4.bin"
    align 2, 0
nemesis_10FB88:
    binclude "src/nemesis/data_10FB88.bin"
    align 2, 0
nemesis_10FF98:
    binclude "src/nemesis/data_10FF98.bin"
    align 2, 0
nemesis_11044C:
    binclude "src/nemesis/data_11044C.bin"
    align 2, 0
nemesis_1111F0:
    binclude "src/nemesis/data_1111F0.bin"
    align 2, 0
nemesis_11174C:
    binclude "src/nemesis/data_11174C.bin"
    align 2, 0
nemesis_1117EA:
    binclude "src/nemesis/data_1117EA.bin"
    align 2, 0
nemesis_1122C8:
    binclude "src/nemesis/data_1122C8.bin"
    align 2, 0
nemesis_112728:
    binclude "src/nemesis/data_112728.bin"
    align 2, 0
nemesis_112D44:
    binclude "src/nemesis/data_112D44.bin"
    align 2, 0
nemesis_1135BC:
    binclude "src/nemesis/data_1135BC.bin"
    align 2, 0
nemesis_113C5E:
    binclude "src/nemesis/data_113C5E.bin"
    align 2, 0

nemesis_enemy_tiles_38:
    binclude "src/enemies/38/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_47:
    binclude "src/enemies/47/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_64:
    binclude "src/enemies/64/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_54:
    binclude "src/enemies/54/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_67:
    binclude "src/enemies/67/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_58:
    binclude "src/enemies/58/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_66:
    binclude "src/enemies/66/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_59:
    binclude "src/enemies/59/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_1:
    binclude "src/enemies/01/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_2:
    binclude "src/enemies/02/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_9:
    binclude "src/enemies/09/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_10:
    binclude "src/enemies/10/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_15:
    binclude "src/enemies/15/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_3:
    binclude "src/enemies/03/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_4:
    binclude "src/enemies/04/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_6:
    binclude "src/enemies/06/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_5:
    binclude "src/enemies/05/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_11:
    binclude "src/enemies/11/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_7:
    binclude "src/enemies/07/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_8:
    binclude "src/enemies/08/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_13:
    binclude "src/enemies/13/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_19:
    binclude "src/enemies/19/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_18:
    binclude "src/enemies/18/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_14:
    binclude "src/enemies/14/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_22:
    binclude "src/enemies/22/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_16:
    binclude "src/enemies/16/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_12:
    binclude "src/enemies/12/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_17:
    binclude "src/enemies/17/nemesis_tiles.bin"
    align 2, 0
off_119FAA:	dc.w byte_119FAE-off_119FAA
		dc.w byte_119FB4-off_119FAA
byte_119FAE:	dc.b 1,	$14, 0,	$C, 0, $21
byte_119FB4:	dc.b 1,	$3C, 0,	$30, 0,	$4A, 2,	$32, $32, $32, $32, 0, $D0, $D,	0, 0
		dc.b $F0, $E0, $F, 0, 8, $F0, $E0, 5, 0, $18, $F8, 2, $32, $32,	$32, $32
		dc.b 0,	$D0, $D, 0, 0, $F0, $E0, $F, 0,	8, $F0,	$E0, 5,	0, $3F,	$F8
		dc.b 3,	$32, $32, $32, $32, 0, $C8, 9, 0, $1C, $F4, $D8, $E, 0,	$22, $F4
		dc.b $F0, $D, 0, $2E, $EC, $D8,	2, 0, $43, $EC,	3, $32,	$32, $32, $32, 0
		dc.b $C8, 9, 0,	$1C, $F4, $D8, $E, 0, $22, $F4,	$F0, $D, 0, $2E, $EC, $D8
		dc.b $A, 0, $36, $DC
off_11A018:	dc.w byte_11A01C-off_11A018
		dc.w byte_11A022-off_11A018
byte_11A01C:	dc.b 1,	$14, 0,	$A, 0, $60
byte_11A022:	dc.b 0,	0, 0, $B0, $F, $56, $56, $56, $56, 0, $C0, $A, $20, 0, $F8, $D8
		dc.b 5,	$20, 9,	0, $E8,	$C, $20, $D, $F0, $D8, 4, $20, $11, $F0, $E0, 8
		dc.b $20, $13, $E8, $E8, $E, 0,	$4B, $E8, $E8, 6, 0, $57, 8, $F0, $D, $20
		dc.b $5D, $A8, $B8, $E,	$20, $25, $20, $B8, $A,	$28, $25, $40, $D0, 0, $20, $31
		dc.b $38, $D0, $F, 0, $33, $38,	$F0, $D, 0, $43, $38, $D0, 0, $20, $32,	$68
		dc.b $D0, $F, $20, $33,	$68, $F0, $D, $20, $43,	$68, $F, $56, $56, $56,	$56, 0
		dc.b $C0, $A, $20, $1C,	$F8, $D8, 5, $20, 9, 0,	$E8, $C, $20, $D, $F0, $D8
		dc.b 4,	$20, $11, $F0, $E0, 8, $20, $13, $E8, $E8, $E, 0, $4B, $E8, $E8, 6
		dc.b 0,	$57, 8,	$F0, $D, $20, $5D, $A8,	$B8, $E, $20, $25, $20,	$B8, $A, $28
		dc.b $25, $40, $D0, 0, $20, $31, $38, $D0, $F, 0, $33, $38, $F0, $D, 0,	$43
		dc.b $38, $D0, 0, $20, $32, $68, $D0, $F, $20, $33, $68, $F0, $D, $20, $43, $68
		dc.b 0,	0, 0, 0, 0, 0, $F0, 5, 0, $65, $B0, 0
off_11A0DE:	dc.w byte_11A0EE-off_11A0DE
		dc.w byte_11A0F8-off_11A0DE
		dc.w byte_11A102-off_11A0DE
		dc.w byte_11A10C-off_11A0DE
		dc.w byte_11A116-off_11A0DE
		dc.w byte_11A120-off_11A0DE
		dc.w byte_11A12A-off_11A0DE
		dc.w byte_11A134-off_11A0DE
byte_11A0EE:	dc.b 3,	2, 0, $50, 0, $5B, $80,	$50, $80, $5B
byte_11A0F8:	dc.b 3,	2, $80,	$46, $80, $51, 0, $46, 0, $51
byte_11A102:	dc.b 3,	2, 0, $52, 0, $5D, $80,	$52, $80, $5D
byte_11A10C:	dc.b 3,	2, $80,	$48, $80, $53, 0, $48, 0, $53
byte_11A116:	dc.b 3,	2, 0, $54, 0, $5F, $80,	$54, $80, $5F
byte_11A120:	dc.b 3,	2, $80,	$4A, $80, $55, 0, $4A, 0, $55
byte_11A12A:	dc.b 3,	2, 0, $56, 0, $61, $80,	$56, $80, $61
byte_11A134:	dc.b 3,	2, $80,	$4C, $80, $57, 0, $4C, 0, $57, 0, 0, $EC, 0, $EC, 0
		dc.b $F0, $F, 0, 0, $F0, 0, 0, $EC, 0, $EC, 0, $F0, $F,	0, $10,	$F0
		dc.b 0,	0, $ED,	0, $ED,	0, $F4,	$A, 0, $20, $F4, 0, 0, $ED, 0, $ED
		dc.b 0,	$F4, $A, 0, $29, $F4, 0, 0, $EE, 0, $EE, 0, $F8, 5, 0, $32
		dc.b $F8, 0, 0,	$EE, 0,	$EE, 0,	$F8, 5,	0, $36,	$F8, 0,	0, $EF,	0
		dc.b $EF, 0, $FC, 0, 0,	$3A, $FC, 0, 0,	$EF, 0,	$EF, 0,	$FC, 0,	0
		dc.b $3B, $FC
off_11A196:	dc.w byte_11A1A2-off_11A196
		dc.w byte_11A1AC-off_11A196
		dc.w byte_11A1B6-off_11A196
		dc.w byte_11A1C4-off_11A196
		dc.w byte_11A1D2-off_11A196
		dc.w byte_11A1DE-off_11A196
byte_11A1A2:	dc.b 3,	$A, 0, $DB, 0, $C1, 0, $A7, 0, $C1
byte_11A1AC:	dc.b 3,	$A, $80, $D1, $80, $B7,	$80, $9D, $80, $B7
byte_11A1B6:	dc.b 5,	4, 0, $E1, 0, $F6, 0, $E1, 1, $B, 1, $20, 1, $B
byte_11A1C4:	dc.b 5,	4, $80,	$D3, $80, $E8, $80, $D3, $80, $FD, $81,	$12, $80, $FD
byte_11A1D2:	dc.b 4,	8, 0, $18, 0, $32, 0, $47, 0, $5C, 0, $6C
byte_11A1DE:	dc.b 4,	8, $80,	$C, $80, $26, $80, $3B,	$80, $50, $80, $60, 3, $A5, $A7, $A6
		dc.b $A8, 0, $D0, $F, 0, 0, $EC, $F0, 9, 0, $10, $EC, $D8, 2, 0, $16
		dc.b $C, $F8, 4, 0, $19, 4, 2, $A5, $A9, $A6, $C5, 0, $D0, 9, 0, $1B
		dc.b $EC, $E0, $F, 0, $21, $EC,	$E8, 2,	0, $31,	$C, 2, 0, 0, 0,	0
		dc.b 0,	$D8, 8,	0, $34,	$EC, $E0, $F, 0, $37, $EC, $E8,	2, 0, $47, $C
		dc.b 1,	0, 0, 0, 0, 0, $E0, 4, 0, $4A, $FC, $E8, $E, 0,	$4C, $F4
		dc.b 0,	0, 0, 0, 0, 0, $F8, $C,	0, $58,	$F4, 3,	$A5, 0,	$A5, 0
		dc.b 0,	$D0, 4,	0, $5C,	$F4, $D8, $F, 0, $5E, $EC, $F8,	$C, 0, $6E, $EC
		dc.b $E0, 2, 0,	$72, $C, 3, $A5, 0, $A5, 0, 0, $D0, 8, 0, $75, $EC
		dc.b $D8, $F, 0, $78, $EC, $F8,	8, 0, $88, $EC,	$E0, 2,	0, $8B,	$C, 3
		dc.b $A5, 0, $A5, 0, 0,	$D0, 4,	0, $8E,	$F4, $D8, $F, 0, $90, $EC, $F8
		dc.b $C, 0, $A0, $EC, $E0, 2, 0, $A4, $C, 2, $A5, $C6, $A5, $C7, 0, $D0
		dc.b 9,	0, $1B,	$EC, $E0, $F, 0, $A7, $EC, $E0,	$C, 0, $B7, $F4, 2, $A5
		dc.b $C6, $A6, $C7, 0, $D0, 9, 0, $1B, $EC, $E0, $F, 0,	$A7, $EC, $E0, $C
		dc.b 0,	$B7, 4,	2, $A5,	$E2, $A6, $E3, 0, $D0, 9, 0, $1B, $EC, $E0, $F
		dc.b 0,	$A7, $EC, $E8, $C, 0, $B7, $F4,	2, $A5,	$E2, $A6, $E3, 0, $D0, 9
		dc.b 0,	$1B, $EC, $E0, $F, 0, $A7, $EC,	$E8, $C, 0, $B7, 4, 0
off_11A2EC:	dc.w byte_11A2F0-off_11A2EC
		dc.w byte_11A2F8-off_11A2EC
byte_11A2F0:	dc.b 2,	$A, 0, $10, 0, $1B, 0, $26
byte_11A2F8:	dc.b 2,	$A, 0, $1E, 0, $13, 0, 8, 0, $4D, $4D, $4D, $4D, 0, $E8, $F
		dc.b 0,	0, $F0,	0, $4D,	$4D, $4D, $4D, 0, $E8, $F, 0, $10, $F0,	0, $4D
		dc.b $4D, $4D, $4D, 0, $E8, $F,	0, $20,	$F0, 0
off_11A322:	dc.w byte_11A324-off_11A322
byte_11A324:	dc.b 5,	$14, 0,	$E, 0, $E, 0, $E, 0, $1E, 0, $E, 0, $1E, 1, $A0
		dc.b $A0, $A0, $A0, 0, $F0, $D,	0, 0, $E0, $F0,	$D, 0, 8, 0, 1,	$A0
		dc.b $A0, $A0, $A0, 0, $F0, $D,	0, $10,	$E0, $F0, $D, 0, $18, 0
off_11A352:	dc.w byte_11A356-off_11A352
		dc.w byte_11A370-off_11A352
byte_11A356:	dc.b $B, 5, 0, $2F, 0, $3A, 0, $2F, 0, $3A, 0, $2F, 0, $3A, 0, $24
		dc.b 0,	$24, 0,	$45, 0,	$3A, 0,	$24, 0,	$24
byte_11A370:	dc.b 3,	5, 0, $2B, 0, $20, 0, $A, 0, $A, 0, 0, 0, 0, 0,	0
		dc.b $E0, 0, 0,	0, $F0,	0, 0, 0, 0, 0, 0, $F0, $D, 0, 1, $F0
		dc.b 0,	0, 0, 0, 0, 0, $F0, $D,	8, 1, $F0, 0, 0, 0, 0, 0
		dc.b 0,	$E8, $E, 0, 9, $F0
off_11A3A6:	dc.w byte_11A3AE-off_11A3A6
		dc.w byte_11A3B2-off_11A3A6
		dc.w byte_11A3B6-off_11A3A6
		dc.w byte_11A3BC-off_11A3A6
byte_11A3AE:	dc.b 0,	0, 0, $14
byte_11A3B2:	dc.b 0,	0, $80,	$10
byte_11A3B6:	dc.b 1,	5, 0, $17, 0, $22
byte_11A3BC:	dc.b 1,	5, $80,	$11, $80, $1C, 0, $99, $99, $99, $99, 0, $F8, 5, 0, 0
		dc.b 0,	0, $99,	$99, $99, $99, 0, $F8, 5, 0, 4,	0, 0, $99, $99,	$99
		dc.b $99, 0, $F8, 5, 0,	8, 0, 0
off_11A3E4:	dc.w byte_11A3E6-off_11A3E4
byte_11A3E6:	dc.b 0,	0, 0, 4, 0, 0, 0, 0, 0,	0, $F0,	$D, 0, 0, $F0, 0
off_11A3F6:	dc.w byte_11A3FC-off_11A3F6
		dc.w byte_11A400-off_11A3F6
		dc.w byte_11A404-off_11A3F6
byte_11A3FC:	dc.b 0,	0, 0, $C
byte_11A400:	dc.b 0,	0, 0, $2C
byte_11A404:	dc.b 0,	0, 0, $56, 5, $65, $65,	$65, $65, 0, 0,	$F, 0, $10, $E0, 0
		dc.b $F, 8, $10, 0, $20, $F, 0,	$20, $E0, $20, $F, 8, $20, 0, $40, $F
		dc.b 0,	$30, $E0, $40, $F, 8, $30, 0, 7, $66, $E4, $66,	$E4, 0,	0, $F
		dc.b 0,	$10, $E0, 0, $F, 8, $10, 0, $20, $F, 0,	$20, $E0, $20, $F, 8
		dc.b $20, 0, $40, $F, 0, $30, $E0, $40,	$F, 8, $30, 0, $60, $F,	0, $40
		dc.b $E0, $60, $F, 8, $40, 0, 7, $66, $E4, $66,	$E4, 0,	0, $F, 0, 0
		dc.b $E0, 0, $F, 8, 0, 0, $20, $F, 0, 0, $E0, $20, $F, 8, 0, 0
		dc.b $40, $F, 0, 0, $E0, $40, $F, 8, 0,	0, $60,	$F, 0, 0, $E0, $60
		dc.b $F, 8, 0, 0
off_11A488:	dc.w byte_11A48A-off_11A488
byte_11A48A:	dc.b 1,	$A, 0, 6, 0, $25, 4, $46, $46, $46, $46, 0, $C8, 9, 0, 0
		dc.b $F4, $D8, 4, 0, 6,	$F4, $D8, 0, 0,	8, 4, $E0, $B, 0, 9, $F4
		dc.b $F0, 1, 0,	$17, $C, 4, $46, $46, $46, $46,	0, $C8,	9, 0, 0, $F4
		dc.b $D8, 4, 0,	$15, $F4, $D8, 0, 0, 8,	4, $E0,	$B, 0, 9, $F4, $F0
		dc.b 1,	0, $17,	$C
off_11A4CE:	dc.w byte_11A4D0-off_11A4CE
byte_11A4D0:	dc.b 0,	0, 0, 4, 0, $64, $64, $64, $64,	0, 0, $D, 0, 0,	$F0, 0
off_11A4E0:	dc.w byte_11A4E4-off_11A4E0
		dc.w byte_11A4E8-off_11A4E0
byte_11A4E4:	dc.b 0,	0, 0, $10
byte_11A4E8:	dc.b 4,	5, 0, $17, 0, $22, 0, $2D, 0, $38, 0, $43, 0, 0, 0, 0
		dc.b 0,	0, $F0,	5, 0, 0, $F8, 0, $41, $41, $41,	$41, 0,	$F4, 0,	0
		dc.b 4,	$FC, 0,	$41, $41, $41, $41, 0, $F0, 5, 0, 5, $F8, 0, $41, $41
		dc.b $41, $41, 0, $F0, 5, 0, 9,	$F8, 0,	$41, $41, $41, $41, 0, $F0, 5
		dc.b 0,	$D, $F8, 0, $41, $41, $41, $41,	0, $F0,	5, 0, $11, $F8
off_11A536:	dc.w byte_11A53E-off_11A536
		dc.w byte_11A544-off_11A536
		dc.w byte_11A54A-off_11A536
		dc.w byte_11A54E-off_11A536
byte_11A53E:	dc.b 1,	$A, 0, $1F, 0, $2F
byte_11A544:	dc.b 1,	$A, 0, $44, 0, $54
byte_11A54A:	dc.b 0,	0, 0, 8
byte_11A54E:	dc.b 0,	0, 0, $2F, 0, $61, $61,	$61, $61, 0, 0,	$A, 0, 0, $F4, 1
		dc.b $60, $60, $60, $60, 0, 2, $A, 0, 0, $F4, $1A, 8, 0, 9, $F4, 1
		dc.b $60, $60, $60, $60, 0, 0, $A, 0, 0, $F4, $18, 8, 0, $C, $F4, 0
		dc.b $61, $61, $61, $61, 0, 0, $A, $10,	0, $F4,	1, $60,	$60, $60, $60, 0
		dc.b 6,	$A, $10, 0, $F4, $FE, 8, $10, 9, $F4, 1, $60, $60, $60,	$60, 0
		dc.b 8,	$A, $10, 0, $F4, 0, 8, $10, $C,	$F4
off_11A5A8:	dc.w byte_11A5AC-off_11A5A8
		dc.w byte_11A5B2-off_11A5A8
byte_11A5AC:	dc.b 1,	5, 0, $A, 0, $15
byte_11A5B2:	dc.b 0,	0, 0, $1A, 0, $63, $63,	$63, $63, 0, $E8, $E, 0, 0, $F0, 0
		dc.b $63, $63, $63, $63, 0, $E0, $F, 0,	$C, $F0, 0, $64, $64, $64, $64,	0
		dc.b 0,	9, 0, $1C, $F4,	0
off_11A5D8:	dc.w byte_11A5E6-off_11A5D8
		dc.w byte_11A5F0-off_11A5D8
		dc.w byte_11A5FA-off_11A5D8
		dc.w byte_11A5FE-off_11A5D8
		dc.w byte_11A602-off_11A5D8
		dc.w byte_11A60C-off_11A5D8
		dc.w byte_11A616-off_11A5D8
byte_11A5E6:	dc.b 3,	5, $80,	$7C, $80, $91, $80, $A6, $80, $91
byte_11A5F0:	dc.b 3,	5, 0, $72, 0, $87, 0, $9C, 0, $87
byte_11A5FA:	dc.b 0,	0, $80,	$A7
byte_11A5FE:	dc.b 0,	0, 0, $A3
byte_11A602:	dc.b 3,	3, 0, $29, 0, $1E, 0, $29, $80,	$1E
byte_11A60C:	dc.b 3,	5, 0, $2A, 0, $35, 0, $40, 0, $4B
byte_11A616:	dc.b 3,	5, $80,	$20, $80, $2B, $80, $36, $80, $41, 0, $5F, $5F,	$5F, $5F, 0
		dc.b $F0, 5, 0,	0, $F8,	0, $5F,	$5F, $5F, $5F, 0, $F0, 5, 0, 4,	$F8
		dc.b 0,	$5F, $5F, $5F, $5F, 0, $F0, 5, 0, 8, $F8, 0, $5F, $5F, $5F, $5F
		dc.b 0,	$F0, 5,	0, $C, $F8, 0, $5F, $5F, $5F, $5F, 0, $F0, 5, $18, 8
		dc.b $F8, 0, $5F, $5F, $5F, $5F, 0, $F0, 5, $18, $C, $F8, 2, $5D, $5E, $5D
		dc.b $5E, 0, $D7, $F, 0, $22, $F4, $CF,	8, 0, $32, $F4,	$F0, 9,	0, $10
		dc.b $F4, 2, $5D, $5E, $5D, $5E, 0, $D8, $F, 0,	$22, $F4, $D0, 8, 0, $32
		dc.b $F4, $F0, 9, 0, $16, $F4, 2, $5D, $5E, $5D, $5E, 0, $D7, $F, 0, $22
		dc.b $F4, $CF, 8, 0, $32, $F4, $F0, 9, 0, $1C, $F4, 1, $5D, $5E, $5D, $5E
		dc.b 0,	$D0, $F, 0, $35, $F0, $F0, $D, 0, $45, $F0, 0
off_11A6B2:	dc.w byte_11A6B4-off_11A6B2
byte_11A6B4:	dc.b 3,	3, 0, $15, 0, $A, 0, $15, $80, $A, 0, $5C, $5C,	$5C, $5C, 0
		dc.b $F8, 5, 0,	0, $F8,	0, $5C,	$5C, $5C, $5C, 0, $F8, 5, 0, 4,	$F8
off_11A6D4:	dc.w byte_11A6D8-off_11A6D4
		dc.w byte_11A6DE-off_11A6D4
byte_11A6D8:	dc.b 1,	$E, 0, $C, 0, $1C
byte_11A6DE:	dc.b 1,	$E, $80, 6, $80, $16, 1, $58, $59, $5A,	$5B, 0,	$E4, $D, 0, 0
		dc.b $F0, $F4, $E, 0, 8, $F0, 1, $58, $59, $5A,	$5B, 0,	$E4, $D, 0, 0
		dc.b $F0, $F4, $E, 0, $14, $F0
off_11A704:	dc.w byte_11A710-off_11A704
		dc.w byte_11A718-off_11A704
		dc.w byte_11A720-off_11A704
		dc.w byte_11A724-off_11A704
		dc.w byte_11A728-off_11A704
		dc.w byte_11A730-off_11A704
byte_11A710:	dc.b 2,	2, $80,	$48, $80, $38, $80, $28
byte_11A718:	dc.b 2,	2, 0, $40, 0, $30, 0, $20
byte_11A720:	dc.b 0,	0, $80,	$48
byte_11A724:	dc.b 0,	0, 0, $44
byte_11A728:	dc.b 2,	8, $80,	$4B, $80, $5B, $80, $4B
byte_11A730:	dc.b 2,	8, 0, $43, 0, $53, 0, $43, 1, $53, $53,	$54, $54, 0, $D7, $D
		dc.b 0,	0, $F4,	$E7, $E, 0, 8, $F4, 1, $53, $53, $54, $54, 0, $D9, $D
		dc.b 0,	0, $F4,	$E9, $E, 0, $14, $F4, 1, $53, $53, $54,	$54, 0,	$D8, $D
		dc.b 0,	0, $F4,	$E8, $E, 0, $20, $F4, 0, $55, $55, $55,	$55, 0,	$F0, $D
		dc.b 0,	$2C, $EC, 1, $55, $9A, $55, $9B, 0, $F0, 5, 0, $34, $E5, $F0, $D
		dc.b 0,	$2C, $EC, 2, $55, $9C, $55, $9D, 0, $E0, 5, 0, $38, $D9, $F0, 9
		dc.b 0,	$3C, $E1, $F0, $D, 0, $2C, $EC
off_11A798:	dc.w byte_11A79A-off_11A798
byte_11A79A:	dc.b 0,	0, 0, 4, 0, 0, 0, 0, 0,	0, $E0,	$F, 0, 0, $F0, 0
off_11A7AA:	dc.w byte_11A7AC-off_11A7AA
byte_11A7AC:	dc.b 2,	$14, 0,	8, 0, $13, 0, $23, 0, 0, 0, 0, 0, 0, $E0, $F
		dc.b 0,	0, $F0,	1, 0, 0, 0, 0, 0, $E8, 4, 0, $10, $F8, $E0, $F
		dc.b 0,	0, $F0,	1, 0, 0, 0, 0, 0, $E8, 4, 0, $12, $F8, $E0, $F
		dc.b 0,	0, $F0,	0
off_11A7E0:	dc.w byte_11A7E4-off_11A7E0
		dc.w byte_11A7EA-off_11A7E0
byte_11A7E4:	dc.b 1,	0, 0, $C, 0, $17
byte_11A7EA:	dc.b 1,	0, 0, 6, $80, $11, 0, $62, $62,	$62, $62, 0, 0,	$C, 0, 0
		dc.b $F0, 0, 0,	0, 0, 0, 0, $E8, 3, 0, 4, $C
off_11A806:	dc.w byte_11A80A-off_11A806
		dc.w byte_11A80E-off_11A806
byte_11A80A:	dc.b 0,	0, $80,	8
byte_11A80E:	dc.b 0,	0, 0, 4, 1, 0, 0, 0, 0,	0, $E8,	$E, 0, 0, $E4, $E8
		dc.b $A, 0, $C,	4
off_11A822:	dc.w byte_11A828-off_11A822
		dc.w byte_11A82C-off_11A822
		dc.w byte_11A830-off_11A822
byte_11A828:	dc.b 0,	0, 0, $C
byte_11A82C:	dc.b 0,	0, 0, $13
byte_11A830:	dc.b 0,	0, 0, $1A, 0, $48, $48,	$48, $48, 0, $E8, $B, 0, 0, $F4, 0
		dc.b $49, $49, $49, $49, 0, $F8, 5, 0, $C, $F8,	0, $49,	$49, $49, $49, 0
		dc.b $F8, 5, 0,	$10, $F8, 0
off_11A856:	dc.w byte_11A860-off_11A856
		dc.w byte_11A86A-off_11A856
		dc.w byte_11A874-off_11A856
		dc.w byte_11A878-off_11A856
		dc.w byte_11A87C-off_11A856
byte_11A860:	dc.b 3,	2, 0, $20, 0, $3F, 0, $5E, 0, $7D
byte_11A86A:	dc.b 3,	2, $80,	$16, $80, $35, $80, $54, $80, $73
byte_11A874:	dc.b 0,	0, 0, $88
byte_11A878:	dc.b 0,	0, $80,	$84
byte_11A87C:	dc.b 0,	0, 0, $8B, 4, $4C, $4D,	$4C, $4D, 0, $D0, $A, 0, 0, $F4, $E4
		dc.b 5,	0, 9, $F8, $E4,	5, 0, 9, $EC, $E4, 5, 0, 9, 4, $F0, 5
		dc.b 0,	9, $F8,	4, $4C,	$4D, $4C, $4D, 0, $D0, $A, 0, 0, $F4, $E4, 5
		dc.b 0,	9, $F8,	$E4, 5,	0, 9, $EC, $E4,	5, 0, 9, 4, $F0, 5, 0
		dc.b 9,	$F9, 4,	$4C, $4D, $4C, $4D, 0, $D0, $A,	0, 0, $F4, $E4,	5, 0
		dc.b 9,	$F9, $E4, 5, 0,	9, $ED,	$E4, 5,	0, 9, 5, $F0, 5, 0, 9
		dc.b $FA, 4, $4C, $4D, $4C, $4D, 0, $D0, $A, 0,	0, $F5,	$E4, 5,	0, 9
		dc.b $FA, $E4, 5, 0, 9,	$EE, $E4, 5, 0,	9, 6, $F0, 5, 0, 9, $FA
		dc.b 0,	$4E, $4E, $4E, $4E, 0, $E8, $A,	0, 0, $F4, 0, $41, $41,	$41, $41
		dc.b 0,	$F0, 5,	0, 9, $F8
off_11A912:	dc.w byte_11A930-off_11A912
		dc.w byte_11A93A-off_11A912
		dc.w byte_11A944-off_11A912
		dc.w byte_11A94E-off_11A912
		dc.w byte_11A958-off_11A912
		dc.w byte_11A95C-off_11A912
		dc.w byte_11A962-off_11A912
		dc.w byte_11A930-off_11A912
		dc.w byte_11A968-off_11A912
		dc.w byte_11A972-off_11A912
		dc.w byte_11A97C-off_11A912
		dc.w byte_11A986-off_11A912
		dc.w byte_11A958-off_11A912
		dc.w byte_11A95C-off_11A912
		dc.w byte_11A962-off_11A912
byte_11A930:	dc.b 3,	$A, 0, $60, 0, $75, 0, $8A, 0, $75
byte_11A93A:	dc.b 3,	$A, $80, $56, $80, $6B,	$80, $80, $80, $6B
byte_11A944:	dc.b 3,	$A, 0, $90, 0, $AA, 0, $C4, 0, $AA
byte_11A94E:	dc.b 3,	$A, $80, $86, $80, $A0,	$80, $BA, $80, $A0
byte_11A958:	dc.b 0,	0, 0, $CF
byte_11A95C:	dc.b 1,	1, 0, $D6, 0, $E1
byte_11A962:	dc.b 1,	1, $80,	$D0, $80, $DB
byte_11A968:	dc.b 3,	$A, 0, $E0, 0, $FA, 1, $14, 0, $FA
byte_11A972:	dc.b 3,	$A, $80, $D6, $80, $F0,	$81, $A, $80, $F0
byte_11A97C:	dc.b 3,	$A, 1, $1F, 1, $3E, 1, $5D, 1, $3E
byte_11A986:	dc.b 3,	$A, $81, $15, $81, $34,	$81, $53, $81, $34, 2, $4F, $50, $51, $52, 0
		dc.b $E2, $E, 0, $11, $FF, $E8,	0, 0, 0, $F8, $F0, $D, 0, 1, $F0, 2
		dc.b $4F, $50, $51, $52, 0, $E1, $E, 0,	$1D, $FF, $E8, 0, 0, 0,	$F8, $F0
		dc.b $D, 0, 1, $F0, 3, $4F, $50, $51, $52, 0, $E4, $A, 0, $29, 7, $FC
		dc.b 8,	0, $32,	$FF, $E8, 0, 0,	0, $F8,	$F0, $D, 0, 1, $F0, 3, $4F
		dc.b $50, $51, $52, 0, $F2, 5, 0, 9, $F, $E2, $E, 0, $11, $FF, $E8, 0
		dc.b 0,	0, $F8,	$F0, $D, 0, 1, $F0, 3, $4F, $50, $51, $52, 0, $F1, 5
		dc.b 0,	9, $F, $E1, $E,	0, $1D,	$FF, $E8, 0, 0,	0, $F8,	$F0, $D, 0
		dc.b 1,	$F0, 4,	$4F, $50, $51, $52, 0, $F0, 5, 0, 9, $F, $E4, $A, 0
		dc.b $29, 7, $FC, 8, 0,	$32, $FF, $E8, 0, 0, 0,	$F8, $F0, $D, 0, 1
		dc.b $F0, 0, $41, $41, $41, $41, 0, $F0, 5, 0, $D, $F8,	0, $57,	$57, $57
		dc.b $57, 0, $F8, 0, 0,	$35, $FC, 0, $57, $57, $57, $57, 0, $F8, 0, 0
		dc.b $36, $FC, 3, $4F, $50, $51, $52, 0, $E2, $E, 0, $11, $FF, $F0, 6, 0
		dc.b $37, $FC, $E8, 0, 0, 0, $F8, $F0, $D, 0, 1, $F0, 3, $4F, $50, $51
		dc.b $52, 0, $E1, $E, 0, $1D, $FF, $F0,	6, 0, $37, $FC,	$E8, 0,	0, 0
		dc.b $F8, $F0, $D, 0, 1, $F0, 4, $4F, $50, $51,	$52, 0,	$E4, $A, 0, $29
		dc.b 7,	$FC, 8,	0, $32,	$FF, $F0, 6, 0,	$37, $FC, $E8, 0, 0, 0,	$F8
		dc.b $F0, $D, 0, 1, $F0, 4, $4F, $50, $51, $52,	0, $F2,	5, 0, 9, $F
		dc.b $E2, $E, 0, $11, $FF, $F0,	6, 0, $37, $FC,	$E8, 0,	0, 0, $F8, $F0
		dc.b $D, 0, 1, $F0, 4, $4F, $50, $51, $52, 0, $F1, 5, 0, 9, $F,	$E1
		dc.b $E, 0, $1D, $FF, $F0, 6, 0, $37, $FC, $E8,	0, 0, 0, $F8, $F0, $D
		dc.b 0,	1, $F0,	5, $4F,	$50, $51, $52, 0, $F0, 5, 0, 9,	$F, $E4, $A
		dc.b 0,	$29, 7,	$FC, 8,	0, $32,	$FF, $F0, 6, 0,	$37, $FC, $E8, 0, 0
		dc.b 0,	$F8, $F0, $D, 0, 1, $F0, 0
off_11AAFE:	dc.w byte_11AB1C-off_11AAFE
		dc.w byte_11AB26-off_11AAFE
		dc.w byte_11AB30-off_11AAFE
		dc.w byte_11AB3A-off_11AAFE
		dc.w byte_11AB44-off_11AAFE
		dc.w byte_11AB48-off_11AAFE
		dc.w byte_11AB4E-off_11AAFE
		dc.w byte_11AB1C-off_11AAFE
		dc.w byte_11AB54-off_11AAFE
		dc.w byte_11AB5E-off_11AAFE
		dc.w byte_11AB68-off_11AAFE
		dc.w byte_11AB72-off_11AAFE
		dc.w byte_11AB44-off_11AAFE
		dc.w byte_11AB48-off_11AAFE
		dc.w byte_11AB4E-off_11AAFE
byte_11AB1C:	dc.b 3,	$A, 0, $60, 0, $7A, 0, $94, 0, $7A
byte_11AB26:	dc.b 3,	$A, $80, $56, $80, $70,	$80, $8A, $80, $70
byte_11AB30:	dc.b 3,	$A, 0, $9F, 0, $BE, 0, $DD, 0, $BE
byte_11AB3A:	dc.b 3,	$A, $80, $95, $80, $B4,	$80, $D3, $80, $B4
byte_11AB44:	dc.b 0,	0, 0, $ED
byte_11AB48:	dc.b 1,	1, 0, $F4, 0, $FF
byte_11AB4E:	dc.b 1,	1, $80,	$EE, $80, $F9
byte_11AB54:	dc.b 3,	$A, 0, $FE, 1, $1D, 1, $3C, 1, $1D
byte_11AB5E:	dc.b 3,	$A, $80, $F4, $81, $13,	$81, $32, $81, $13
byte_11AB68:	dc.b 3,	$A, 1, $4C, 1, $70, 1, $94, 1, $70
byte_11AB72:	dc.b 3,	$A, $81, $42, $81, $66,	$81, $8A, $81, $66, 3, $4F, $50, $51, $52, 0
		dc.b $E6, $A, 0, $3D, 7, $E2, $E, 0, $11, $FF, $E8, 0, 0, 0, $F8, $F0
		dc.b $D, 0, 1, $F0, 3, $4F, $50, $51, $52, 0, $E5, $A, 0, $3D, 7, $E1
		dc.b $E, 0, $1D, $FF, $E8, 0, 0, 0, $F8, $F0, $D, 0, 1,	$F0, 4,	$4F
		dc.b $50, $51, $52, 0, $E4, $A,	0, $3D,	7, $E4,	$A, 0, $29, 7, $FC, 8
		dc.b 0,	$32, $FF, $E8, 0, 0, 0,	$F8, $F0, $D, 0, 1, $F0, 4, $4F, $50
		dc.b $51, $52, 0, $F2, 5, 0, 9,	$F, $E6, $A, 0,	$3D, 7,	$E2, $E, 0
		dc.b $11, $FF, $E8, 0, 0, 0, $F8, $F0, $D, 0, 1, $F0, 4, $4F, $50, $51
		dc.b $52, 0, $F1, 5, 0,	9, $F, $E5, $A,	0, $3D,	7, $E1,	$E, 0, $1D
		dc.b $FF, $E8, 0, 0, 0,	$F8, $F0, $D, 0, 1, $F0, 5, $4F, $50, $51, $52
		dc.b 0,	$F0, 5,	0, 9, $F, $E4, $A, 0, $3D, 7, $E4, $A, 0, $29, 7
		dc.b $FC, 8, 0,	$32, $FF, $E8, 0, 0, 0,	$F8, $F0, $D, 0, 1, $F0, 0
		dc.b $41, $41, $41, $41, 0, $F0, 5, 0, $D, $F8,	0, $57,	$57, $57, $57, 0
		dc.b $F8, 0, 0,	$35, $FC, 0, $57, $57, $57, $57, 0, $F8, 0, 0, $36, $FC
		dc.b 4,	$4F, $50, $51, $52, 0, $E6, $A,	0, $3D,	7, $E2,	$E, 0, $11, $FF
		dc.b $F0, 6, 0,	$37, $FC, $E8, 0, 0, 0,	$F8, $F0, $D, 0, 1, $F0, 4
		dc.b $4F, $50, $51, $52, 0, $E5, $A, 0,	$3D, 7,	$E1, $E, 0, $1D, $FF, $F0
		dc.b 6,	0, $37,	$FC, $E8, 0, 0,	0, $F8,	$F0, $D, 0, 1, $F0, 5, $4F
		dc.b $50, $51, $52, 0, $E4, $A,	0, $3D,	7, $E4,	$A, 0, $29, 7, $FC, 8
		dc.b 0,	$32, $FF, $F0, 6, 0, $37, $FC, $E8, 0, 0, 0, $F8, $F0, $D, 0
		dc.b 1,	$F0, 5,	$4F, $50, $51, $52, 0, $F2, 5, 0, 9, $F, $E6, $A, 0
		dc.b $3D, 7, $E2, $E, 0, $11, $FF, $F0,	6, 0, $37, $FC,	$E8, 0,	0, 0
		dc.b $F8, $F0, $D, 0, 1, $F0, 5, $4F, $50, $51,	$52, 0,	$F1, 5,	0, 9
		dc.b $F, $E5, $A, 0, $3D, 7, $E1, $E, 0, $1D, $FF, $F0,	6, 0, $37, $FC
		dc.b $E8, 0, 0,	0, $F8,	$F0, $D, 0, 1, $F0, 6, $4F, $50, $51, $52, 0
		dc.b $F0, 5, 0,	9, $F, $E4, $A,	0, $3D,	7, $E4,	$A, 0, $29, 7, $FC
		dc.b 8,	0, $32,	$FF, $F0, 6, 0,	$37, $FC, $E8, 0, 0, 0,	$F8, $F0, $D
		dc.b 0,	1, $F0,	0
off_11AD26:	dc.w byte_11AD2C-off_11AD26
		dc.w byte_11AD38-off_11AD26
		dc.w byte_11AD44-off_11AD26
byte_11AD2C:	dc.b 4,	$A, 0, $27, 0, $1C, 0, $27, 0, $1C, 0, $1C
byte_11AD38:	dc.b 4,	$A, $80, $1B, $80, $10,	$80, $1B, $80, $10, $80, $10
byte_11AD44:	dc.b 0,	0, 0, $1A, 0, 0, 0, 0, 0, 0, $E8, $A, 0, 0, $F0, 0
		dc.b 0,	0, 0, 0, 0, $E8, $E, 0,	9, $F0,	0, $42,	$42, $42, $42, 0
		dc.b $E8, $E, 0, $15, $F0, 0
off_11AD6A:	dc.w byte_11AD74-off_11AD6A
		dc.w byte_11AD7A-off_11AD6A
		dc.w byte_11AD80-off_11AD6A
		dc.w byte_11AD86-off_11AD6A
		dc.w byte_11AD8C-off_11AD6A
byte_11AD74:	dc.b 1,	2, 0, $1E, 0, $29
byte_11AD7A:	dc.b 1,	2, 0, $2E, 0, $39
byte_11AD80:	dc.b 1,	2, $80,	$28, $80, $33
byte_11AD86:	dc.b 1,	2, 0, $38, 0, $43
byte_11AD8C:	dc.b 1,	2, $80,	$32, $80, $3D, 0, $43, $43, $43, $43, 0, $FC, $C, 0, 0
		dc.b $F0, 0, $43, $43, $43, $43, 0, $FC, $C, 0,	4, $F0,	0, $44,	$44, $44
		dc.b $44, 0, $F4, $A, 0, 8, $F4, 0, $44, $44, $44, $44,	0, $F4,	$A, 0
		dc.b $11, $F4, 0, $45, $45, $45, $45, 0, $F8, $D, 0, $1A, $F0, 0, $45, $45
		dc.b $45, $45, 0, $F8, $D, 0, $22, $F0
off_11ADD4:	dc.w byte_11ADE4-off_11ADD4
		dc.w byte_11ADF2-off_11ADD4
		dc.w byte_11AE00-off_11ADD4
		dc.w byte_11AE0E-off_11ADD4
		dc.w byte_11AE1C-off_11ADD4
		dc.w byte_11AE20-off_11ADD4
		dc.w byte_11AE24-off_11ADD4
		dc.w byte_11AE2A-off_11ADD4
byte_11ADE4:	dc.b 5,	3, 0, $4C, 0, $66, 0, $80, 0, $80, 0, $66, 0, $66
byte_11ADF2:	dc.b 5,	3, $80,	$3E, $80, $58, $80, $72, $80, $72, $80,	$58, $80, $58
byte_11AE00:	dc.b 5,	3, 0, $7E, 0, $93, 0, $93, 0, $93, 0, $93, 0, $7E
byte_11AE0E:	dc.b 5,	3, $80,	$70, $80, $85, $80, $85, $80, $85, $80,	$85, $80, $70
byte_11AE1C:	dc.b 0,	0, 0, $8C
byte_11AE20:	dc.b 0,	0, $80,	$88
byte_11AE24:	dc.b 1,	0, 0, $84, 0, $8F
byte_11AE2A:	dc.b 1,	0, 0, $7E, $80,	$89, 3,	$3C, $3C, $3D, $3D, 0, $D0, 4, 0, 0
		dc.b $F4, $D8, $F, 0, 2, $EC, $E0, 2, 0, $12, $C, $F8, $C, 0, $15, $EC
		dc.b 3,	$3C, $3C, $3D, $3D, 0, $D0, $C,	0, $19,	$F4, $D8, $F, 0, $1D, $EC
		dc.b $D8, 2, 0,	$2D, $C, $F8, $C, 0, $15, $EC, 3, $3C, $3C, $3D, $3D, 0
		dc.b $D0, 8, 0,	$30, $F2, $D8, $F, 0, $33, $EA,	$E0, 1,	0, $43,	$E2, $F8
		dc.b $C, 0, $15, $EA, 2, $3E, $3E, $3F,	$3F, 0,	$E8, $E, 0, $45, $EC, $E8
		dc.b 0,	0, $51,	$C, $F0, 9, 0, $52, $C,	2, $3E,	$3E, $3F, $3F, 0, $E8
		dc.b 6,	0, $58,	$EC, $E0, $E, 0, $5E, $FC, $F8,	8, 0, $6A, $FC,	0, $40
		dc.b $40, $40, $40, 0, $F8, 0, 0, $6D, $FC, 0, 0, 0, 0,	0, 0, $F4
		dc.b 1,	0, $6E,	$FC
off_11AEBE:	dc.w byte_11AEC4-off_11AEBE
		dc.w byte_11AEC8-off_11AEBE
		dc.w byte_11AECC-off_11AEBE
byte_11AEC4:	dc.b 0,	0, 0, $C
byte_11AEC8:	dc.b 0,	0, 0, $13
byte_11AECC:	dc.b 0,	0, 0, $29, 0, $41, $41,	$41, $41, 0, $F0, 5, 0,	0, $F8,	3
		dc.b $4A, $4A, $4B, $4B, 0, $D0, $E, 0,	4, $EC,	$E8, $D, 0, $10, $EC, $F8
		dc.b $C, 0, $18, $EC, $D8, 3, 0, $1C, $C, 3, $4A, $4A, $4B, $4B, 0, $D0
		dc.b $E, 0, 4, $EC, $E8, $D, 0,	$20, $EC, $F8, $C, 0, $18, $EC,	$D8, 3
		dc.b 0,	$28, $C, 0
nemesis_enemy_tiles_61:
    binclude "src/enemies/61/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_60:
    binclude "src/enemies/60/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_56:
    binclude "src/enemies/56/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_57:
    binclude "src/enemies/57/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_65:
    binclude "src/enemies/65/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_52:
    binclude "src/enemies/52/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_55:
    binclude "src/enemies/55/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_50:
    binclude "src/enemies/50/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_32:
    binclude "src/enemies/32/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_51:
    binclude "src/enemies/51/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_37:
    binclude "src/enemies/37/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_44:
    binclude "src/enemies/44/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_53:
    binclude "src/enemies/53/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_48:
    binclude "src/enemies/48/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_39:
    binclude "src/enemies/39/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_33:
    binclude "src/enemies/33/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_36:
    binclude "src/enemies/36/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_35:
    binclude "src/enemies/35/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_45:
    binclude "src/enemies/45/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_42:
    binclude "src/enemies/42/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_43:
    binclude "src/enemies/43/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_41:
    binclude "src/enemies/41/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_30:
    binclude "src/enemies/30/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_0:
    binclude "src/enemies/00/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_21:
    binclude "src/enemies/21/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_26:
    binclude "src/enemies/26/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_24:
    binclude "src/enemies/24/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_23:
    binclude "src/enemies/23/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_25:
    binclude "src/enemies/25/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_27:
    binclude "src/enemies/27/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_28:
    binclude "src/enemies/28/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_20:
    binclude "src/enemies/20/nemesis_tiles.bin"
    align 2, 0
off_1214C6:	dc.w byte_1214C8-off_1214C6
byte_1214C8:	dc.b 0,	0, 0, 4, 1, $47, $47, $47, $47,	0, $E0,	$F, 0, 0, $E8, $E0
		dc.b 7,	0, $10,	8
off_1214DC:	dc.w byte_1214EC-off_1214DC
		dc.w byte_1214FA-off_1214DC
		dc.w byte_121508-off_1214DC
		dc.w byte_121516-off_1214DC
		dc.w byte_121524-off_1214DC
		dc.w byte_121528-off_1214DC
		dc.w byte_12152C-off_1214DC
		dc.w byte_121532-off_1214DC
byte_1214EC:	dc.b 5,	3, 0, $4C, 0, $66, 0, $80, 0, $80, 0, $66, 0, $66
byte_1214FA:	dc.b 5,	3, $80,	$3E, $80, $58, $80, $72, $80, $72, $80,	$58, $80, $58
byte_121508:	dc.b 5,	3, 0, $7E, 0, $93, 0, $93, 0, $93, 0, $93, 0, $7E
byte_121516:	dc.b 5,	3, $80,	$70, $80, $85, $80, $85, $80, $85, $80,	$85, $80, $70
byte_121524:	dc.b 0,	0, 0, $8C
byte_121528:	dc.b 0,	0, $80,	$88
byte_12152C:	dc.b 1,	0, 0, $84, 0, $8F
byte_121532:	dc.b 1,	0, 0, $7E, $80,	$89, 3,	$3C, $3C, $3D, $3D, 0, $D0, 4, 0, 0
		dc.b $F4, $D8, $F, 0, 2, $EC, $E0, 2, 0, $12, $C, $F8, $C, 0, $15, $EC
		dc.b 3,	$3C, $3C, $3D, $3D, 0, $D0, $C,	0, $19,	$F4, $D8, $F, 0, $1D, $EC
		dc.b $D8, 2, 0,	$2D, $C, $F8, $C, 0, $15, $EC, 3, $3C, $3C, $3D, $3D, 0
		dc.b $D0, 8, 0,	$30, $F2, $D8, $F, 0, $33, $EA,	$E0, 1,	0, $43,	$E2, $F8
		dc.b $C, 0, $15, $EA, 2, $A3, $A3, $A4,	$A4, 0,	$E8, $E, 0, $45, $EC, $E8
		dc.b 0,	0, $51,	$C, $F0, 9, 0, $52, $C,	2, $A3,	$A3, $A4, $A4, 0, $E8
		dc.b 6,	0, $58,	$EC, $E0, $E, 0, $5E, $FC, $F8,	8, 0, $6A, $FC,	0, $40
		dc.b $40, $40, $40, 0, $F8, 0, 0, $6D, $FC, 0, 0, 0, 0,	0, 0, $F4
		dc.b 1,	0, $6E,	$FC
off_1215C6:	dc.w byte_1215C8-off_1215C6
byte_1215C8:	dc.b 1,	1, 0, 6, 0, $11, 0, $4D, $4D, $4D, $4D,	0, $E8,	$E, 0, 0
		dc.b $F0, 0, $4D, $4D, $4D, $4D, 0, $E8, $E, 0,	$C, $F0
off_1215E4:	dc.w byte_1215EA-off_1215E4
		dc.w byte_1215F0-off_1215E4
		dc.w byte_1215F6-off_1215E4
byte_1215EA:	dc.b 1,	$A, $80, $16, $80, $26
byte_1215F0:	dc.b 1,	$A, 0, $10, 0, $20
byte_1215F6:	dc.b 3,	$A, 0, $34, 0, $44, 0, $54, 0, $44, 1, $95, $9E, $95, $9F, 0
		dc.b $E0, 7, 0,	0, $F0,	$E8, 6,	0, 8, 0, 3, $94, $94, $94, $94,	0
		dc.b $E8, 4, 0,	$E, $E4, $F0, $C, 0, $10, $E4, $E8, 0, 0, $B, $14, $F0
		dc.b 9,	0, $14,	4, 1, $F9, $F9,	$F9, $F9, 0, $F0, 5, 0,	$32, $F3, $D3
		dc.b 7,	0, $1A,	$F8, 1,	$F9, $F9, $F9, $F9, 0, $F0, 5, 0, $32, $F6, $D3
		dc.b 7,	0, $22,	$F8, 1,	$F9, $F9, $F9, $F9, 0, $F0, 5, 0, $32, $F8, $D3
		dc.b 7,	0, $2A,	$F8
off_12165A:	dc.w byte_12165E-off_12165A
		dc.w byte_121664-off_12165A
byte_12165E:	dc.b 1,	5, 0, $C, 0, $21
byte_121664:	dc.b 1,	5, $80,	6, $80,	$1B, 2,	$81, $81, $81, $81, 0, $E0, 8, 0, 0
		dc.b $F0, $E8, $D, 0, 3, $F0, $F8, 8, 0, $B, $F0, 2, $81, $81, $81, $81
		dc.b 0,	$E0, 8,	0, $E, $F0, $E8, $D, 0,	$11, $F0, $F8, 8, 0, $19, $F0
off_121694:	dc.w byte_121696-off_121694
byte_121696:	dc.b 0,	0, 0, 4, 5, $80, $E5, $80, $E5,	0, $A0,	$F, 0, 0, $E0, $A0
		dc.b $F, 0, $10, 0, $C0, $F, 0,	$20, $E0, $C0, $F, 0, $30, 0, $E0, $F
		dc.b 0,	$40, $E0, $E0, $F, 0, $50, 0
off_1216BE:	dc.w byte_1216C0-off_1216BE
byte_1216C0:	dc.b 0,	0, 0, 4, 7, $80, $E5, $80, $E5,	0, $A0,	$F, 0, 0, $E0, $A0
		dc.b $F, 0, 0, 0, $C0, $D, 0, $10, $E0,	$C0, $D, 0, $18, 0, $D0, $D
		dc.b 0,	$14, $E0, $D0, $D, 0, $14, 0, $E0, $F, 0, $20, $E0, $E0, $F, 8
		dc.b $20, 0
off_1216F2:	dc.w byte_1216F4-off_1216F2
byte_1216F4:	dc.b 0,	0, 0, 4, 0, 0, 0, 0, 0,	0, $E8,	$E, 0, 0, $F0, 0
off_121704:	dc.w byte_12170C-off_121704
		dc.w byte_12170C-off_121704
		dc.w byte_121710-off_121704
		dc.w byte_121714-off_121704
byte_12170C:	dc.b 0,	0, 0, $C
byte_121710:	dc.b 0,	0, 0, $18
byte_121714:	dc.b 0,	0, $80,	$14, 1,	$7E, $7E, $7E, $7E, 0, $C0, 3, 0, 0, $FC, $E0
		dc.b 3,	0, 4, $FC, 1, $A1, $A1,	$A2, $A2, 0, $FC, $C, 0, 8, 0, $FC
		dc.b $C, 0, $C,	$20
off_121738:	dc.w byte_12173C-off_121738
		dc.w byte_121740-off_121738
byte_12173C:	dc.b 0,	0, 0, $10
byte_121740:	dc.b 4,	5, 0, $17, 0, $22, 0, $2D, 0, $38, 0, $43, 0, $41, $41,	$41
		dc.b $41, 0, $F0, 5, 0,	0, $F8,	0, $41,	$41, $41, $41, 0, $F4, 0, 0
		dc.b 4,	$FC, 0,	$41, $41, $41, $41, 0, $F0, 5, 0, 5, $F8, 0, $41, $41
		dc.b $41, $41, 0, $F0, 5, 0, 9,	$F8, 0,	$41, $41, $41, $41, 0, $F0, 5
		dc.b 0,	$D, $F8, 0, $41, $41, $41, $41,	0, $F0,	5, 0, $11, $F8
off_12178E:	dc.w byte_12179C-off_12178E
		dc.w byte_1217A6-off_12178E
		dc.w byte_1217B0-off_12178E
		dc.w byte_1217B4-off_12178E
		dc.w byte_1217B8-off_12178E
		dc.w byte_1217C2-off_12178E
		dc.w byte_1217CC-off_12178E
byte_12179C:	dc.b 3,	5, $80,	$7C, $80, $91, $80, $A6, $80, $91
byte_1217A6:	dc.b 3,	5, 0, $72, 0, $87, 0, $9C, 0, $87
byte_1217B0:	dc.b 0,	0, $80,	$B1
byte_1217B4:	dc.b 0,	0, 0, $AD
byte_1217B8:	dc.b 3,	3, 0, $29, 0, $1E, 0, $29, $80,	$1E
byte_1217C2:	dc.b 3,	5, 0, $2A, 0, $35, 0, $40, 0, $4B
byte_1217CC:	dc.b 3,	5, $80,	$20, $80, $2B, $80, $36, $80, $41, 0, $5F, $5F,	$5F, $5F, 0
		dc.b $F0, 5, 0,	0, $F8,	0, $5F,	$5F, $5F, $5F, 0, $F0, 5, 0, 4,	$F8
		dc.b 0,	$5F, $5F, $5F, $5F, 0, $F0, 5, 0, 8, $F8, 0, $5F, $5F, $5F, $5F
		dc.b 0,	$F0, 5,	0, $C, $F8, 0, $5F, $5F, $5F, $5F, 0, $F0, 5, $18, 8
		dc.b $F8, 0, $5F, $5F, $5F, $5F, 0, $F0, 5, $18, $C, $F8, 2, $5D, $5E, $5D
		dc.b $5E, 0, $CF, 9, 0,	$22, $F4, $DF, $E, 0, $28, $F4,	$F0, 9,	0, $10
		dc.b $F4, 2, $5D, $5E, $5D, $5E, 0, $D0, 9, 0, $22, $F4, $E0, $E, 0, $28
		dc.b $F4, $F0, 9, 0, $16, $F4, 2, $5D, $5E, $5D, $5E, 0, $CF, 9, 0, $22
		dc.b $F4, $DF, $E, 0, $28, $F4,	$F0, 9,	0, $1C,	$F4, $D8, 9, 0,	$22, $F0
		dc.b $E8, $E, 0, $28, $F0, 1, $5D, $5E,	$5D, $5E, 0, $D0, 9, 0,	$34, $F8
		dc.b $E0, $F, 0, $3A, $F0, 0
off_121872:	dc.w byte_121874-off_121872
byte_121874:	dc.b 0,	0, 0, 4, 1, $8A, $8A, $8A, $8A,	0, $F0,	9, 0, 0, $E8, $F0
		dc.b 9,	0, 6, 0
off_121888:	dc.w byte_121892-off_121888
		dc.w byte_121892-off_121888
		dc.w byte_121896-off_121888
		dc.w byte_12189A-off_121888
		dc.w byte_12189E-off_121888
byte_121892:	dc.b 0,	0, 0, $10
byte_121896:	dc.b 0,	0, 0, $3A
byte_12189A:	dc.b 0,	0, 0, $64
byte_12189E:	dc.b 0,	0, 0, $6B, 7, $66, $E4,	$66, $E4, 0, 0,	$F, 0, 0, $E0, 0
		dc.b $F, 0, $10, 0, $20, $F, 0,	$20, $E0, $20, $F, 0, $30, 0, $40, $F
		dc.b 0,	$40, $E0, $40, $F, 0, $50, 0, $60, $F, 0, $40, $E0, $60, $F, 0
		dc.b $50, 0, 7,	$66, $E4, $66, $E4, 0, 0, $F, 0, $40, $E0, 0, $F, 0
		dc.b $50, 0, $20, $F, 0, $40, $E0, $20,	$F, 0, $50, 0, $40, $F,	0, $40
		dc.b $E0, $40, $F, 0, $50, 0, $60, $F, 0, $40, $E0, $60, $F, 0,	$50, 0
		dc.b 0,	$64, $64, $64, $64, 0, 0, $F, 0, $60, $F0, 1, $7D, $7D,	$7D, $7D
		dc.b 0,	0, $F, 0, $70, $E8, 0, 7, 0, $80, 8, 0
off_12191A:	dc.w byte_12191C-off_12191A
byte_12191C:	dc.b 0,	0, 0, 4, 0, $8A, $8A, $8A, $8A,	0, $F0,	$D, 0, 0, $F0, 0
off_12192C:	dc.w byte_12193E-off_12192C
		dc.w byte_121948-off_12192C
		dc.w byte_121952-off_12192C
		dc.w byte_12195C-off_12192C
		dc.w byte_121966-off_12192C
		dc.w byte_12196C-off_12192C
		dc.w byte_121972-off_12192C
		dc.w byte_121976-off_12192C
		dc.w byte_12197A-off_12192C
byte_12193E:	dc.b 3,	$F, $80, $40, $80, $40,	$80, $40, $80, $55
byte_121948:	dc.b 3,	$F, 0, $36, 0, $36, 0, $36, 0, $4B
byte_121952:	dc.b 3,	$F, $80, $56, $80, $56,	$80, $56, $80, $66
byte_12195C:	dc.b 3,	$F, 0, $4C, 0, $4C, 0, $4C, 0, $5C
byte_121966:	dc.b 1,	$F, $80, $62, $80, $72
byte_12196C:	dc.b 1,	$F, 0, $5C, 0, $6C
byte_121972:	dc.b 0,	0, 0, $80
byte_121976:	dc.b 0,	0, 0, $87
byte_12197A:	dc.b 0,	0, 0, $8E, 2, $8B, $8C,	$8B, $8C, 0, $C8, $F, 0, 0, $F4, $E8
		dc.b $E, 0, $10, $EC, $E8, 2, 0, $1C, $C, 2, $8B, $8C, $8B, $8C, 0, $CC
		dc.b $F, 0, 0, $F0, $EC, $A, 0,	$1F, $E8, $EC, $A, 0, $28, 0, 1, 0
		dc.b 0,	0, 0, 0, $C0, $C, 0, $31, $EC, $C8, 4, 0, $35, $EC, 1, 0
		dc.b 0,	0, 0, 0, $C4, $C, 0, $31, $E8, $CC, 4, 0, $35, $E8, 1, 0
		dc.b 0,	0, 0, 0, $E0, 7, 0, $37, $F0, $E8, 6, 0, $3F, 0, 3, 0
		dc.b 0,	0, 0, 0, $E8, 4, 0, $45, $D8, $F0, $C, 0, $47, $D8, $E8, 0
		dc.b 0,	$42, 8,	$F0, 9,	0, $4B,	$F8, 0,	0, 0, 0, 0, 0, $F8, 0
		dc.b 0,	$51, $FC, 0, 0,	0, 0, 0, 0, $F8, 0, 0, $52, $FC, 0, 0
		dc.b 0,	0, 0, 0, $F8, 0, 0, $53, $FC, 0
off_121A14:	dc.w byte_121A20-off_121A14
		dc.w byte_121A26-off_121A14
		dc.w byte_121A2C-off_121A14
		dc.w byte_121A30-off_121A14
		dc.w byte_121A34-off_121A14
		dc.w byte_121A38-off_121A14
byte_121A20:	dc.b 1,	5, 0, $55, 0, $6F
byte_121A26:	dc.b 1,	5, $80,	$4F, $80, $69
byte_121A2C:	dc.b 0,	0, 0, $10
byte_121A30:	dc.b 0,	0, $80,	$C
byte_121A34:	dc.b 0,	0, 0, $22
byte_121A38:	dc.b 0,	0, $80,	$1E, 3,	$89, $89, $89, $89, 0, $C0, $F,	0, 0, $E2, $C0
		dc.b $B, 0, $10, 2, $E0, $B, 0,	$1C, $EA, $E0, 7, 0, $28, 2, 4,	$89
		dc.b $89, $89, $89, 0, $C0, $D,	0, $30,	$F3, $D0, $B, 0, $38, $EB, $D0,	$B
		dc.b 0,	$44, 3,	$F0, 9,	0, $50,	$EB, $F0, 5, 0,	$56, 3,	3, $89,	$89
		dc.b $89, $89, 0, $E0, $B, 0, $5A, $E7,	$E0, $B, 0, $66, $FF, $C4, $B, 0
		dc.b $8E, $EC, $C4, $B,	0, $9A,	4, 3, $89, $89,	$89, $89, 0, $E0, $F, 0
		dc.b $72, $E4, $E0, $B,	0, $82,	4, $C4,	$B, 0, $8E, $EC, $C4, $B, 0, $9A
		dc.b 4,	0
off_121AAA:	dc.w byte_121AB8-off_121AAA
		dc.w byte_121ABC-off_121AAA
		dc.w byte_121AC0-off_121AAA
		dc.w byte_121AC6-off_121AAA
		dc.w byte_121ACC-off_121AAA
		dc.w byte_121AD0-off_121AAA
		dc.w byte_121AD4-off_121AAA
byte_121AB8:	dc.b 0,	0, $80,	$4E
byte_121ABC:	dc.b 0,	0, 0, $4A
byte_121AC0:	dc.b 1,	$1E, $80, $36, 0, $36
byte_121AC6:	dc.b 1,	$1E, 0,	$30, $80, $30
byte_121ACC:	dc.b 0,	0, $80,	$10
byte_121AD0:	dc.b 0,	0, 0, $C
byte_121AD4:	dc.b 0,	4, 0, $3D, 0, $48, 0, $62, 3, $87, $87,	$87, $87, 0, $D0, 6
		dc.b 0,	0, $E1,	$E8, 5,	0, 6, $E1, $D0,	$F, 0, $A, $F1,	$F0, $D, 0
		dc.b $1A, $F1, 1, 0, 0,	0, 0, 0, $D4, 4, 0, $22, $F8, $DC, $D, 0
		dc.b $24, $F0, 0, $88, $88, $88, $88, 0, $F8, $C, 0, $2C, $F0, 0, $7F, $7F
		dc.b $7F, $7F, 0, $E0, $F, 0, $30, $F0,	3, $7F,	$7F, $7F, $7F, 0, $E0, 3
		dc.b 0,	$30, $EC, $E0, 3, 0, $34, $F6, $E0, 3, 0, $38, 2, $E0, 3, 0
		dc.b $3C, $C, 3, $7F, $7F, $7F,	$7F, 0,	$E0, 3,	0, $30,	$E8, $E0, 3, 0
		dc.b $34, $F4, $E0, 3, 0, $38, 4, $E0, 3, 0, $3C, $10
off_121B50:	dc.w byte_121B52-off_121B50
byte_121B52:	dc.b 0,	0, 0, 4, 1, $86, $86, $86, $86,	0, $F8,	8, 0, $12, $E8,	$F8
		dc.b 8,	0, $15,	0
off_121B66:	dc.w byte_121B6A-off_121B66
		dc.w byte_121B6E-off_121B66
byte_121B6A:	dc.b 0,	0, 0, 8
byte_121B6E:	dc.b 0,	0, 0, $F, 0, $84, $84, $84, $84, 0, $E0, $A, 0,	0, $E8,	0
		dc.b $85, $85, $85, $85, 0, $E0, $A, 0,	9, 0
off_121B88:	dc.w byte_121B8C-off_121B88
		dc.w byte_121B90-off_121B88
byte_121B8C:	dc.b 0,	0, 0, 8
byte_121B90:	dc.b 0,	0, 0, $F, 0, $7C, $7C, $7C, $7C, 0, $F8, $D, 0,	0, $F0,	0
		dc.b 0,	0, 0, 0, 0, 0, $F, 0, 8, $F0
off_121BAA:	dc.w byte_121BAE-off_121BAA
		dc.w byte_121BB8-off_121BAA
byte_121BAE:	dc.b 3,	$A, $80, $3E, $80, $29,	$80, $3E, $80, $14
byte_121BB8:	dc.b 3,	$A, 0, $34, 0, $1F, 0, $34, 0, $A, 2, $8D, $8E,	$8F, $90, 0
		dc.b $D8, $D, 0, 0, $E8, $E8, $A, 0, 8,	$F0, $E8, $A, 0, $11, 8, 2
		dc.b $91, $91, $91, $91, 0, $E8, $C, 0,	$1A, $F0, $F0, $D, 0, $1E, $E0,	$F0
		dc.b $D, 0, $26, 0, 2, $8D, $92, $8F, $93, 0, $E0, $E, 0, $2E, $E0, $E8
		dc.b $E, 0, $3A, 0, $F8, 8, 0, $46, $E8, 0
off_121C02:	dc.w byte_121C0A-off_121C02
		dc.w byte_121C0E-off_121C02
		dc.w byte_121C14-off_121C02
		dc.w byte_121C18-off_121C02
byte_121C0A:	dc.b 0,	0, 0, $14
byte_121C0E:	dc.b 1,	$A, 0, $20, 0, $30
byte_121C14:	dc.b 0,	0, 0, $3A
byte_121C18:	dc.b 1,	$A, 0, $46, 0, $56, 1, $78, $79, $78, $79, 0, 0, $D, 0,	0
		dc.b $E0, $10, 5, 0, 8,	$F0, 1,	0, 0, 0, 0, 0, 0, $D, 0, $1A
		dc.b $E0, $10, 5, 0, $22, $F0, 1, 0, 0,	0, 0, 0, 0, $E,	0, $26
		dc.b $E0, $18, 4, 0, $32, $F0, 1, $7A, $7B, $7A, $7B, 0, 0, 4, 0, $C
		dc.b $D0, 0, $E, 0, $E,	$E0, 1,	0, 0, 0, 0, 0, $F8, $D,	0, $1A
		dc.b $E0, 8, 5,	0, $22,	$F0, 1,	0, 0, 0, 0, 0, $F8, $E,	0, $26
		dc.b $E0, $10, 4, 0, $32, $F0
off_121C7E:	dc.w byte_121C80-off_121C7E
byte_121C80:	dc.b 1,	5, 0, 6, 0, $20, 3, $71, $71, $71, $71,	0, $D0,	$F, 0, 0
		dc.b $E8, $D0, 7, 0, $10, 8, $F0, $D, 0, $18, $E8, $F0,	5, 0, $20, 8
		dc.b 3,	$71, $71, $71, $71, 0, $D0, $F,	0, $24,	$E8, $D0, 7, 0,	$34, 8
		dc.b $F0, $D, 0, $3C, $E8, $F0,	5, 0, $44, 8
off_121CBA:	dc.w byte_121CCA-off_121CBA
		dc.w byte_121CD0-off_121CBA
		dc.w byte_121CD6-off_121CBA
		dc.w byte_121CDA-off_121CBA
		dc.w byte_121CDE-off_121CBA
		dc.w byte_121CE2-off_121CBA
		dc.w byte_121CE6-off_121CBA
		dc.w byte_121CEA-off_121CBA
byte_121CCA:	dc.b 1,	5, $80,	$24, $80, $2F
byte_121CD0:	dc.b 1,	5, 0, $1E, 0, $29
byte_121CD6:	dc.b 0,	0, $80,	$2E
byte_121CDA:	dc.b 0,	0, 0, $2A
byte_121CDE:	dc.b 0,	0, $80,	$3B
byte_121CE2:	dc.b 0,	0, 0, $37
byte_121CE6:	dc.b 0,	0, $80,	$43
byte_121CEA:	dc.b 0,	0, 0, $3F, 0, $72, $72,	$72, $72, 0, $E0, $F, 0, 0, $F0, 0
		dc.b $72, $72, $72, $72, 0, $E0, $B, 0,	$10, $F5, 2, $75, $74, $73, $74, 0
		dc.b $E0, 4, 0,	$1C, $ED, $E8, 5, 0, $1E, $E5, $E8, $A,	0, $22,	$F5, 1
		dc.b $76, $76, $76, $76, 0, $F0, $D, 0,	$2B, $EC, $F0, 1, 0, $33, $C, 2
		dc.b $77, $77, $77, $77, 0, $EB, 8, 0, $35, $F8, $F3, $C, 0, $38, $F0, $FB
		dc.b 8,	0, $3C,	$F0
off_121D3E:	dc.w byte_121D42-off_121D3E
		dc.w byte_121D48-off_121D3E
byte_121D42:	dc.b 1,	0, $80,	$C, $80, $3F
byte_121D48:	dc.b 1,	0, 0, 6, 0, $39, 8, 0, 0, 0, 0,	0, $F0,	8, 0, 0
		dc.b $E8, $F0, 8, 0, 3,	0, $D8,	$E, 0, 6, $E0, $D8, $E,	0, $12,	0
		dc.b $D0, 4, 0,	$1E, $E8, $B8, 2, 0, $20, $F0, $B8, 5, 0, $23, 8, $C8
		dc.b 9,	0, $27,	8, $B8,	7, 0, $2D, $F8,	8, 0, 0, 0, 0, 0, $F0
		dc.b 8,	0, 0, $E8, $F0,	8, 0, 3, 0, $D8, $E, 0,	6, $E0,	$D8, $E
		dc.b 0,	$12, 0,	$D0, 4,	0, $1E,	$E8, $B8, 2, 0,	$20, $F0, $B8, 5, 0
		dc.b $23, 8, $C8, 9, 0,	$27, 8,	$B8, 7,	0, $35,	$F8
off_121DB4:	dc.w byte_121DC0-off_121DB4
		dc.w byte_121DC8-off_121DB4
		dc.w byte_121DD0-off_121DB4
		dc.w byte_121DD4-off_121DB4
		dc.w byte_121DD8-off_121DB4
		dc.w byte_121DE6-off_121DB4
byte_121DC0:	dc.b 2,	3, $80,	$4A, $80, $3F, $80, $34
byte_121DC8:	dc.b 2,	3, 0, $42, 0, $37, 0, $2C
byte_121DD0:	dc.b 0,	0, 0, $45
byte_121DD4:	dc.b 0,	0, $80,	$41
byte_121DD8:	dc.b 5,	3, 0, $48, 0, $48, 0, $5D, 0, $5D, 0, $48, 0, $48
byte_121DE6:	dc.b 5,	3, $80,	$3A, $80, $3A, $80, $4F, $80, $4F, $80,	$3A, $80, $3A, 0, 0
		dc.b 0,	0, 0, 0, $E9, 5, 0, 0, $C, 0, 0, 0, 0, 0, 0, $EB
		dc.b 5,	0, 0, $C, 0, 0,	0, 0, 0, 0, $EA, 5, 0, 0, $C, 0
		dc.b 0,	0, 0, 0, 0, $E8, 6, 0, 4, $F8, 2, 0, 0,	0, 0, 0
		dc.b $E0, 6, 0,	$A, $E2, $E8, 4, 0, $10, $F2, $E0, 4, 0, $12, $FA, 2
		dc.b 0,	0, 0, 0, 0, $E0, 6, 0, $A, $E0,	$E8, 4,	0, $10,	$F0, $E0
		dc.b 4,	0, $12,	$F8
off_121E4A:	dc.w byte_121E5A-off_121E4A
		dc.w byte_121E68-off_121E4A
		dc.w byte_121E76-off_121E4A
		dc.w byte_121E84-off_121E4A
		dc.w byte_121E92-off_121E4A
		dc.w byte_121E96-off_121E4A
		dc.w byte_121E9A-off_121E4A
		dc.w byte_121EA0-off_121E4A
byte_121E5A:	dc.b 5,	3, 0, $4C, 0, $6B, 0, $8A, 0, $8A, 0, $6B, 0, $6B
byte_121E68:	dc.b 5,	3, $80,	$3E, $80, $5D, $80, $7C, $80, $7C, $80,	$5D, $80, $5D
byte_121E76:	dc.b 5,	3, 0, $8D, 0, $A7, 0, $A7, 0, $A7, 0, $A7, 0, $8D
byte_121E84:	dc.b 5,	3, $80,	$7F, $80, $99, $80, $99, $80, $99, $80,	$99, $80, $7F
byte_121E92:	dc.b 0,	0, 0, $A5
byte_121E96:	dc.b 0,	0, $80,	$A1
byte_121E9A:	dc.b 1,	0, 0, $9D, 0, $A8
byte_121EA0:	dc.b 1,	0, 0, $97, $80,	$A2, 4,	$3C, $3C, $3D, $3D, 0, $CB, 9, 0, $79
		dc.b $F2, $D0, 4, 0, 0,	$F4, $D8, $F, 0, 2, $EC, $E0, 2, 0, $12, $C
		dc.b $F8, $C, 0, $15, $EC, 4, $3C, $3C,	$3D, $3D, 0, $CD, 9, 0,	$79, $F1
		dc.b $D0, $C, 0, $19, $F4, $D8,	$F, 0, $1D, $EC, $D8, 2, 0, $2D, $C, $F8
		dc.b $C, 0, $15, $EC, 4, $3C, $3C, $3D,	$3D, 0,	$CD, 9,	0, $79,	$EF, $D0
		dc.b 8,	0, $30,	$F2, $D8, $F, 0, $33, $EA, $E0,	1, 0, $43, $E2,	$F8, $C
		dc.b 0,	$15, $EA, 3, $3E, $3E, $3F, $3F, 0, $E3, 9, 0, $79, 0, $E8, $E
		dc.b 0,	$45, $EC, $E8, 0, 0, $51, $C, $F0, 9, 0, $52, $C, 3, $3E, $3E
		dc.b $3F, $3F, 0, $DC, 9, 0, $79, $FC, $E8, 6, 0, $58, $EC, $E0, $E, 0
		dc.b $5E, $FC, $F8, 8, 0, $6A, $FC, 0, $40, $40, $40, $40, 0, $F8, 0, 0
		dc.b $6D, $FC, 0, 0, 0,	0, 0, 0, $F4, 1, 0, $6E, $FC, 0
off_121F4E:	dc.w byte_121F5E-off_121F4E
		dc.w byte_121F6C-off_121F4E
		dc.w byte_121F7A-off_121F4E
		dc.w byte_121F88-off_121F4E
		dc.w byte_121F96-off_121F4E
		dc.w byte_121F9A-off_121F4E
		dc.w byte_121F9E-off_121F4E
		dc.w byte_121FA4-off_121F4E
byte_121F5E:	dc.b 5,	3, 0, $4C, 0, $6B, 0, $8A, 0, $8A, 0, $6B, 0, $6B
byte_121F6C:	dc.b 5,	3, $80,	$3E, $80, $5D, $80, $7C, $80, $7C, $80,	$5D, $80, $5D
byte_121F7A:	dc.b 5,	3, 0, $8D, 0, $A7, 0, $A7, 0, $A7, 0, $A7, 0, $8D
byte_121F88:	dc.b 5,	3, $80,	$7F, $80, $99, $80, $99, $80, $99, $80,	$99, $80, $7F
byte_121F96:	dc.b 0,	0, 0, $A5
byte_121F9A:	dc.b 0,	0, $80,	$A1
byte_121F9E:	dc.b 1,	0, 0, $9D, 0, $A8
byte_121FA4:	dc.b 1,	0, 0, $97, $80,	$A2, 4,	$3C, $3C, $3D, $3D, 0, $CD, $A,	0, $70
		dc.b $F0, $D0, 4, 0, 0,	$F4, $D8, $F, 0, 2, $EC, $E0, 2, 0, $12, $C
		dc.b $F8, $C, 0, $15, $EC, 4, $3C, $3C,	$3D, $3D, 0, $CD, $A, 0, $70, $F0
		dc.b $D0, $C, 0, $19, $F4, $D8,	$F, 0, $1D, $EC, $D8, 2, 0, $2D, $C, $F8
		dc.b $C, 0, $15, $EC, 4, $3C, $3C, $3D,	$3D, 0,	$CD, $A, 0, $70, $EE, $D0
		dc.b 8,	0, $30,	$F2, $D8, $F, 0, $33, $EA, $E0,	1, 0, $43, $E2,	$F8, $C
		dc.b 0,	$15, $EA, 3, $3E, $3E, $3F, $3F, 0, $E8, $A, 0,	$70, 0,	$E8, $E
		dc.b 0,	$45, $EC, $E8, 0, 0, $51, $C, $F0, 9, 0, $52, $C, 3, $3E, $3E
		dc.b $3F, $3F, 0, $E0, $A, 0, $70, $FC,	$E8, 6,	0, $58,	$EC, $E0, $E, 0
		dc.b $5E, $FC, $F8, 8, 0, $6A, $FC, 0, $40, $40, $40, $40, 0, $F8, 0, 0
		dc.b $6D, $FC, 0, 0, 0,	0, 0, 0, $F4, 1, 0, $6E, $FC, 0
off_122052:	dc.w byte_122058-off_122052
		dc.w byte_122060-off_122052
		dc.w byte_122066-off_122052
byte_122058:	dc.b 2,	5, 0, $14, 0, $1F, 0, $2A
byte_122060:	dc.b 1,	4, $80,	$2D, $80, $38
byte_122066:	dc.b 1,	4, 0, $27, 0, $32, 0, 0, 0, 0, 0, 0, $F8, 1, 0,	0
		dc.b $FC, 0, 0,	0, 0, 0, 0, $F8, $D, 0,	2, $F0,	0, 0, 0, 0
		dc.b 0,	0, $F4,	$A, 0, $A, $F4,	0, $70,	$70, $70, $70, 0, $EE, $F, 0
		dc.b $13, $F5, 0, $70, $70, $70, $70, 0, $F4, $A, 0, $23, $F5, 0
off_1220A4:	dc.w byte_1220A6-off_1220A4
byte_1220A6:	dc.b 3,	$1E, 0,	$15, 0,	$A, 0, $20, 0, $A, 0, 0, 0, 0, 0, 0
		dc.b $F8, 0, 0,	0, $FC,	0, 0, 0, 0, 0, 0, $F0, 5, 0, 1,	$F4
		dc.b 0,	0, 0, 0, 0, 0, $F0, 5, 0, 5, $F4, 0
off_1220D2:	dc.w byte_1220D4-off_1220D2
byte_1220D4:	dc.b 0,	0, 0, 4, 5, 0, 0, 0, 0,	0, $B0,	$B, 0, 0, $E8, $D0
		dc.b $A, 0, $C,	$E8, $E8, 6, 0,	$15, $F0, $B0, $B, 8, 0, 0, $D0, $A
		dc.b 8,	$C, 0, $E8, 6, 8, $15, 0
off_1220FC:	dc.w byte_12210A-off_1220FC
		dc.w byte_122114-off_1220FC
		dc.w byte_12211E-off_1220FC
		dc.w byte_122124-off_1220FC
		dc.w byte_12212A-off_1220FC
		dc.w byte_122134-off_1220FC
		dc.w byte_12213E-off_1220FC
byte_12210A:	dc.b 3,	8, 0, $48, 0, $58, 0, $48, 0, $38
byte_122114:	dc.b 3,	8, $80,	$3E, $80, $4E, $80, $3E, $80, $2E
byte_12211E:	dc.b 1,	$A, 0, $44, 0, $59
byte_122124:	dc.b 1,	$A, $80, $3E, $80, $53
byte_12212A:	dc.b 3,	5, 0, $62, 0, $6D, 0, $78, 0, $83
byte_122134:	dc.b 3,	5, $80,	$58, $80, $63, $80, $6E, $80, $79
byte_12213E:	dc.b 0,	0, 0, $7A, 1, $67, $68,	$67, $68, 0, $DA, $D, 0, $3F, $F7, $E8
		dc.b $A, 0, 0, $F0, 1, $67, $68, $67, $68, 0, $DA, $D, 0, $3F, $F6, $E8
		dc.b 6,	0, 9, $F3, 2, $67, $68,	$67, $68, 0, $DA, $D, 0, $3F, $F7, $E8
		dc.b $A, 0, $F,	$F0, $F8, 0, 0,	$18, 8,	2, $69,	$6A, $69, $6A, 0, $D2
		dc.b $A, 0, $36, $F7, $E8, $A, 0, $F, $F0, $F8,	0, 0, $18, 8, 0, $41
		dc.b $41, $41, $41, 0, $F0, 5, 0, $2E, $F8, 0, $41, $41, $41, $41, 0, $F0
		dc.b 5,	0, $32,	$F8, 0,	$41, $41, $41, $41, 0, $F0, 5, $18, $2E, $F8, 0
		dc.b $41, $41, $41, $41, 0, $F0, 5, $18, $32, $F8, 1, 0, 0, 0, 0, 0
		dc.b $C8, $B, 0, $19, $F4, $E8,	$A, 0, $25, $F4
off_1221C8:	dc.w byte_1221D6-off_1221C8
		dc.w byte_1221DE-off_1221C8
		dc.w byte_1221E6-off_1221C8
		dc.w byte_1221F0-off_1221C8
		dc.w byte_1221FA-off_1221C8
		dc.w byte_122202-off_1221C8
		dc.w byte_12220A-off_1221C8
byte_1221D6:	dc.b 2,	8, $80,	$4A, $80, $55, $80, $60
byte_1221DE:	dc.b 2,	8, 0, $42, 0, $4D, 0, $58
byte_1221E6:	dc.b 3,	8, $80,	$50, $80, $60, $80, $70, $80, $80
byte_1221F0:	dc.b 3,	8, 0, $46, 0, $56, 0, $66, 0, $76
byte_1221FA:	dc.b 2,	8, $80,	$3C, $80, $31, $80, $26
byte_122202:	dc.b 2,	8, 0, $34, 0, $29, 0, $1E
byte_12220A:	dc.b 9,	8, 0, $6C, 0, $6C, 0, $16, 0, $21, 0, $2C, 0, $2C, 0, $2C
		dc.b 0,	$21, 0,	$16, 0,	$6C, 0,	0, 0, 0, 0, 0, $E0, $B,	0, 8
		dc.b $F4, 0, 0,	0, 0, 0, 0, $E0, $B, 0,	$14, $F4, 1, $6B, $6B, $6B
		dc.b $6B, 0, $EA, $D, 0, 0, $EF, $E0, $B, 0, $20, $F4, 1, $6B, $6B, $6B
		dc.b $6B, 0, $EA, $D, 0, 0, $EE, $E0, $B, 0, $20, $F4, 1, $6B, $6B, $6B
		dc.b $6B, 0, $EB, $D, 0, 0, $EE, $E0, $B, 0, $20, $F4, 1, $6B, $6B, $6B
		dc.b $6B, 0, $EB, $D, 0, 0, $EF, $E0, $B, 0, $20, $F4, 0, 0, 0,	0
		dc.b 0,	0, 0, 0, 0, $2C, 0, 0
off_122282:	dc.w byte_122286-off_122282
		dc.w byte_12228A-off_122282
byte_122286:	dc.b 0,	0, 0, 8
byte_12228A:	dc.b 0,	0, 0, $F, 0, 0,	0, 0, 0, 0, $FC, 0, 0, 0, $FC, 0
		dc.b $6C, $6D, $6C, $6D, 0, $F0, $F, 0,	1, $F0
off_1222A4:	dc.w byte_1222A6-off_1222A4
byte_1222A6:	dc.b 0,	0, 0, 4, 0, $6E, $6E, $6E, $6E,	0, $E0,	$F, 0, 0, $F0, 0
off_1222B6:	dc.w byte_1222C4-off_1222B6
		dc.w byte_1222CA-off_1222B6
		dc.w byte_1222CA-off_1222B6
		dc.w byte_1222CA-off_1222B6
		dc.w byte_1222CA-off_1222B6
		dc.w byte_1222CA-off_1222B6
		dc.w byte_1222CA-off_1222B6
byte_1222C4:	dc.b 1,	8, 0, $C, 0, $17
byte_1222CA:	dc.b 1,	8, 0, 6, 0, $11, 0, $6F, $6F, $6F, $6F,	0, $F0,	9, 0, 0
		dc.b $F4, 0, $6F, $6F, $6F, $6F, 0, $F0, 9, 0, 6, $F4, 0, $6F, $6F, $6F
		dc.b $6F, 0, $F0, 9, $10, 6, $F4, 0
off_1222F2:	dc.w byte_1222F4-off_1222F2
byte_1222F4:	dc.b 2,	$1E, 0,	8, 0, $18, 0, $28, 1, 0, 0, 0, 0, 0, $C8, 7
		dc.b 0,	0, $F8,	$E8, 6,	0, 8, $F8, 1, 0, 0, 0, 0, 0, $C8, 7
		dc.b 0,	$E, $F8, $E8, 6, 0, $16, $F8, 1, 0, 0, 0, 0, 0,	$C8, 7
		dc.b 0,	$1C, $F8, $E8, 6, 0, $24, $F8
off_12232C:	dc.w byte_12233C-off_12232C
		dc.w byte_122344-off_12232C
		dc.w byte_12234C-off_12232C
		dc.w byte_122354-off_12232C
		dc.w byte_12235C-off_12232C
		dc.w byte_122364-off_12232C
		dc.w byte_12236C-off_12232C
		dc.w byte_122370-off_12232C
byte_12233C:	dc.b 2,	5, 0, $38, 0, $52, 0, $6C
byte_122344:	dc.b 2,	5, $80,	$30, $80, $4A, $80, $64
byte_12234C:	dc.b 2,	5, 0, $28, 0, $76, 0, $C4
byte_122354:	dc.b 2,	5, $80,	$20, $80, $6E, $80, $BC
byte_12235C:	dc.b 2,	5, 0, $80, 0, $9A, 0, $B4
byte_122364:	dc.b 2,	5, $80,	$78, $80, $92, $80, $AC
byte_12236C:	dc.b 0,	0, 0, $BE
byte_122370:	dc.b 0,	0, $80,	$BA, 3,	0, $83,	0, $83,	0, $CC,	$D, 0, $38, $F0, $DC
		dc.b $F, 0, 0, $F0, $C0, $F, 0,	$40, $F0, $E0, $F, 0, $50, $F0,	3, 0
		dc.b $83, 0, $83, 0, $CC, $D, 0, $38, $F0, $DC,	$F, 0, $10, $F0, $C0, $F
		dc.b 0,	$40, $F0, $E0, $F, 0, $50, $F0,	3, 0, $83, 0, $83, 0, $CC, $D
		dc.b 0,	$38, $F0, $DC, $F, 0, $20, $F0,	$C0, $F, 0, $40, $F0, $E0, $F, 0
		dc.b $50, $F0, 3, 0, $83, 0, $83, 0, $CC, $D, 0, $30, $F0, $DC,	$F, 0
		dc.b $10, $F0, $C0, $F,	0, $40,	$F0, $E0, $F, 0, $50, $F0, 3, 0, $83, 0
		dc.b $83, 0, $CC, $D, 0, $AB, $F0, $DC,	$F, 0, 0, $F0, $C0, $F,	0, $40
		dc.b $F0, $E0, $F, 0, $50, $F0,	3, 0, $83, 0, $83, 0, $CC, $D, 0, $AB
		dc.b $F0, $DC, $F, 0, $10, $F0,	$C0, $F, 0, $40, $F0, $E0, $F, 0, $50, $F0
		dc.b 3,	0, $83,	0, $83,	0, $CC,	$D, 0, $AB, $F0, $DC, $F, 0, $20, $F0
		dc.b $C0, $F, 0, $40, $F0, $E0,	$F, 0, $50, $F0, $A, $82, $83, $82, $83, 0
		dc.b $C0, $E, 0, $60, $F0, $B8,	$D, 0, $6C, $D8, $C8, $F, 0, $74, $D8, $C8
		dc.b 5,	0, $84,	$C8, $D8, 9, 0,	$88, $C0, $E8, 5, 0, $8E, $C0, $B8, $D
		dc.b 0,	$92, 6,	$C8, $A, 0, $9A, 6, $C8, 7, 0, $A3, $1E, $C0, $F, 0
		dc.b $40, $F0, $E0, $F,	0, $50,	$F0, 0
off_122468:	dc.w byte_122474-off_122468
		dc.w byte_122474-off_122468
		dc.w byte_12247C-off_122468
		dc.w byte_122482-off_122468
		dc.w byte_122488-off_122468
		dc.w byte_122488-off_122468
byte_122474:	dc.b 2,	8, 0, $1C, 0, $27, 0, $32
byte_12247C:	dc.b 1,	4, $80,	$35, $80, $40
byte_122482:	dc.b 1,	4, 0, $2F, 0, $3A
byte_122488:	dc.b 2,	8, 0, $1E, 0, $13, 0, 8, 0, 0, 0, 0, 0,	0, $F8,	1
		dc.b 0,	0, $FC,	0, 0, 0, 0, 0, 0, $F8, $D, 0, 2, $F0, 0, 0
		dc.b 0,	0, 0, 0, $F4, $A, 0, $A, $F4, 0, $70, $70, $70,	$70, 0,	$EE
		dc.b $F, 0, $13, $F5, 0, $70, $70, $70,	$70, 0,	$F4, $A, 0, $23, $F5, 0
nemesis_enemy_tiles_69:
    binclude "src/enemies/69/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_31:
    binclude "src/enemies/31/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_49:
    binclude "src/enemies/49/nemesis_tiles.bin"
    align 2, 0
off_1245AE:	dc.w byte_1245BE-off_1245AE
		dc.w byte_1245C2-off_1245AE
		dc.w byte_1245C6-off_1245AE
		dc.w byte_1245D8-off_1245AE
		dc.w byte_1245EA-off_1245AE
		dc.w byte_1245F0-off_1245AE
		dc.w byte_1245F6-off_1245AE
		dc.w byte_1245FE-off_1245AE
byte_1245BE:	dc.b   0,  0,  0,$48
byte_1245C2:	dc.b   0,  0,$80,$44
byte_1245C6:	dc.b   7,  8,  0,$40,$81,$56,  0,$40,  0,$69,  0,$92,  0,$B6,  0,$92,  0,$69
byte_1245D8:	dc.b   7,  8,$80,$2E,  1,$44,$80,$2E,$80,$57,$80,$80,$80,$A4,$80,$80,$80,$57
byte_1245EA:	dc.b 1,	0, 0, $B6, 0, $DA
byte_1245F0:	dc.b 1,	0, $80,	$B0, $80, $D4
byte_1245F6:	dc.b 2,	8, 0, $F2, 0, $10, 1, $11
byte_1245FE:	dc.b 2,	8, $80,	$EA, $80, 8, $81, 9, 6,	$F4, $F3, $F6, $F2, 0, $D0, 9
		dc.b $20, $44, $12, $E0, 4, $20, $4A, $1A, $D8,	$A, $20, $65, $10, $E0,	4, $20
		dc.b $6E, 0, $E8, 8, $20, $70, $F8, $F0, $D, $20, $73, $F8, $F0, 0, $20, $7B
		dc.b $18, 6, $F4, $F3, $F6, $F2, 0, $D0, 8, $20, $4C, $15, $D8,	$C, $20, $4F
		dc.b $D, $D8, $A, $20, $65, $10, $E0, 4, $20, $6E, 0, $E8, 8, $20, $70,	$F8
		dc.b $F0, $D, $20, $73,	$F8, $F0, 0, $20, $7B, $18, 5, $F4, $F3, $F6, $F2, 0
		dc.b $D0, $A, $20, $53,	$12, $D8, $A, $20, $65,	$10, $E0, 4, $20, $6E, 0, $E8
		dc.b 8,	$20, $70, $F8, $F0, $D,	$20, $73, $F8, $F0, 0, $20, $7B, $18, 5, $F4
		dc.b $F3, $F6, $F2, 0, $D0, $A,	$20, $5C, $12, $D8, $A,	$20, $65, $10, $E0, 4
		dc.b $20, $6E, 0, $E8, 8, $20, $70, $F8, $F0, $D, $20, $73, $F8, $F0, 0, $20
		dc.b $7B, $18, 5, $E8, $F0, $E9, $F1, 0, $D0, 9, $20, $7C, $18,	$E0, $E, $20
		dc.b $82, $E0, $E0, $F,	$20, $8E, 0, $E0, 9, $20, $9E, $20, $F0, 0, $20, $A4
		dc.b $20, $F8, 4, $20, $A5, $20, 5, $EA, $E6, $EB, $E7,	0, $D0,	4, $20,	$A7
		dc.b $F0, $D8, 9, $20, $A9, $E0, $D8, 8, $20, $AF, $F8,	$E0, $F, $20, $B2, $F8
		dc.b $D8, $B, $20, $C2,	$18, $F8, 8, $20, $CE, $18, 4, 0, 0, 0,	0, 0
		dc.b $D0, 8, $20, $D1, $F0, $D8, $E, $20, $D4, $E8, $E0, $E, $20, $E0, 8, $F0
		dc.b 4,	$20, $EC, $F8, $F8, $C,	$20, $EE, 0, 2,	0, 0, 0, 0, 0, $D8
		dc.b $C, $20, $F2, 0, $E0, $F, $20, $F6, $F8, $E0, 1, $21, 6, $18, 2, 0
		dc.b 0,	0, 0, 0, $D8, $C, $20, $F2, $F0, $E0, $F, $20, $F6, $E8, $E0, 1
		dc.b $21, 6, 8,	0
off_124732:	dc.w byte_12477E-off_124732
		dc.w byte_124788-off_124732
		dc.w byte_12476A-off_124732
		dc.w byte_124774-off_124732
		dc.w byte_124756-off_124732
		dc.w byte_124760-off_124732
		dc.w byte_124742-off_124732
		dc.w byte_12474C-off_124732
byte_124742:	dc.b   3,  2,  0,$50,  0,$5B,$80,$50,$80,$5B
byte_12474C:	dc.b 3,	2, $80,	$46, $80, $51, 0, $46, 0, $51
byte_124756:	dc.b 3,	2, 0, $52, 0, $5D, $80,	$52, $80, $5D
byte_124760:	dc.b 3,	2, $80,	$48, $80, $53, 0, $48, 0, $53
byte_12476A:	dc.b 3,	2, 0, $54, 0, $5F, $80,	$54, $80, $5F
byte_124774:	dc.b 3,	2, $80,	$4A, $80, $55, 0, $4A, 0, $55
byte_12477E:	dc.b 3,	2, 0, $56, 0, $61, $80,	$56, $80, $61
byte_124788:	dc.b 3,	2, $80,	$4C, $80, $57, 0, $4C, 0, $57, 0, 0, $EC, 0, $EC, 0
		dc.b $F0, $F, 0, 0, $F0, 0, 0, $EC, 0, $EC, 0, $F0, $F,	0, $10,	$F0
		dc.b 0,	0, $ED,	0, $ED,	0, $F4,	$A, 0, $20, $F4, 0, 0, $ED, 0, $ED
		dc.b 0,	$F4, $A, 0, $29, $F4, 0, 0, $EE, 0, $EE, 0, $F8, 5, 0, $32
		dc.b $F8, 0, 0,	$EE, 0,	$EE, 0,	$F8, 5,	0, $36,	$F8, 0,	0, $EF,	0
		dc.b $EF, 0, $FC, 0, 0,	$3A, $FC, 0, 0,	$EF, 0,	$EF, 0,	$FC, 0,	0
		dc.b $3B, $FC
off_1247EA:	dc.w byte_1247EE-off_1247EA
		dc.w byte_1247F2-off_1247EA
byte_1247EE:	dc.b 0,	0, $80,	8
byte_1247F2:	dc.b 0,	0, 0, 4, 0, 0, $F5, 0, $F5, 0, $F0, $D,	0, $3C,	$F0, 0
off_124802:	dc.w byte_124806-off_124802
		dc.w byte_12480A-off_124802
byte_124806:	dc.b 0,	$FF, 0,	8
byte_12480A:	dc.b 0,	$FF, $80, 4, 2,	0, 0, 0, 0, 0, $D8, 9, 0, 0, $F4, $E0
		dc.b 1,	0, 6, $C, $E8, $E, 0, 8, $EC, 0
nemesis_enemy_tiles_68:
    binclude "src/enemies/68/nemesis_tiles.bin"
    align 2, 0
off_1249FC:	dc.w byte_124A00-off_1249FC
		dc.w byte_124A04-off_1249FC
byte_124A00:	dc.b 0,	0, 0, 8
byte_124A04:	dc.b 0,	0, 0, $2D, 6, 0, 0, 0, 0, 0, $A0, $F, 0, 0, $E0, $C0
		dc.b $F, 0, $10, $E0, $E0, $F, 0, $20, $E0, $A0, $B, 0,	$30, 0,	$C0, 8
		dc.b 0,	$3C, 0,	$C8, $E, 0, $3F, 0, $E0, $F, 0,	$4B, 0,	6, 0, 0
		dc.b 0,	0, 0, $A0, 7, 0, $5B, $E8, $C0,	4, 0, $63, $E8,	$C8, 2,	0
		dc.b $65, $F0, $E0, 3, 0, $68, $F0, $A0, $F, 8,	0, $F8,	$C0, $F, 0, $6C
		dc.b $F8, $E0, $F, 0, $7C, $F8
nemesis_enemy_tiles_71:
    binclude "src/enemies/71/nemesis_tiles.bin"
    align 2, 0
off_125330:	dc.w byte_125336-off_125330
		dc.w byte_12533A-off_125330
		dc.w byte_125340-off_125330
byte_125336:	dc.b 0,	0, 0, $2E
byte_12533A:	dc.b 1,	$3C, 0,	$A, 0, $1A
byte_125340:	dc.b 0,	0, 0, $34, 1, 0, 0, 0, 0, 0, $F0, $D, 0, 0, $E8, $F0
		dc.b 5,	0, 8, 8, 1, 0, 0, 0, 0,	0, $E0,	$F, 0, $C, $DD,	$E0
		dc.b 3,	0, $1C,	$FD, 1,	0, 0, 0, 0, 0, $E8, $E,	0, $20,	$E8, $E8
		dc.b 6,	0, $2C,	8, 1, 0, 0, 0, 0, 0, $D0, $B, 0, $32, $F4, $F0
		dc.b 9,	0, $3E,	$F4
nemesis_enemy_tiles_73:
    binclude "src/enemies/73/nemesis_tiles.bin"
    align 2, 0
off_125880:	dc.w byte_12588E-off_125880
		dc.w byte_12588E-off_125880
		dc.w byte_12588E-off_125880
		dc.w byte_12588E-off_125880
		dc.w byte_125894-off_125880
		dc.w byte_125898-off_125880
		dc.w byte_12589E-off_125880
byte_12588E:	dc.b 1,	$A, 0, $C1, 0, $E0
byte_125894:	dc.b 0,	0, 0, $A6
byte_125898:	dc.b 1,	1, $80,	$A, $80, $56
byte_12589E:	dc.b 0,	$A, 0, $A6, $D,	0, 0, 0, 0, 0, $D0, 2, 0, $D, $D0, $D0
		dc.b $B, 0, $20, $F0, $D0, $B, 0, $20, 8, $C8, $C, 0, $2C, $E0,	$D0, 0
		dc.b 0,	$30, $E8, $D8, $A, 0, $31, $D8,	$E8, 0,	0, $3A,	$D0, $F0, $D, 0
		dc.b $3B, $D8, $F0, $D,	0, $43,	$F8, $F0, 5, 0,	$4B, $18, $D8, 9, 0, $4F
		dc.b $20, $E8, 4, 0, $55, $20, $D0, 4, 0, $57, $28, 0, 4, 0, $59, $F0
		dc.b $D, 0, 0, 0, 0, 0,	$F0, 2,	0, $D, $D0, $D0, $B, 0,	$20, $F0
		dc.b $D0, $B, 0, $20, 8, $C8, $C, 0, $2C, $E0, $D0, 0, 0, $30, $E8, $D8
		dc.b $A, 0, $31, $D8, $E8, 0, 0, $3A, $D0, $F0,	$D, 0, $3B, $D8, $F0, $D
		dc.b 0,	$43, $F8, $F0, 5, 0, $4B, $18, $D8, 9, 0, $4F, $20, $E8, 4, 0
		dc.b $55, $20, $D0, 4, 0, $57, $28, 0, 4, 0, $59, $F0, 2, 0, 0,	0
		dc.b 0,	0, $B8,	$D, 0, 0, $E0, $C8, $F,	0, 8, $D8, $C8,	7, 0, $18
		dc.b $F8, 4, $46, $46, $46, $46, 0, $F0, $D, 0,	$20, $F4, $D0, $F, 0, $28
		dc.b $FC, $D8, 6, 0, $38, $EC, $C0, $A,	0, $3E,	$E4, $B8, $A, 0, $47, $FC
		dc.b 5,	$46, $46, $46, $46, 0, $C8, 5, 0, $50, $F8, $F0, $D, 0,	$20, $F4
		dc.b $D0, $F, 0, $28, $FC, $D8,	6, 0, $38, $EC,	$C0, $A, 0, $3E, $E4, $B8
		dc.b $A, 0, $47, $FC
off_125992:	dc.w byte_1259A4-off_125992
		dc.w byte_1259AA-off_125992
		dc.w byte_1259AE-off_125992
		dc.w byte_1259B4-off_125992
		dc.w byte_1259BA-off_125992
		dc.w byte_1259C0-off_125992
		dc.w byte_1259C6-off_125992
		dc.w byte_1259CA-off_125992
		dc.w byte_1259CE-off_125992
byte_1259A4:	dc.b 1,	1, 0, $2E, 0, $3E
byte_1259AA:	dc.b 0,	0, 0, $4D
byte_1259AE:	dc.b 1,	$A, 0, $5A, 0, $74
byte_1259B4:	dc.b 1,	$A, $80, $54, $80, $6E
byte_1259BA:	dc.b 1,	$A, 0, $82, 0, $A1
byte_1259C0:	dc.b 1,	$A, $80, $7C, $80, $9B
byte_1259C6:	dc.b 0,	0, 0, $CE
byte_1259CA:	dc.b 0,	0, 0, $B0
byte_1259CE:	dc.b 0,	0, $80,	$AC, 1,	$AC, $AC, $AC, $AC, 0, $E0, $F,	0, 0, $E0, $E0
		dc.b $F, 0, $10, 0, 2, $AC, $AC, $AC, $AC, 0, $F0, 9, 0, $20, $F4, $E0
		dc.b $F, 0, 0, $E0, $E0, $F, 0,	$10, 0,	1, $AD,	$AD, $AD, $AD, 0, $F0
		dc.b $D, 0, $26, $E0, $F0, $D, 0, $2E, 0, 0, 3,	$AA, $AB, $AA, $AB, 0
		dc.b $D8, $B, 0, $48, $F4, $F0,	$D, 0, $84, $E8, $E8, $A, 0, $36, $E8, $E8
		dc.b $A, 0, $3F, 0, 3, $AA, $AB, $AA, $AB, 0, $DC, $A, 0, $54, $F4, $F0
		dc.b $D, 0, $84, $E8, $E8, $A, 0, $36, $E8, $E8, $A, 0,	$3F, 0,	4, 0
		dc.b 0,	0, 0, 0, $D8, $B, 0, $5D, $F4, $E0, 9, 0, $71, $E4, $F0, 5
		dc.b 0,	$77, $E4, $E8, $A, 0, $36, $E8,	$E8, $A, 0, $3F, 0, 4, 0, 0
		dc.b 0,	0, 0, $D8, $B, 0, $5D, $F4, $E0, 8, 0, $7B, $DC, $E8, 6, 0
		dc.b $7E, $E4, $E8, $A,	0, $36,	$E8, $E8, $A, 0, $3F, 0, 3, 0, 0, 0
		dc.b 0,	0, $D8,	$B, 0, $5D, $F4, $F0, $D, 0, $69, $D0, $E8, $A,	0, $36
		dc.b $E8, $E8, $A, 0, $3F, 0, 0, 0, 0, 0, 0, 0,	$E0, 7,	0, $8C
		dc.b $F8, 0
off_125AA0:	dc.w byte_125AF4-off_125AA0
		dc.w byte_125AFC-off_125AA0
		dc.w byte_125B04-off_125AA0
		dc.w byte_125B0C-off_125AA0
		dc.w byte_125B14-off_125AA0
		dc.w byte_125B1C-off_125AA0
		dc.w byte_125B24-off_125AA0
		dc.w byte_125B30-off_125AA0
		dc.w byte_125B3C-off_125AA0
		dc.w byte_125B48-off_125AA0
		dc.w byte_125ABC-off_125AA0
		dc.w byte_125ACA-off_125AA0
		dc.w byte_125AD8-off_125AA0
		dc.w byte_125AE6-off_125AA0
byte_125ABC:	dc.b   5, $A,  1,$9F,  1,$BE,  1,$DD,  1,$DD,  1,$FC,  2,$1B
byte_125ACA:	dc.b   5, $A,$82, $D,$81,$EE,$81,$CF,$81,$CF,$81,$B0,$81,$91
byte_125AD8:	dc.b   5, $A,  1,$FF,  1,$E0,  1,$C1,  1,$C1,  1,$A2,  1,$83
byte_125AE6:	dc.b   5, $A,$81,$75,$81,$94,$81,$B3,$81,$B3,$81,$D2,$81,$F1
byte_125AF4:	dc.b   2, $A,  0,$60,  0,$7F,  0,$9E
byte_125AFC:	dc.b   2, $A,$80,$58,$80,$77,$80,$96
byte_125B04:	dc.b   2,  6,  0,$8E,  0,$AD,  0,$D1
byte_125B0C:	dc.b   2,  6,$80,$86,$80,$A5,$80,$C9
byte_125B14:	dc.b   2, $A,  0,$7E,  0,$5F,  0,$40
byte_125B1C:	dc.b   2, $A,$80,$76,$80,$57,$80,$38
byte_125B24:	dc.b 4,	$A, 1, $18, 1, $18, 1, $18, 0, $D5, 0, $F9
byte_125B30:	dc.b 4,	$A, $81, $C, $81, $C, $81, $C, $80, $C9, $80, $ED
byte_125B3C:	dc.b 4,	$A, 0, $E1, 0, $BD, 1, 0, 1, 0,	1, 0
byte_125B48:	dc.b 4,	$A, $80, $D5, $80, $B1,	$80, $F4, $80, $F4, $80, $F4, 4, $BB, $C0, $BB
		dc.b $C0, 0, $D2, 5, 0,	$3C, $E8, $D1, 6, 0, $40, 7, $C3, $B, 0, 0
		dc.b $F2, $E3, 8, 0, $C, $F2, $E8, $E, 0, $F, $F0, 4, $BB, $C0,	$BB, $C0
		dc.b 0,	$D2, 5,	0, $46,	$E9, $D1, 5, 0,	$4A, 7,	$C3, $B, 0, 0, $F2
		dc.b $E3, 8, 0,	$C, $F2, $E8, $E, 0, $F, $F0, 4, $BB, $C0, $BB,	$C0, 0
		dc.b $D2, 5, 0,	$4E, $EC, $D1, 5, 0, $52, 7, $C3, $B, 0, 0, $F2, $E3
		dc.b 8,	0, $C, $F2, $E8, $E, 0,	$F, $F0, 5, $BC, $C1, $BD, $C2,	0, $D6
		dc.b 5,	0, $4E,	$F2, $D5, 5, 0,	$52, $D, $C7, $B, 0, 0,	$FA, $E7, 8
		dc.b 0,	$C, $FA, $E8, $A, 0, $1B, $F0, $E8, $A,	0, $24,	8, 5, $BE, $C3
		dc.b $BF, $C4, 0, $D7, 5, 0, $4E, $FA, $D6, 5, 0, $52, $15, $C6, $B, 0
		dc.b 0,	2, $E6,	8, 0, $C, 2, $E9, $A, 0, $2D, $F8, $E9,	6, 0, $36
		dc.b $10, 5, $BB, $C0, $BB, $C0, 0, $C7, 7, 0, $56, $EF, $D7, 5, 0, $52
		dc.b $E, $C7, $B, 0, 0,	$FC, $E7, 8, 0,	$C, $FC, $E8, $A, 0, $2D, $F0
		dc.b $E8, 6, 0,	$36, 8,	4, $BC,	$C1, $BD, $C2, 0, $C4, 8, 0, $5E, $F8
		dc.b $CC, $F, 0, $61, $F8, $D2,	5, 0, $52, $C, $E8, $A,	0, $2D,	$F0, $E8
		dc.b 6,	0, $36,	8, 4, $BB, $C0,	$BB, $C0, 0, $C0, 7, 0,	$56, $E6, $D0
		dc.b 5,	0, $52,	7, $C2,	$B, 0, 0, $F1, $E2, 8, 0, $C, $F1, $E8,	$E
		dc.b 0,	$F, $F0, 4, $BB, $C0, $BB, $C0,	0, $D2,	5, 0, $4E, $EC,	$D1, 6
		dc.b 0,	$40, 7,	$C3, $B, 0, 0, $F2, $E3, 8, 0, $C, $F2,	$E8, $E, 0
		dc.b $F, $F0, 4, $BB, $C0, $BB,	$C0, 0,	$D2, 5,	0, $4E,	$EC, $D1, 5, 0
		dc.b $4A, 7, $C3, $B, 0, 0, $F2, $E3, 8, 0, $C,	$F2, $E8, $E, 0, $F
		dc.b $F0, 4, $BB, $C0, $BB, $C0, 0, $D2, 5, 0, $4E, $EC, $D1, 5, 0, $52
		dc.b 7,	$C3, $B, 0, 0, $F2, $E3, 8, 0, $C, $F2,	$E8, $E, 0, $F,	$F0
		dc.b 4,	$BB, $C0, $BB, $C0, 0, $D2, 5, 0, $46, $E9, $D1, 5, 0, $52, 7
		dc.b $C3, $B, 0, 0, $F2, $E3, 8, 0, $C,	$F2, $E8, $E, 0, $F, $F0, 4
		dc.b $BB, $C0, $BB, $C0, 0, $D2, 5, 0, $3C, $E8, $D1, 5, 0, $52, 7, $C3
		dc.b $B, 0, 0, $F2, $E3, 8, 0, $C, $F2,	$E8, $E, 0, $F,	$F0
off_125CF6:	dc.w byte_125D18-off_125CF6
		dc.w byte_125D06-off_125CF6
		dc.w byte_125D3C-off_125CF6
		dc.w byte_125D2A-off_125CF6
		dc.w byte_125D4E-off_125CF6
		dc.w byte_125D60-off_125CF6
		dc.w byte_125D72-off_125CF6
		dc.w byte_125D84-off_125CF6
byte_125D06:	dc.b 7,	4, 0, $90, 0, $A5, 0, $BA, $80,	$A5, $80, $90, $80, $CF, 0, $E4
		dc.b 0,	$CF
byte_125D18:	dc.b 7,	4, 0, $7E, 0, $BD, 0, $D2, $80,	$BD, $80, $7E, $80, $93, 0, $A8
		dc.b 0,	$93
byte_125D2A:	dc.b 7,	$A, 0, $D5, 0, $EA, 0, $FF, $80, $EA, $80, $D5,	$81, $14, 1, $29
		dc.b 1,	$14
byte_125D3C:	dc.b 7,	$A, 0, $C3, 1, 2, 1, $17, $81, 2, $80, $C3, $80, $D8, 0, $ED
		dc.b 0,	$D8
byte_125D4E:	dc.b 7,	$A, 1, $1A, 1, $25, 1, $30, $81, $25, $81, $1A,	$81, $3B, 1, $46
		dc.b 1,	$3B
byte_125D60:	dc.b 7,	$A, 1, $50, 1, $71, 1, $7C, $81, $71, $81, $50,	$81, $5B, 1, $66
		dc.b 1,	$5B
byte_125D72:	dc.b 7,	4, 1, $2D, 1, $42, 1, $57, $81,	$42, $81, $2D, $81, $6C, 1, $81
		dc.b 1,	$6C
byte_125D84:	dc.b 7,	4, 1, $1B, 1, $5A, 1, $6F, $81,	$5A, $81, $1B, $81, $30, 1, $45
		dc.b 1,	$30, 2,	$AE, $AE, $AF, $AF, 0, $FC, $C,	0, 0, $E4, $F4,	2, 0
		dc.b 4,	4, $FC,	4, 0, 7, $C, 2,	$B0, $B1, $B2, $B3, 0, $EC, 9, 0
		dc.b 9,	$EC, $FC, 0, 0,	$A, $F4, $FC, $A, 0, $F, $FC, 2, $B4, $B4, $B4
		dc.b $B4, 0, $E4, 3, 0,	$18, $FC, 4, 8,	0, $1C,	$F4, $C, 1, 0, $1F
		dc.b $FC, 2, $B5, $B6, $B7, $B8, 0, 4, 9, $10, 9, $EC, $FC, 0, $10, $A
		dc.b $F4, $EC, $A, $10,	$F, $FC, 2, $B9, $B9, $B9, $B9,	0, $FC,	3, $10,	$18
		dc.b $FC, $F4, 8, $10, $1C, $F4, $E4, 1, $10, $1F, $FC,	2, $AE,	$AE, $AF, $AF
		dc.b 0,	$FC, $C, 0, $21, $E4, $F4, 2, 0, $25, 4, $FC, 4, 0, $28, $C
		dc.b 2,	$B0, $B1, $B2, $B3, 0, $EC, 9, 0, $2A, $EC, $FC, 0, 0, $2B, $F4
		dc.b $FC, $A, 0, $30, $FC, 2, $B4, $B4,	$B4, $B4, 0, $E4, 3, 0,	$39, $FC
		dc.b 4,	8, 0, $3D, $F4,	$C, 1, 0, $40, $FC, 2, $B5, $B6, $B7, $B8, 0
		dc.b 4,	9, $10,	$2A, $EC, $FC, 0, $10, $2B, $F4, $EC, $A, $10, $30, $FC, 2
		dc.b $B9, $B9, $B9, $B9, 0, $FC, 3, $10, $39, $FC, $F4,	8, $10,	$3D, $F4, $E4
		dc.b 1,	$10, $40, $FC, 0, $BA, $BA, $BA, $BA, 0, $F4, $A, 0, $42, $F4, 0
		dc.b $BA, $BA, $BA, $BA, 0, $F0, $F, 0,	$4B, $F0, 0, $BA, $BA, $BA, $BA, 0
		dc.b $F4, $A, 0, $5B, $F4, 0, $BA, $BA,	$BA, $BA, 0, $F0, $F, $10, $4B,	$F0
		dc.b 0,	$BA, $BA, $BA, $BA, 0, $F4, $A,	$10, $5B, $F4, 2, $AE, $AE, $AF, $AF
		dc.b 0,	$FC, $C, 0, 0, $DC, $F4, 2, 0, 4, $FC, $FC, 4, 0, 7, 4
		dc.b 2,	$B0, $B1, $B2, $B3, 0, $E4, 9, 0, 9, $E4, $F4, 0, 0, $A, $EC
		dc.b $F4, $A, 0, $F, $F4, 2, $B4, $B4, $B4, $B4, 0, $DC, 3, 0, $18, $FC
		dc.b $FC, 8, 0,	$1C, $F4, 4, 1,	0, $1F,	$FC, 2,	$B5, $B6, $B7, $B8, 0
		dc.b $C, 9, $10, 9, $E4, 4, 0, $10, $A,	$EC, $F4, $A, $10, $F, $F4, 2
		dc.b $B9, $B9, $B9, $B9, 0, $C,	3, $10,	$18, $FC, 4, 8,	$10, $1C, $F4, $F4
		dc.b 1,	$10, $1F, $FC
nemesis_enemy_tiles_62:
    binclude "src/enemies/62/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_63:
    binclude "src/enemies/63/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_70:
    binclude "src/enemies/70/nemesis_tiles.bin"
    align 2, 0
nemesis_enemy_tiles_72:
    binclude "src/enemies/72/nemesis_tiles.bin"
    align 2, 0
byte_127CD8:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $72, $93, $99, $77, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $93, $78, $7D, $7B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3D, $3B,	$3B, $85, $98, $9F, $7D, $9A, $8B, $87,	$72
		dc.b $3D, $3B, $3B, $3B, $3D, $3B, $3B,	$3B, $8B, $73, $78, $9F, $79, $4D, $6D,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $54, $6D, $46, $71, $47, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3D, $3B, $3B, $3B,	$3B, $90, $8B, $98, $7D, $A1, $3B, $3B,	$3B
		dc.b $3B, $3D, $3E, $3B, $3B, $3B, $3B,	$3B, $75, $7D, $8D, $85, $3B, $3B, $3B,	$3B
		dc.b $3B, $3D, $3B, $3B, $3B, $3B, $3B,	$3B, $72, $7D, $85, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3D, $3B, $3B, $3B,	$3B, $4F, $45, $66, $4B, $5E, $3B, $3B,	$3B
off_127D68:	dc.w byte_127D6A-off_127D68
byte_127D6A:	dc.b 0,	0, 0, 4, 0, 0, 0, 0, 0,	0, 0, $B, 0, 0,	0, 0
off_127D7A:	dc.w byte_127D80-off_127D7A
		dc.w byte_127D84-off_127D7A
		dc.w byte_127D88-off_127D7A
byte_127D80:	dc.b 0,	0, 0, $C
byte_127D84:	dc.b 0,	0, $80,	8
byte_127D88:	dc.b 0,	0, 0, $F, 0, 0,	0, 0, 0, 0, $F0, 5, 0, 0, $F8, 0
		dc.b 0,	0, 0, 0, 0, $F8, 5, 0, 4, $F0
nemesis_127DA2:
    binclude "src/nemesis/data_127DA2.bin"
    align 2, 0
nemesis_127EC6:
    binclude "src/nemesis/data_127EC6.bin"
    align 2, 0
enigma_127F88:
    binclude "src/enigma/data_127F88.bin"
    align 2, 0
enigma_128004:
    binclude "src/enigma/data_128004.bin"
    align 2, 0
nemesis_128028:
    binclude "src/nemesis/data_128028.bin"
    align 2, 0
nemesis_enemy_tiles_40:
    binclude "src/enemies/40/nemesis_tiles.bin"
    align 2, 0
off_128DC6:	dc.w byte_128DD8-off_128DC6
		dc.w byte_128DE6-off_128DC6
		dc.w byte_128E18-off_128DC6
		dc.w byte_128E22-off_128DC6
		dc.w byte_128E2C-off_128DC6
		dc.w byte_128E36-off_128DC6
		dc.w byte_128E40-off_128DC6
		dc.w byte_128E4A-off_128DC6
		dc.w byte_128E58-off_128DC6
byte_128DD8:	dc.b   5,$20,  1, $C,  0,$E8,  1, $C,$81, $C,$80,$E8,$81, $C
byte_128DE6:	dc.b $17,  2,  0,$AC,  1,$7E,  1,$AC,  1,$7E,  0,$AC,  0,$AC,$80,$AC,$81,$7E,$81,$AC
		dc.b $81,$7E,$80,$AC,$80,$AC,  0,$FE,  1,$DA,  1,$FE,  1,$DA,  0,$FE,  0,$FE,$80,$FE
		dc.b $81,$DA,$81,$FE,$81,$DA,$80,$FE,$80,$FE
byte_128E18:	dc.b   3,  0,  2,$38,$82,$38,  2,$43,$82,$43
byte_128E22:	dc.b   3,  0,  2,$44,$82,$44,  2,$54,$82,$54
byte_128E2C:	dc.b   3,  0,  2,$5A,$82,$5A,  2,$6A,$82,$6A
byte_128E36:	dc.b 3,	0, 2, $70, $82,	$70, 2,	$80, $82, $80
byte_128E40:	dc.b 3,	0, 2, $86, $82,	$86, 2,	$91, $82, $91
byte_128E4A:	dc.b 5,	$14, 0,	$48, 0,	$EC, 0,	$BE, $80, $48, $80, $EC, $80, $BE
byte_128E58:	dc.b $1B, 8, 0,	$8C, 1,	$B0, 0,	$8C, 1,	$B0, 0,	$8C, 1,	$B0, 0,	$8C
		dc.b $80, $8C, $81, $B0, $80, $8C, $81,	$B0, $80, $8C, $81, $B0, $80, $8C, 1, $8C
		dc.b 1,	$D4, 1,	$8C, 1,	$D4, 1,	$8C, 1,	$D4, 1,	$8C, $81, $8C, $81, $D4
		dc.b $81, $8C, $81, $D4, $81, $8C, $81,	$D4, $81, $8C, 7, $CE, $C8, $CF, $C9, 0
		dc.b $10, $A, 8, $C, $28, $18, 5, 8, $15, $18, $14, $B,	$20, $62, $F0, 0
		dc.b $B, $20, $8A, 8, $30, 5, $20, $72,	$FC, $30, 5, $20, $80, $18, $18, $F
		dc.b $20, $A2, 0, $18, 7, $20, $B2, $20, 5, $F7, $D4, $F8, $D5,	0, $18,	$B
		dc.b $20, $62, $F8, 4, $B, $20,	$8A, $E, $30, 5, $20, $6E, 0, $30, 5, $20
		dc.b $7C, $28, $1C, $F,	$20, $A2, 4, $1C, 7, $20, $B2, $24, 5, $CE, $C8, $CF
		dc.b $C9, 0, $14, $B, $20, $62,	$F0, 0,	$B, $20, $8A, 8, $30, 5, $20, $72
		dc.b $FC, $30, 5, $20, $80, $18, $18, $F, $20, $A2, 0, $18, 7, $20, $B2, $20
		dc.b 7,	$CC, $D6, $CD, $D7, 0, 8, $A, 8, $C, $28, $10, 5, 8, $15, $18
		dc.b $F, $B, $20, $62, $F0, $F8, $B, $20, $8A, 8, $2C, 6, $20, $76, 0, $2C
		dc.b 6,	$20, $84, $18, $10, $F,	$20, $A2, 0, $10, 7, $20, $B2, $20, 7, $CC
		dc.b $D4, $CD, $D5, 0, $18, $A,	8, $C, $24, $20, 5, 8, $15, $14, $10, $B
		dc.b $20, $62, $F8, 4, $B, $20,	$8A, $E, $30, 5, $20, $6E, 0, $30, 5, $20
		dc.b $7C, $28, $1C, $F,	$20, $A2, 4, $1C, 7, $20, $B2, $24, 7, $D0, $C8, $D1
		dc.b $C9, 0, $10, $A, 8, $C, $28, $18, 5, 8, $15, $18, $C, $F, $20, $42
		dc.b $F0, 0, $B, $20, $8A, 8, $30, 5, $20, $72,	$FC, $30, 5, $20, $80, $18
		dc.b $18, $F, $20, $A2,	0, $18,	7, $20,	$B2, $20, 7, $D2, $D8, $D3, $D9, 0
		dc.b $18, $A, 8, $C, $24, $20, 5, 8, $15, $14, 8, $F, $20, $52,	$F0, 8
		dc.b $B, $20, $8A, 8, $30, 5, $20, $6E,	$F8, $30, 5, $20, $7C, $20, $20, $F
		dc.b $20, $A2, $FC, $20, 7, $20, $B2, $1C, 5, $D0, $C8,	$D1, $C9, 0, $C, $F
		dc.b $20, $42, $F0, 0, $B, $20,	$8A, 8,	$30, 5,	$20, $72, $FC, $30, 5, $20
		dc.b $80, $18, $18, $F,	$20, $A2, 0, $18, 7, $20, $B2, $20, 5, $D2, $D8, $D3
		dc.b $D9, 0, 8,	$F, $20, $52, $F0, 8, $B, $20, $8A, 8, $30, 5, $20, $6E
		dc.b $F8, $30, 5, $20, $7C, $20, $20, $F, $20, $A2, $FC, $20, 7, $20, $B2, $1C
		dc.b 5,	$CE, $C8, $CF, $C9, 0, $14, $B,	$20, $62, $F0, 2, $B, $20, $96,	8
		dc.b $30, 5, $20, $72, $FC, $30, 5, $20, $80, $18, $1A,	$F, $20, $A2, 0, $1A
		dc.b 7,	$20, $B2, $20, 5, $D2, $D8, $D3, $D9, 0, 8, $F,	$20, $52, $F0, $A
		dc.b $B, $20, $96, 8, $30, 5, $20, $6E,	$F8, $30, 5, $20, $7C, $20, $22, $F
		dc.b $20, $A2, $FC, $22, 7, $20, $B2, $1C, 0, 0, $D6, 0, $D7, 0, $F8, $B
		dc.b $20, $8A, 8, 0, 0,	$D6, 0,	$D7, 0,	0, $B, $20, $8A, 8, 1, 0
		dc.b $DA, 0, $DB, 0, $10, $F, $20, $A2,	0, $10,	7, $20,	$B2, $20, 1, 0
		dc.b $DA, 0, $DB, 0, $18, $F, $20, $A2,	0, $18,	7, $20,	$B2, $20, 1, $DC
		dc.b $DE, $DD, $DF, 0, $2C, 6, $20, $76, 0, $2C, 6, $20, $84, $18, 1, $DC
		dc.b $DE, $DD, $DF, 0, $34, 6, $20, $76, 0, $34, 6, $20, $84, $18, 1, 0
		dc.b $E0, 0, $E1, 0, 8,	$A, 8, $C, $28,	$10, 5,	8, $15,	$18, 1,	0
		dc.b $E0, 0, $E1, 0, $10, $A, 8, $C, $28, $18, 5, 8, $15, $18, 0, 0
		dc.b $CC, 0, $CD, 0, $F, $B, $20, $62, $F0, 0, 0, $CC, 0, $CD, 0, $17
		dc.b $B, $20, $62, $F0
off_1290DC:	dc.w byte_1290E0-off_1290DC
		dc.w byte_1290F2-off_1290DC
byte_1290E0:	dc.b 7,	2, 0, $59, 0, $49, 0, $39, 0, $29, 0, $1E, $80,	$29, $80, $39
		dc.b $80, $49
byte_1290F2:	dc.b 4,	2, $80,	$C, $80, $17, $80, $27,	$80, $37, $80, $47, 0, 0, $CA, 0
		dc.b $CA, 0, $F0, $B, 0, 0, $F4, 1, 0, $CA, 0, $CA, 0, $F0, $A,	0
		dc.b $C, $EC, $F8, 5, 0, $15, 4, 1, 0, $CA, 0, $CA, 0, $F6, 6, 0
		dc.b $19, $EC, $F6, 9, 0, $1F, $FC, 1, 0, $CA, 0, $CA, 0, $F8, $A, 0
		dc.b $25, $EC, $F0, 5, 0, $2E, 4, 0, 0,	$CA, 0,	$CA, 0,	$EF, $F, 0
		dc.b $32, $F0
kosinski_129144:
    binclude "src/kosinski/data_129144.bin"
    align 2, 0
nemesis_1291A4:
    binclude "src/nemesis/data_1291A4.bin"
    align 2, 0

    org $69D00
sub_129D00:
		lea	off_129D08(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_129D08:	dc.w sub_129D0C-off_129D08
		dc.w locret_129D32-off_129D08

sub_129D0C:
		move.b	#$18,$C(a0)
		move.w	#$98,$10(a0)
		move.w	#$100,$14(a0)
		move.w	#$23C0,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#0,d0
		jsr	sub_12A5C4(pc)

locret_129D32:
		rts

sub_129D34:
		lea	off_129D3C(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_129D3C:	dc.w sub_129D4A-off_129D3C
		dc.w sub_129D78-off_129D3C
		dc.w sub_129D86-off_129D3C
		dc.w locret_129D98-off_129D3C
		dc.w sub_129D9A-off_129D3C
		dc.w sub_129DB6-off_129D3C
		dc.w sub_129DD6-off_129D3C

sub_129D4A:
		move.b	#$18,$C(a0)
		move.w	#$140,$10(a0)
		move.w	#$108,$14(a0)
		move.w	#$23C0,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#1,d0
		jsr	sub_12A5C4(pc)
		move.w	#3,2(a0)
		rts

sub_129D78:
		moveq	#2,d0
		jsr	sub_12A5C4(pc)
		move.w	#3,2(a0)
		rts

sub_129D86:
		move.w	#$158,$10(a0)
		moveq	#3,d0
		jsr	sub_12A5C4(pc)
		move.w	#3,2(a0)

locret_129D98:
		rts

sub_129D9A:
		move.w	#$144,$10(a0)
		move.w	#$F0,$14(a0)
		move.l	#$FFFF8000,$1C(a0)
		moveq	#$16,d0
		jsr	sub_12A5C4(pc)
		rts

sub_129DB6:
		move.l	$1C(a0),d0
		addi.l	#$1000,d0
		move.l	d0,$1C(a0)
		add.l	d0,$14(a0)
		cmpi.l	#$8000,d0
		blt.s	locret_129DD4
		addq.w	#1,2(a0)

locret_129DD4:
		rts

sub_129DD6:
		move.l	$1C(a0),d0
		subi.l	#$1000,d0
		move.l	d0,$1C(a0)
		add.l	d0,$14(a0)
		cmpi.l	#$FFFF8000,d0
		bgt.s	locret_129DF4
		subq.w	#1,2(a0)

locret_129DF4:
		rts

sub_129DF6:
		lea	off_129DFE(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_129DFE:	dc.w sub_129E08-off_129DFE
		dc.w sub_129E34-off_129DFE
		dc.w sub_129E4C-off_129DFE
		dc.w locret_129E64-off_129DFE
		dc.w sub_129E66-off_129DFE

sub_129E08:
		move.b	#$18,$C(a0)
		move.w	#$170,$10(a0)
		move.w	#$108,$14(a0)
		move.w	#$23C0,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#$F,d0
		jsr	sub_12A5C4(pc)
		move.w	#$2F8,$38(a0)

sub_129E34:
		jsr	sub_12A1EE(pc)
		moveq	#4,d0
		jsr	sub_12A5C4(pc)
		move.w	#3,2(a0)
		move.w	#$5B,(word_FF90C0).w
		rts

sub_129E4C:
		moveq	#5,d0
		jsr	sub_12A5C4(pc)
		move.w	$10(a0),(word_FF9010).w
		move.w	$14(a0),(dword_FF9014).w
		subi.w	#$10,(dword_FF9014).w

locret_129E64:
		rts

sub_129E66:
		moveq	#$15,d0
		jsr	sub_12A5C4(pc)
		move.w	#3,2(a0)
		rts

sub_129E74:
		lea	off_129E7C(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_129E7C:	dc.w sub_129E8C-off_129E7C
		dc.w sub_129ECA-off_129E7C
		dc.w sub_129EE6-off_129E7C
		dc.w nullsub_26-off_129E7C
		dc.w sub_129EF2-off_129E7C
		dc.w nullsub_27-off_129E7C
		dc.w sub_129EFA-off_129E7C
		dc.w nullsub_28-off_129E7C

sub_129E8C:
		jsr	sub_12A1EE(pc)
		move.b	#$18,$C(a0)
		move.b	#0,$D(a0)
		move.w	#$80,$10(a0)
		move.w	#$108,$14(a0)
		move.w	#$23C0,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#6,d0
		jsr	sub_12A5C4(pc)
		move.w	#$200,$38(a0)
		move.l	#$2000,$18(a0)

sub_129ECA:
		jsr	sub_12A5E8
		jsr	sub_12A1EE(pc)
		move.w	#$6F,(word_FF9080).w
		move.w	#$10,$38(a0)
		moveq	#7,d0
		jmp	sub_12A5C4(pc)

sub_129EE6:
		jsr	sub_12A1EE(pc)
		moveq	#8,d0
		jmp	sub_12A5C4(pc)

nullsub_26:
		rts

sub_129EF2:
		moveq	#9,d0
		jmp	sub_12A5C4(pc)

nullsub_27:
		rts

sub_129EFA:
		moveq	#$A,d0
		jmp	sub_12A5C4(pc)

nullsub_28:
		rts

sub_129F02:
		lea	off_129F0A(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_129F0A:	dc.w sub_129F12-off_129F0A
		dc.w loc_129F54-off_129F0A
		dc.w sub_129F84-off_129F0A
		dc.w nullsub_29-off_129F0A

sub_129F12:
		move.b	#$18,$C(a0)
		move.w	(word_FF9190).w,$10(a0)
		move.w	(word_FF9194).w,$14(a0)
		move.w	$14(a0),$30(a0)
		subq.w	#8,$14(a0)
		move.w	#$23C0,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#$B,d0
		jsr	sub_12A5C4(pc)
		move.w	#$200,$38(a0)
		move.w	#1,$18(a0)
		move.w	#$FFFE,$1C(a0)

loc_129F54:
		jsr	sub_12A5E8
		addi.l	#$1000,$1C(a0)
		move.w	$30(a0),d0
		cmp.w	$14(a0),d0
		bcc.s	locret_129F82
		move.w	d0,$14(a0)
		moveq	#$C,d0
		jsr	sub_12A5C4(pc)
		move.w	#2,2(a0)
		move.w	#$A,$38(a0)

locret_129F82:
		rts

sub_129F84:
		jsr	sub_12A1EE(pc)
		move.w	#$58,(word_FF9000).w
		moveq	#$D,d0
		jmp	sub_12A5C4(pc)

nullsub_29:
		rts

sub_129F96:
		lea	off_129F9E(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_129F9E:	dc.w sub_129FAE-off_129F9E
		dc.w sub_129FEE-off_129F9E
		dc.w sub_12A028-off_129F9E
		dc.w sub_12A03E-off_129F9E
		dc.w sub_12A054-off_129F9E
		dc.w sub_12A074-off_129F9E
		dc.w sub_12A0A0-off_129F9E
		dc.w locret_12A0A8-off_129F9E

sub_129FAE:
		move.b	#$18,$C(a0)
		move.w	(word_FF9090).w,$10(a0)
		move.w	(word_FF9094).w,$14(a0)
		move.w	(word_FF9154).w,$30(a0)
		subi.w	#$10,$30(a0)
		move.w	#$43C0,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#$E,d0
		jsr	sub_12A5C4(pc)
		move.l	#$1D000,$18(a0)
		move.w	#$FFFE,$1C(a0)

sub_129FEE:
		jsr	sub_12A5E8
		addi.l	#$1000,$1C(a0)
		tst.w	$1C(a0)
		bmi.s	locret_12A026
		move.w	$30(a0),d0
		cmp.w	$14(a0),d0
		bcc.s	locret_12A026
		move.w	d0,$14(a0)
		addq.w	#1,2(a0)
		move.w	#2,(word_FF9142).w
		bset	#0,(byte_FF90CC).w
		move.w	#$3C,$38(a0)

locret_12A026:
		rts

sub_12A028:
		jsr	sub_12A1EE(pc)
		move.w	#1,(word_FF9102).w
		move.w	#$3C,$38(a0)
		addq.w	#1,2(a0)
		rts

sub_12A03E:
		jsr	sub_12A1EE(pc)
		move.w	#4,(word_FF9182).w
		move.w	#$78,$38(a0)
		addq.w	#1,2(a0)
		rts

sub_12A054:
		jsr	sub_12A1EE(pc)
		move.w	#2,(word_FF9102).w
		bset	#2,(byte_FF914D).w
		bset	#2,$D(a0)
		move.w	#$78,$38(a0)
		addq.w	#1,2(a0)

sub_12A074:
		jsr	sub_12A1EE(pc)
		move.w	#6,(word_FF9182).w
		move.w	#4,(word_FF9102).w
		bclr	#2,(byte_FF914D).w
		move.w	#4,(word_FF9142).w
		bclr	#2,$D(a0)
		addq.w	#1,2(a0)
		move.w	#$12C,$38(a0)

sub_12A0A0:
		jsr	sub_12A1EE(pc)
		addq.w	#1,2(a0)

locret_12A0A8:
		rts

sub_12A0AA:
		lea	off_12A0B2(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_12A0B2:	dc.w sub_12A0BC-off_12A0B2
		dc.w sub_12A0EE-off_12A0B2
		dc.w locret_12A0FC-off_12A0B2
		dc.w sub_12A0FE-off_12A0B2
		dc.w sub_12A124-off_12A0B2

sub_12A0BC:
		move.b	#$18,$C(a0)
		move.w	#$200,$10(a0)
		move.w	#$100,$14(a0)
		move.w	#$2060,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#$10,d0
		jsr	sub_12A5C4(pc)
		move.w	#$FFFE,$18(a0)
		move.w	#$60,$38(a0)

sub_12A0EE:
		jsr	sub_12A5E8
		jsr	sub_12A1EE(pc)
		addq.w	#1,2(a0)

locret_12A0FC:
		rts

sub_12A0FE:
		move.w	#$23C0,$A(a0)
		moveq	#$12,d0
		jsr	sub_12A5C4(pc)
		move.b	#1,(byte_FFFC07).w
		move.w	#$37,$38(a0)
		bset	#0,(byte_FF900C).w
		bset	#0,(byte_FF908C).w
		rts

sub_12A124:
		jsr	sub_12A1EE(pc)
		bset	#0,$C(a0)
		rts

sub_12A130:
		lea	off_12A138(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_12A138:	dc.w sub_12A13C-off_12A138
		dc.w sub_12A156-off_12A138

sub_12A13C:
		move.b	#$18,$C(a0)
		move.w	#$43C0,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#$14,d0
		jsr	sub_12A5C4(pc)

sub_12A156:
		move.w	(word_FF9050).w,$10(a0)
		move.w	(word_FF9054).w,$14(a0)
		subi.w	#$22,$14(a0)
		move.b	(byte_FF906D).w,$2D(a0)
		rts

sub_12A170:
		lea	off_12A178(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_12A178:	dc.w sub_12A17C-off_12A178
		dc.w loc_12A196-off_12A178

sub_12A17C:
		move.b	#$18,$C(a0)
		move.w	#$23C0,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#$11,d0
		jsr	sub_12A5C4(pc)

loc_12A196:
		move.w	(word_FF9050).w,$10(a0)
		move.w	(word_FF9054).w,$14(a0)
		subi.w	#$22,$14(a0)
		move.b	(byte_FF906D).w,$2D(a0)
		rts

sub_12A1B0:
		lea	off_12A1B8(pc),a1
		jmp	sub_12A5D8(pc)	; a1 = funcs table
off_12A1B8:	dc.w sub_12A1BC-off_12A1B8
		dc.w locret_12A1EC-off_12A1B8

sub_12A1BC:
		move.b	#$18,$C(a0)
		move.w	#$23C0,$A(a0)
		move.l	#off_12A1F8,$20(a0)
		moveq	#$13,d0
		jsr	sub_12A5C4(pc)
		move.w	(word_FF9150).w,$10(a0)
		subq.w	#4,$10(a0)
		move.w	(word_FF9154).w,$14(a0)
		subi.w	#$20,$14(a0)

locret_12A1EC:
		rts

sub_12A1EE:
		subq.w	#1,$38(a0)
		beq.s	locret_12A1F6
		move.l	(sp)+,d0

locret_12A1F6:
		rts

off_12A1F8:	dc.w byte_12A226-off_12A1F8
		dc.w byte_12A22A-off_12A1F8
		dc.w byte_12A22E-off_12A1F8
		dc.w byte_12A232-off_12A1F8
		dc.w byte_12A236-off_12A1F8
		dc.w byte_12A23C-off_12A1F8
		dc.w byte_12A240-off_12A1F8
		dc.w byte_12A24A-off_12A1F8
		dc.w byte_12A24E-off_12A1F8
		dc.w byte_12A252-off_12A1F8
		dc.w byte_12A256-off_12A1F8
		dc.w byte_12A25A-off_12A1F8
		dc.w byte_12A25E-off_12A1F8
		dc.w byte_12A262-off_12A1F8
		dc.w byte_12A266-off_12A1F8
		dc.w byte_12A26A-off_12A1F8
		dc.w byte_12A26E-off_12A1F8
		dc.w byte_12A274-off_12A1F8
		dc.w byte_12A278-off_12A1F8
		dc.w byte_12A282-off_12A1F8
		dc.w byte_12A298-off_12A1F8
		dc.w byte_12A29C-off_12A1F8
		dc.w byte_12A2A0-off_12A1F8
byte_12A226:	dc.b 0,	$FF, 0,	$82
byte_12A22A:	dc.b 0,	$FF, 0,	$8E
byte_12A22E:	dc.b 0,	$FF, 0,	$A4
byte_12A232:	dc.b 0,	$FF, 0,	$BA
byte_12A236:	dc.b 1,	8, 0, $E0, 3, 6
byte_12A23C:	dc.b 0,	$FF, 0,	$FA
byte_12A240:	dc.b 3,	$F, 1, $54, 1, $C, 1, $30, 1, $C
byte_12A24A:	dc.b 0,	$FF, 1,	$6E
byte_12A24E:	dc.b 0,	$FF, 1,	$7A
byte_12A252:	dc.b 0,	$FF, 1,	$8C
byte_12A256:	dc.b 0,	$FF, 1,	$9E
byte_12A25A:	dc.b 0,	$FF, 1,	$B4
byte_12A25E:	dc.b 0,	$FF, 1,	$C0
byte_12A262:	dc.b 0,	$FF, 1,	$BC
byte_12A266:	dc.b 0,	$FF, 1,	$C8
byte_12A26A:	dc.b 0,	$FF, 0,	$9C
byte_12A26E:	dc.b 1,	1, 1, $CC, 2, $1E
byte_12A274:	dc.b 0,	$FF, 2,	$6A
byte_12A278:	dc.b 3,	$F, 2, $72, 2, $96, 2, $AC, 2, $B8
byte_12A282:	dc.b 9,	5, 2, $DA, 2, $E6, 0, $24, 0, $24, $82,	$DA, $82, $E6, 0, $24
		dc.b 0,	$24, 0,	$24, 0,	$24
byte_12A298:	dc.b 0,	$FF, 2,	$DC
byte_12A29C:	dc.b 0,	$FF, 3,	$D
byte_12A2A0:	dc.b 1,	2, 2, $DF, 2, $F4, $FF,	0, 1, 0, 0, 0, 0, 0, $E0, $F
		dc.b 1,	$9F, $E8, $E0, 7, 1, $AF, 8, 3,	0, 0, 0, 0, 0, $D8, 4
		dc.b 0,	$75, $FC, $E0, $D, 0, $77, $F4,	$E8, 0,	0, $7F,	$EC, $F0, $D, 0
		dc.b $80, $EC, 3, 0, 0,	0, 0, 0, $D0, 4, 0, $88, $FC, $D8, $D, 0
		dc.b $8A, $F4, $E0, 0, 0, $92, $EC, $E8, $E, 0,	$93, $EC, 3, 0,	0, 0
		dc.b 0,	0, $D0,	$E, 0, $9F, $E8, $D0, 2, 0, $AB, 8, $E8, $E, 0,	$AE
		dc.b $E8, $E8, 6, 0, $BA, 8, 1,	0, 0, 0, 0, 0, $D0, 5, 0, $F7
		dc.b $F4, $E0, $B, 0, $FB, $F4,	4, 0, 0, 0, 0, 0, $D8, 4, 0, $E7
		dc.b $F0, $E0, $D, 0, $E9, $F0,	$F0, 8,	0, $F1,	$F8, $F8, 4, 0,	$F4, $F8
		dc.b $F8, 0, 0,	$F6, 8,	0, 2, 0, 0, 0, 0, 0, $D0, 4, 1,	7
		dc.b $F8, $D8, $E, 1, 9, $F0, $F0, 9, 1, $15, $F0, 0, 5, 0, 0, 0
		dc.b 0,	0, $D0,	$E, 1, $69, $E8, $D0, 6, 1, $75, 8, $E0, $D, 0,	0
		dc.b $EC, $E0, 1, 0, 8,	$C, $F0, $D, 0,	$A, $EC, $F0, 1, 0, $12, $C
		dc.b 5,	0, 0, 0, 0, 0, $D0, $E,	1, $69,	$E8, $D0, 6, 1,	$75, 8
		dc.b $E0, $D, 0, 0, $EC, $E0, 1, 0, 8, $C, $F0,	$D, 0, $14, $EC, $F0
		dc.b 1,	0, $1C,	$C, 5, 0, 0, 0,	0, 0, $D0, $E, 1, $69, $E8, $D0
		dc.b 6,	1, $75,	8, $E0,	$D, 0, 0, $EC, $E0, 1, 0, 8, $C, $F0, $D
		dc.b 0,	$1E, $EC, $F0, 1, 0, $26, $C, 1, 0, 0, 0, 0, 0,	$E0, $F
		dc.b 0,	$28, $E8, $E0, 7, 0, $38, 8, 2,	0, 0, 0, 0, 0, $F0, $D
		dc.b 0,	$40, $E0, $F0, 8, 0, $48, 0, $F8, $C, 0, $4B, 0, 0, 2, 0
		dc.b 0,	0, 0, 0, $E8, 8, 0, $4F, $EC, $F0, $D, 0, $52, $E4, $E8, $A
		dc.b 0,	$5A, 4,	0, 3, 0, 0, 0, 0, 0, $E8, 8, 0,	$63, $EC, $F0
		dc.b $D, 0, $66, $E4, $E8, 5, 0, $6E, 4, $F8, 8, 0, $72, 4, 1, 0
		dc.b 0,	0, 0, 0, $E8, $E, 1, $69, $E8, $E8, 6, 1, $75, 8, 1, 0
		dc.b 0,	0, 0, 0, $F0, $D, 1, $7B, $E4, $F0, 9, 1, $83, 4, 0, 0
		dc.b 0,	0, 0, 0, $F1, 5, 1, $89, $F6, 0, $E, 0,	0, 0, 0, 0
		dc.b $D8, $D, 0, $10, $F0, $C8,	2, 0, $D, $CC, $C8, $B,	0, $20,	$EC, $C8
		dc.b $B, 0, $20, 4, $C0, $C, 0,	$2C, $DC, $C8, 0, 0, $30, $E4, $D0, $A
		dc.b 0,	$31, $D4, $E0, 0, 0, $3A, $CC, $E8, $D,	0, $3B,	$D4, $E8, $D, 0
		dc.b $43, $F4, $E8, 5, 0, $4B, $14, $D0, 9, 0, $4F, $1C, $E0, 4, 0, $55
		dc.b $1C, $C8, 4, 0, $57, $24, $F8, 4, 0, $59, $EC, 0, $E, 0, 0, 0
		dc.b 0,	0, $D8,	$D, 0, $10, $F0, $E8, 2, 0, $D,	$CC, $C8, $B, 0, $20
		dc.b $EC, $C8, $B, 0, $20, 4, $C0, $C, 0, $2C, $DC, $C8, 0, 0, $30, $E4
		dc.b $D0, $A, 0, $31, $D4, $E0,	0, 0, $3A, $CC,	$E8, $D, 0, $3B, $D4, $E8
		dc.b $D, 0, $43, $F4, $E8, 5, 0, $4B, $14, $D0,	9, 0, $4F, $1C,	$E0, 4
		dc.b 0,	$55, $1C, $C8, 4, 0, $57, $24, $F8, 4, 0, $59, $EC, 0, 0, 0
		dc.b 0,	0, 0, 0, $E0, $A, 1, $96, 4, 0,	5, 0, 0, 0, 0, 0
		dc.b $D8, $F, 1, $24, $AC, $D8,	0, 1, $34, $CC,	$D8, 4,	1, $35,	$DC, $E0
		dc.b $E, 1, $37, $CC, $E0, 0, 1, $43, $EC, $F0,	0, 1, $44, $EC,	2, 0
		dc.b 0,	0, 0, 0, $C0, $E, 1, $45, $9C, $D8, 4, 1, $51, $AC, $C0, $B
		dc.b 1,	$53, $BC, 0, 0,	0, 0, 0, 0, 0, $B8, $D,	1, $5F,	$98, 0
		dc.b 0,	0, 0, 0, 0, 0, $B0, 4, 1, $67, $98, 0, 4, 0, 0,	0
		dc.b 0,	0, $D8,	4, 0, $E7, $F0,	$E0, $D, 0, $E9, $F0, $F0, 8, 0, $F1
		dc.b $F8, $F8, 4, 1, $1B, $F8, $F8, 0, 0, $F6, 8, 0, 0,	0, 0, 0
		dc.b 0,	0, $F8,	0, 1, $1D, $F4,	0, 0, 0, 0, 0, 0, 0, $F0, 5
		dc.b 1,	$1E, $EC, 0, 0,	0, 0, 0, 0, 0, $E0, $A,	1, $8D,	$EC, 2
		dc.b 0,	0, 0, 0, 0, $E8, $D, 0,	$C0, $E4, $F8, 8, 0, $C8, $EC, $E8
		dc.b $A, 0, $CB, 4, 2, 0, 0, 0,	0, 0, $E8, $D, 0, $D4, $E4, $F8
		dc.b 4,	0, $DC,	$F4, $E8, $A, 0, $DE, 4, 3, 0, 0, 0, 0,	0, $D8
		dc.b 4,	1, $22,	$F8, $D0, 4, 1,	7, $F8,	$D8, $E, 1, 9, $F0, $F0, 9
		dc.b 1,	$15, $F0, 0
sub_12A5C4:
		addq.w	#1,2(a0)
		move.w	d0,4(a0)
		moveq	#0,d0
		move.w	d0,6(a0)
		move.b	d0,8(a0)
		rts
; a1 = funcs table

sub_12A5D8:
		moveq	#0,d0
		move.w	2(a0),d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		adda.l	d0,a1
		jmp	(a1)

sub_12A5E8:
		move.l	$18(a0),d0
		add.l	d0,$10(a0)
		move.l	$1C(a0),d0
		add.l	d0,$14(a0)
		rts

nemesis_12A5FA:
    binclude "src/nemesis/data_12A5FA.bin"
    align 2, 0
word_12A87A:	dc.w $2300, $2301, $2302, $2303, $2304,	$2305, $2306, $2307, $2308, $2309
		dc.w $230A, $230B, $230C, $230D, $230E,	$230F, $2310, $2311, $2312, $2313
		dc.w $2314, $2315, $2316, $2317, $2318,	$2319, $231A, $231B, $231C, $231D
		dc.w $231E, $231F, $2320, $2321, $2322,	$2323, $2324, $2325, $2326
tbl_ram_vram_send:ram_vram_send M68K_RAM, $40000003, $1F, $1B
		ram_vram_send unk_FF0800, $40400003, $1F, $1B
		ram_vram_send M68K_RAM, $40800003, $1F, $1B
		ram_vram_send unk_FF0800, $40C00003, $1F, $1B
		ram_vram_send unk_FF1000, $60000003, $1F, $1B
		ram_vram_send unk_FF1000, $60400003, $1F, $1B
		ram_vram_send unk_FF1000, $60800003, $1F, $1B
		ram_vram_send unk_FF1000, $60C00003, $1F, $1B
		ram_vram_send M68K_RAM, $60500003, $27, $D
		ram_vram_send unk_FF1000, $6E500003, $27, $D
		ram_vram_send M68K_RAM, $43080003, $1F, 8
		ram_vram_send unk_FF2000, $58140003, $14, 2
		ram_vram_send unk_FF4000, $4B280003, $F, 1
sub_12A964:
		movem.l	d0-d2/a1-a3,-(sp)
		add.w	d1,d1
		move.w	off_12A9A8(pc,d1.w),d1
		lea	off_12A9A8(pc,d1.w),a3
		lea	(VDP_DATA).l,a2
		move.w	(a3)+,d2

loc_12A97A:
		move.w	(a3)+,d1
		lea	off_12A9A8(pc,d1.w),a1
		move.w	(a3)+,(VDP_CTRL).l
		move.w	#3,(VDP_CTRL).l

loc_12A98E:
		moveq	#0,d1
		move.b	(a1)+,d1
		cmpi.b	#$FF,d1
		beq.s	loc_12A99E
		add.w	d0,d1
		move.w	d1,(a2)
		bra.s	loc_12A98E

loc_12A99E:
		dbf	d2,loc_12A97A
		movem.l	(sp)+,d0-d2/a1-a3
		rts

off_12A9A8:	dc.w word_12AA08-off_12A9A8
		dc.w word_12AA0E-off_12A9A8
		dc.w word_12AA14-off_12A9A8
		dc.w word_12AA1A-off_12A9A8
		dc.w word_12AA20-off_12A9A8
		dc.w word_12AA20-off_12A9A8
		dc.w word_12AA32-off_12A9A8
		dc.w word_12AA3C-off_12A9A8
		dc.w word_12AA46-off_12A9A8
		dc.w word_12AA4C-off_12A9A8
		dc.w word_12AA56-off_12A9A8
		dc.w word_12AA60-off_12A9A8
		dc.w word_12AA6A-off_12A9A8
		dc.w word_12AA7C-off_12A9A8
		dc.w word_12AA8E-off_12A9A8
		dc.w word_12AA9C-off_12A9A8
		dc.w word_12AAA6-off_12A9A8
		dc.w word_12AAB4-off_12A9A8
		dc.w word_12AAD6-off_12A9A8
		dc.w word_12B5A4-off_12A9A8
		dc.w word_12B5B2-off_12A9A8
		dc.w word_12B5C0-off_12A9A8
		dc.w word_12B5CE-off_12A9A8
		dc.w word_12B5DC-off_12A9A8
		dc.w word_12B5EE-off_12A9A8
		dc.w word_12B600-off_12A9A8
		dc.w word_12B616-off_12A9A8
		dc.w word_12B62C-off_12A9A8
		dc.w word_12B63E-off_12A9A8
		dc.w word_12B64C-off_12A9A8
		dc.w word_12B65E-off_12A9A8
		dc.w word_12B668-off_12A9A8
		dc.w word_12B676-off_12A9A8
		dc.w word_12AEF2-off_12A9A8
		dc.w word_12AF14-off_12A9A8
		dc.w word_12AF36-off_12A9A8
		dc.w word_12AF48-off_12A9A8
		dc.w word_12AF5A-off_12A9A8
		dc.w word_12AF7C-off_12A9A8
		dc.w word_12AF96-off_12A9A8
		dc.w word_12AFB8-off_12A9A8
		dc.w word_12AFD2-off_12A9A8
		dc.w word_12AFEC-off_12A9A8
		dc.w word_12AAF8-off_12A9A8
		dc.w word_12AB02-off_12A9A8
		dc.w word_12AB0C-off_12A9A8
		dc.w word_12AB16-off_12A9A8
		dc.w word_12AB20-off_12A9A8
word_12AA08:	dc.w 0
		struc_12A9A8 byte_12AB2E-off_12A9A8, $5524
word_12AA0E:	dc.w 0
		struc_12A9A8 byte_12AB34-off_12A9A8, $560C
word_12AA14:	dc.w 0
		struc_12A9A8 byte_12AB52-off_12A9A8, $560C
word_12AA1A:	dc.w 0
		struc_12A9A8 byte_12AB70-off_12A9A8, $560A
word_12AA20:	dc.w 3
		struc_12A9A8 byte_12AB90-off_12A9A8, $5406
		struc_12A9A8 byte_12AB90-off_12A9A8, $5506
		struc_12A9A8 byte_12AB90-off_12A9A8, $5606
		struc_12A9A8 byte_12AB90-off_12A9A8, $5706
word_12AA32:	dc.w 1
		struc_12A9A8 byte_12ABB6-off_12A9A8, $4A0C
		struc_12A9A8 byte_12ABD6-off_12A9A8, $4B0E
word_12AA3C:	dc.w 1
		struc_12A9A8 byte_12ABEC-off_12A9A8, $4A04
		struc_12A9A8 byte_12AC12-off_12A9A8, $4B06
word_12AA46:	dc.w 0
		struc_12A9A8 byte_12AC24-off_12A9A8, $4A04
word_12AA4C:	dc.w 1
		struc_12A9A8 byte_12AC4A-off_12A9A8, $4A10
		struc_12A9A8 byte_12AC66-off_12A9A8, $4B22
word_12AA56:	dc.w 1
		struc_12A9A8 byte_12AC6E-off_12A9A8, $4A1A
		struc_12A9A8 byte_12AC7C-off_12A9A8, $4B1A
word_12AA60:	dc.w 1
		struc_12A9A8 byte_12AC8A-off_12A9A8, $4A22
		struc_12A9A8 byte_12AC92-off_12A9A8, $4B0C
word_12AA6A:	dc.w 3
		struc_12A9A8 byte_12ACB0-off_12A9A8, $4A1E
		struc_12A9A8 byte_12ACBC-off_12A9A8, $4B18
		struc_12A9A8 byte_12ADD8-off_12A9A8, $4C10
		struc_12A9A8 byte_12ADEE-off_12A9A8, $4D10
word_12AA7C:	dc.w 3
		struc_12A9A8 byte_12ACCE-off_12A9A8, $4996
		struc_12A9A8 byte_12ACE0-off_12A9A8, $4A9A
		struc_12A9A8 byte_12ACEE-off_12A9A8, $4C16
		struc_12A9A8 byte_12ACFE-off_12A9A8, $4D24
word_12AA8E:	dc.w 2
		struc_12A9A8 byte_12AD02-off_12A9A8, $4996
		struc_12A9A8 byte_12AD14-off_12A9A8, $4A98
		struc_12A9A8 byte_12AD2A-off_12A9A8, $4B98
word_12AA9C:	dc.w 1
		struc_12A9A8 byte_12AD4C-off_12A9A8, $4A14
		struc_12A9A8 byte_12AD64-off_12A9A8, $4B1E
word_12AAA6:	dc.w 2
		struc_12A9A8 byte_12AD3A-off_12A9A8, $4A14
		struc_12A9A8 byte_12AD70-off_12A9A8, $4B14
		struc_12A9A8 byte_12AD84-off_12A9A8, $4CA2
word_12AAB4:	dc.w 7
		struc_12A9A8 byte_12AD8C-off_12A9A8, $4A04
		struc_12A9A8 byte_12AD8C-off_12A9A8, $4B04
		struc_12A9A8 byte_12AD8C-off_12A9A8, $4984
		struc_12A9A8 byte_12AD8C-off_12A9A8, $4A84
		struc_12A9A8 byte_12AD8C-off_12A9A8, $4C04
		struc_12A9A8 byte_12AD8C-off_12A9A8, $4D04
		struc_12A9A8 byte_12AD8C-off_12A9A8, $4B84
		struc_12A9A8 byte_12AD8C-off_12A9A8, $4C84
word_12AAD6:	dc.w 7
		struc_12A9A8 byte_12ADB2-off_12A9A8, $4A04
		struc_12A9A8 byte_12ADB2-off_12A9A8, $4B04
		struc_12A9A8 byte_12ADB2-off_12A9A8, $4984
		struc_12A9A8 byte_12ADB2-off_12A9A8, $4A84
		struc_12A9A8 byte_12ADB2-off_12A9A8, $4C04
		struc_12A9A8 byte_12ADB2-off_12A9A8, $4D04
		struc_12A9A8 byte_12ADB2-off_12A9A8, $4B84
		struc_12A9A8 byte_12ADB2-off_12A9A8, $4C84
word_12AAF8:	dc.w 1
		struc_12A9A8 byte_12AE06-off_12A9A8, $4A0C
		struc_12A9A8 byte_12AE1E-off_12A9A8, $4A8C
word_12AB02:	dc.w 1
		struc_12A9A8 byte_12AE38-off_12A9A8, $4A0C
		struc_12A9A8 byte_12AE4A-off_12A9A8, $4A8C
word_12AB0C:	dc.w 1
		struc_12A9A8 byte_12AE66-off_12A9A8, $4A14
		struc_12A9A8 byte_12AE76-off_12A9A8, $4A94
word_12AB16:	dc.w 1
		struc_12A9A8 byte_12AE8C-off_12A9A8, $4A10
		struc_12A9A8 byte_12AEA8-off_12A9A8, $4B12
word_12AB20:	dc.w 2
		struc_12A9A8 byte_12AEBC-off_12A9A8, $4A10
		struc_12A9A8 byte_12AED8-off_12A9A8, $4A92
		struc_12A9A8 byte_12AEE4-off_12A9A8, $4B12
byte_12AB2E:	dc.b $D, $B, $1C, $1D, $FF, 0
byte_12AB34:	dc.b $E, 1, $18, $B, $16, $E, 0, $E, $1E, $D, $15, 0, 0, 0, 0, 0
		dc.b 0,	0, $E, $B, $13,	$1C, $22, 0, $E, $1E, $D, $15, $FF, 0
byte_12AB52:	dc.b $12, $1E, $F, $22,	$27, 0,	$E, $F,	$20, $F, $22, $27, 0, $34, 0, $16
		dc.b 1,	$1E, $13, $F, 0, 0, 0, 0, $11, 1, 1, $10, $22, $FF
byte_12AB70:	dc.b $1E, $18, $D, $16,	$F, 0, $1C, $D,	$1B, 1,	1, $11,	$F, 0, 0, 0
		dc.b 0,	$11, $22, $1B, 1, 0, $11, $F, $B, $1B, $16, 1, 1, $1C, $F, $FF
byte_12AB90:	dc.b 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1
		dc.b 1,	1, 1, 1, 1, 1, 1, 1, 1,	1, 1, 1, 1, 1, 1, 1
		dc.b 1,	1, 1, 1, $FF, 0
byte_12ABB6:	dc.b $28, $E, 1, $18, $B, $16, $E, $25,	0, $13,	$1D, $2D, $1C, 0, $18, $13
		dc.b $D, $F, 0,	$1D, 1,	0, $1C,	$F, $F,	0, $22,	1, $1E,	$26, $FF, 0
byte_12ABD6:	dc.b $20, $12, $F, $1B,	$F, $2D, $1C, 0, $17, $22, 0, $19, $1B,	$F, $1C, $F
		dc.b $18, $1D, $24, $29, $FF, 0
byte_12ABEC:	dc.b $28, $1D, $12, $13, $1C, 0, $13, $1C, 0, $13, $1D,	$2A, $2A, $1D, $12, $F
		dc.b 0,	$11, $1B, $F, $B, $1D, 0, $E, $1E, $D, $15, 0, $1D, $1B, $F, $B
		dc.b $1C, $1E, $1B, $F,	$FF, 0
byte_12AC12:	dc.b 1,	$10, 0,	$15, $13, $18, $11, 0, $11, $B,	$1B, $1E, $23, $13, $B,	$26
		dc.b $29, $FF
byte_12AC24:	dc.b $28, $1D, $12, $13, $1C, 0, $13, $1C, 0, $17, $22,	0, $19,	$1B, $F, $1C
		dc.b $F, $18, $1D, $24,	0, $13,	$1C, 0,	$1D, $12, $B, $1D, 0, $B, $16, $16
		dc.b $24, $25, $25, $29, $FF, 0
byte_12AC4A:	dc.b $11, $B, $17, $F, $40, $E,	$F, $1C, $13, $11, $18,	$F, $E,	$40, $34, $40
		dc.b $E, $13, $1B, $F, $D, $1D,	$F, $E,	$40, $C, $22, $FF
byte_12AC66:	dc.b $F, $17, $13, $1B,	$13, $18, $FF, 0
byte_12AC6E:	dc.b $B, $1B, $1D, $40,	$E, $13, $1B, $F, $D, $1D, 1, $1B, $FF,	0
byte_12AC7C:	dc.b $1D, $12, 1, $17, $B, $1C,	$40, $22, $1E, $1E, $E,	$B, $FF, 0
byte_12AC8A:	dc.b $B, $1B, $1D, $13,	$1C, $1D, $1C, $FF
byte_12AC92:	dc.b $1B, $13, $D, $F, $40, $40, $40, $17, $13,	$15, $B, $1B, $13, $18,	$40, $40
		dc.b $40, $1D, $12, 1, $17, $B,	$1C, $40, $22, $1E, $1E, $E, $B, $FF
byte_12ACB0:	dc.b $19, $1B, 1, $11, $1B, $B,	$17, $17, $F, $1B, $1C,	$FF
byte_12ACBC:	dc.b $17, $1E, $13, $17, $1E, $13, $40,	$40, $40, $40, $40, $22, $B, $17, $B, 2
		dc.b $FF, 0
byte_12ACCE:	dc.b $17, $1E, $1C, $13, $D, $40, $D, 1, $17, $19, 1, $1C, $F, $E, $40,	$C
		dc.b $22, $FF
byte_12ACE0:	dc.b $15, $B, $17, $13,	$22, $B, $40, $1C, $1D,	$1E, $E, $13, 1, $FF
byte_12ACEE:	dc.b $1C, 1, $1E, $18, $E, $40,	$19, $1B, 1, $E, $1E, $D, $F, $1B, $FF,	0
byte_12ACFE:	dc.b $C, 1, $FF, 0
byte_12AD02:	dc.b $1C, $19, $F, $D, $13, $B,	$16, $40, $1D, $12, $B,	$18, $15, $1C, $40, $1D
		dc.b 1,	$FF
byte_12AD14:	dc.b $C, $F, $1B, $1D, $40, $40, $40, $40, $40,	$14, $B, $D, $15, $1C, 1, $18
		dc.b $40, $22, 1, $1E, $FF, 0
byte_12AD2A:	dc.b $12, $1E, $11, $12, $40, $40, $40,	$40, $40, 1, $12, $1C, $B, $18,	$FF, 0
byte_12AD3A:	dc.b $17, $B, $13, $18,	$40, $19, $1B, 1, $11, $1B, $B,	$17, $17, $F, $1B, $40
		dc.b $34, $FF
byte_12AD4C:	dc.b $20, $B, $16, $1D,	$40, $E, $13, $1C, $18,	$F, $22, $2D, $1C, $40,	$19, $1B
		dc.b 1,	$E, $1E, $D, $F, $1B, $FF, 0
byte_12AD64:	dc.b $14, $13, $17, $40, $1C, $13, $17,	$17, 1,	$18, $1C, $FF
byte_12AD70:	dc.b $19, $1B, 1, $11, $1B, $B,	$17, $40, $D, 1, 1, $1B, $E, $13, $18, $B
		dc.b $1D, 1, $1B, $FF
byte_12AD84:	dc.b $1C, $B, $1D, $17,	$B, $18, $FF, 0
byte_12AD8C:	dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0, 0, 0
		dc.b 0,	0, 0, 0, $FF, 0
byte_12ADB2:	dc.b $40, $40, $40, $40, $40, $40, $40,	$40, $40, $40, $40, $40, $40, $40, $40,	$40
		dc.b $40, $40, $40, $40, $40, $40, $40,	$40, $40, $40, $40, $40, $40, $40, $40,	$40
		dc.b $40, $40, $40, $40, $FF, 0
byte_12ADD8:	dc.b $17, 1, $17, 1, $18, $11, $B, $40,	$17, 1,	$17, 1,	$40, $40, $40, $40
		dc.b $40, $1B, $22, $1E, $1E, $FF
byte_12ADEE:	dc.b $17, $2F, 1, $12, $17, 1, $1B, $13, $40, $40, $40,	$40, $40, $40, $40, $1D
		dc.b $B, $1D, $1C, $1E,	$22, $B, $18, $FF
byte_12AE06:	dc.b $3B, $3D, $3B, $3B, $3D, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3E
		dc.b $3B, $3D, $3B, $3B, $3B, $3D, $FF,	0
byte_12AE1E:	dc.b $3F, $85, $86, $9A, $85, $3B, $40,	$41, $4F, $45, $6E, $4F, $6B, $25, $3B,	$8D
		dc.b $9B, $7F, $9F, $85, $59, $53, $49,	$24, $A9, $FF
byte_12AE38:	dc.b $3B, $3B, $3B, $3B, $3B, $3D, $3B,	$3D, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3D
		dc.b $FF, 0
byte_12AE4A:	dc.b $3F, $49, $69, $54, $6D, $4F, $48,	$53, $2F, $2F, $2F, $4D, $41, $54, $68,	$81
		dc.b $A0, $79, $58, $4F, $45, $66, $4A,	$2F, $2F, $2F, $A9, $FF
byte_12AE66:	dc.b $3B, $3B, $3B, $3D, $3E, $3B, $3D,	$3B, $3B, $3B, $3B, $3B, $3B, $3D, $FF,	0
byte_12AE76:	dc.b $3F, $49, $69, $45, $8D, $9B, $7F,	$9F, $85, $24, $3B, $49, $69, $4F, $48,	$54
		dc.b $58, $24, $25, $A9, $FF, 0
byte_12AE8C:	dc.b $28, $B, $3B, $11,	1, $16,	$E, $3B, $B, $18, $E, $3B, $14,	$F, $20, $F
		dc.b $16, $3B, $18, $F,	$D, $15, $16, $B, $D, $F, $25, $FF
byte_12AEA8:	dc.b $1D, $12, $B, $18,	$15, $3B, $22, 1, $1E, $27, $3B, $E, 1,	$18, $B, $16
		dc.b $E, $25, $29, $FF
byte_12AEBC:	dc.b $3F, $5E, $40, $3B, $4C, $52, $46,	$25, $3B, $46, $69, $41, $54, $3B, $5D,	$42
		dc.b $4D, $46, $58, $3B, $89, $A0, $79,	$9B, $7E, $25, $FF, 0
byte_12AED8:	dc.b $3B, $3B, $3D, $3B, $3B, $3B, $3D,	$3B, $3B, $3D, $FF, 0
byte_12AEE4:	dc.b $40, $67, $45, $53, $42, $3B, $85,	$86, $9A, $85, $25, $A9, $FF, 0
word_12AEF2:	dc.w 7
		struc_12A9A8 byte_12B00E-off_12A9A8, $688C
		struc_12A9A8 byte_12B022-off_12A9A8, $690C
		struc_12A9A8 byte_12B03E-off_12A9A8, $698C
		struc_12A9A8 byte_12B044-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B05C-off_12A9A8, $6A8C
		struc_12A9A8 byte_12B06E-off_12A9A8, $6B0C
		struc_12A9A8 byte_12B08A-off_12A9A8, $6B8C
		struc_12A9A8 byte_12B08C-off_12A9A8, $6C0C
word_12AF14:	dc.w 7
		struc_12A9A8 byte_12B0A2-off_12A9A8, $688C
		struc_12A9A8 byte_12B0BA-off_12A9A8, $690C
		struc_12A9A8 byte_12B0D8-off_12A9A8, $698C
		struc_12A9A8 byte_12B0EA-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B10A-off_12A9A8, $6A8C
		struc_12A9A8 byte_12B126-off_12A9A8, $6B0C
		struc_12A9A8 byte_12B144-off_12A9A8, $6B8C
		struc_12A9A8 byte_12B15C-off_12A9A8, $6C0C
word_12AF36:	dc.w 3
		struc_12A9A8 byte_12B176-off_12A9A8, $690C
		struc_12A9A8 byte_12B196-off_12A9A8, $698C
		struc_12A9A8 byte_12B1B6-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B1B8-off_12A9A8, $6A8C
word_12AF48:	dc.w 3
		struc_12A9A8 byte_12B1C4-off_12A9A8, $690C
		struc_12A9A8 byte_12B1E0-off_12A9A8, $698C
		struc_12A9A8 byte_12B1FC-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B212-off_12A9A8, $6A8C
word_12AF5A:	dc.w 7
		struc_12A9A8 byte_12B22A-off_12A9A8, $688C
		struc_12A9A8 byte_12B23E-off_12A9A8, $690C
		struc_12A9A8 byte_12B25E-off_12A9A8, $698C
		struc_12A9A8 byte_12B278-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B294-off_12A9A8, $6A8C
		struc_12A9A8 byte_12B2AC-off_12A9A8, $6B0C
		struc_12A9A8 byte_12B2C6-off_12A9A8, $6B8C
		struc_12A9A8 byte_12B2CE-off_12A9A8, $6C0C
word_12AF7C:	dc.w 5
		struc_12A9A8 byte_12B2D6-off_12A9A8, $688C
		struc_12A9A8 byte_12B2F2-off_12A9A8, $690C
		struc_12A9A8 byte_12B312-off_12A9A8, $698C
		struc_12A9A8 byte_12B32E-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B34E-off_12A9A8, $6A8C
		struc_12A9A8 byte_12B350-off_12A9A8, $6B0C
word_12AF96:	dc.w 7
		struc_12A9A8 byte_12B368-off_12A9A8, $688C
		struc_12A9A8 byte_12B37A-off_12A9A8, $690C
		struc_12A9A8 byte_12B398-off_12A9A8, $698C
		struc_12A9A8 byte_12B3B0-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B3CC-off_12A9A8, $6A8C
		struc_12A9A8 byte_12B3CE-off_12A9A8, $6B0C
		struc_12A9A8 byte_12B3D4-off_12A9A8, $6B8C
		struc_12A9A8 byte_12B3F0-off_12A9A8, $6C0C
word_12AFB8:	dc.w 5
		struc_12A9A8 byte_12B40E-off_12A9A8, $688C
		struc_12A9A8 byte_12B42A-off_12A9A8, $690C
		struc_12A9A8 byte_12B448-off_12A9A8, $698C
		struc_12A9A8 byte_12B45A-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B472-off_12A9A8, $6A8C
		struc_12A9A8 byte_12B47A-off_12A9A8, $6B0C
word_12AFD2:	dc.w 5
		struc_12A9A8 byte_12B486-off_12A9A8, $688C
		struc_12A9A8 byte_12B4A4-off_12A9A8, $690C
		struc_12A9A8 byte_12B4C4-off_12A9A8, $698C
		struc_12A9A8 byte_12B4CA-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B4EA-off_12A9A8, $6A8C
		struc_12A9A8 byte_12B500-off_12A9A8, $6B0C
word_12AFEC:	dc.w 7
		struc_12A9A8 byte_12B518-off_12A9A8, $688C
		struc_12A9A8 byte_12B530-off_12A9A8, $690C
		struc_12A9A8 byte_12B54C-off_12A9A8, $698C
		struc_12A9A8 byte_12B54E-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B556-off_12A9A8, $6A8C
		struc_12A9A8 byte_12B572-off_12A9A8, $6B0C
		struc_12A9A8 byte_12B58E-off_12A9A8, $6B8C
		struc_12A9A8 byte_12B598-off_12A9A8, $6C0C
byte_12B00E:	dc.b $3B, $3B, $3B, $3B, $3B, $3D, $3B,	$3B, $3D, $3B, $3B, $3B, $3B, $3B, $3B,	$3D
		dc.b $3B, $3D, $FF, 0
byte_12B022:	dc.b $3B, $40, $68, $5A, $3B, $85, $86,	$9A, $85, $59, $3B, $7E, $79, $9A, $3C,	$7D
		dc.b $44, $4B, $4A, $6D, $58, $3B, $4B,	$71, $4A, $41, $58, $FF
byte_12B03E:	dc.b $3B, $3B, $3B, $3B, $3D, $FF
byte_12B044:	dc.b $45, $4F, $4C, $5F, $52, $3B, 2, $4A, $51,	$58, $3B, $5D, $6D, $6C, $3B, $5F
		dc.b $51, $48, $5E, $4B, $4F, $3E, $FF,	0
byte_12B05C:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3D,	$3B
		dc.b $3D, $FF
byte_12B06E:	dc.b $4E, $58, $5D, $6D, $58, $3B, $5A,	$71, $42, $4B, $55, $59, $3B, $3F, $79,	$9A
		dc.b $7D, $72, $44, $42, $53, $3B, $45,	$47, $4A, $69, $4F, $FF
byte_12B08A:	dc.b $3D, $FF
byte_12B08C:	dc.b $81, $A0, $79, $58, $5A, $5D, $42,	$A9, $3B, $53, $3B, $45, $45, $69, $52,	$3B
		dc.b $41, $5E, $4B, $4F, $3E, $FF
byte_12B0A2:	dc.b $3B, $3B, $3B, $3B, $3B, $3D, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3D, $3B,	$3D
		dc.b $3B, $3B, $3B, $3B, $3B, $3D, $FF,	0
byte_12B0BA:	dc.b $4E, $69, $55, $65, $69, $59, $3B,	$4E, $58, $60, $45, $4B, $3B, $79, $9A,	$7D
		dc.b $72, $44, $42, $59, $3B, $81, $A0,	$79, $44, $42, $49, $47, $FF, 0
byte_12B0D8:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3D, $FF
byte_12B0EA:	dc.b $53, $41, $42, $3B, $44, $44, $46,	$54, $47, $55, $58, $3B, $44, $42, $4A,	$5E
		dc.b $52, $4B, $4F, $3E, $3B, $45, $69,	$59, $3B, $4B, $56, $5E, $43, $55, $FF,	0
byte_12B10A:	dc.b $3B, $3B, $3D, $3B, $3B, $3D, $3B,	$3D, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3D, $FF, 0
byte_12B126:	dc.b $41, $50, $59, $6D, $3B, $4F, $41,	$4B, $55, $3B, $4B, $52, $41, $4F, $3B,	$4F
		dc.b $45, $66, $3B, $3F, $4D, $41, $54,	$68, $3B, $81, $A0, $79, $58, $FF
byte_12B144:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3D, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3D, $FF,	0
byte_12B15C:	dc.b $5A, $5D, $42, $A9, $3B, $6C, $3B,	$53, $49, $45, $55, $3B, $45, $47, $4B,	$4F
		dc.b $53, $3B, $41, $42, $58, $52, $4C,	$3E, $FF, 0
byte_12B176:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3D, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3D,	$3B, $3B, $3B, $3B, $3B, $3D, $3D, $FF,	0
byte_12B196:	dc.b $4E, $4B, $52, $3B, $4E, $58, $5D,	$6D, $55, $59, $3B, $81, $A0, $79, $58,	$3B
		dc.b $5A, $5D, $42, $58, $3B, $52, $45,	$45, $67, $58, $3B, $50, $4C, $45, $FF,	0
byte_12B1B6:	dc.b $FF, 0
byte_12B1B8:	dc.b $59, $4A, $5E, $69, $52, $3B, $41,	$5E, $4B, $4F, $3E, $FF
byte_12B1C4:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3D, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3D, $3B, $3B,	$3B, $3B, $3B, $3D, $FF
byte_12B1E0:	dc.b $3F, $20, 1, $20, $25, $3B, $49, $58, $3B,	$4F, $45, $66, $45, $3B, $52, $55
		dc.b $3B, $59, $41, $69, $59, $3B, $7E,	$79, $9A, $3C, $7D, $FF
byte_12B1FC:	dc.b $3B, $3B, $3D, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3D, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3D, $FF
byte_12B212:	dc.b $3B, $44, $4B, $4A, $6D, $65, $67,	$62, $3B, $44, $44, $45, $57, $62, $50,	$55
		dc.b $3B, $54, $69, $68, $4E, $25, $A9,	$FF
byte_12B22A:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3E, $3B, $3B, $3D,	$3B
		dc.b $3B, $3D, $3D, $FF
byte_12B23E:	dc.b $4B, $45, $4B, $3B, $4E, $58, $65,	$42, $4C, $6C, $3B, $8C, $3C, $85, $78,	$A1
		dc.b $9F, $79, $4F, $6D, $53, $41, $42,	$3B, $4D, $45, $41, $52, $46, $54, $FF,	0
byte_12B25E:	dc.b $3D, $3B, $3B, $3D, $3D, $3B, $3B,	$3B, $3B, $3B, $3B, $3D, $3B, $3B, $3D,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3D, $FF, 0
byte_12B278:	dc.b $78, $A1, $9F, $79, $4F, $6D, $58,	$3B, $41, $50, $5F, $45, $3B, $5E, $53,	$45
		dc.b $66, $3B, $5F, $52, $41, $4F, $58,	$52, $4B, $4F, $3E, $FF
byte_12B294:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3D, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3D, $3D, $FF,	0
byte_12B2AC:	dc.b $4E, $42, $53, $59, $3B, $4B, $66,	$4C, $3B, $4E, $58, $5D, $6D, $6C, $3B,	$62
		dc.b $6E, $52, $3B, $53, $5A, $4F, $4B,	$52, $FF, 0
byte_12B2C6:	dc.b $3B, $3B, $3D, $3B, $3B, $3D, $FF,	0
byte_12B2CE:	dc.b $41, $47, $85, $86, $9A, $85, $25,	$FF
byte_12B2D6:	dc.b $3E, $3B, $3B, $3D, $3B, $3B, $3D,	$3D, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3D,	$3B, $3B, $3B, $3D, $FF
byte_12B2F2:	dc.b $8C, $3C, $85, $78, $A1, $9F, $79,	$4F, $6D, $58, $3B, $41, $50, $5F, $59,	$3B
		dc.b $4F, $45, $66, $58, $3B, $50, $4C,	$6C, $3B, $42, $59, $44, $42, $53, $FF,	0
byte_12B312:	dc.b $3D, $3B, $3B, $3D, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3D, $3B, $3D, $3B, $3B,	$3D, $3D, $3B, $3D, $FF
byte_12B32E:	dc.b $85, $86, $9A, $85, $58, $3B, $40,	$53, $6C, $3B, $51, $48, $52, $41, $46,	$5E
		dc.b $4B, $4F, $45, $3B, $85, $86, $9A,	$85, $45, $53, $5A, $49, $43, $4F, $FF,	0
byte_12B34E:	dc.b $FF, 0
byte_12B350:	dc.b $90, $9F, $8F, $3C, $9A, $58, $3B,	$40, $54, $55, $3B, $44, $50, $52, $3B,	$4B
		dc.b $5E, $41, $5E, $4B, $4F, $3E, $FF,	0
byte_12B368:	dc.b $3D, $3B, $3B, $3D, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3D, $FF
byte_12B37A:	dc.b $85, $86, $9A, $85, $59, $3B, $4A,	$6E, $4E, $47, $3B, $8C, $A2, $3C, $73,	$3B
		dc.b $84, $A2, $3C, $73, $3B, $9A, $3C,	$73, $58, 4, $55, $6D, $58, $FF
byte_12B398:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3D,	$3B
		dc.b $3B, $3B, $3B, $3D, $3B, $3B, $3D,	$FF
byte_12B3B0:	dc.b $44, $41, $6E, $49, $6C, $3B, $51,	$69, $52, $3B, $4F, $45, $66, $4A, $45,	$4B
		dc.b $58, $3B, $4F, $5A, $55, $3B, $52,	$68, $49, $53, $55, $FF
byte_12B3CC:	dc.b $FF, 0
byte_12B3CE:	dc.b $4B, $5E, $4B, $4F, $3E, $FF
byte_12B3D4:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3D, $3B,	$3D
		dc.b $3B, $3D, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3D, $FF, 0
byte_12B3F0:	dc.b $4B, $45, $4B, $3B, $4E, $49, $55,	$3B, $44, $49, $6E, $4F, $3B, $84, $73,	$7D
		dc.b $3C, $45, $3B, $63, $6E, $52, $46,	$4F, $58, $52, $4C, $3E, $FF, 0
byte_12B40E:	dc.b $3B, $3D, $3B, $3B, $3D, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3D, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3D, $FF, 0
byte_12B42A:	dc.b $3F, $85, $86, $9A, $85, $25, $3B,	$41, $6E, $4F, $41, $3B, $53, $49, $55,	$3B
		dc.b $41, $47, $58, $24, $3B, $51, $41,	$3B, 2,	$4B, $45, $6D, $FF, 0
byte_12B448:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3D
		dc.b $FF, 0
byte_12B45A:	dc.b $3B, $5E, $43, $55, $59, $3B, $41,	$6E, $4B, $71, $55, $3B, $4B, $71, $47,	$4B
		dc.b $3B, $4B, $65, $42, $6E, $52, $FF,	0
byte_12B472:	dc.b $3B, $3B, $3B, $3B, $3B, $3D, $FF,	0
byte_12B47A:	dc.b $3B, $41, $6E, $52, $4F, $4B, $6F,	$54, $41, $25, $A9, $FF
byte_12B486:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3D,	$3B, $3D, $3B, $3B, $3B, $3B, $3D, $3D,	$3B
		dc.b $3D, $3B, $3B, $3B, $3D, $3B, $3B,	$3B, $3D, $3B, $3B, $3B, $3D, $FF
byte_12B4A4:	dc.b $3F, $50, $71, $6E, $53, $3B, $4F,	$41, $4B, $54, $3B, $65, $42, $4B, $45,	$3B
		dc.b $52, $46, $4F, $6D, $4F, $65, $3E,	$3B, $52, $62, $3B, $4C, $49, $41, $FF,	0
byte_12B4C4:	dc.b $3B, $3E, $3B, $3D, $FF, 0
byte_12B4CA:	dc.b $3B, $8D, $9B, $7F, $9F, $85, $6C,	$3B, $62, $6E, $52, $45, $43, $68, $45,	$66
		dc.b $3B, $4F, $58, $4B, $5F, $55, $3B,	$5E, $6E, $52, $52, $65, $25, $A9, $FF,	0
byte_12B4EA:	dc.b $3B, $3D, $3B, $3B, $3D, $3B, $3B,	$3B, $3B, $3B, $3D, $3B, $3B, $3B, $3B,	$3B
		dc.b $3B, $3B, $3B, $3D, $FF, 0
byte_12B500:	dc.b $3F, $85, $86, $9A, $85, $3B, $5E,	$6E, $52, $3B, $85, $86, $72, $72, $72,	$72
		dc.b $72, $72, $9A, $85, $25, $A9, $FF,	0
byte_12B518:	dc.b $3B, $3B, $3B, $3B, $3B, $3D, $3B,	$3D, $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3D
		dc.b $3B, $3B, $3D, $3B, $3B, $3B, $3D,	$FF
byte_12B530:	dc.b $44, $49, $6E, $4F, $3B, $84, $73,	$7D, $3C, $6C, $3B, $44, $41, $52, $3B,	$85
		dc.b $86, $9A, $85, $59, $3B, $53, $5A,	$4F, $6E, $52, $FF, 0
byte_12B54C:	dc.b $FF, 0
byte_12B54E:	dc.b $41, $46, $5E, $4B, $4F, $3E, $FF,	0
byte_12B556:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3B, $3D, $3B, $3B, $3B, $3B, $3B, $3B,	$3B
		dc.b $3E, $3B, $3B, $3D, $3B, $3B, $3D,	$3D, $3B, $3D, $FF, 0
byte_12B572:	dc.b $4B, $45, $4B, $3B, $49, $67, $62,	$4D, $4C, $3B, $4E, $58, $40, $53, $6C,	$3B
		dc.b $8C, $3C, $85, $78, $A1, $9F, $79,	$4F, $6D, $45, $FF, 0
byte_12B58E:	dc.b $3B, $3B, $3B, $3B, $3B, $3B, $3B,	$3D, $FF, 0
byte_12B598:	dc.b $44, $6E, $52, $41, $6E, $4F, $58,	$52, $4B, $4F, $3E, $FF
word_12B5A4:	dc.w 2
		struc_12A9A8 byte_12B684-off_12A9A8, $6910
		struc_12A9A8 byte_12B6A0-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B6C0-off_12A9A8, $6B0C
word_12B5B2:	dc.w 2
		struc_12A9A8 byte_12B6C8-off_12A9A8, $690C
		struc_12A9A8 byte_12B6E2-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B6FE-off_12A9A8, $6B0C
word_12B5C0:	dc.w 2
		struc_12A9A8 byte_12B70A-off_12A9A8, $6908
		struc_12A9A8 byte_12B72A-off_12A9A8, $6A08
		struc_12A9A8 byte_12B74A-off_12A9A8, $6B08
word_12B5CE:	dc.w 2
		struc_12A9A8 byte_12B758-off_12A9A8, $6908
		struc_12A9A8 byte_12B77A-off_12A9A8, $6A08
		struc_12A9A8 byte_12B79A-off_12A9A8, $6B08
word_12B5DC:	dc.w 3
		struc_12A9A8 byte_12B7B0-off_12A9A8, $690C
		struc_12A9A8 byte_12B7D0-off_12A9A8, $6A0C
		struc_12A9A8 byte_12B7EE-off_12A9A8, $6B0C
		struc_12A9A8 byte_12B80A-off_12A9A8, $6C0C
word_12B5EE:	dc.w 3
		struc_12A9A8 byte_12B812-off_12A9A8, $6908
		struc_12A9A8 byte_12B82C-off_12A9A8, $6A08
		struc_12A9A8 byte_12B84E-off_12A9A8, $6B08
		struc_12A9A8 byte_12B86E-off_12A9A8, $6C08
word_12B600:	dc.w 4
		struc_12A9A8 byte_12B878-off_12A9A8, $6888
		struc_12A9A8 byte_12B898-off_12A9A8, $6988
		struc_12A9A8 byte_12B8B6-off_12A9A8, $6A88
		struc_12A9A8 byte_12B8D6-off_12A9A8, $6B88
		struc_12A9A8 byte_12B8F4-off_12A9A8, $6C88
word_12B616:	dc.w 4
		struc_12A9A8 byte_12B900-off_12A9A8, $6888
		struc_12A9A8 byte_12B920-off_12A9A8, $6988
		struc_12A9A8 byte_12B944-off_12A9A8, $6A88
		struc_12A9A8 byte_12B962-off_12A9A8, $6B88
		struc_12A9A8 byte_12B982-off_12A9A8, $6C88
word_12B62C:	dc.w 3
		struc_12A9A8 byte_12B990-off_12A9A8, $6988
		struc_12A9A8 byte_12B9B4-off_12A9A8, $6A88
		struc_12A9A8 byte_12B9D4-off_12A9A8, $6B88
		struc_12A9A8 byte_12B9EA-off_12A9A8, $6C88
word_12B63E:	dc.w 2
		struc_12A9A8 byte_12BA0A-off_12A9A8, $6988
		struc_12A9A8 byte_12BA2C-off_12A9A8, $6A88
		struc_12A9A8 byte_12BA4C-off_12A9A8, $6B88
word_12B64C:	dc.w 3
		struc_12A9A8 byte_12BA66-off_12A9A8, $6988
		struc_12A9A8 byte_12BA88-off_12A9A8, $6A88
		struc_12A9A8 byte_12BAA8-off_12A9A8, $6B88
		struc_12A9A8 byte_12BAC8-off_12A9A8, $6C88
word_12B65E:	dc.w 1
		struc_12A9A8 byte_12BAE4-off_12A9A8, $6A0C
		struc_12A9A8 byte_12BB00-off_12A9A8, $6B0E
word_12B668:	dc.w 2
		struc_12A9A8 byte_12BB10-off_12A9A8, $6988
		struc_12A9A8 byte_12BB30-off_12A9A8, $6A88
		struc_12A9A8 byte_12BB52-off_12A9A8, $6B88
word_12B676:	dc.w 2
		struc_12A9A8 byte_12BB60-off_12A9A8, $6A08
		struc_12A9A8 byte_12BB80-off_12A9A8, $6B08
		struc_12A9A8 byte_12BB9A-off_12A9A8, $6C08
byte_12B684:	dc.b 1,	$18, $F, 0, $E,	$B, $22, $27, 0, $E, 1,	$18, $B, $16, $E, 0
		dc.b $D, $B, $17, $F, 0, $B, $D, $1B, 1, $1C, $1C, $FF
byte_12B6A0:	dc.b $B, $18, 0, 1, $16, $E, 0,	$C, 1, 1, $15, 0, $13, $18, 0, $1E
		dc.b $18, $D, $16, $F, 0, $1C, $D, $1B,	1, 1, $11, $F, $2D, $1C, $FF, 0
byte_12B6C0:	dc.b $1C, $1D, $1E, $E,	$22, $26, $FF, 0
byte_12B6C8:	dc.b $1D, $12, $F, 0, $1D, $13,	$1D, $16, $F, 0, 1, $10, 0, $1D, $12, $F
		dc.b 0,	$C, 1, 1, $15, 0, $20, $B, $1C,	$FF
byte_12B6E2:	dc.b $28, $15, $13, $18, $11, 0, $11, $B, $1B, $1E, $23, $13, $B, $2D, $1C, 0
		dc.b $11, $1B, $F, $B, $1D, 0, $E, $1E,	$D, $15, $FF, 0
byte_12B6FE:	dc.b $1D, $1B, $F, $B, $1C, $1E, $1B, $F, $26, $29, $FF, 0
byte_12B70A:	dc.b $B, $D, $D, 1, $1B, $E, $13, $18, $11, 0, $1D, 1, 0, $1D, $12, $F
		dc.b 0,	$C, 1, 1, $15, $27, 0, $11, $B,	$1B, $1E, $23, $13, $B,	$FF, 0
byte_12B72A:	dc.b $20, $B, $1C, 0, 1, $18, $D, $F, 0, $1D, $12, $F, 0, $16, $F, $B
		dc.b $E, $F, $1B, 0, 1,	$10, 0,	$B, 0, $11, $1B, $F, $B, $1D, $FF, 0
byte_12B74A:	dc.b $E, $1E, $D, $15, 0, $15, $13, $18, $11, $E, 1, $17, $26, $FF
byte_12B758:	dc.b $14, $1E, $1C, $1D, 0, $C,	$F, $10, 1, $1B, $F, 0,	$12, $F, 0, $E
		dc.b $13, $F, $E, $27, 0, $15, $13, $18, $11, 0, $11, $B, $1B, $1E, $23, $13
		dc.b $B, $FF
byte_12B77A:	dc.b $12, $13, $E, 0, $12, $13,	$1C, 0,	$17, 1,	$1C, $1D, 0, $19, $1B, $13
		dc.b $23, $F, $E, 0, $19, 1, $1C, $1C, $F, $1C,	$1C, $13, 1, $18, $FF, 0
byte_12B79A:	dc.b $13, $18, 0, $B, 0, $1C, $F, $D, $1B, $F, $1D, 0, $16, 1, $D, $B
		dc.b $1D, $13, 1, $18, $26, $FF
byte_12B7B0:	dc.b $1D, $1E, $D, $15,	$F, $E,	0, $13,	$18, $1C, $13, $E, $F, 0, $1D, $12
		dc.b $F, 0, $C,	1, 1, $15, $27,	0, $E, 1, $18, $B, $16,	$E, $FF, 0
byte_12B7D0:	dc.b $10, 1, $1E, $18, $E, 0, $B, 0, $17, $B, $19, 0, $1C, $12,	1, $20
		dc.b $13, $18, $11, 0, $D, $16,	$1E, $F, $1C, 0, $1D, 1, $FF, 0
byte_12B7EE:	dc.b $20, $12, $F, $1B,	$F, 0, $1D, $12, $F, 0,	$1D, $1B, $F, $B, $1C, $1E
		dc.b $1B, $F, 0, $D, 1,	$1E, $16, $E, 0, $C, $F, $FF
byte_12B80A:	dc.b $10, 1, $1E, $18, $E, $26,	$FF, 0
byte_12B812:	dc.b $28, $20, 1, $20, $25, $29, 0, $E,	1, $18,	$B, $16, $E, 0,	$F, $21
		dc.b $D, $16, $B, $13, $17, $F,	$E, $26, $FF, 0
byte_12B82C:	dc.b $28, $13, $10, 0, $13, 0, $D, 1, $1E, $16,	$E, 0, $10, $13, $18, $E
		dc.b 0,	$B, 0, $1D, $1B, $F, $B, $1C, $1E, $1B,	$F, 0, $16, $13, $15, $F
		dc.b $FF, 0
byte_12B84E:	dc.b $1D, $12, $13, $1C, $27, 0, $13, $2D, $E, 0, $C, $F, 0, $1B, $13, $D
		dc.b $12, $F, $1B, 0, $1D, $12,	$B, $18, 0, $1E, $18, $D, $16, $F, $FF,	0
byte_12B86E:	dc.b $1C, $D, $1B, 1, 1, $11, $F, $26, $29, $FF
byte_12B878:	dc.b $C, $1E, $1D, 0, 1, $18, $F, 0, 1,	$10, 0,	$19, $F, $1D, $F, $2D
		dc.b $1C, 0, $11, $B, $18, $11,	0, $12,	$B, $E,	0, $C, $F, $F, $18, $FF
byte_12B898:	dc.b $1C, $19, $22, $13, $18, $11, 0, $1D, $12,	$1B, 1,	$1E, $11, $12, 0, $1D
		dc.b $12, $F, 0, $20, $13, $18,	$E, 1, $20, 0, $B, $18,	$E, $FF
byte_12B8B6:	dc.b $1C, $B, $20, 0, $F, $1F, $F, $1B,	$22, $1D, $12, $13, $18, $11, $26, 0
		dc.b $E, 1, $18, $B, $16, $E, 0, $1D, 1, 1, $15, 0, $1D, $12, $F, $FF
byte_12B8D6:	dc.b $17, $B, $19, 0, $20, $13,	$1D, $12, 0, $12, $13, $17, 0, $B, $1C,	0
		dc.b $12, $F, 0, $1C, $1D, $B, $1B, $1D, $F, $E, 0, $1D, 1, $FF
byte_12B8F4:	dc.b $12, $F, $B, $E, 0, $12, 1, $17, $F, $26, $FF, 0
byte_12B900:	dc.b $19, $F, $1D, $F, $2D, $1C, 0, $11, $B, $18, $11, 0, $D, $12, $B, $1C
		dc.b $F, $E, 0,	$B, $10, $1D, $F, $1B, 0, $E, 1, $18, $B, $16, $E, $FF
byte_12B920:	dc.b $B, $18, $E, 0, $1D, $12, $F, 0, $1D, $1B,	$F, $B,	$1C, $1E, $1B, $F
		dc.b 0,	$17, $B, $19, $26, 0, $E, 1, $18, $B, $16, $E, 0, $D, 1, $1E
		dc.b $16, $E, $FF, 0
byte_12B944:	dc.b $1C, $F, $F, 0, $B, $18, 0, 1, $19, $F, $18, 0, $17, $B, $18, $12
		dc.b 1,	$16, $F, 0, $B,	$12, $F, $B, $E, 0, $B,	$18, $E, $FF
byte_12B962:	dc.b $14, $1E, $17, $19, $F, $E, 0, 1, $1F, $F,	$1B, 0,	$13, $1D, $27, 0
		dc.b $C, $1E, $1D, 0, $19, $F, $1D, $F,	$2D, $1C, 0, $11, $B, $18, $11,	$FF
byte_12B982:	dc.b $B, $16, $16, 0, $10, $F, $16, $16, 0, $13, $18, $26, $FF,	0
byte_12B990:	dc.b $E, 1, $18, $B, $16, $E, 0, $1D, 1, 1, $15, 0, $12, $1E, $F, $22
		dc.b $27, 0, $E, $F, $20, $F, $22, $27,	0, $B, $18, $E,	0, $16,	1, $1E
		dc.b $13, $F, $FF, 0
byte_12B9B4:	dc.b $1D, 1, 0,	$1D, $12, $F, 0, $19, $16, $B, $18, $F,	0, $1D,	1, 0
		dc.b $1D, $B, $15, $F, 0, 1, $10, $10, 0, 1, $18, 0, $1D, $12, $F, $FF
byte_12B9D4:	dc.b $11, $1B, $F, $B, $1D, 0, $1D, $1B, $F, $B, $1C, $1E, $1B,	$F, 0, $12
		dc.b $1E, $18, $1D, $26, $FF, 0
byte_12B9EA:	dc.b $C, $1E, $1D, 0, $14, $1E,	$1C, $1D, 0, $1D, $12, $F, $18,	$27, 0,	$E
		dc.b $B, $13, $1C, $22,	0, $B, $19, $19, $F, $B, $1B, $F, $E, $26, $FF,	0
byte_12BA0A:	dc.b $28, $E, 1, $18, $B, $16, $E, 0, $20, $12,	$F, $1B, $F, 0,	$B, $1B
		dc.b $F, 0, $22, 1, $1E, 0, $11, 1, $13, $18, $11, $24,	0, $22,	1, $1E
		dc.b $FF, 0
byte_12BA2C:	dc.b $20, $F, $1B, $F, 0, $1C, $1E, $19, $19, 1, $1C, $F, $E, 0, $1D, 1
		dc.b 0,	$C, $F,	0, $B, $1D, 0, $17, $22, 0, $12, 1, $1E, $1C, $F, $FF
byte_12BA4C:	dc.b $10, 1, $1B, 0, $E, $13, $18, $18,	$F, $1B, 0, $B,	$18, 0,	$12, 1
		dc.b $1E, $1B, 0, $B, $11, 1, $25, $29,	$FF, 0
byte_12BA66:	dc.b $28, $E, $B, $13, $1C, $22, $27, 0, $1C, 1, $17, $F, $1D, $12, $13, $18
		dc.b $11, 0, $1F, $F, $1B, $22,	0, $13,	$17, $19, 1, $1B, $1D, $B, $18,	$1D
		dc.b $FF, 0
byte_12BA88:	dc.b $12, $B, $1C, 0, $D, 1, $17, $F, 0, $1E, $19, $26,	0, $13,	$2D, $17
		dc.b 0,	$11, 1,	$13, $18, $11, 0, $1D, 1, 0, $10, $13, $18, $E,	$FF, 0
byte_12BAA8:	dc.b $1C, 1, $17, $F, $1D, $12,	$13, $18, $11, 0, $1C, $19, $F,	$D, $13, $B
		dc.b $16, 0, $10, 1, $1B, 0, $22, 1, $1E, 0, $B, $18, $E, 0, $13, $FF
byte_12BAC8:	dc.b $20, $B, $18, $1D,	0, $13,	$1D, 0,	$1D, 1,	0, $C, $F, 0, $B, 0
		dc.b $1C, $1E, $1B, $19, $1B, $13, $1C,	$F, $26, $29, $FF, 0
byte_12BAE4:	dc.b $28, $E, 1, $18, $B, $16, $E, 0, $20, $B, $13, $1D, $2F, $2F, $2F,	$2F
		dc.b $D, 1, $17, $F, 0,	$C, $B,	$D, $15, $27, $FF, 0
byte_12BB00:	dc.b $E, 1, $18, $B, $B, $B, $B, $B, $B, $B, $B, $16, $E, $25, $29, $FF
byte_12BB10:	dc.b $E, 1, $18, $B, $16, $E, 0, $B, $18, $E, 0, $12, $13, $1C,	0, $18
		dc.b $F, $19, $12, $F, $20, $1C, 0, $1D, 1, 1, $15, 0, 1, $10, $10, $FF
byte_12BB30:	dc.b $13, $18, 0, $1D, $12, $F,	$13, $1B, 0, $19, $16, $B, $18,	$F, $27, 0
		dc.b $16, $F, $B, $1F, $13, $18, $11, 0, $B, 0,	$10, $1E, $1B, $13, 1, $1E
		dc.b $1C, $FF
byte_12BB52:	dc.b $E, $B, $13, $1C, $22, 0, $C, $F, $12, $13, $18, $E, $26, $FF
byte_12BB60:	dc.b $17, 1, $17, $F, $18, $1D,	$1C, 0,	$16, $B, $1D, $F, $1B, $27, 0, $19
		dc.b $F, $1D, $F, $2D, $1C, 0, $11, $B,	$18, $11, 0, $10, $16, $F, $20,	$FF
byte_12BB80:	dc.b $B, $10, $1D, $F, $1B, 0, $1D, $12, $F, $17, 0, $13, $18, 0, $B, 0
		dc.b $19, $16, $B, $18,	$F, 0, 1, $10, $FF, 0
byte_12BB9A:	dc.b $1D, $12, $F, $13,	$1B, 0,	1, $20,	$18, $26, $FF, 0
nemesis_12BBA6:
    binclude "src/nemesis/data_12BBA6.bin"
    align 2, 0
word_12BC1C:	dc.w $8008, $8008, $8008, $8008, $C00C,	$C00C, $C00C, $C00C
		dc.w $E00E, $E00E, $E00E, $E00E, $F00F,	$F00F, $F00F, $F00F
		dc.w $F88F, $F88F, $F88F, $F88F, $FCCF,	$FCCF, $FCCF, $FCCF
		dc.w $FEEF, $FEEF, $FEEF, $FEEF, $FFFF,	$FFFF, $FFFF, $FFFF
byte_12BC5C:	dc.b 0,	0, 0, $FF, 0, 0, 0, 0, 0, 0, 0,	$FF, $FF, 0, 0,	0
		dc.b 0,	0, $FF,	$FF, $FF, 0, 0,	0, 0, 0, $FF, $FF, $FF,	$FF, 0,	0
		dc.b 0,	$FF, $FF, $FF, $FF, $FF, 0, 0, 0, $FF, $FF, $FF, $FF, $FF, $FF,	0
		dc.b $FF, $FF, $FF, $FF, $FF, $FF, $FF,	0, $FF,	$FF, $FF, $FF, $FF, $FF, $FF, $FF
byte_12BC9C:	dc.b $FF, $FF, $FF, $FF, $FF, $FF, $FF,	0, 0, $FF, $FF,	$FF, $FF, $FF, $FF, 0
		dc.b 0,	$FF, $FF, $FF, $FF, $FF, 0, 0, 0, 0, $FF, $FF, $FF, $FF, 0, 0
		dc.b 0,	0, $FF,	$FF, $FF, 0, 0,	0, 0, 0, 0, $FF, $FF, 0, 0, 0
		dc.b 0,	0, 0, $FF, 0, 0, 0, 0, 0, 0, 0,	0, 0, 0, 0, 0
nemesis_12BCDC:
    binclude "src/nemesis/data_12BCDC.bin"
    align 2, 0
enigma_12C192:
    binclude "src/enigma/data_12C192.bin"
    align 2, 0
nemesis_12C226:
    binclude "src/nemesis/data_12C226.bin"
    align 2, 0
off_12E272:	dc.w byte_12E286-off_12E272
		dc.w byte_12E28A-off_12E272
		dc.w byte_12E294-off_12E272
		dc.w byte_12E29A-off_12E272
		dc.w byte_12E2A6-off_12E272
		dc.w byte_12E2AE-off_12E272
		dc.w byte_12E2BA-off_12E272
		dc.w byte_12E2C6-off_12E272
		dc.w byte_12E2CA-off_12E272
		dc.w byte_12E2C0-off_12E272
byte_12E286:	dc.b 0,	$FF, 0,	$4A
byte_12E28A:	dc.b 3,	4, 0, $56, 0, $62, $80,	$56, $80, $62
byte_12E294:	dc.b 1,	2, 0, $64, $80,	$64
byte_12E29A:	dc.b 4,	8, 0, $6A, 0, $80, 0, $90, 0, $9C, 0, $34
byte_12E2A6:	dc.b 2,	$14, 0,	$9C, 0,	$A8, 0,	$B4
byte_12E2AE:	dc.b 4,	$F, 0, $B8, 0, $C4, 0, $D4, 0, $EA, 1, 0
byte_12E2BA:	dc.b 1,	1, 1, $14, 1, $74
byte_12E2C0:	dc.b 1,	1, $81,	$E, $81, $6E
byte_12E2C6:	dc.b 0,	$FF, 1,	$C8
byte_12E2CA:	dc.b 0,	$FF, 1,	$DE, $FF, 0, 1,	0, 0, 0, 0, 0, $E0, 8, 0, 1
		dc.b $F0, $E8, $E, 0, 4, $F0, 0, 0, 0, 0, 0, 0,	$E8, 6,	0, $10
		dc.b $F8, 0, 0,	0, 0, 0, 0, 0, $E8, 6, 0, $16, $F8, 0, 0, 0
		dc.b 0,	0, 0, 0, $F8, 0, 0, $3E, $FC, 0, 2, 0, 0, 0, 0,	0
		dc.b $E0, 8, 0,	$1C, $EC, $E8, $E, 0, $1F, $C, $E0, 2, 0, $2B, $EC, 0
		dc.b 1,	0, 0, 0, 0, 0, $E8, $D,	0, $2E,	$F0, $F8, 8, 0,	$36, $F0
		dc.b 0,	0, 0, 0, 0, 0, $F0, 5, 0, $39, $F8, 0, 0, 0, 0,	0
		dc.b 0,	0, $F8,	0, 0, $3D, $FC,	0, 0, 0, 0, 0, 0, 0, $F8, 4
		dc.b 0,	1, $F8,	0, 0, 0, 0, 0, 0, 0, $F8, 4, 0,	3, $F8,	0
		dc.b 0,	0, 0, 0, 0, 0, $F8, 4, 0, 5, $F8, 0, 0,	0, 0, 0
		dc.b 0,	0, $F8,	8, 0, 7, $F4, 0, 1, 0, 0, 0, 0,	0, $F0,	$C
		dc.b 0,	$A, $F0, $F8, 8, 0, $E,	$F0, 2,	0, 0, 0, 0, 0, $E8, $C
		dc.b 0,	$11, $EC, $F0, $C, 0, $15, $F4,	$F8, 0,	0, $19,	$FC, 0,	2, 0
		dc.b 0,	0, 0, 0, $E8, $D, 0, $1A, $E4, $F0, 9, 0, $22, 4, $F8, 4
		dc.b 0,	$28, $F4, 0, 4,	0, 0, 0, 0, 0, $D8, 8, 0, $2A, $DC, $E0
		dc.b $F, 0, $2D, $EC, $E0, 0, 0, $3D, $E4, $E0,	5, 0, $3E, $C, $F0, 9
		dc.b 0,	$42, $C, 0, $11, 0, 0, 0, 0, 0,	$E0, $D, 0, $10, $F4, $CD
		dc.b 5,	0, 1, $F6, $CD,	5, 0, 5, $E, $CA, 5, 0,	9, 4, $D0, 2
		dc.b 0,	$D, $D0, $D0, $B, 0, $20, $F0, $D0, $B,	0, $20,	8, $C8,	$C, 0
		dc.b $2C, $E0, $D0, 0, 0, $30, $E8, $D8, $A, 0,	$31, $D8, $E8, 0, 0, $3A
		dc.b $D0, $F0, $D, 0, $3B, $D8,	$F0, $D, 0, $43, $F8, $F0, 5, 0, $4B, $18
		dc.b $D8, 9, 0,	$4F, $20, $E8, 4, 0, $55, $20, $D0, 4, 0, $57, $28, 0
		dc.b 4,	0, $59,	$F0, $11, 0, 0,	0, 0, 0, $E0, $D, 0, $10, $F4, $CD
		dc.b 5,	0, 1, $F6, $CD,	5, 0, 5, $E, $CA, 5, 0,	9, 4, $F0, 2
		dc.b 0,	$D, $D0, $D0, $B, 0, $20, $F0, $D0, $B,	0, $20,	8, $C8,	$C, 0
		dc.b $2C, $E0, $D0, 0, 0, $30, $E8, $D8, $A, 0,	$31, $D8, $E8, 0, 0, $3A
		dc.b $D0, $F0, $D, 0, $3B, $D8,	$F0, $D, 0, $43, $F8, $F0, 5, 0, $4B, $18
		dc.b $D8, 9, 0,	$4F, $20, $E8, 4, 0, $55, $20, $D0, 4, 0, $57, $28, 0
		dc.b 4,	0, $59,	$F0, 3,	0, 0, 0, 0, 0, $E0, $F,	0, 1, $C0, $E0
		dc.b $F, 0, $11, $E0, $E0, $F, 0, $21, 0, $E0, $F, 0, $31, $20,	4, 0
		dc.b 0,	0, 0, 0, $D8, 5, 0, 0, $E8, $E0, $C, 0,	4, $F8,	$D0, 5
		dc.b 0,	8, 8, $E8, $E, 0, $C, $E0, $E8,	$E, 0, $18, 0, 0
nemesis_12E4C8:
    binclude "src/nemesis/data_12E4C8.bin"
    align 2, 0
enigma_12FE5C:
    binclude "src/enigma/data_12FE5C.bin"
    align 2, 0
enigma_12FE7A:
    binclude "src/enigma/data_12FE7A.bin"
    align 2, 0
enigma_12FEAE:
    binclude "src/enigma/data_12FEAE.bin"
    align 2, 0
enigma_12FEE8:
    binclude "src/enigma/data_12FEE8.bin"
    align 2, 0
enigma_12FF02:
    binclude "src/enigma/data_12FF02.bin"
    align 2, 0
enigma_12FF1E:
    binclude "src/enigma/data_12FF1E.bin"
    align 2, 0

    org $70000
smps_bank0:
    binclude "src/smps/bank0.bin"
    align 2, 0

    org $78000
smps_bank1:
    binclude "src/smps/bank1.bin"
    align 2, 0
smps_driver_part1:
    binclude "src/smps/driver_1.bin"
    align 2, 0
smps_driver_part2:
    binclude "src/smps/driver_2.bin"
    align 2, 0
smps_driver_part3:
    binclude "src/smps/driver_3.bin"
    align 2, 0

kosinski_dialogs:
    binclude "src/dialogs/kosinski_dialogs.bin"
    align 2, 0
		align 2, 0

kosinski_13BD40:
    binclude "src/kosinski/data_13BD40.bin"
    align 2, 0
		align 2, 0

palettes_data_1:dc.w	 0, $EEE, $8C8,	$484, $262, $8CE, $48A,	$246, $8AE, $46A,  $EE,	$24E, $ECA, $A86, $642,	$222
		dc.w	 0, $EEE, $EAA,	$A66, $844, $CCA, $886,	$442, $8AE, $46A,  $26,	   0, $CCA, $886, $442,	$222
		dc.w	 0, $6AE, $E44,	$22E, $282, $EEE,    0,	   0,	 0,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w	 0, $6AE, $E44,	$22E, $282, $EEE,    0,	   0,	 0,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w  $8CC, $6AE, $48C,	$46A, $248,  $26, $224,	$EEE, $ACE, $8AC, $68A,	$468, $664, $442, $222,	   0
		dc.w	 0, $CEE, $AEE,	$8CC, $6AA, $688, $468,	$AAA, $666, $444, $CEC,	$CEA, $CE8,    0,    0,	   0
		dc.w  $CE8, $EEE, $8CC,	$8A8, $686, $466, $246,	$446, $226, $224,    2,	$664, $442, $444, $222,	   0
		dc.w  $EC6, $ACE, $48C,	$24A,  $26, $222, $68A,	$466, $244, $2A8, $486,	$EEE, $8AE, $ACE, $8AE,	$6AC
		dc.w  $A22, $E86, $8CE,	$6AE, $8AA, $688, $8CC,	$2A8, $48E, $264, $C84,	$EA4, $EC8, $EEC, $246,	$26A
		dc.w  $642, $AC4, $E68,	$A60, $882, $462, $442,	$220, $422, $422, $A86,	$864, $642, $C64, $A44,	$642
		dc.w  $64A, $A64, $644,	$422, $624, $844, $CC6,	$AA4, $884, $662, $A66,	$642, $222,    0, $A66,	$CA2
		dc.w  $EC6, $ACE, $48E,	$46C, $24A, $246, $264,	 $24, $EEE, $ECA, $A86,	$642,	 0,    0,    0,	   0
		dc.w  $EA0, $ACE, $68C,	$468, $466, $462, $240,	$220, $248, $246, $244,	$4AE, $48E, $26E, $24E,	   0
		dc.w  $EC6, $CEE, $28E,	 $48,  $24, $222, $6CE,	$26C,  $26,  $22,    0,	   0, $ACE,    0,    0,	   0
		dc.w  $EC6, $ACE, $48C,	$24A,  $26, $222, $68A,	$466, $244, $2A8, $486,	$22A, $8AE, $ACE, $8AE,	$68C
		dc.w  $ACE, $28E, $4AE,	$26E,  $4A, $248,  $AE,	$488, $48E, $244, $46E,	$48E, $2AE, $6CE, $246,	$26A
		dc.w  $666, $48A, $468,	$446, $224, $EEC, $8A8,	$684, $664, $442, $242,	$444, $222, $EAA, $624,	$422
		dc.w  $888, $EE8, $CA2,	$A86, $862, $666, $844,	$642, $622, $422, $EEE,	$ECA, $A86,    0,    0,	   0
		dc.w  $666, $48A, $468,	$446, $224, $EEC, $8A8,	$684, $664, $442, $242,	$444, $222, $EAA, $624,	$422
		dc.w	 0, $864, $EEE,	$ECA, $A86,    0,    0,	   0,	 0,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w	 0, $46A, $248,	$226, $224, $222, $422,	$864, $A86, $CA8, $622,	$822, $A22, $68C,    0,	   0
		dc.w	 0, $EEE, $8C8,	$484, $262, $8CE, $48A,	$246, $AAE, $46A,   $E,	$24E, $ECA, $A86, $642,	   0
		dc.w	 0,  $26,  $48,	 $6A,  $AE,  $EE, $B22,	$E64,	 0,    0, $ACE,	$4AE, $48E, $26E, $24E,	   0
word_13CD50:	dc.w	 0, $ACE, $8AC,	$68A, $468, $446, $66A,	$488
		dc.w   $2E,  $4E,  $6E,	 $8E,  $AE,  $CE,  $EE,	$222
word_13CD70:	dc.w	 0,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w	 0,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w	 0, $EEE,    0,	   0,	 0, $8CE, $48A,	$246
		dc.w	 0,    0, $2A2,	   0, $ECA,    0, $442,	   0
		dc.w	 0, $48C, $46A,	$246, $224, $CEE, $8AA,	$686
		dc.w  $466, $244, $242,	$444, $222, $88C, $226,	$224
		dc.w	 0, $8EE, $6AC,	$68A, $468, $666, $448,	$446
		dc.w  $444, $224, $EEE,	$ECA, $A86,    0,    0,	   0
		dc.w	 0, $8EE, $8AC,	$68A, $488, $268, $248,	$246
		dc.w   $26,  $24,    2,	$464, $244, $246, $222,	   0
		dc.w	 0, $8AE, $6AE,	$48C, $46A, $448, $248,	$68E
		dc.w  $446, $224, $48E,	$46C, $44A, $AEE, $AEE,	$EEE
		dc.w	 0, $EEE, $C8C,	$848, $626, $CCA, $886,	$442
		dc.w  $8AE, $46A,  $26,	   0, $CCA, $886, $442,	$222
		dc.w	 0, $EEE, $AAE,	$44C, $228, $8CE, $48A,	$246
		dc.w  $8AE, $46A, $68E,	$24E, $CCA, $886, $442,	$222
		dc.w	 0, $EEE, $EA6,	$E64, $A22, $8CE, $48A,	$246
		dc.w  $8AE, $46A,  $EE,	$24E, $ECA, $A86, $642,	$222
		dc.w	 0, $EEE, $EE8,	$EC4, $AA2, $886, $442,	$222
		dc.w  $8AE, $46A, $68E,	$24E, $CCA, $886, $442,	$222
		dc.w	 0, $EEE, $AEE,	$6AA, $266, $244,  $24,	 $22
		dc.w	 0,    0,    0,	   0, $CCA, $886, $442,	$222
		dc.w	 0, $EEE, $8CE,	$48E, $24E, $8CE, $48A,	$246
		dc.w  $8AE, $46A, $68E,	$24E, $CCA, $886, $442,	$222
word_13CEF0:	dc.w  $886, $EEE, $EEA,	$CC6, $CA4, $C80, $A60,	$842
		dc.w  $622, $EC8, $C86,	$A64, $A44, $824, $422,	   0
		dc.w  $E00, $EEE, $EEC,	$ECC, $EAA, $E6C, $C88,	$C68
		dc.w  $A46, $824, $C86,	$EA8, $C4A, $A28, $824,	$EAE
		dc.w	 0, $CEE, $CCA,	$CA8, $A88, $A66, $A62,	$842
		dc.w  $822, $EE8, $CA4,	$A62, $842, $824, $442,	$642
		dc.w  $800, $AEE, $AEC,	$AEA, $AC8, $8A6, $884,	$866
		dc.w  $CE8, $AA6, $A86,	$864, $844, $644, $EEE,	$AA6
		dc.w  $A00, $EE8, $CA4,	$C82, $A64, $844, $624,	$8A8
		dc.w  $686, $464, $420,	$AAC, $668, $446, $224,	   0
		dc.w	 0, $600, $800,	$C00, $E00, $E20, $E40,	$E62
		dc.w  $E82, $ACE, $ACC,	$EAA, $E88,    0,    0,	   0
		dc.w  $A22, $AEE, $6CE,	 $AE, $46A,  $46, $226,	 $24
		dc.w  $248,  $22,    2,	   0,	 0,    0, $246,	   0
		dc.w	 0, $48E, $26E,	$24C, $22E, $22C, $22A,	$228
		dc.w  $226, $224, $222,	$642, $422, $EE0, $E0E,	   0
		dc.w	 0, $EEE, $AAE,	$66E, $22C, $244,  $AE,	$246
		dc.w  $8AE, $222, $662,	$24E, $ECA, $A86, $442,	$222
		dc.w	 0, $EEE, $8CE,	$48A, $246, $8CE, $48A,	$246
		dc.w  $8AE, $46A,  $EE,	$24E, $ECA, $A86, $642,	$222
		dc.w	 0, $EEE, $8C8,	$484, $262, $8CE, $48A,	$248
		dc.w  $8AE, $46C,    0,	   0, $ECA, $A86, $642,	$222
		dc.w	 0, $EEE, $88E,	$44C, $22A,  $EE,  $AE,	$246
		dc.w  $8AE,  $6A, $E64,	$24E, $ECA, $A86, $642,	$222
		dc.w  $A22, $EEE, $4AE,	$28E, $26A, $ACC, $6AA,	$488
		dc.w  $266, $248, $24C,	$24E, $EEC, $CCA, $886,	$222
		dc.w  $A22, $EEE, $8EE,	$2AE, $26A, $8CE, $48A,	$246
		dc.w  $66E, $44C,    0,	$22A, $EEC, $CCA, $886,	$222
		dc.w  $EC6, $CEE, $8AE,	$68C, $46A, $8CE, $68A,	$468
		dc.w  $246, $224, $264,	$22A, $8AE, $ACE, $8AE,	$6AC
		dc.w	 0, $8CE, $6AC,	$48C, $26A,  $48, $224,	   0
		dc.w  $ECA, $EA6, $CA2,	$EEE,	 0,    0,    0,	   0
		dc.w  $CC8, $8EE, $8AA,	$684, $266, $244, $48E,	$ACA
		dc.w  $CEE,    0, $488,	$EEE, $8CC, $CEA, $ACC,	$8A8
		dc.w  $E0E, $CE8, $ECC,	$CC6, $CC4, $CA8, $CA6,	$AC8
		dc.w  $8A6, $688, $668,	$468, $448, $446, $868,	$444
		dc.w  $EE0, $AEE, $6AC,	$48A, $468, $244,  $24,	   0
		dc.w	 2, $4AE, $26E,	$24E, $4AE, $26E,  $8E,	$AEE
		dc.w	 0,    0,    0,	$48A, $468, $248, $244,	 $24
		dc.w	 2,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w  $EE0, $AEE, $6AC,	$48A, $468, $244,  $24,	   0
		dc.w	 2,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w  $EC6, $ACE, $48E,	$46C, $24A, $246, $264,	 $24
		dc.w  $EEE, $ECA, $A86,	$642,	 0,    0,    0,	   0
		dc.w  $EA0,    0, $68C,	$468, $466, $462, $240,	$220
		dc.w  $248, $246, $244,	   0,	 0,    0,    0,	   0
		dc.w	 0,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w	 0,    0,    0,	   0,	 0,    0,    0,	   0
word_13D1F0:	dc.w	 0, $CEC,    0,	$882, $AA4, $CC8, $6A6,	$8C8
		dc.w  $8CC, $688, $464,	$440, $220, $66C, $24C,	$22A
		dc.w	 0, $EEE, $8C8,	$484, $262, $8CE, $48A,	$246
		dc.w  $8AE, $46A,    0,	$24E, $ECA, $A86, $642,	   0
		dc.w	 0, $EEE,    0,	   0,	 0,  $EE,  $AE,	 $48
		dc.w	 0,    0,    0,	   0, $E8A, $A46, $824,	$222
		dc.w	 0, $EEE, $EA6,	$E64, $A22,    0,    0,	$246
		dc.w  $8AE,    0,    0,	$24E, $ECA, $A86, $642,	   0
		dc.w	 0, $EEE, $CCA,	$AA6, $864, $644, $422,	$8A8
		dc.w  $686, $A86, $664,	$662, $442, $668, $448,	   0
		dc.w	 0, $EEE, $ACA,	$8A6, $664, $444, $222,	$6A8
		dc.w  $488, $886, $466,	$464, $244, $468, $248,	   0
		dc.w	 0, $6AE, $48E,	$68E, $66C, $66A, $66A,	$6AC
		dc.w  $68C, $46A, $448,	$248, $228, $226, $448,	$224
		dc.w  $777, $EEE, $ACE,	$6AE, $26A, $248,  $28,	 $26
		dc.w   $24,    0,    2,	   0, $CCA, $886, $442,	$222
		dc.w  $A22, $ACE, $68C,	$46A, $248, $226, $864,	$642
		dc.w  $422,    0, $A86,	$864, $642, $422,    0,	$222
		dc.w  $660, $CEE, $688,	$686, $446, $224, $220,	$286
		dc.w   $40,  $26,  $48,	 $6A,  $8C, $2CE,    0,	$222
		dc.w  $EE0, $CEE, $8AC,	$68A, $686, $466, $664,	$442
		dc.w  $422,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w  $424, $ACA, $6AA,	$688, $466, $464, $444,	$222
		dc.w  $664, $422, $428,	$642, $8A6, $2AE, $48E,	$44A
		dc.w	 0,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w	 0,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w  $660, $222, $224,	$246, $466, $6AA, $8CE,	$CEE
		dc.w  $488, $686, $244,	$442, $462,    0,    0,	   0
		dc.w  $660, $AEC, $CC8,	$684, $284,  $42,  $20,	$6AE
		dc.w  $46A, $246,    0,	 $22,	 0, $6AE, $26E,	   0
		dc.w  $EA8, $EEE, $6AA,	$486, $264, $240,    0,	   0
		dc.w	 0,    0,    0,	$AAC, $668, $446, $224,	   0
		dc.w  $EA0, $EEE, $ACE,	$8AE, $68C, $46A, $248,	$226
		dc.w  $224, $222, $A8C,	$86A, $648, $E48, $E68,	$E8A
		dc.w	 0, $88E, $68E,	$66C, $64A,    0,    0,	$A46
		dc.w  $846, $646, $ECE,	$EAE, $E8C, $E8A, $E68,	$C66
		dc.w	 0, $EEE, $ECC,	$ACC, $6AA, $4AE, $28E,	$26C
		dc.w  $24C, $228, $A8E,	$802, $C24, $C66, $444,	$222
		dc.w	 0,  $2A, $222,	$488, $8AA, $ACC, $266,	$EEE
		dc.w  $24A, $28C, $6CE,	$C66, $226, $802, $C24,	$ECA
		dc.w	 0, $EAA, $864,	$642, $420, $EEE, $AAA,	$88A
		dc.w  $446,    0,    0,	   0, $C66, $844, $400,	   0
		dc.w	 0, $222, $466,	$488, $ACC, $EEE, $802,	$C24
		dc.w  $C66, $24E, $28E,	$6CE,	 0, $248, $6AA,	   0
		dc.w	 0,    0,    0,	$242, $464, $688, $222,	$ACC
		dc.w  $EEE,  $20, $466,	$422, $600, $822,    0,	   0
		dc.w	 0, $EEE, $8C8,	$484, $242, $4AE, $26C,	$246
		dc.w  $28E,    0, $228,	$24C, $ECA, $A86, $642,	$222
		dc.w	 0, $EEE,    0,	$ACC, $6AA, $8AE, $68E,	$46C
		dc.w  $24A, $228, $24E,	$642, $A86, $ECA, $444,	$222
		dc.w	 0, $8CE, $8CA,	$688, $466, $444, $222,	$A88
		dc.w  $686, $886, $664,	$662, $442, $668, $448,	   0
		dc.w	 0, $EA8, $C8C,	$C8A, $C68, $A64, $A66,	$A88
		dc.w  $A66, $864, $644,	$642, $624, $424, $844,	$422
		dc.w	 0, $EEE, $EA6,	$C64, $A22, $8CE, $48A,	$246
		dc.w  $8AE, $46A,  $EE,	$24E, $ECA, $A86, $642,	$222
		dc.w	 0, $EEE, $EEE,	$CCA, $886, $EEE, $886,	$442
		dc.w  $8AE, $46A,  $EE,	$24E, $ECA, $A86, $642,	$222
		dc.w	 0, $EEE, $EEE,	$484, $262, $EEE, $EEE,	   0
		dc.w	 0,    0,    0,	   0, $ECA, $A86, $642,	$222
		dc.w  $FAA, $8CC, $8AC,	$488,  $68,  $44,  $24,	$8CC
		dc.w  $688, $466,    2,	$244,	 0,    0,    0,	   0
		dc.w  $EAA, $EEE, $8CC,	$6AA, $486, $264,    0,	   0
		dc.w	 0,    0,    0,	   0,	 0,    0,    0,	   0
		dc.w  $886, $EEE, $EEA,	$CC6, $CA4, $C80, $A60,	$842
		dc.w  $622, $EC8, $C86,	$A64, $A44, $824, $422,	   0
		dc.w	 0, $EEE, $AAE,	$24A, $226, $ECA, $A86,	$642
		dc.w  $8AE, $46A, $68E,	$24E, $CCA, $886, $442,	$222
		dc.w	 0, $EEE, $E8A,	$A46, $824,  $EE,  $AE,	 $48
		dc.w  $6AE,  $48, $26A,	$24E, $ECA, $A86, $642,	$222
		dc.w	 0, $EEE, $EA6,	$E64, $C22, $8CE, $48A,	$246
		dc.w  $8AE, $46A,  $EE,	$24E, $ECA, $A86, $642,	$222
stru_13D670:	struc_64 0, 0, 0, 0
		struc_64 $D5, $2B, $F0, $18
		struc_64 $D5, $2B, $F8, $18
		struc_64 $E8, $18, $E8, $30
		struc_64 0, 0, 0, 0
		struc_64 $F8, 8, $C1, $7E
		struc_64 $F4, $18, $E8, $18
		struc_64 9, $10, $E0, $20
		struc_64 0, $18, $C0, $78
		struc_64 $D5, $20, $F0, $1C
		struc_64 $D5, $20, $F4, $1C
		struc_64 $D5, $2B, $F0, $18
		struc_64 $D5, $2B, $F8, $18
		struc_64 $D5, $2B, $F8, $18
		struc_64 $D5, $2B, $F0, $18
		struc_64 $D5, $2B, $F8, $18
		struc_64 $D5, $2B, $F0, $18
		struc_64 $D5, $2B, $F4, $18
		struc_64 $D5, $2B, $F4, $18
		struc_64 $EC, $14, $E8, $24
		struc_64 $EC, $14, $F4, $24
		struc_64 $D0, $28, $F4, $18
		struc_64 $D5, $20, $F4, $18
		struc_64 $D5, $20, $EC, $20
		struc_64 $D5, $20, $F4, $20
		struc_64 $D5, $20, $F4, $18
		struc_64 $E0, $20, $F0, $20
		struc_64 $E8, $18, $F0, $20
		struc_64 $F0, $10, $F0, $20
		struc_64 $F8, 8, $F0, $20
		struc_64 $D0, $30, $E0, $40
		struc_64 $F2, $E, $F8,	$10
		struc_64 $E0, $10, $F8, $10
		struc_64 $DC, $24, $E0, $30
		struc_64 $DC, $24, $F0, $30
		struc_64 0, 4,	$FE, 8
		struc_64 0, 4,	$FA, 8
		struc_64 $FC, 8, $FC, 8
		struc_64 $F8, $10, $F8, $10
		struc_64 $F4, $18, $F4, $18
		struc_64 $FB, $A, 0, 4
		struc_64 $FB, $A, $FC,	4
		struc_64 0, 0, 0, 0
		struc_64 $FE, 4, 0, $1E
		struc_64 $FE, 4, $E2, $1E
		struc_64 0, $20, $FE, 4
		struc_64 $BE, $40, $FA, $C
		struc_64 $F8, $18, $F8, $10
		struc_64 $F6, 4, $FE, 4
		struc_64 0, $20, 0, $20
		struc_64 $D0, $30, $DC, $C
		struc_64 0, $18, $F0, $20
		struc_64 $D0, $30, $E8, $30
		struc_64 0, $20, 0, $20
		struc_64 0, $30, 0, $20
		struc_64 $FC, $20, $E2, 8
		struc_64 $FC, $20, $16, 8
		struc_64 $10, 8, $E8, $30
		struc_64 0, $10, 0, $20
		struc_64 0, $40, $E0, 8
		struc_64 $D8, $28, $F6, $14
		struc_64 $D8, $28, $F6, $14
		struc_64 $EC, $12, $F0, $24
		struc_64 $EC, $12, $EC, $24
		struc_64 $FA, 4, $FE, 4
		struc_64 $F2, $C, $FA,	$C
		struc_64 $EE, $C, $F6,	$14
		struc_64 $FD, 6, $F2, $1C
		struc_64 $F8, $10, $F8, $10
		struc_64 $FC, 8, $F8, $10
		struc_64 $C4, $3C, $CE, $10
		struc_64 $F0, $20, $E8, $30
		struc_64 $EA, $1A, $FA, $C
		struc_64 $FA, $C, $FA,	$C
		struc_64 $EA, $C, $FE,	$C
		struc_64 $EA, $C, $F6,	$C
		struc_64 $D4, $28, $FC, 8
		struc_64 $E8, $C, $F0,	$20
		struc_64 $EA, $14, $F6, $14
		struc_64 $F2, $C, $FA,	$12
		struc_64 $EA, $E, $C, $10
		struc_64 $F2, $C, $F6,	$12
		struc_64 $EA, $E, $E4,	$10
		struc_64 $E2, $1A, $FA, $16
		struc_64 $E2, $1A, $F0, $16
		struc_64 $F6, 8, $FC, 8
		struc_64 $E0, $20, $CE, $1E
		struc_64 $FA, 4, $FE, 4
		struc_64 $EC, $1C, $F8, $12
		struc_64 $EC, $1C, $F6, $12
		struc_64 $E8, $1C, $F8, $12
		struc_64 $E8, $1C, $F6, $12
		struc_64 $FE, 6, $FE, 4
		struc_64 $D4, $28, $FA, $14
		struc_64 $D4, $28, $E,	$14
		struc_64 $F6, 6, $FE, 4
		struc_64 2, $18, $F6, $14
		struc_64 0, $16, $F6, $14
		struc_64 0, 8,	$F0, $20
		struc_64 $EC, $12, $F6, $14
		struc_64 0, $E, $F6, $14
		struc_64 0, $40, $E0, $40
		struc_64 0, $10, $E0, $40
		struc_64 $D4, $28, $F6, $12
		struc_64 $D4, $28, $F8, $12
		struc_64 $E0, $1C, $F6, $12
		struc_64 $E0, $1C, $F8, $12
		struc_64 $E2, $1C, $F8, $10
		struc_64 $F4, $18, $F8, $10
		struc_64 $F8, $10, $F4, $18
		struc_64 $E8, $14, $F2, $1C
		struc_64 $F0, $C, $F8,	$10
		struc_64 $F6, $14, $F8, $10
		struc_64 $D4, $28, $EC, $28
		struc_64 $E4, $18, $F8, $10
		struc_64 $EC, 8, $E8, $1E
		struc_64 $F8, 6, $F8, $10
		struc_64 $EC, 8, $FA, $1E
		struc_64 $F4, $A, $F0,	$20
		struc_64 $F0, $A, $F4,	$18
		struc_64 0, $10, $E0, $20
		struc_64 $10, $C, $F0,	$C
		struc_64 0, $10, $D0, $30
		struc_64 $10, 4, $F0, $C
		struc_64 0, $10, $F0, $20
		struc_64 0, $1C, $EE, $24
		struc_64 $C0, $18, $FE, 4
		struc_64 $E0, $20, $F0, $20
		struc_64 $A0, 8, $E0, $40
		struc_64 $E4, $18, $F6, $14
		struc_64 $D0, $10, $F8, $10
		struc_64 $C4, $38, $F8, $10
		struc_64 $E2, $1E, $E6, 4
		struc_64 $E2, $1E, $16, 4
		struc_64 $F8, 8, $EC, $28
		struc_64 $D2, $18, $F8, $10
		struc_64 $FA, 2, $F4, $18
		struc_64 $C8, $34, $F2, $1C
		struc_64 $F0, $10, $F0, $20
		struc_64 $CA, $32, $F8, $14
		struc_64 $CA, $32, $F4, $14
		struc_64 $F4, $C, $F4,	$28
		struc_64 $E2, $C, $F2,	$E
		struc_64 $F4, $C, $E4,	$28
		struc_64 $E2, $C, 0, $E
		struc_64 $F0, $E, $E4,	$38
		struc_64 $EC, 8, $E8, $14
		struc_64 $EC, 8, 4, $14
		struc_64 $F0, 8, $E8, $30
		struc_64 $F2, $C, $F4,	$18
		struc_64 $F4, $18, $F4, $18
		struc_64 $F6, $14, $F6, $14
		struc_64 $FA, $C, $FA,	$C
		struc_64 $FE, 4, $FE, 4
		struc_64 $F4, $A, $E8,	$A
		struc_64 $F4, 0, $F2, $A
		struc_64 $E8, $14, $E0, $A
		struc_64 $E8, $14, $16, $A
		struc_64 $E2, $C, $F4,	$A
		struc_64 $E2, $C, 2, $A
		struc_64 $F0, $A, $E0,	$40
		struc_64 $FE, 4, $30, $10
		struc_64 $FE, 4, $C0, $10
		struc_64 $F0, $E, $F0,	$24
		struc_64 $F0, $E, $EC,	$24
		struc_64 $D8, $20, $F0, $14
		struc_64 $D8, $20, $FC, $14
		struc_64 $DC, $C, 8, 8
		struc_64 $DC, $C, $F0,	8
		struc_64 $F0, $C, 8, 8
		struc_64 $D8, $22, $F8, $10
		struc_64 $EC, $14, $F0, $20
		struc_64 $E8, $18, $E0, $40
		struc_64 $F8, 6, $E2, $3C
		struc_64 $FD, 3, $E0, $28
		struc_64 $FD, 3, $F8, $28
		struc_64 $EC, 8, $EC, 8
		struc_64 $FC, 8, $FC, 8
		struc_64 $EC, 8, $C, 8
		struc_64 $FC, 8, $FC, 8
		struc_64 $E8, $20, $FD, 3
		struc_64 $C, 8, $EC, 8
		struc_64 $FC, 8, $FC, 8
		struc_64 $C, 8, $C, 8
		struc_64 $FC, 8, $FC, 8
		struc_64 $F8, $28, $FD, 3
		struc_64 $F6, $14, $F6, $14
		struc_64 $C4, $3A, $F8, $10
		struc_64 $C8, $36, 0, $10
		struc_64 $C8, $36, $F0, $10
		struc_64 $C8, $36, 6, $10
		struc_64 $C8, $36, $EA, $10
		struc_64 $C4, $10, $F8, $10
		struc_64 $C8, $10, 0, $10
		struc_64 $C8, $10, $F0, $10
		struc_64 $C8, $10, 6, $10
		struc_64 $C8, $10, $EA, $10
		struc_64 $F0, $C, $F0,	8
		struc_64 $E2, 4, 0, $18
		struc_64 $E2, 4, $E8, $18
		struc_64 0, $D, 8, $18
		struc_64 0, $D, $E0, $18
		struc_64 $F3, $1A, $FC, 8
		struc_64 $F0, $20, $F0, $20
		struc_64 $F, $20, $F4,	$10
		struc_64 $F, $20, $FC,	$10
		struc_64 $14, $20, $F4, $10
		struc_64 $14, $20, $FC, $10
		struc_64 $C, $20, $F4,	$10
		struc_64 $C, $20, $FC,	$10
		struc_64 8, $20, $F4, $10
		struc_64 8, $20, $FC, $10
		struc_64 4, $D, $E, $18
		struc_64 4, $D, $DA, $18
		struc_64 $F8, $D, 8, $18
		struc_64 $F8, $D, $E0,	$18
		struc_64 8, $D, 8, $18
		struc_64 8, $D, $E0, $18
		struc_64 $10, $20, 0, $14
		struc_64 $10, $20, $EC, $14
		struc_64 $2C, $18, 2, 8
		struc_64 $2C, $18, $F6, 8
		struc_64 $2C, $18, $1B, 8
		struc_64 $2C, $18, $E5, 8
		struc_64 8, $14, $14, $20
		struc_64 8, $14, $CC, $20
		struc_64 $EA, 4, 0, $18
		struc_64 $EA, 4, $E8, $18
		struc_64 $10, $70, $E0, $40
		struc_64 $A8, $58, $E0, $40
		struc_64 $D8, $24, 0, $24
		struc_64 $D8, $24, $DC, $24
		struc_64 $D8, $E, $18,	$16
		struc_64 $D8, $E, $D2,	$16
		struc_64 $D8, $10, $18, $18
		struc_64 $D8, $10, $D0, $18
		struc_64 $F9, $E, $F9,	$E
		struc_64 $FB, $A, $FB,	$A
		struc_64 $FC, 8, $FC, 8
		struc_64 $FE, 4, $FE, 4
		struc_64 $E0, $18, $F0, $3A
		struc_64 $E0, $18, $D6, $3A
		struc_64 $E0, $20, $E8, $18
		struc_64 $E0, $20, 0, $18
		struc_64 $D0, $10, $14, $10
		struc_64 $F2, $E, $F4,	$18
		struc_64 $D0, $10, $EC, $10
		struc_64 $18, $20, $F4, $10
		struc_64 $18, $20, $FC, $10
		struc_64 $DC, $20, $FC, 8
		struc_64 0, 0, 0, 0
		struc_64 0, 0, 0, 0
		struc_64 0, 0, 0, 0
		struc_64 0, 0, 0, 0
		struc_64 0, 0, 0, 0
		struc_64 0, 0, 0, 0
stru_13DA70:	struc_65_v2 dword_FF6000, 0, %1000010,	$E, 0, 3, 2, 4,	byte_13DACA
		struc_65_v2 dword_FF6000, 0, %1000010,	$E, 0, 1, 1, 9,	byte_13DACE
		struc_65_v2 dword_FF6000, 0, %1000010,	$E, 0, 3, 4, 4,	byte_13DACA
		struc_65_v2 dword_FF6000, 0, %1000010,	$A, 0, 1, 2, 2,	byte_13DACE
		struc_65_v2 dword_FF6000, 0, %1000010,	$14, 0,	4, 2, 4, byte_13DAD0
byte_13DACA:	dc.b   0,  1,  2,  3
byte_13DACE:	dc.b   0,  1
byte_13DAD0:	dc.b   0,  0,  1,  2,  0
		align 2, 0
kosinski_13DAD6:
    binclude "src/kosinski/data_13DAD6.bin"
    align 2, 0
kosinski_level_params:
    binclude "src/levels/kosinski_params.bin"
    align 2, 0
sega_logo_palette:
    binclude "src/sega_logo/palette.bin"
    align 2, 0
enigma_sega_logo_mapping:
    binclude "src/sega_logo/enigma_mapping.bin"
    align 2, 0
nemesis_sega_logo:
    binclude "src/sega_logo/nemesis_tiles.bin"
    align 2, 0

init_sound_type1:
		move.w	#$100,(IO_Z80RES).l
		jsr	request_z80_bus(pc)
		movem.l	d1/a1-a2,-(sp)
		jsr	load_smps_driver_parts_1_2(pc)
		bra.s	loc_13FE2A

init_sound_type2:
		move.w	#$100,(IO_Z80RES).l
		jsr	request_z80_bus(pc)
		movem.l	d1/a1-a2,-(sp)
		jsr	load_smps_driver_parts_1_3(pc)

loc_13FE2A:
		lea	(byte_A01BFE).l,a1
		move.b	#((smps_bank1 >> $10) &	$FF),(a1)+
		move.b	#((smps_bank1 >> $08) &	$FF),(a1)+
		move.b	#((smps_bank0 >> $10) &	$FF),(a1)+
		move.b	#((smps_bank0 >> $08) &	$FF),(a1)+
		move.b	#0,(a1)+
		move.b	#$80,(a1)+
		move.b	#$B4,(a1)+
		move.b	#0,(a1)+
		move.b	#$E6,(a1)+
		move.b	#$80,(a1)+
		move.b	#0,(a1)+
		move.b	#0,(a1)+
		move.w	#0,(IO_Z80RES).l
		ror.b	#8,d0
		move.w	#$100,(IO_Z80RES).l
		jsr	release_z80_bus(pc)
		movem.l	(sp)+,d1/a1-a2
		rts

load_smps_driver_parts_1_2:
		lea	(Z80_RAM).l,a1
		lea	(smps_driver_part1).l,a2
		move.w	#3525,d1

loc_13FE8C:
		move.b	(a2)+,(a1)+
		dbf	d1,loc_13FE8C
		lea	(byte_A00DD0).l,a1
		lea	(smps_driver_part2).l,a2
		move.w	#3619,d1

loc_13FEA2:
		move.b	(a2)+,(a1)+
		dbf	d1,loc_13FEA2
		rts

load_smps_driver_parts_1_3:
		lea	(Z80_RAM).l,a1
		lea	(smps_driver_part1).l,a2
		move.w	#3525,d1

loc_13FEBA:
		move.b	(a2)+,(a1)+
		dbf	d1,loc_13FEBA
		lea	(byte_A00F00).l,a1
		lea	(smps_driver_part3).l,a2
		move.w	#1751,d1

loc_13FED0:
		move.b	(a2)+,(a1)+
		dbf	d1,loc_13FED0
		rts
; d0 = cmd
; #$F9 - ?

send_smps_cmd:
		move.l	d0,-(sp)
		move.b	(smps_cmd1).w,d0
		beq.s	loc_13FEE8
		move.b	#0,(smps_cmd1).w
		bra.s	loc_13FEF4

loc_13FEE8:
		move.b	(smps_cmd2).w,d0
		beq.s	loc_13FF0A
		move.b	#0,(smps_cmd2).w

loc_13FEF4:
		jsr	request_z80_bus(pc)
		nop
		nop
		nop
		nop
		move.b	d0,(z80_cmd).l
		jsr	release_z80_bus(pc)

loc_13FF0A:
		move.l	(sp)+,d0
		rts

request_z80_bus:
		move	sr,(word_FF8F82).w
		move	#$2700,sr
		move.w	#$100,(IO_Z80BUS).l

loc_13FF1E:
		btst	#0,(IO_Z80BUS).l
		bne.s	loc_13FF1E
		rts

release_z80_bus:
		move.w	#0,(IO_Z80BUS).l
		move	(word_FF8F82).w,sr
		rts
    org $7FFFF
rom_end:	dc.b $FF
