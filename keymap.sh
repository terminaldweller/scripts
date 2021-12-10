#!/usr/bin/sh

#xcape -e 'Caps_Lock=Escape'
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape' -t 100
xcape -e 'Shift_L=Shift_L|bracketleft'
xcape -e 'Shift_R=Shift_R|bracketright'
xcape -e 'Alt_L=parenleft'
xcape -e 'Alt_R=parenright'
xcape -e 'Control_L=bracketleft'
xcape -e 'Control_R=bracketright'
