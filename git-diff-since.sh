#!/bin/sh
if [ $# -eq 0 ] || [ "$1" = "--help" ]; then
  cat <<EOF
Usage: $0 DATE FILE...
git diff on FILE... since the specified DATE on the current branch.
EOF
  exit
fi

branch1=$(git rev-parse --abbrev-ref HEAD)
revision1=$(git rev-list -1 --before="$1" "$branch1")
shift

revision2=HEAD

git diff "$revision1" "$revision2" -- "$@"
