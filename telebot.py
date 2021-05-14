#!/usr/bin/python3

import argparse
import code
import readline
import signal
import sys
from telegram.ext import Updater, CommandHandler
import logging
import imp
import json
sys.path.insert(0, "./python")
from deviutil import Demon_Father
hived = imp.load_source("hived", "./hived")
from hived import networth, highpercentdump_bot
sys.path.insert(0, "/home/rooot/devi/kaminokumo")
kaminokumo = imp.load_source("kaminokumo", "/home/rooot/devi/kaminokumo")
from kaminokumo import mrg import json
import threading
from io import TextIOWrapper, BytesIO

telekey_json = "./telekey.json"
json_key = json.load(open(telekey_json))
API_TOKEN = json_key['telekey']

class Mg_thread(threading.Thread):
    def __init__(self, bot, update):
        self.bot = bot
        self.update = update

    def run(self):
        url = json.load(open("/home/bloodstalker/extra/kaminokumo/data.json"))
        res = mrg(url["1"])
        text_str = str()
        if res: text_str = "marge is up"
        else: text_str = "no marge"
        res = mrg(url["2"])
        text_str = str()
        if res: text_str = "obk is up"
        else: text_str = "no obk"
        self.bot.send_message(chat_id=self.update.message.chat_id, text=text_str)

def start(bot, update):
    bot.send_message(chat_id=update.message.chat_id, text="Hey... nice to make your acquaintance.")

def net(bot, update):
    total = networth()
    bot.send_message(chat_id=update.message.chat_id, text=total)

def high(bot, update):
    total = highpercentdump_bot()
    total_str = "".join(total)
    bot.send_message(chat_id=update.message.chat_id, text=total_str)

def mg(bot, update):
    url = json.load(open("/home/bloodstalker/extra/kaminokumo/data.json"))
    res = mrg(url["1"])
    text_str = str()
    if res: text_str += "marge is up"
    else: text_str += "no marge\t"
    res = mrg(url["2"])
    if res: text_str += "obk is up"
    else: text_str += "no obk\t"
    bot.send_message(chat_id=update.message.chat_id, text=text_str)

def generic(bot, update, args):
    import mushi
    print(repr(args))
    old_stdout = sys.stdout
    sys.stdout = TextIOWrapper(BytesIO(), sys.stdout.encoding)
    mushi.main(args)
    sys.stdout.seek(0)
    out = sys.stdout.read()
    print(repr(out))
    bot.send_message(chat_id=update.message.chat_id, text=out)
    sys.stdout.close()
    sys.stdout = old_stdout

class Argparser(object):
    def __init__(self):
        parser = argparse.ArgumentParser()
        parser.add_argument("--string", type=str, help="string")
        parser.add_argument("--bool", action="store_true", help="bool", default=False)
        parser.add_argument("--dbg", action="store_true", help="debug", default=False)
        self.args = parser.parse_args()

class Demon(Demon_Father):
    def run(self):
        updater = Updater(token=API_TOKEN)
        bot = updater.bot
        dispatcher = updater.dispatcher
        logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', level=logging.INFO)
        start_handler = CommandHandler("start", start)
        net_handler = CommandHandler("net", net)
        high_handler = CommandHandler("high", high)
        mg_handler = CommandHandler("mg", mg)
        generic_handler = CommandHandler("cc", generic, pass_args=True)
        dispatcher.add_handler(start_handler)
        dispatcher.add_handler(net_handler)
        dispatcher.add_handler(high_handler)
        dispatcher.add_handler(mg_handler)
        dispatcher.add_handler(generic_handler)
        updater.start_polling()

# write code here
def premain(argparser):
    #here
    pidfile = open("/tmp/telebot_temp", "w")
    demon = Demon(pidfile)
    demon.run()

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
