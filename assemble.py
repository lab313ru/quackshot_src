import os
import subprocess

AS_BIN = os.path.join('bin', 'asw')
P2_BIN = os.path.join('bin', 'p2bin')
MAIN_SRC = 'qs.s'


def run_process(cmd):
    p = subprocess.Popen(cmd, bufsize=2048, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    p.wait()
    print p.stdout.read()


if __name__ == '__main__':
    run_process('%s -maxerrors 2 %s' % (AS_BIN, MAIN_SRC))

    pre, ext = os.path.splitext(MAIN_SRC)
    run_process('%s %s' % (P2_BIN, pre))
