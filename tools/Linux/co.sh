#!/bin/bash
# lzipsh: compressor for Unix executables.
# Use this only for binaries that you do not use frequently.
#
# The compressed version is a shell script which decompresses itself after
# skipping $skip lines of shell commands.  We try invoking the compressed
# executable with the original name (for programs looking at their name).
# We also try to retain the original file permissions on the compressed file.
# For safety reasons, lzipsh will not create setuid or setgid shell scripts.

# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5

# Copyright (C) 2022 Fajar Kim

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program. If not write to the Fajar Kim, see <https://www.gnu.org/licenses/>.
#

tab='	'
nl='
'
IFS=" $tab$nl"

set -e
PROG="${0##*/}"

# Make sure important variables exist if not already defined
#
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"

# Test directory '.config'
test -d "$HOME/.config" && test -w "$HOME/.config" && test -x "$HOME/.config" || {
  mkdir "$HOME/.config" >/dev/null 2>&1
}

# Settings for check upgrade
_lzipsh_upgrade_current_epoch() {
  local sec=${EPOCHSECONDS-}
  test $sec || printf -v sec '%(%s)T' -1 2>/dev/null || sec=$(command date +%s)
  echo $((sec / 60 / 60 / 24))
}

_lzipsh_upgrade_update_timestamp() {
  echo "LAST_EPOCH=$(_lzipsh_upgrade_current_epoch)" >| $HOME/.config/.lzipsh-update
}

_lzipsh_upgrade_check() {
  if test ! -f "$HOME/.config/.lzipsh-update"; then
    # create ~/.osh-update
    _lzipsh_upgrade_update_timestamp
    return 0
  fi

  local LAST_EPOCH
  . $HOME/.config/.lzipsh-update
  if test ! $LAST_EPOCH; then
    _lzipsh_upgrade_update_timestamp
    return 0
  fi

  # Default to the old behavior
  local epoch_expires=${UPDATE_LZIPSH_DAYS:-30}
  local epoch_elapsed=$(($(_lzipsh_upgrade_current_epoch) - LAST_EPOCH))
  if ((epoch_elapsed <= epoch_expires)); then
    return 0
  fi

  # update $HOME/.config/.lzipsh-update
  _lzipsh_upgrade_update_timestamp
  echo "${PROG}: the tool hasn't been updated for 30 days
For upgrade, you run \`lzipsh-upgrade' or run \`bash upgrade.sh'"
}

_lzipsh_upgrade_check

# Default command
help() {
  echo "Usage: ${PROG} [OPTIONS] FILE...
Replace each executable FILE with a compressed version of itself.
Make a backup FILE~ of the old version of FILE.

  -t, --type-shell   Change your type shell (sh, bash, zsh, ksh, or mksh).
  -f, --file         Compress each FILE instead it.

  -h, --help         display this help.
  -v, --version      output version information.

Example:
   ${PROG} -t bash -f FILE
or
   ${PROG} --type-shell bash --file FILE

If your compressed files, yor type for example:
   ${PROG} -t bash -f FILE1 FILE2 FILE3...
or
   ${PROG} --type-shell bash --file FILE1 FILE2 FILE3...

Report bugs <fajarrkim@gmail.com>"
}

version() {
  echo "LZip Shell Exec v1.0 <https://github.com/FajarKim/lzip-shell>
Copyright (C) 2022 Fajar Kim.
This is free software.  You may redistribute copies of it under the terms of
the GNU General Public License <https://www.gnu.org/licenses/agpl.html>.
There is NO WARRANTY, to the extent permitted by law.

Report bugs <fajarrkim@gmail.com>"
}

# Command settings
command_exists() {
        command -v "$@" >/dev/null 2>&1
}

# Checking package 'lzip'
command_exists lzip || {
  echo "${PROG}: the program \`lzip' is not installed
Please now installed first."
  exit 127
}

# The command parser
if test $# -eq 0; then
  echo "${PROG}: missing operand
Try \`${PROG} --help' for more information."
  exit 1
fi

case $1 in
-h | -v | -t | \
--help | --version | --type-shell) ;;
-f | --file) echo "${PROG}: invalid first option \`$1'"; echo "Try \`$PROG --help' for more information."; exit 1;;
*) echo "${PROG}: invalid option \`$1'"; exit 1;;
esac

while :; do
  case $@ in
  -h | --help) help || exit 1; exit;;
  -v | --version) version || exit 1; exit;;
  -t | --type-shell) shift;;
  -f | --file) shift;;
  *) shift; break;;
  esac
done

# Checking type shell
case $1 in
sh | bash | zsh | ksh | mksh) command_exists $1 || { echo "${PROG}: the type shell \`$1' is not installed"; echo "Please now installed first."; exit 127; }; TYPE_SHELL=$1; shift;;
-f | --file) echo "${PROG}: input your type shell"; exit 1;;
-*) echo "${PROG}: invalid option \`$1'"; exit 1;;
*) echo "${PROG}: \`$1' maybe not a shell type"; echo "Cannot supported."; exit 1;;
esac

# Checking file input
case $1 in
-f | --file) shift;;
*) echo "${PROG}: invalid option \`$1'"; exit 1;;
esac

if test $# -eq 0; then
  echo "${PROG}: missing operand
Try \`${PROG} --help' for more information."
  exit 1
fi

# Compression
tmp=
trap 'res=$?
  test -n "$tmp" && rm -f "$tmp"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

mktemp_status=

for i do
  case $i in
  -*) file=./$i;;
  *)  file=$i;;
  esac
  if test ! -f "$file" || test ! -r "$file"; then
    res=1
    echo "${PROG}: $i is not a readable regular file"
    continue
  fi
#  case `LC_ALL=C sed -n -e 1d -e '/^skip=[0-9][0-9]*$/p' -e 2q "$file"` in
#  skip=[0-9] | skip=[0-9][0-9] | skip=[0-9][0-9][0-9])
#    res=1
#    echo "${PROG}: $i is already compressed"
#    continue;;
#  esac
  if test -u "$file"; then
    res=1
    echo "${PROG}: $i has setuid permission, unchanged"
    continue
  fi
  if test -g "$file"; then
    res=1
    echo "${PROG}: $i has setgid permission, unchanged"
    continue
  fi
  case /$file in
  */basename | */bash | */cat | */chmod | */cp | \
  */dirname | */expr | */gzip | */bzip2 | */lzip | */tar | \
  */lzma | */zstd | */xz | */plzip | */compress | */prezip | \
  */ln | */mkdir | */mktemp | */mv | */printf | */rm | \
  */sed | */sh | */sleep | */test | */tail)
    res=1
    echo "${PROG}: $i might depend on itself"; continue;;
  esac

  dir=`dirname "$file"` || dir=$TMPDIR
  case $TMPDIR in
  */tmp) ;;
  *:* | *) TMPDIR=$HOME/.cache; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  esac
  test -d "$dir" && test -w "$dir" && test -x "$dir" || dir=$TMPDIR
  test -n "$tmp" && rm -f "$tmp"
  if test -z "$mktemp_status"; then
    type mktemp >/dev/null 2>&1
    mktemp_status=$?
  fi
  case $dir in
    */) ;;
    *) dir=$dir/;;
  esac
  if test $mktemp_status -eq 0; then
    tmp=`mktemp "${dir}lzipshXXXXXXXXX"`
  else
    tmp=${dir}lzipsh$$
  fi && { cp -p "$file" "$tmp" 2>/dev/null || cp "$file" "$tmp"; } || {
    res=1
    echo "${PROG}: cannot copy $file"
    continue
  }
  if test -w "$tmp"; then
    writable=1
  else
    writable=0
    chmod u+w "$tmp" || {
      res=$?
      echo "${PROG}: cannot chmod $tmp"
      continue
    }
  fi
  case $HOME in
  #*/com.termux/* | */bin.mt.plus/*) PATHDIR=`command -v $TYPE_SHELL`; SKIP_NO=50; SET="set -e\n\n";;
  *) PATHDIR=/bin/$TYPE_SHELL; SKIP_NO=50; SET="set -e\n\n";;
  esac
  (echo '#!'"${PATHDIR}"
  echo "skip=${SKIP_NO}"
  printf "${SET}"
  cat <<'EOF' &&
tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

lziptmpdir=
trap 'res=$?
  test -n "$lziptmpdir" && rm -fr "$lziptmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  lziptmpdir=`mktemp -d "${TMPDIR}lziptmpXXXXXXXXX"`
else
  lziptmpdir=${TMPDIR}lziptmp$$; mkdir $lziptmpdir
fi || { (exit 127); exit 127; }

lziptmp=$lziptmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lziptmp" && rm -r "$lziptmp";;
*/*) lziptmp=$lziptmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzip -cd > "$lziptmp"; then
  umask $umask
  chmod 700 "$lziptmp"
  (sleep 5; rm -fr "$lziptmpdir") 2>/dev/null &
  "$lziptmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs <fajarrkim@gmail.com>"
  (exit 127); res=127
fi; exit $res
EOF
  lzip -cv9 "$file") > "$tmp" || {
    res=$?
    echo "${PROG}: compression not possible for $i, file unchanged."
    continue
  }
  test $writable -eq 1 || chmod u-w "$tmp" || {
    res=$?
    echo "${PROG}: $tmp: cannot chmod"
    continue
  }
  cp -p "$file" "$file~" || {
    res=$?
    echo "${PROG}: cannot backup $i as $i~"
    continue
  }
  mv -f "$tmp" "$file" || {
    res=$?
    echo "${PROG}: cannot rename $tmp to $i"
    continue
  }
  tmp=
done
(exit $res); exit $res
