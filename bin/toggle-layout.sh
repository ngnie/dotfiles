#/bin/sh

keyboard_layout=$(setxkbmap -query | grep layout | sed -e 's/ \{1,\}/ /g' | cut -d ' ' -f 2)

if [ $keyboard_layout = "us" ]; then
  setxkbmap dk
  #$DOTFILES_HOME/bin/mod_dk.sh
else
  setxkbmap us
  #$DOTFILES_HOME/bin/mod_us.sh
fi

