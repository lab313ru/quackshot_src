# work with level names: bin->txt, txt->bin (txt is UTF-8)
# first arg: bin (if txt->bin), txt (if bin->txt)

import os
import struct
import sys
from assemble import LEVELS_DIR, MAIN_MENU_DIR
from font_chars import i2a, a2i


BIN_EXT = '.bin'
TXT_EXT = '.txt'
LVL_NAME = 'name'
ROOM1_NAME = 'room1_name'
ROOM2_NAME = 'room2_name'
CHR_MASK = 0x2000


def list_levels(lvls_dir):
    ll = [name for name in os.listdir(lvls_dir) if os.path.isdir(os.path.join(lvls_dir, name))]

    return list(filter(lambda x: '00' <= x[:2] <= '99' and x[2] == '_', ll))


def txt2bin(data):
    bin_data = ''

    for c in data:
        bin_data += struct.pack('>H', (CHR_MASK + a2i(c)))

    return bin_data


def bin2txt(data):
    txt_data = ''

    for i in xrange(len(data) // 2):
        txt_data += i2a(struct.unpack_from('>H', data, i * 2)[0] - CHR_MASK)

    return txt_data.encode('utf8')


def convert(path, new_path, mode):
    with open(path, 'rb') as f:
        data = f.read()

        if mode == 'bin':
            data = data.decode('utf8').rstrip('\r\n')
            new_data = txt2bin(data)
        else:
            new_data = bin2txt(data)

        with open(new_path, 'wb') as w:
            w.write(new_data)

    if mode == 'txt':
        os.remove(path)


def form_paths(d, name, mode):
    path = os.path.join(d, name + TXT_EXT if mode == 'bin'
                        else name + BIN_EXT if mode == 'txt'
                        else name + TXT_EXT)

    new_path = os.path.join(d, name + TXT_EXT if mode == 'txt'
                            else name + BIN_EXT if mode == 'bin'
                            else name + TXT_EXT)

    return path, new_path


def main(mode):
    mode = mode.lower()
    levels = list_levels(LEVELS_DIR)

    for level in levels:
        path, new_path = form_paths(LEVELS_DIR, os.path.join(level, LVL_NAME), mode)
        convert(path, new_path, mode)

    rooms = [ROOM1_NAME, ROOM2_NAME]

    for room in rooms:
        path, new_path = form_paths(MAIN_MENU_DIR, room, mode)
        convert(path, new_path, mode)


if __name__ == '__main__':
    main(sys.argv[1])
