#/bin/sh

list=$(jq -r '.[] | "\(.name)\t\(.command)"' command.json)
#echo "$list"
#echo "$list" | fzf --delimiter '\t' --with-nth=1 | cut -f2
#eval $(echo "$list" | fzf --delimiter '\t' --with-nth=1 | cut -f2)
zsh -c "$(echo "$list" | fzf --delimiter '\t' --with-nth=1 | cut -f2) &" 
