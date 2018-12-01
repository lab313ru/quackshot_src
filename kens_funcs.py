import os
import platform
import sys
from ctypes import cdll


def main(mode, path):
    pre, ext = os.path.splitext(path)
    new_path = pre + ('_dec' if mode[0] == 'd' else '_enc') + ext

    lib_name = None
    if mode[1] == 'e':
        lib_name = 'Enigma'
    elif mode[1] == 'n':
        lib_name = 'Nemesis'
    elif mode[1] == 'k':
        lib_name = 'Kosinski'

    if lib_name is not None:
        lib_name = 'kens/' + lib_name
        lib_name += '_x64' if platform.architecture()[0] == '64bit' else '_x86'
        lib_name += '.dll'
        print lib_name
    else:
        sys.exit(-1)

    lib = cdll.LoadLibrary(lib_name)

    if lib is None:
        sys.exit(-1)

    if not os.path.exists(path):
        print 'Cannot open input file'
        sys.exit(-1)

    insize = 0
    if mode[1] == 'e':
        # long (__cdecl *Comp)(char *SrcFile, char *DstFile, bool Padding);
        # long (__cdecl *Decomp)(char *SrcFile, char *DstFile, long Pointer, bool Padding);

        if mode[0] == 'c':
            insize = lib.Comp(path, new_path, False)
        else:
            insize = lib.Decomp(path, new_path, 0, False)
    elif mode[1] == 'n':
        # long (__cdecl *Comp)(char *SrcFile, char *DstFile);
        # long (__cdecl *Decomp)(char *SrcFile, char *DstFile, long Pointer);

        if mode[0] == 'c':
            insize = lib.Comp(path, new_path)
        else:
            insize = lib.Decomp(path, new_path, 0)
    elif mode[1] == 'k':
        # long (__cdecl *Comp)(char *SrcFile, char *DstFile, bool Moduled);
        # long (__cdecl *Decomp)(char *SrcFile, char *DstFile, long Pointer, bool Moduled);

        if mode[0] == 'c':
            insize = lib.Comp(path, new_path, False)
        else:
            insize = lib.Decomp(path, new_path, 0, False)

    if mode[0] == 'd':
        if insize > 0:
            print 'File "%s" successfully unpacked to "%s" => (src: %d bytes)' % (path, new_path, insize)

            diff_size = abs(insize - os.path.getsize(path))
            if diff_size != 0:
                print 'There are %d useless bytes at the end of file!' % diff_size
        else:
            print 'Cannot unpack "%s" file' % path
    else:
        if insize == 0:
            print 'File "%s" successfully packed to "%s"' % (path, new_path)
        else:
            print 'Cannot pack "%s" file' % path


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
