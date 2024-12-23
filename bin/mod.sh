#/bin/sh

#xmodmap -e "clear Mod1"
#xmodmap -e "add Mod1 = Alt_L"
#xmodmap -e "clear Mod3"
#xmodmap -e "add Mod3 = Alt_R"

xmodmap -e 'remove Mod1 = Alt_R'
xmodmap -e 'add Mod3 = Alt_R'
