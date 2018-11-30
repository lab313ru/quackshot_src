import os
import sys
from ctypes import cdll


def main(path):
    enigma = cdll.LoadLibrary('Enigma.dll')

    pre, ext = os.path.splitext(path)
    enigma.Decomp(path, pre + '_dec' + ext, 0, False)


if __name__ == '__main__':
    main(sys.argv[1])
