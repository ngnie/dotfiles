create_file_link() {
  if [ -L $2 ]; then
    echo "File link already exist: $2"
  else
    if [ -f $2 ]; then
      echo "File already exist. Check it: $2"
    else
      ln -s $1 $2
      if [ -L $2 ]; then
        echo "File link created: $2"
      else
        echo "File link was not created. Check it: $2"
      fi
    fi
  fi
}

create_folder_link() {
  if [ -L $2 ]; then
    echo "Folder link already exist: $2"
  else
    if [ -d $2 ]; then
      echo "Folder already exist. Check it: $2"
    else
      ln -s $1 $2
      if [ -L $2 ]; then
        echo "Folder link created: $2"
      else
        echo "Folder link was not created. Check it: $2"
      fi
    fi
  fi
}

diff_dotfile() {
  if [ -L $2 ]; then
    echo "File link already exist: $2"
  else
    if [ -f $2 ]; then
      diff $1 $2 > /dev/null 2>&1
      error=$?
      if [ $error -eq 0 ]; then
        echo "File is equal: $2"
      elif [ $error -eq 1 ]; then
        echo "File has difference: $2"
        diff $1 $2
      else
        echo "Diff call failed: $2"
      fi
    else
      echo "File does not exist: $2"
    fi
  fi
}

diff_folder() {
  if [ -L $2 ]; then
    echo "Folder link already exist: $2"
  else
    if [ -d $2 ]; then
      diff -r $1 $2 > /dev/null 2>&1
      error=$?
      if [ $error -eq 0 ]; then
        echo "Folder is equal: $2"
      elif [ $error -eq 1 ]; then
        echo "Folder has difference: $2"
        diff -r $1 $2
      else
        echo "Diff call failed: $2"
      fi
    else
      echo "Folder does not exist: $2"
    fi
  fi
}

