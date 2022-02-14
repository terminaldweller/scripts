from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

config: ConfigAPI = config
c: ConfigContainer = c

config.load_autoconfig()

solarized = {
    "base03": "#002b36",
    "base02": "#073642",
    "base01": "#586e75",
    "base00": "#657b83",
    "base0": "#839496",
    "base1": "#93a1a1",
    "base2": "#eee8d5",
    "base3": "#fdf6e3",
    "yellow": "#b58900",
    "orange": "#cb4b16",
    "red": "#dc322f",
    "magenta": "#d33682",
    "violet": "#6c71c4",
    "blue": "#268bd2",
    "cyan": "#2aa198",
    "green": "#005f00",
}

c.colors.completion.category.bg = solarized["base03"]
c.colors.completion.category.border.bottom = solarized["base03"]
c.colors.completion.category.border.top = solarized["base03"]
c.colors.completion.category.fg = solarized["base3"]
c.colors.completion.even.bg = solarized["base02"]
c.colors.completion.fg = solarized["base3"]
c.colors.completion.item.selected.bg = solarized["violet"]
c.colors.completion.item.selected.border.bottom = solarized["violet"]
c.colors.completion.item.selected.border.top = solarized["violet"]
c.colors.completion.item.selected.fg = solarized["base3"]
c.colors.completion.match.fg = solarized["base2"]
c.colors.completion.odd.bg = solarized["base02"]
c.colors.completion.scrollbar.bg = solarized["base0"]
c.colors.completion.scrollbar.fg = solarized["base2"]
c.colors.downloads.bar.bg = solarized["base03"]
c.colors.downloads.error.bg = solarized["red"]
c.colors.downloads.error.fg = solarized["base3"]
c.colors.downloads.start.bg = "#0000aa"
c.colors.downloads.start.fg = solarized["base3"]
c.colors.downloads.stop.bg = "#00aa00"
c.colors.downloads.stop.fg = solarized["base3"]
c.colors.downloads.system.bg = "rgb"
c.colors.downloads.system.fg = "rgb"
c.colors.hints.bg = solarized["violet"]
c.colors.hints.fg = solarized["base3"]
c.colors.hints.match.fg = solarized["base2"]
c.colors.keyhint.bg = "rgba(0, 0, 0, 80%)"
c.colors.keyhint.fg = solarized["base3"]
c.colors.keyhint.suffix.fg = solarized["yellow"]
c.colors.messages.error.bg = solarized["red"]
c.colors.messages.error.border = solarized["red"]
c.colors.messages.error.fg = solarized["base3"]
c.colors.messages.info.bg = solarized["base03"]
c.colors.messages.info.border = solarized["base03"]
c.colors.messages.info.fg = solarized["base3"]
c.colors.messages.warning.bg = solarized["orange"]
c.colors.messages.warning.border = solarized["orange"]
c.colors.messages.warning.fg = solarized["base3"]
c.colors.prompts.bg = solarized["base02"]
c.colors.prompts.border = "1px solid " + solarized["base3"]
c.colors.prompts.fg = solarized["base3"]
c.colors.prompts.selected.bg = solarized["base01"]
c.colors.statusbar.caret.bg = solarized["blue"]
c.colors.statusbar.caret.fg = solarized["base3"]
c.colors.statusbar.caret.selection.bg = solarized["violet"]
c.colors.statusbar.caret.selection.fg = solarized["base3"]
c.colors.statusbar.command.bg = solarized["base03"]
c.colors.statusbar.command.fg = solarized["base3"]
c.colors.statusbar.command.private.bg = solarized["base01"]
c.colors.statusbar.command.private.fg = solarized["base3"]
c.colors.statusbar.insert.bg = solarized["green"]
c.colors.statusbar.insert.fg = solarized["base3"]
c.colors.statusbar.normal.bg = solarized["base03"]
c.colors.statusbar.normal.fg = solarized["base3"]
c.colors.statusbar.passthrough.bg = solarized["magenta"]
c.colors.statusbar.passthrough.fg = solarized["base3"]
c.colors.statusbar.private.bg = solarized["base01"]
c.colors.statusbar.private.fg = solarized["base3"]
c.colors.statusbar.progress.bg = solarized["base3"]
c.colors.statusbar.url.error.fg = solarized["red"]
c.colors.statusbar.url.fg = solarized["base3"]
c.colors.statusbar.url.hover.fg = solarized["base2"]
c.colors.statusbar.url.success.http.fg = solarized["base3"]
c.colors.statusbar.url.success.https.fg = solarized["base3"]
c.colors.statusbar.url.warn.fg = solarized["yellow"]
c.colors.tabs.bar.bg = "#000000"
c.colors.tabs.even.bg = solarized["base01"]
c.colors.tabs.even.fg = solarized["base2"]
c.colors.tabs.indicator.error = solarized["red"]
c.colors.tabs.indicator.start = solarized["violet"]
c.colors.tabs.indicator.stop = solarized["orange"]
c.colors.tabs.odd.bg = solarized["base01"]
c.colors.tabs.odd.fg = solarized["base2"]
c.colors.tabs.selected.even.bg = solarized["base03"]
c.colors.tabs.selected.even.fg = solarized["base3"]
c.colors.tabs.selected.odd.bg = solarized["base03"]
c.colors.tabs.selected.odd.fg = solarized["base3"]

c.auto_save.session = True
c.content.user_stylesheets = (
    "/home/devi/.config/qutebrowser/"
    "qutebrowser_dark_solarized/solarized-dark.css"
)
