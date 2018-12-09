import os
import platform
import subprocess
import sys
from ctypes import cdll

AS_BIN = os.path.join(os.getcwd(), 'bin', 'asw')
AS_ARGS = '-maxerrors 2'

P2_BIN = os.path.join(os.getcwd(), 'bin', 'p2bin')
P2_BIN_DST_EXT = '.bin'

SRC_DIR = os.path.join(os.getcwd(), 'src')
LEVELS_DIR = os.path.join(os.getcwd(), SRC_DIR, 'levels')
ENEMIES_DIR = os.path.join(os.getcwd(), SRC_DIR, 'enemies')
FONTS_DIR = os.path.join(os.getcwd(), SRC_DIR, 'fonts')
MAIN_MENU_DIR = os.path.join(os.getcwd(), SRC_DIR, 'main_menu')
MAIN_SRC = os.path.join(os.getcwd(), 'qs.s')
NEM_ENEMY_TILES_DEC = 'nemesis_tiles_dec.bin'
NEM_MAIN_FONT_DEC = 'nemesis_main_dec.bin'
LEVEL_PARAMS_SRC = os.path.join(os.getcwd(), LEVELS_DIR, 'kosinski_params_dec.s')


def run_process(cmd):
    p = subprocess.Popen(cmd, bufsize=2048, shell=True)
    p.wait()


def kosinski_compress(src, dst):
    lib_name = 'kens/Kosinski'
    lib_name += '_x64' if platform.architecture()[0] == '64bit' else '_x86'
    lib_name += '.dll'

    lib = cdll.LoadLibrary(lib_name)

    if lib is None:
        print 'Cannot load Kosinski compression lib'
        sys.exit(-1)

    if not os.path.exists(src):
        print 'Cannot open input file "%s"' % src
        sys.exit(-1)

    insize = lib.Comp(src, dst, False)

    if insize != 0:
        print 'Cannot pack "%s" file' % src
        sys.exit(-1)


def nemesis_compress(src, dst):
    lib_name = 'kens/Nemesis'
    lib_name += '_x64' if platform.architecture()[0] == '64bit' else '_x86'
    lib_name += '.dll'

    lib = cdll.LoadLibrary(lib_name)

    if lib is None:
        print 'Cannot load Nemesis compression lib'
        sys.exit(-1)

    if not os.path.exists(src):
        print 'Cannot open input file "%s"' % src
        sys.exit(-1)

    insize = lib.Comp(src, dst)

    if insize != 0:
        print 'Cannot pack "%s" file' % src
        sys.exit(-1)


def assemble_level_params(base_dir):
    os.chdir(LEVELS_DIR)

    run_process('%s %s %s' % (AS_BIN, AS_ARGS, LEVEL_PARAMS_SRC))

    pre, ext = os.path.splitext(LEVEL_PARAMS_SRC)
    run_process('%s %s' % (P2_BIN, pre))

    os.chdir(base_dir)
    kosinski_compress(pre + P2_BIN_DST_EXT, pre[:-4] + P2_BIN_DST_EXT)


def assemble_main_font(base_dir):
    os.chdir(base_dir)

    path = os.path.join(FONTS_DIR, NEM_MAIN_FONT_DEC)
    pre, ext = os.path.splitext(path)
    nemesis_compress(path, pre[:-4] + ext)


def assemble_enemies_tiles(base_dir):
    def list_enemies(enms_dir):
        ll = list()

        for dname in os.listdir(enms_dir):
            dname = os.path.join(enms_dir, dname)

            for fname in os.listdir(dname):
                if fname == NEM_ENEMY_TILES_DEC:
                    ll.append(os.path.join(dname, fname))
        return ll

    enlist = list_enemies(ENEMIES_DIR)

    os.chdir(base_dir)
    for efile in enlist:
        pre, ext = os.path.splitext(efile)
        nemesis_compress(efile, pre[:-4] + ext)


def assemble_level_names(base_dir):
    os.chdir(base_dir)

    run_process('level_names.py bin')


def assemble_main_src(base_dir):
    os.chdir(base_dir)

    run_process('%s %s %s' % (AS_BIN, AS_ARGS, MAIN_SRC))

    pre, ext = os.path.splitext(MAIN_SRC)
    run_process('%s %s' % (P2_BIN, pre))


if __name__ == '__main__':
    basedir = os.getcwd()
    assemble_level_params(basedir)
    assemble_enemies_tiles(basedir)
    assemble_main_font(basedir)
    assemble_level_names(basedir)
    assemble_main_src(basedir)
