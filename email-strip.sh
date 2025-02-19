#! /bin/bash
[[ -n ${DEBUG} ]] && set -x

#
# Strips out just the email from a file of:
# name <name@example.com>
# So they can be added block lists easier
#

usage() {
  echo "$0 file [ file ... ]"
  exit 1
}
[[ $# -lt 1 ]] && usage

for file in $* ; do
  awk -F '[<>]' '{print $2}' ${file}
done
