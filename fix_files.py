import os

if __name__ == '__main__':
    os.system('asm_fixer.py qs.asm qs.map')
    os.system('asm_fixer.py src/levels/kosinski_params_dec.asm')
    os.system('level_names.py txt')
