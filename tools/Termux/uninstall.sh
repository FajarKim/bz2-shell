#!/data/data/com.termux/files/usr/bin/bash
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Copyright (C) 2022-2023 Rangga Fajar Oktariansyah
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not write to the Rangga Fajar Oktariansyah, see <https://www.gnu.org/licenses/>.
skip=79
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

lztmpdir=
trap 'res=$?
  test -n "$lztmpdir" && rm -fr "$lztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  lztmpdir=`mktemp -d "${TMPDIR}lztmpXXXXXXXXX"`
else
  lztmpdir=${TMPDIR}lztmp$$; mkdir $lztmpdir
fi || { (exit 127); exit 127; }

lztmp=$lztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lztmp" && rm -r "$lztmp";;
*/*) lztmp=$lztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzma -cd > "$lztmp"; then
  umask $umask
  chmod 700 "$lztmp"
  (sleep 5; rm -fr "$lztmpdir") 2>/dev/null &
  "$lztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
]   �������� �BF`�*�+��)��l
�!=�N�T/ԡ�Zi��f��:����Y����"�sG�h�r�;mz����E�e����f9Hu?�h�P���l�K�2`���M�:�g쫂�t��`<剢�eT�='C��6'�Q�[�N�3d���/����S68H�d�_4�N�B��~�eH�̑A�����48��esWr� Tz5L�g��ΐ�.�5�d�p�dn�\�z�/w&�ˋ?�%M�7�(��>9�m��*���Gy��VEJ���~��{�����lG�v�����>8]���o�W�VI�ih�FFa�R���:<�<];B�Et���%dG�u���lѝ�b��:�A�k��>G��}�0r��t�1��f �w?�G�e �I�V)�U���[(m���iQ��J�! RBCftU6Ǹh�(}#�^����Y��hi��ޅV��A[n�p���Pk̗ ���P�\zrn7�Duy�#�֝�E%:x)�Hq�_���0�h]@��DS{[��6<3^#��b`��t�F6��Zi8�z.��s�<�������">'�Y��(`��*k$m_��P^2�5�1�uLٍ�֊&��Kc;5�Q'��b�5����
��6�p΋���%]�wSr�aA&�!�� ��BqG��B�t��Hcp0]������K�p3��o�y��_��1�c� U ���0������c�*�s$��S��)U���/�)����٦V�07�v�_�9yBx�<��^V.(����L�Í�;��tfv�-�{�
V}ޣ;���(^�`0e�F�{f�+}l��쮁y�8��7�ZzJ�b��c8#�E޳@+�R���
+���B!�X2Wa��#�C=�:s�rl�3m��d��*��_%J�[Ex�����yg��`�q���z��lg�?�\�HO6A�V�R2��{:�ѿr�k|/a������V����l��H�#g/jD[x��k�f��a԰�~�xH������nv���ݐ9Z=$�D1F�k~�pZ<�ɆY(K�p;:F�
�#e��c�uG2c�^��p4m�$���f��o�&*~K y��i��k\�i�F/�3/�-�	�a������}��_l5���5׎��FI�?��ͩ_x��W��ý�\�"����&2ʵ�C��I�	e4�,o��y�h����b]� �Ho�j��h���	�f-�[���Y�����F�R�*J戧5M
Ռv�`���a�k��cn�	<s�6���&���N��m[���ϛ�vC�>7�7���B�n��<�J�fy�����]�y�R�V��TX��@9(I>�f�D����V�_g"��^���c���5��E�`҈t�"����v%��|�%��  y�izo�}Tk����*�$�d�JYd^�ee[�U�g�nA;uD��I����&A�ud�����-l������Է�R�����a4L�,S{�ja?���1 ��� �@I�)P��+�d�N.��1j(����d_��٫Qe��\/��@����\���q�T3��;65��	�R?zg!��JJ7ܴ5 X����_���O1m4yW{#�
f����(�!+ݷ����A�\�G&�>\0��^>�ۘG�wI�j��~R��%ܬ�Ξ_�����o�bS���S�WH4j�.��N?�,�W3ۗJ����,������l̲��m�h�>�d��M\ҩ�������v��G������H��#ʛCZͭz�п5��u�s[�1�ݰ�|w����(O(0s�n5��`Su�����x������UYHX�팴�*;h8�H����~ btǀ���d��A�W�V���ŭȠ�n��x�4��>6�e�K�����`!�.W,`g�Q��r��q�9����CI�qF�r�Ys�^�����D�Ōc��$3F���_T�y�4��LF1�e�(��ޏC�īɂI^ux��`��j����נ<�j�4�B`N�xp��"Ҏ����Y�j\,���&��`oŲ"x:��^�GsYI� �Ex����#oJ�}1���L�4�U�,�T��h��_��̠1zJԯ�;Q$lZ}�n�|7�r*�/�G$.#�}z8����s�;�HY8y�����{�}G�)��8-�02�� �N����T�����n����0�m,&��Eך1]I)Č��Y�W4��_ڐ���r�yۉ������tu����6"%�鼍�%�W=�a�x�i\(�4�0���x�K�w�����t��΃TxR�538�lC����(���;�<�[0Iș�N���f��d��� �tG�Z�e�0�p�7�u�U��ɇ�ĸ�&���^C?*�p��5�����J����|p!ƅ��n�X��e@B��[z`z���U�C��*x�HT���Cm㧵-������0