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
f����(�!+ݷ����A�\�G&�>\0��^>�ۘG�wI�j��~R��%ܬ�Ξ_�����o�bS���S�WH4j�.��N?�,�W3ۗJ����,������l̲��m�h�>�d��M\ҩ�������v��G������H��#ʛCZͭz�п5��u�s[�1�ݰ�|w����(O(0s�n5��`Su�����x������UYHX�팴�*;h8�H����~ btǀ���d��A�W�V���ŭȠ�n��x�4��>6�e�K�����`!�.W,`g�Q��r��q�9����CI�qF�r�Ys�^�����D�Ōc��$3F���_T�y�4��LF1�e�(��ޏC�īɂI^ux��`��j����נ<�j�4�B`N�xp��"Ҏ����Y�j\,���&��`oŲ"x:��^�GsYI� �Ex����#oJ�}1���L�4�U�,�T��h��_������r�+վŢ��������:�YT	*]�ң�Xµ�:A�ui��wg�(�<&%���Lv�|�3C��ٰG��Yk����N��f�
��}�[�8˵ŕ ��0RW�Ѩ;P��e2ƽic4r���E~�>�����*�Z�?6��2+�$ n��7��f���9�u�\Dk�W���n�ۍ�?F<YɎ�&'c	�W!�[+|W�S�c�E�ޱ=)�g�1��n�ݵ ����@l;���h<���^�M�"+m�?���KC�Z������IN��{����U�x�N!ޡ�?�����=�L�������caw.��/7�^��-?�cR4�Y���#�Z�̒J7K������ג�H�@J��38����4�ҡ����/ϟp��
"`E����%V�vf�\�f�HKhj��|��2��ʭ�\�����ёD4�ũ�d�Y'�!pkm"���:cU$܃"���������>P��so�6~��'blEay=�A�Y�
�wg!���Q�L���S���e�|�4�@�Hh��:��V �P[��ǩ�
��u���Q>cq���G���.�(T��!ȿ�q��"?�ԿfZ�÷�� ��7�9��9��C��$�ͬ
ՏJ8���z����t��C����^Tr���Bx�z�s����~��
D��V�v��&���W� ����D�X���F�o@�7g��v�lC�OG\��Sq�ԙZuƝ��˾~C��+�uK��T���+��.�RX��k�}ӆ)�"�:��u����8P0�[�$��[������hI��u�*���p��҃��۟�%�5��Wڋv|��4�G���~�o�X��^-a3�@5[Ԁf#/���7�\	�����H�W�p��,Ei�T�$�w�n	c<#������~�Z�H��L�l��j����.
+�@3��sf.b~�*��v��	[v��QKk���خ˂>�2�s�#X��	����5I�d-R����A4�cV�8�a$��UzF����T#0�FM�Y4mY2tehB�2�(qG�4�(�U�/-��CRI��������R���^^o����[�����s0>|���eo�Y�/��o�����	�[Q��n�&�õ�Q��Uj����gP��\���J�ܫ��C��ɤ�
zop�6K�2?8��z)��:�:�m�D��1N���%�~�տ���Ǹr�X�י�+����yMI��9��5V/M\�B��|���Gt7��2����0�k%���ө}C>m��u���س��}� 9���.e�Rγ2� 	��Ai�L��5��?9��_`]	p�3�ћ��"�;�Ha��$X0���"�|^�� Y���P�) �H�����c�hY��9ˍh���	m%�M�R0�����������6j޹~�+�Oyh��Z1򩔑�U	��� 4 �z�����Ѧ�[�/L@�~��8��\��6sՔ�nNu�0/P���-?���qg��4Z�ɵRD��v�q5^s��.ZL�A�~q$�	v��@�8�p���l��;�9�c�����Jr�AZo�~-2�� �k�z��wyj��w��94�<[u���Ì��җw8��R�wJ�D����D� }pgh���vs��d�p-2�7T�� �z/�6	@M\>��]gQ	�i썚b���p\M�#NO���Ǯ�{Z�:���s��"u����Gv�S,�.�{�������^"�Cڟl�����F����Ǡ���BƄ�۹^���/w����z=�_k�>�-9o��M���LL+MA����Sa孑q �S��AY+����;wB	�ʄ��n�w�;�S�'��y�B;��:E�e2c&G28T>�^Z�e[�el����h���f��`�����]�g�`g�_Q'~��`(��ݛ�155Mb�2t𖦸K	�X�|�ֹ���W��xr�'�	y�	�#H�G��#W���MX�ָ�=�Gac��!z�{U��xq���������0#��Q��e� ����?Ǆ�;�e�;�E��#�� f�P����sR��H��p\&�m�$���P�c��Hٓ�|*&�Z�y ��H�B�#�'m]1��N���Vȫ����J���& `d���ș�p�����O	�4z޽R�\�.>t^�GM�H�L�\D0���V���r�v��� \�K=�d���}�ϡ #��.�x�\c~�	�QU>��5��Kh{�QFL%����:�l4!Y���p���wh؛E���7���<��k@����2��n\���[���ЙI�W �y=Z�굹�Y�R=؋f"o�gx��$o��`�z፴���9��]��*���Lmy��}�۲�v��8���y�cOi֖�+?��3��8�[p�6V&c %8�>2��X ��V��z[�����|0��V���h<w�Rg���]%�c����`����q�7Y�˩͒��I�Ĉ�1(vX���H��;����