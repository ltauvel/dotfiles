#!/bin/bash

function get_plateform() {
  if [ -f /proc/version ]; then
    if cat /proc/version  | grep -Piq 'debian|ubuntu'; then
      echo 'ubuntu'
    elif cat /proc/version  | grep -Piq 'centos|redhat'; then
      echo 'redhat'
    fi
  elif uname | grep -iq 'darwin'; then
    echo 'mac'
  fi
}

function  get_script_dir() {
     SOURCE="${BASH_SOURCE[0]}"
     # While $SOURCE is a symlink, resolve it
     while [ -h "$SOURCE" ]; do
          DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
          SOURCE="$( readlink "$SOURCE" )"
          # If $SOURCE was a relative symlink (so no "/" as prefix, need to resolve it relative to the symlink base directory
          [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
     done
     DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
     echo "$DIR"
}

function get_modules_setup {
  local result=()
  local plateform=$(get_plateform)

  # Getting all steup files containing priority
  local priorities=()
  while read -r out ; do
    priorities+=("$out")
  done <<< "$(egrep '#\s*PRIORITY\s*:\s*[0-9+]' $HOME/.dotfiles/*/install.sh)"

  # Ordering by priority
  for i in {0..100}; do
    for priority in "${priorities[@]}"; do
      if echo $priority | egrep -q "#\s*PRIORITY\s*:\s*$i\$"; then
        IFS=':' read -r -a priority_parts <<< "$priority"
        result+=("${priority_parts[0]}")
      fi
    done
    if [[ "${#priorities[@]}" == "${#result[@]}" ]]; then break; fi
  done

  # Completing list with all other modules
  while read -r out ; do
    out=${out/\/\///}
    if ! echo "${result[@]}" | egrep -q "$out"; then
      result+=("$out")
    fi
  done <<< "$(find $HOME/.dotfiles/*/ -name install.sh)"

  # Filtering result by plateform
  for file in "${result[@]}"; do
    if cat $file | egrep -q "#\s*PLATEFORM\s*:\s*($plateform\$|all|\$)"; then
      echo $file
    fi
  done
}

function pkg {
  local pkgmgr=''
  local plateform=$(get_plateform)

  # Determine the package manager
  if [ "$plateform" == "ubuntu" ]; then
    pkgmgr='apt-get'
  elif [ "$plateform" == "redhat" ]; then
    pkgmgr='yum'
  elif [ "$plateform" == "mac" ]; then
    pkgmgr='brew'
  fi

  # Launch the package manager command 
  if [ "$(id -u)" != "0" ] && [ "$plateform" != "mac" ]; then
    eval sudo $pkgmgr $@
  else
    eval $pkgmgr $@
  fi
}