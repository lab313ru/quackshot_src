set PATH=%PATH%;./bin/;
python asm_fixer.py %1.s %1.map
copy %1_new.s %1.s
asw -maxerrors 2 %1.s
p2bin %1.p
