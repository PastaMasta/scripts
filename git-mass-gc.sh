#! /bin/bash

function usage {
  echo "$0 DIR [ DIR .. ]"
  exit 0
}

[[ $# -lt 1 ]] && usage

for dir in $* ; do
  for git in $(find $dir -name .git) ; do
    cd $(dirname ${git})
    git gc
    echo ""
    cd -
  done
done
