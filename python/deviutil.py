#!/usr/bin/python3

import argparse
import code
import signal
import sys
import socket
from abc import ABCMeta, abstractmethod


class Colors:
    purple = '\033[95m'
    blue = '\033[94m'
    green = '\033[92m'
    yellow = '\033[93m'
    red = '\033[91m'
    grey = '\033[1;37m'
    darkgrey = '\033[1;30m'
    cyan = '\033[1;36m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def SigHandler_SIGINT(signum, frame):
    print()
    sys.exit(0)


class Argparser(object):
    def __init__(self):
        parser = argparse.ArgumentParser()
        parser.add_argument("--string", type=str, help="string")
        parser.add_argument("--bool", action="store_true",
                            help="bool", default=False)
        parser.add_argument("--dbg", action="store_true",
                            help="debug", default=False)
        self.args = parser.parse_args()


def ffs(offset, header_list, numbered, *args):
    cn = Colors.green
    ch = Colors.cyan
    cd = Colors.blue
    cb = Colors.BOLD
    ci = Colors.red
    ce = Colors.ENDC
    max_column_width = []
    lines = []
    numbers_f = []
    dummy = []

    if numbered:
        numbers_f.extend(range(1, len(args[-1])+1))
        max_column_width.append(
            max([len(repr(number)) for number in numbers_f]))
        header_list.insert(0, "idx")

    for arg in args:
        max_column_width.append(max([len(repr(argette)) for argette in arg]))

    index = range(0, len(header_list))
    for header, width, i in zip(header_list, max_column_width, index):
        max_column_width[i] = max(len(header), width) + offset

    for i in index:
        dummy.append(ch + cb + header_list[i].ljust(max_column_width[i]) + ce)
    lines.append("".join(dummy))
    dummy.clear()

    index2 = range(0, len(args[-1]))
    for i in index2:
        if numbered:
            dummy.append(ci+cb+repr(i).ljust(max_column_width[0])+ce)
            for arg, width in zip(args, max_column_width[1:]):
                dummy.append(cd+repr(arg[i]).ljust(width)+ce)
        else:
            for arg, width in zip(args, max_column_width):
                dummy.append(cd+repr(arg[i]).ljust(width)+ce)
        lines.append("".join(dummy))
        dummy.clear()
    return lines


class Demon_Father:
    __metalclass__ = ABCMeta

    def __init__(self, pidfile):
        self.pidfile = pidfile
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server_address = ('localhost', 10000)

    def daemonize(self):
        try:
            pid = os.fork()
            if pid > 0:
                sys.exit(0)
        except OSError as err:
            sys.stderr.write('fork #1 failed: {0}\n'.format(err))
            sys.exit(1)
        os.chdir('/')
        os.setsid()
        os.umask(0)
        try:
            pid = os.fork()
            if pid > 0:
                sys.exit(0)
        except OSError as err:
            sys.stderr.write('fork #2 failed: {0}\n'.format(err))
            sys.exit(1)
        sys.stdout.flush()
        sys.stderr.flush()
        si = open(os.devnull, 'r')
        so = open(os.devnull, 'a+')
        se = open(os.devnull, 'a+')
        os.dup2(si.fileno(), sys.stdin.fileno())
        os.dup2(so.fileno(), sys.stdout.fileno())
        os.dup2(se.fileno(), sys.stderr.fileno())
        atexit.register(self.delpid)
        pid = str(os.getpid())
        with open(self.pidfile, 'w+') as f:
            f.write(pid + '\n')

    def delpid(self):
        self.pidfile.close()
        os.remove(self.pidfile)

    def start(self):
        self.daemonize()
        try:
            with open(self.pidfile, 'r') as pf:
                pid = int(pf.read().strip())
        except IOError:
            pid = None
            '''
        if pid:
            message = "pidfile {0} already exist. " + "Daemon already running?\n"
            sys.stderr.write(message.format(self.pidfile))
            sys.exit(1)
            '''
        self.run()

    def stop(self):
        try:
            with open(self.pidfile, 'r') as pf:
                pid = int(pf.read().strip())
        except IOError:
            pid = None
        if not pid:
            message = "pidfile {0} does not exist. " + "Daemon not running?\n"
            sys.stderr.write(message.format(self.pidfile))
            return
        try:
            while 1:
                os.kill(pid, signal.SIGTERM)
                time.sleep(0.1)
        except OSError as err:
            e = str(err.args)
            if e.find("No such process") > 0:
                if os.path.exists(self.pidfile):
                    os.remove(self.pidfile)
            else:
                print(str(err.args))
                sys.exit(1)

    def restart(self):
        self.stop()
        self.start()

    @abstractmethod
    def run(self):
        pass


def hexdump(obj):
    count = int()
    strrep = []
    for byte in obj:
        if count % 16 == 0:
            for ch in strrep:
                if ord(ch) > 32 and ord(ch) < 127:
                    print(ch, end='')
                else:
                    pass
            print()
            strrep = []
            print(format(count, "06x"), ': ', end='')
            strrep.append(str(chr(byte)))
            print(format(byte, '02x') + ' ', end='')
        else:
            pass
            strrep += str(chr(byte))
            print(format(byte, '02x') + ' ', end='')
        count += 1
    for i in range(0, 16-count % 16):
        print("   ", end="")
    for ch in strrep:
        if ord(ch) > 32 and ord(ch) < 127:
            print(ch, end='')
        else:
            pass
    print()


# write code here
def premain(argparser):
    signal.signal(signal.SIGINT, SigHandler_SIGINT)
    # here
    a = [0x2f, 0x6c, 0x69, 0x62, 0x36, 0x34, 0x2f, 0x6c, 0x64, 0x2d, 0x6c,
         0x69, 0x6e, 0x75, 0x78, 0x2d, 0x78, 0x38, 0x36, 0x2d, 0x36, 0x34, 0x2e, 0x73, 0x6f, 0x2e, 0x32, 0x00]
    hexdump(a)


def main():
    argparser = Argparser()
    if argparser.args.dbg:
        try:
            premain(argparser)
        except:
            variables = globals().copy()
            variables.update(locals())
            shell = code.InteractiveConsole(variables)
            shell.interact(banner="DEBUG REPL")
    else:
        premain(argparser)


if __name__ == "__main__":
    main()
