#! /bin/bash
[[ -n ${DEBUG} ]] && set -x

#
# Takes the SQLite Databases in the Reddit-is-fun backup and dumps out a list
# subreddits and multireddits in plain text
#

usage() {
  echo "$0 rif_is_fun_settings_2023-06-03.zip"
  exit 1
}
[[ $# -lt 1 ]] && usage
zipfile=$1
[[ ! -r ${zipfile} ]] && echo "Can't read zip!" && exit 1

tempdir=$(mktemp -d)
unzip -q "${zipfile}" -d "${tempdir}"

echo 'SELECT name FROM reddits;' | sqlite3 "${tempdir}/reddits.db" > reddits.txt
echo 'SELECT name FROM multireddits;' | sqlite3 "${tempdir}/multireddits.db" > multireddits.txt

# finally
rm -rf "${tempdir}"
