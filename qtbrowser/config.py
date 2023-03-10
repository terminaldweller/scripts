# pylint: disable=C0111
import qutebrowser
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401

config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig()

c.url.start_pages = ["about:blank"]
c.url.default_page = "about:blank"
c.content.javascript.enabled = False
c.auto_save.session = True
config.source("qutebrowser-themes/themes/themes/onedark.py")
config.set("colors.webpage.darkmode.enabled", True)
c.window.hide_decoration = True

c.content.webgl = False
c.content.autoplay = False
c.content.geolocation = False
c.content.blocking.enabled = True
c.content.blocking.method = "adblock"
c.content.notifications.enabled = False
c.content.tls.certificate_errors = "ask-block-thirdparty"

c.statusbar.widgets = ["keypress", "url", "scroll", "history", "tabs", "progress"]

c.url.searchengines["DEFAULT"] = "https://searx.terminaldweller.com/search?q={}"
c.url.searchengines["arch"] = "https://wiki.archlinux.org/?search={}"
c.url.searchengines["wiki"] = "https://en.wikipedia.org/w/index.php?search={}"


config.bind("<Ctrl-k>", "tab-next", mode="normal")
config.bind("<Ctrl-j>", "tab-prev", mode="normal")
config.bind("<Ctrl-Shift-k>", "tab-move +", mode="normal")
config.bind("<Ctrl-Shift-j>", "tab-move -", mode="normal")

import subprocess


def read_xresources(prefix):
    props = {}
    x = subprocess.run(["xrdb", "-query"], capture_output=True, check=True, text=True)
    lines = x.stdout.split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props


xresources = read_xresources("*")
# c.colors.statusbar.normal.bg = xresources["*.background"]
c.content.default_encoding = "utf-8"
