    cpu 68000
    supmode on
    padding off
    include "kosinski_params_dec_structs.inc"
    include "kosinski_params_dec_equals.inc"
    include "kosinski_params_dec_externs.inc"
    include "kosinski_params_dec_funcs.inc"

; segment "ROM"
offset0:	dc.w tbl_lvl_params1-offset0
offset2:	dc.w tbl_lvl_params2-offset2
offset4:	dc.w tbl_lvl_params3-offset4
offset6:	dc.w tbl_lvl_params4-offset6
tbl_lvl_params1:dc.w tbl_params1_lvl_0-tbl_lvl_params1
		dc.w tbl_params1_lvl_1-tbl_lvl_params1
		dc.w tbl_params1_lvl_2-tbl_lvl_params1
		dc.w tbl_params1_lvl_3-tbl_lvl_params1
		dc.w tbl_params1_lvl_4-tbl_lvl_params1
		dc.w tbl_params1_lvl_5-tbl_lvl_params1
		dc.w tbl_params1_lvl_6-tbl_lvl_params1
		dc.w tbl_params1_lvl_7-tbl_lvl_params1
		dc.w tbl_params1_lvl_8-tbl_lvl_params1
		dc.w tbl_params1_lvl_9-tbl_lvl_params1
tbl_params1_lvl_0:dc.w tbl_params1_lvl_1_0-tbl_params1_lvl_0
tbl_params1_lvl_1:dc.w tbl_params1_lvl_1_0-tbl_params1_lvl_1
		dc.w tbl_params1_lvl_1_1-tbl_params1_lvl_1
		dc.w tbl_params1_lvl_1_2-tbl_params1_lvl_1
		dc.w tbl_params1_lvl_1_3-tbl_params1_lvl_1
		dc.w tbl_params1_lvl_1_4-tbl_params1_lvl_1
		dc.w tbl_params1_lvl_1_5-tbl_params1_lvl_1
		dc.w tbl_params1_lvl_1_6-tbl_params1_lvl_1
tbl_params1_lvl_2:dc.w tbl_params1_lvl_2_0-tbl_params1_lvl_2
		dc.w tbl_params1_lvl_2_1-tbl_params1_lvl_2
		dc.w tbl_params1_lvl_2_2-tbl_params1_lvl_2
		dc.w tbl_params1_lvl_2_3-tbl_params1_lvl_2
		dc.w tbl_params1_lvl_2_4-tbl_params1_lvl_2
		dc.w tbl_params1_lvl_2_5-tbl_params1_lvl_2
		dc.w tbl_params1_lvl_2_6-tbl_params1_lvl_2
		dc.w tbl_params1_lvl_2_7-tbl_params1_lvl_2
tbl_params1_lvl_3:dc.w tbl_params1_lvl_3_0-tbl_params1_lvl_3
		dc.w tbl_params1_lvl_3_1-tbl_params1_lvl_3
		dc.w tbl_params1_lvl_3_2-tbl_params1_lvl_3
		dc.w tbl_params1_lvl_3_3-tbl_params1_lvl_3
		dc.w tbl_params1_lvl_3_4-tbl_params1_lvl_3
		dc.w tbl_params1_lvl_3_5-tbl_params1_lvl_3
		dc.w tbl_params1_lvl_3_6-tbl_params1_lvl_3
		dc.w tbl_params1_lvl_3_7-tbl_params1_lvl_3
		dc.w tbl_params1_lvl_3_8-tbl_params1_lvl_3
tbl_params1_lvl_4:dc.w tbl_params1_lvl_4_0-tbl_params1_lvl_4
		dc.w tbl_params1_lvl_4_1-tbl_params1_lvl_4
		dc.w tbl_params1_lvl_4_7-tbl_params1_lvl_4
		dc.w tbl_params1_lvl_4_3-tbl_params1_lvl_4
		dc.w tbl_params1_lvl_4_4-tbl_params1_lvl_4
		dc.w tbl_params1_lvl_4_5-tbl_params1_lvl_4
		dc.w tbl_params1_lvl_4_6-tbl_params1_lvl_4
		dc.w tbl_params1_lvl_4_7-tbl_params1_lvl_4
tbl_params1_lvl_5:dc.w tbl_params1_lvl_5_0-tbl_params1_lvl_5
		dc.w tbl_params1_lvl_5_1-tbl_params1_lvl_5
		dc.w tbl_params1_lvl_5_2-tbl_params1_lvl_5
		dc.w tbl_params1_lvl_5_3-tbl_params1_lvl_5
		dc.w tbl_params1_lvl_5_4-tbl_params1_lvl_5
		dc.w tbl_params1_lvl_5_5-tbl_params1_lvl_5
		dc.w tbl_params1_lvl_5_6-tbl_params1_lvl_5
		dc.w tbl_params1_lvl_5_7-tbl_params1_lvl_5
		dc.w tbl_params1_lvl_5_8-tbl_params1_lvl_5
tbl_params1_lvl_6:dc.w tbl_params1_lvl_6_0-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_1-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_2-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_3-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_4-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_5-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_6-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_7-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_8-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_9-tbl_params1_lvl_6
		dc.w tbl_params1_lvl_6_10-tbl_params1_lvl_6
tbl_params1_lvl_7:dc.w tbl_params1_lvl_7_0-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_1-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_2-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_3-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_4-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_5-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_6-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_7-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_8-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_9-tbl_params1_lvl_7
		dc.w tbl_params1_lvl_7_10-tbl_params1_lvl_7
tbl_params1_lvl_8:dc.w tbl_params1_lvl_8_0-tbl_params1_lvl_8
		dc.w tbl_params1_lvl_8_1-tbl_params1_lvl_8
		dc.w tbl_params1_lvl_8_2-tbl_params1_lvl_8
		dc.w tbl_params1_lvl_8_3-tbl_params1_lvl_8
		dc.w tbl_params1_lvl_8_4-tbl_params1_lvl_8
tbl_params1_lvl_9:dc.w tbl_params1_lvl_9_0-tbl_params1_lvl_9
		dc.w tbl_params1_lvl_9_1-tbl_params1_lvl_9
		dc.w tbl_params1_lvl_9_2-tbl_params1_lvl_9
		dc.w tbl_params1_lvl_9_3-tbl_params1_lvl_9
tbl_params1_lvl_1_0:
    include "01_Duckburg/params1_00.inc"
tbl_params1_lvl_1_1:
    include "01_Duckburg/params1_01.inc"
tbl_params1_lvl_1_2:
    include "01_Duckburg/params1_02.inc"
tbl_params1_lvl_1_3:
    include "01_Duckburg/params1_03.inc"
tbl_params1_lvl_1_4:
    include "01_Duckburg/params1_04.inc"
tbl_params1_lvl_1_5:
    include "01_Duckburg/params1_05.inc"
tbl_params1_lvl_1_6:
    include "01_Duckburg/params1_06.inc"
tbl_params1_lvl_2_0:
    include "02_Mexico/params1_00.inc"
tbl_params1_lvl_2_1:
    include "02_Mexico/params1_01.inc"
tbl_params1_lvl_2_2:
    include "02_Mexico/params1_02.inc"
tbl_params1_lvl_2_3:
    include "02_Mexico/params1_03.inc"
tbl_params1_lvl_2_4:
    include "02_Mexico/params1_04.inc"
tbl_params1_lvl_2_5:
    include "02_Mexico/params1_05.inc"
tbl_params1_lvl_2_6:
    include "02_Mexico/params1_06.inc"
tbl_params1_lvl_2_7:
    include "02_Mexico/params1_07.inc"
tbl_params1_lvl_3_0:
    include "03_Transylvania/params1_00.inc"
tbl_params1_lvl_3_1:
    include "03_Transylvania/params1_01.inc"
tbl_params1_lvl_3_2:
    include "03_Transylvania/params1_02.inc"
tbl_params1_lvl_3_3:
    include "03_Transylvania/params1_03.inc"
tbl_params1_lvl_3_4:
    include "03_Transylvania/params1_04.inc"
tbl_params1_lvl_3_5:
    include "03_Transylvania/params1_05.inc"
tbl_params1_lvl_3_6:
    include "03_Transylvania/params1_06.inc"
tbl_params1_lvl_3_7:
    include "03_Transylvania/params1_07.inc"
tbl_params1_lvl_3_8:
    include "03_Transylvania/params1_08.inc"
tbl_params1_lvl_4_0:
    include "04_Viking_Ship/params1_00.inc"
tbl_params1_lvl_4_1:
    include "04_Viking_Ship/params1_01.inc"
tbl_params1_lvl_4_7:
    include "04_Viking_Ship/params1_07.inc"
tbl_params1_lvl_4_3:
    include "04_Viking_Ship/params1_03.inc"
tbl_params1_lvl_4_4:
    include "04_Viking_Ship/params1_04.inc"
tbl_params1_lvl_4_5:
    include "04_Viking_Ship/params1_05.inc"
tbl_params1_lvl_4_6:
    include "04_Viking_Ship/params1_06.inc"
tbl_params1_lvl_5_0:
    include "05_South_Pole/params1_00.inc"
tbl_params1_lvl_5_1:
    include "05_South_Pole/params1_01.inc"
tbl_params1_lvl_5_2:
    include "05_South_Pole/params1_02.inc"
tbl_params1_lvl_5_3:
    include "05_South_Pole/params1_03.inc"
tbl_params1_lvl_5_4:
    include "05_South_Pole/params1_04.inc"
tbl_params1_lvl_5_5:
    include "05_South_Pole/params1_05.inc"
tbl_params1_lvl_5_6:
    include "05_South_Pole/params1_06.inc"
tbl_params1_lvl_5_7:
    include "05_South_Pole/params1_07.inc"
tbl_params1_lvl_5_8:
    include "05_South_Pole/params1_08.inc"
tbl_params1_lvl_6_0:
    include "06_Maharajah/params1_00.inc"
tbl_params1_lvl_6_1:
    include "06_Maharajah/params1_01.inc"
tbl_params1_lvl_6_2:
    include "06_Maharajah/params1_02.inc"
tbl_params1_lvl_6_3:
    include "06_Maharajah/params1_03.inc"
tbl_params1_lvl_6_4:
    include "06_Maharajah/params1_04.inc"
tbl_params1_lvl_6_5:
    include "06_Maharajah/params1_05.inc"
tbl_params1_lvl_6_6:
    include "06_Maharajah/params1_06.inc"
tbl_params1_lvl_6_7:
    include "06_Maharajah/params1_07.inc"
tbl_params1_lvl_6_8:
    include "06_Maharajah/params1_08.inc"
tbl_params1_lvl_6_9:
    include "06_Maharajah/params1_09.inc"
tbl_params1_lvl_6_10:
    include "06_Maharajah/params1_10.inc"
tbl_params1_lvl_7_0:
    include "07_Egypt/params1_00.inc"
tbl_params1_lvl_7_1:
    include "07_Egypt/params1_01.inc"
tbl_params1_lvl_7_2:
    include "07_Egypt/params1_02.inc"
tbl_params1_lvl_7_3:
    include "07_Egypt/params1_03.inc"
tbl_params1_lvl_7_4:
    include "07_Egypt/params1_04.inc"
tbl_params1_lvl_7_5:
    include "07_Egypt/params1_05.inc"
tbl_params1_lvl_7_6:
    include "07_Egypt/params1_06.inc"
tbl_params1_lvl_7_7:
    include "07_Egypt/params1_07.inc"
tbl_params1_lvl_7_8:
    include "07_Egypt/params1_08.inc"
tbl_params1_lvl_7_9:
    include "07_Egypt/params1_09.inc"
tbl_params1_lvl_7_10:
    include "07_Egypt/params1_10.inc"
tbl_params1_lvl_8_0:
    include "08_Hideout/params1_00.inc"
tbl_params1_lvl_8_1:
    include "08_Hideout/params1_01.inc"
tbl_params1_lvl_8_2:
    include "08_Hideout/params1_02.inc"
tbl_params1_lvl_8_3:
    include "08_Hideout/params1_03.inc"
tbl_params1_lvl_8_4:
    include "08_Hideout/params1_04.inc"
tbl_params1_lvl_9_0:
    include "09_The_Island/params1_00.inc"
tbl_params1_lvl_9_1:
    include "09_The_Island/params1_01.inc"
tbl_params1_lvl_9_2:
    include "09_The_Island/params1_02.inc"
tbl_params1_lvl_9_3:
    include "09_The_Island/params1_03.inc"
tbl_lvl_params2:dc.w tbl_params2_lvl_1-tbl_lvl_params2
		dc.w tbl_params2_lvl_1-tbl_lvl_params2
		dc.w tbl_params2_lvl_2-tbl_lvl_params2
		dc.w tbl_params2_lvl_3-tbl_lvl_params2
		dc.w tbl_params2_lvl_4-tbl_lvl_params2
		dc.w tbl_params2_lvl_5-tbl_lvl_params2
		dc.w tbl_params2_lvl_6-tbl_lvl_params2
		dc.w tbl_params2_lvl_7-tbl_lvl_params2
		dc.w tbl_params2_lvl_8-tbl_lvl_params2
		dc.w tbl_params2_lvl_9-tbl_lvl_params2
tbl_params2_lvl_1:dc.w tbl_params2_lvl_1_0-tbl_params2_lvl_1
		dc.w tbl_params2_lvl_1_1-tbl_params2_lvl_1
		dc.w tbl_params2_lvl_1_2-tbl_params2_lvl_1
tbl_params2_lvl_1_0:
    include "01_Duckburg/params2_00.inc"
tbl_params2_lvl_1_1:
    include "01_Duckburg/params2_01.inc"
tbl_params2_lvl_1_2:
    include "01_Duckburg/params2_02.inc"
tbl_params2_lvl_2:dc.w tbl_params2_lvl_2_0-tbl_params2_lvl_2
		dc.w tbl_params2_lvl_2_1-tbl_params2_lvl_2
		dc.w tbl_params2_lvl_2_2-tbl_params2_lvl_2
		dc.w tbl_params2_lvl_2_3-tbl_params2_lvl_2
tbl_params2_lvl_2_0:
    include "02_Mexico/params2_00.inc"
tbl_params2_lvl_2_1:
    include "02_Mexico/params2_01.inc"
tbl_params2_lvl_2_2:
    include "02_Mexico/params2_02.inc"
tbl_params2_lvl_2_3:
    include "02_Mexico/params2_03.inc"
tbl_params2_lvl_3:dc.w tbl_params2_lvl_3_0-tbl_params2_lvl_3
		dc.w tbl_params2_lvl_3_1-tbl_params2_lvl_3
		dc.w tbl_params2_lvl_3_2-tbl_params2_lvl_3
		dc.w tbl_params2_lvl_3_3-tbl_params2_lvl_3
		dc.w tbl_params2_lvl_3_4-tbl_params2_lvl_3
		dc.w tbl_params2_lvl_3_5-tbl_params2_lvl_3
		dc.w tbl_params2_lvl_3_6-tbl_params2_lvl_3
tbl_params2_lvl_3_0:
    include "03_Transylvania/params2_00.inc"
tbl_params2_lvl_3_1:
    include "03_Transylvania/params2_01.inc"
tbl_params2_lvl_3_2:
    include "03_Transylvania/params2_02.inc"
tbl_params2_lvl_3_3:
    include "03_Transylvania/params2_03.inc"
tbl_params2_lvl_3_4:
    include "03_Transylvania/params2_04.inc"
tbl_params2_lvl_3_5:
    include "03_Transylvania/params2_05.inc"
tbl_params2_lvl_3_6:
    include "03_Transylvania/params2_06.inc"
tbl_params2_lvl_4:dc.w tbl_params2_lvl_4_0-tbl_params2_lvl_4
		dc.w tbl_params2_lvl_4_1-tbl_params2_lvl_4
		dc.w tbl_params2_lvl_4_2-tbl_params2_lvl_4
		dc.w tbl_params2_lvl_4_3-tbl_params2_lvl_4
		dc.w tbl_params2_lvl_4_4-tbl_params2_lvl_4
tbl_params2_lvl_4_0:
    include "04_Viking_Ship/params2_00.inc"
tbl_params2_lvl_4_1:
    include "04_Viking_Ship/params2_01.inc"
tbl_params2_lvl_4_2:
    include "04_Viking_Ship/params2_02.inc"
tbl_params2_lvl_4_3:
    include "04_Viking_Ship/params2_03.inc"
tbl_params2_lvl_4_4:
    include "04_Viking_Ship/params2_04.inc"
tbl_params2_lvl_5:dc.w tbl_params2_lvl_5_0-tbl_params2_lvl_5
		dc.w tbl_params2_lvl_5_1-tbl_params2_lvl_5
		dc.w tbl_params2_lvl_5_2-tbl_params2_lvl_5
		dc.w tbl_params2_lvl_5_3-tbl_params2_lvl_5
tbl_params2_lvl_5_0:
    include "05_South_Pole/params2_00.inc"
tbl_params2_lvl_5_1:
    include "05_South_Pole/params2_01.inc"
tbl_params2_lvl_5_2:
    include "05_South_Pole/params2_02.inc"
tbl_params2_lvl_5_3:
    include "05_South_Pole/params2_03.inc"
tbl_params2_lvl_6:dc.w tbl_params2_lvl_6_0-tbl_params2_lvl_6
		dc.w tbl_params2_lvl_6_1-tbl_params2_lvl_6
		dc.w tbl_params2_lvl_6_2-tbl_params2_lvl_6
		dc.w tbl_params2_lvl_6_3-tbl_params2_lvl_6
		dc.w tbl_params2_lvl_6_5-tbl_params2_lvl_6
		dc.w tbl_params2_lvl_6_5-tbl_params2_lvl_6
		dc.w tbl_params2_lvl_6_7-tbl_params2_lvl_6
		dc.w tbl_params2_lvl_6_7-tbl_params2_lvl_6
		dc.w tbl_params2_lvl_6_8-tbl_params2_lvl_6
tbl_params2_lvl_6_0:
    include "06_Maharajah/params2_00.inc"
tbl_params2_lvl_6_1:
    include "06_Maharajah/params2_01.inc"
tbl_params2_lvl_6_2:
    include "06_Maharajah/params2_02.inc"
tbl_params2_lvl_6_3:
    include "06_Maharajah/params2_03.inc"
tbl_params2_lvl_6_5:
    include "06_Maharajah/params2_05.inc"
tbl_params2_lvl_6_7:
    include "06_Maharajah/params2_07.inc"
tbl_params2_lvl_6_8:
    include "06_Maharajah/params2_08.inc"
tbl_params2_lvl_7:dc.w tbl_params2_lvl_7_0-tbl_params2_lvl_7
		dc.w tbl_params2_lvl_7_1-tbl_params2_lvl_7
		dc.w tbl_params2_lvl_7_2-tbl_params2_lvl_7
		dc.w tbl_params2_lvl_7_3-tbl_params2_lvl_7
		dc.w tbl_params2_lvl_7_4-tbl_params2_lvl_7
		dc.w tbl_params2_lvl_7_5-tbl_params2_lvl_7
tbl_params2_lvl_7_0:
    include "07_Egypt/params2_00.inc"
tbl_params2_lvl_7_1:
    include "07_Egypt/params2_01.inc"
tbl_params2_lvl_7_2:
    include "07_Egypt/params2_02.inc"
tbl_params2_lvl_7_3:
    include "07_Egypt/params2_03.inc"
tbl_params2_lvl_7_4:
    include "07_Egypt/params2_04.inc"
tbl_params2_lvl_7_5:
    include "07_Egypt/params2_05.inc"
tbl_params2_lvl_8:dc.w tbl_params2_lvl_8_0-tbl_params2_lvl_8
		dc.w tbl_params2_lvl_8_1-tbl_params2_lvl_8
		dc.w tbl_params2_lvl_8_2-tbl_params2_lvl_8
		dc.w tbl_params2_lvl_8_3-tbl_params2_lvl_8
		dc.w tbl_params2_lvl_8_4-tbl_params2_lvl_8
tbl_params2_lvl_8_0:
    include "08_Hideout/params2_00.inc"
tbl_params2_lvl_8_1:
    include "08_Hideout/params2_01.inc"
tbl_params2_lvl_8_2:
    include "08_Hideout/params2_02.inc"
tbl_params2_lvl_8_3:
    include "08_Hideout/params2_03.inc"
tbl_params2_lvl_8_4:
    include "08_Hideout/params2_04.inc"
tbl_params2_lvl_9:dc.w tbl_params2_lvl_9_0-tbl_params2_lvl_9
		dc.w tbl_params2_lvl_9_1-tbl_params2_lvl_9
		dc.w tbl_params2_lvl_9_2-tbl_params2_lvl_9
		dc.w tbl_params2_lvl_9_3-tbl_params2_lvl_9
tbl_params2_lvl_9_0:
    include "09_The_Island/params2_00.inc"
tbl_params2_lvl_9_1:
    include "09_The_Island/params2_01.inc"
tbl_params2_lvl_9_2:
    include "09_The_Island/params2_02.inc"
tbl_params2_lvl_9_3:
    include "09_The_Island/params2_03.inc"
tbl_lvl_params3:dc.w tbl_params3_0-tbl_lvl_params3
		dc.w tbl_params3_1-tbl_lvl_params3
		dc.w tbl_params3_9-tbl_lvl_params3
		dc.w tbl_params3_3-tbl_lvl_params3
		dc.w tbl_params3_4-tbl_lvl_params3
		dc.w tbl_params3_5-tbl_lvl_params3
		dc.w tbl_params3_6-tbl_lvl_params3
		dc.w tbl_params3_7-tbl_lvl_params3
		dc.w tbl_params3_8-tbl_lvl_params3
		dc.w tbl_params3_9-tbl_lvl_params3
		dc.w tbl_params3_10-tbl_lvl_params3
		dc.w tbl_params3_11-tbl_lvl_params3
		dc.w tbl_params3_12-tbl_lvl_params3
		dc.w tbl_params3_13-tbl_lvl_params3
		dc.w tbl_params3_14-tbl_lvl_params3
		dc.w tbl_params3_15-tbl_lvl_params3
		dc.w tbl_params3_16-tbl_lvl_params3
		dc.w tbl_params3_17-tbl_lvl_params3
		dc.w tbl_params3_18-tbl_lvl_params3
		dc.w tbl_params3_19-tbl_lvl_params3
		dc.w tbl_params3_20-tbl_lvl_params3
		dc.w tbl_params3_21-tbl_lvl_params3
		dc.w tbl_params3_22-tbl_lvl_params3
		dc.w tbl_params3_23-tbl_lvl_params3
		dc.w tbl_params3_24-tbl_lvl_params3
		dc.w tbl_params3_25-tbl_lvl_params3
		dc.w tbl_params3_26-tbl_lvl_params3
		dc.w tbl_params3_27-tbl_lvl_params3
		dc.w tbl_params3_28-tbl_lvl_params3
		dc.w tbl_params3_29-tbl_lvl_params3
		dc.w tbl_params3_30-tbl_lvl_params3
		dc.w tbl_params3_31-tbl_lvl_params3
		dc.w tbl_params3_32-tbl_lvl_params3
		dc.w tbl_params3_33-tbl_lvl_params3
		dc.w tbl_params3_34-tbl_lvl_params3
		dc.w tbl_params3_35-tbl_lvl_params3
		dc.w tbl_params3_36-tbl_lvl_params3
		dc.w tbl_params3_37-tbl_lvl_params3
		dc.w tbl_params3_38-tbl_lvl_params3
		dc.w tbl_params3_39-tbl_lvl_params3
		dc.w tbl_params3_40-tbl_lvl_params3
		dc.w tbl_params3_41-tbl_lvl_params3
		dc.w tbl_params3_42-tbl_lvl_params3
		dc.w tbl_params3_43-tbl_lvl_params3
		dc.w tbl_params3_44-tbl_lvl_params3
		dc.w tbl_params3_45-tbl_lvl_params3
tbl_params3_0:
    binclude "params3/00.bin"
		align 2
tbl_params3_1:
    binclude "params3/01.bin"
tbl_params3_9:
    binclude "params3/09.bin"
tbl_params3_3:
    binclude "params3/03.bin"
		align 2
tbl_params3_4:
    binclude "params3/04.bin"
tbl_params3_5:
    binclude "params3/05.bin"
tbl_params3_6:
    binclude "params3/06.bin"
tbl_params3_7:
    binclude "params3/07.bin"
tbl_params3_8:
    binclude "params3/08.bin"
tbl_params3_10:
    binclude "params3/10.bin"
tbl_params3_11:
    binclude "params3/11.bin"
tbl_params3_12:
    binclude "params3/12.bin"
		align 2
tbl_params3_13:
    binclude "params3/13.bin"
tbl_params3_14:
    binclude "params3/14.bin"
tbl_params3_15:
    binclude "params3/15.bin"
		align 2
tbl_params3_16:
    binclude "params3/16.bin"
tbl_params3_17:
    binclude "params3/17.bin"
tbl_params3_18:
    binclude "params3/18.bin"
tbl_params3_19:
    binclude "params3/19.bin"
		align 2
tbl_params3_20:
    binclude "params3/20.bin"
		align 2
tbl_params3_21:
    binclude "params3/21.bin"
tbl_params3_22:
    binclude "params3/22.bin"
tbl_params3_23:
    binclude "params3/23.bin"
tbl_params3_24:
    binclude "params3/24.bin"
tbl_params3_25:
    binclude "params3/25.bin"
tbl_params3_26:
    binclude "params3/26.bin"
tbl_params3_27:
    binclude "params3/27.bin"
tbl_params3_28:
    binclude "params3/28.bin"
		align 2
tbl_params3_29:
    binclude "params3/29.bin"
tbl_params3_30:
    binclude "params3/30.bin"
tbl_params3_31:
    binclude "params3/31.bin"
tbl_params3_32:
    binclude "params3/32.bin"
		align 2
tbl_params3_33:
    binclude "params3/33.bin"
tbl_params3_34:
    binclude "params3/34.bin"
tbl_params3_35:
    binclude "params3/35.bin"
		align 2
tbl_params3_36:
    binclude "params3/36.bin"
		align 2
tbl_params3_37:
    binclude "params3/37.bin"
tbl_params3_38:
    binclude "params3/38.bin"
		align 2
tbl_params3_39:
    binclude "params3/39.bin"
		align 2
tbl_params3_45:
    binclude "params3/45.bin"
		align 2
tbl_params3_40:
    binclude "params3/40.bin"
		align 2
tbl_params3_41:
    binclude "params3/41.bin"
		align 2
tbl_params3_42:
    binclude "params3/42.bin"
		align 2
tbl_params3_43:
    binclude "params3/43.bin"
		align 2
tbl_params3_44:
    binclude "params3/44.bin"
		align 2
tbl_lvl_params4:dc.w tbl_params4_2-tbl_lvl_params4
		dc.w tbl_params4_2-tbl_lvl_params4
		dc.w tbl_params4_2-tbl_lvl_params4
		dc.w tbl_params4_3-tbl_lvl_params4
		dc.w tbl_params4_4-tbl_lvl_params4
		dc.w tbl_params4_5-tbl_lvl_params4
		dc.w tbl_params4_6-tbl_lvl_params4
		dc.w tbl_params4_7-tbl_lvl_params4
		dc.w tbl_params4_8-tbl_lvl_params4
		dc.w tbl_params4_9-tbl_lvl_params4
		dc.w tbl_params4_10-tbl_lvl_params4
		dc.w tbl_params4_11-tbl_lvl_params4
		dc.w tbl_params4_12-tbl_lvl_params4
		dc.w tbl_params4_13-tbl_lvl_params4
		dc.w tbl_params4_14-tbl_lvl_params4
		dc.w tbl_params4_15-tbl_lvl_params4
		dc.w tbl_params4_16-tbl_lvl_params4
		dc.w tbl_params4_17-tbl_lvl_params4
		dc.w tbl_params4_18-tbl_lvl_params4
		dc.w tbl_params4_19-tbl_lvl_params4
tbl_params4_2:
    binclude "params4/02.bin"
		align 2
tbl_params4_3:
    binclude "params4/03.bin"
		align 2
tbl_params4_7:
    binclude "params4/07.bin"
		align 2
tbl_params4_6:
    binclude "params4/06.bin"
		align 2
tbl_params4_5:
    binclude "params4/05.bin"
		align 2
tbl_params4_8:
    binclude "params4/08.bin"
		align 2
tbl_params4_9:
    binclude "params4/09.bin"
		align 2
tbl_params4_10:
    binclude "params4/10.bin"
		align 2
tbl_params4_11:
    binclude "params4/11.bin"
		align 2
tbl_params4_4:
    binclude "params4/04.bin"
		align 2
tbl_params4_13:
    binclude "params4/13.bin"
		align 2
tbl_params4_12:
    binclude "params4/12.bin"
tbl_params4_19:
    binclude "params4/19.bin"
		align 2
tbl_params4_18:
    binclude "params4/18.bin"
		align 2
tbl_params4_14:
    binclude "params4/14.bin"
		align 2
tbl_params4_16:
    binclude "params4/16.bin"
tbl_params4_17:
    binclude "params4/17.bin"
		align 2
tbl_params4_15:
    binclude "params4/15.bin"
		align 2
