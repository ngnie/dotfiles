reddit() {
  local titleTabPermalink
  local refUrl
  titleTabPermalink=$(curl -s -A 'Reddit CLI' "https://www.reddit.com/r/$1/new.json?limit=10" | jq -r '.data.children | .[] | "\(.data.title)\t\(.data.permalink)"')
  refUrl=$(echo "$titleTabPermalink" | fzf --delimiter='\t' --with-nth=1 | cut -f2)

  if [[ -n $refUrl ]]
  then
    xdg-open "https://www.reddit.com$refUrl"
  fi
}
