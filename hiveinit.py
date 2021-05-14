#!/usr/bin/python3

import argparse
import code
import readline
import signal
import sys
import imp
hived = imp.load_source("hived", "./hived")
from hived import Demon

def SigHandler_SIGINT(signum, frame):
    print()
    sys.exit(0)

class Argparser(object):
    def __init__(self):
        self.parser = argparse.ArgumentParser()
        self.parser.add_argument("--name", type=str, help="price of the chose crypto")
        self.parser.add_argument("--worth", type=str, help="single asset worth")
        self.parser.add_argument("--xx", type=str, nargs=2, help="convert")
        self.parser.add_argument("--xxv", type=float, help="xx multiplier")
        self.parser.add_argument("--gen", type=str, nargs=2, help="general option")
        self.parser.add_argument("--cap", type=str, help="market cap")
        self.parser.add_argument("--rank", type=str, help="market cap rank")
        self.parser.add_argument("--total", action="store_true", help="total", default=False)
        self.parser.add_argument("--ava", type=str, help="is currency available on changelly")
        self.parser.add_argument("--avass", type=str, help="is currency available on shapeshift")
        self.parser.add_argument("--cglistall", action="store_true", help="list all currencies available on changelly", default=False)
        self.parser.add_argument("--test", action="store_true", help="test switch", default=False)
        self.parser.add_argument("--watchlist", type=str, nargs="+", help="watch list")
        self.parser.add_argument("--ss", type=str, nargs="+", help="watchlist on shapeshift")
        self.parser.add_argument("--dy", type=int, help="lazy")
        self.parser.add_argument("--demon", action="store_true", help="daemon mode", default=False)
        self.parser.add_argument("--al1", action="store_true", help="alert1", default=False)
        self.parser.add_argument("--dbg", action="store_true", help="debug", default=False)
        self.parser.add_argument("--alive", action="store_true", help="is hived up", default=False)
        self.parser.add_argument("--tg", action="store_true", help="tg", default=False)

    def parse(self, argv):
        self.args, self.rest = self.parser.parse_known_args(argv)

def main():
    argparser = Argparser()
    sys.argv.pop(0)
    argparser.parse(sys.argv)
    if argparser.args.dbg:
        try:
            premain(argparser)
        except:
            variables = globals().copy()
            variables.update(locals())
            shell = code.InteractiveConsole(variables)
            shell.interact(banner="DEBUG REPL")
    else:
        demon = Demon()
        demon.run(argparser)

if __name__ == "__main__":
    main()
