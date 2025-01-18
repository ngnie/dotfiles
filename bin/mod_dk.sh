#/bin/sh

xmodmap -e 'remove mod5 = ISO_Level3_Shift'
xmodmap -e 'remove mod3 = ISO_Level5_Shift'
xmodmap -e 'add mod3 = ISO_Level3_Shift'

#xmodmap -e 'remove mod4 = Super_L'
#xmodmap -e 'add mod3 = Super_L'
