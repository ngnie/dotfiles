create_link() {
  if [ -L $1 ]; then
    echo "Link already exist: $1"
  else
    if [ -f $1 ]; then
      echo "File already exist. Check it: $1"
    else
      ln -s $2 $1
      if [ -L $1 ]; then
        echo "Link created: $1"
      else
        echo "Link was not created. Check it: $1"
      fi
    fi
  fi
}

diff_dotfile() {
  if [ -L $1 ]; then
    echo "Link already exist: $1"
  else
    if [ -f $1 ]; then
      diff $1 $2 > /dev/null 2>&1
      error=$?
      if [ $error -eq 0 ]; then
        echo "File is equal: $1"
      elif [ $error -eq 1 ]; then
        echo "File has difference: $1"
        diff $1 $2
      else
        echo "Diff call failed: $1"
      fi
    else
      echo "File does not exist: $1"
    fi
  fi
}
