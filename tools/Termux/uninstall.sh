#!/data/data/com.termux/files/usr/bin/bash
# Copyright (C) 2022 Fajar Kim
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
# along with this program. If not write to the Fajar Kim, see <https://www.gnu.org/licenses/>.
skip=75
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
�!=�N�T/ԡ�Zi��f��~ϗY��@�Զ�)�Z2<���%c*�/���Jn��_5�=��RY�֔�u4X=pi�݈����0\+�LY��|����`ז
�)پ���|��g�Q<�Z�F�Y;7�_K P��GY��9bS���H����Z�w���d��C�3p#@,��9�U]��q7�W�ޓe�r!��6(�ƀ�y2��-g�QL��HY?�m7V���a�^!J�b���2s����TM~}uBrM�z�T�؂�bY�s�Ƅmq���]�����q�U%3�6��M s$���Ы��n���7G¹�"�x���]�T��,��zM?�t��4+d���3���)ab�����jM�M �\�N5�%����N�&�)dN}����	~��P�E��|G1+�#?�JΤ��M���:^`��)�F|����-jP�QS67�#��r�r&��!�H��Wl�m���#����L
��|�t8� -��ת��p�{��Dؔ�EB��GF�~Dg�=\iw �|�ETSy"'���=Yp�o����ć
�ūD0���yK�
�G�m�l>Ox���u�h��r\�t��ޓ)4����.�d�/�����5��H�
�+�<�7���n��/�l�@v%�j��>���Q5ǭ���S�;�Dg;�Z��m'g-���=����}���u�o���%be� cp{�R�t�~'v'>g�V�Fqz��i���n*D�_�R:B�蘒%��k[��c䂢�"&(�m�m��ld�cĨcqo����LjMa�c��N��ђ`j)�i����Z.����҇-A<C��"><!�/w�:���ݺ
���+����]�^=D����J�T'��e^@c^�&5�h�7!���.��E�02�vӻ���TMGX�+�EJ�2��z��xCq�M���w�^?�� ��DD���@�_�q0cYB3*R�%'�Ξvm���,�2�`[<��5U�t�7�X���E�}iG��bG&gv�k#�;���:���Y��o���@���}�0S�>�;�/H�%��A)U��狦��Z�ү�v��`�*r�B�V��Q@�n�?�κJk�qvf	�G�Ω�[����A �\��&PB+KS���.2p��B�P('��8ɮf��,Ub��j���G�{ �kW7D뻸�Rw���\{v���hy����8W�E]^"�J����A̭P�ݏ�~�Ϊ���K��v�gr˯�
Sf�ִ���	b{M|�We���"]%��*��&�'Ե���W�1��x`_�B74I��j(v���QA[&�F�7s���~#�)�p̚i tp׻��Bn%%lgiw��Y��V'daJ�ރ�O�6�<=*Cj��.1�jQ����l���[�L}=�,CH�,�59��`�;I�+��6�&F�x��1(�v���r�-��FoyP�D�L;��72��±n_v�"���WS�W��m�e���@}�g0�q[]=\�;RS����r��Bv�O[��3�&��Q#{�8�[]��"r��N8%�� ��hx<2޽kL~ti+H ��ax}�N]��<��R�W��-ybYQ���DiQ����mR2!3�`��q������a�#���0��f��(�������Im�Ұ��N����`yx����c6V<Uz�t�B�6C���r= ��!�����O�sQ��oJpH@�^�d0�8�>t����Ie���Q�+67���6.�h<i������3K�2�&�S�K�u�y��[�!�`�(}�sTL.�ShFC�����κ3����#Z�X��Aa\�j��-�\�R�Ά5��"	A�Ŧ}k�B�\��C�Au�/at�?���]��Y�-�p����_�����ױ���FX���溹�D���M�NfX1�\�@t������<�=d�_��1�-��tƵ��/��W`|�l\"���ն��$ۨn*�C�
%����*]IK_�<�6�pP�_��N_11��;��v���Ӑ�c����A��b�Fw�� �2�9��Wf���5��[��iۿ�y�waq6����P��<�����O������SqH�{K��\5ˤ,ͧ�HV�dn�6R�4����>��Q�I�z�(��h,�%�F�R<7A�B��TCJZ�
�*�'-2���'	[���0!��Z:��&��j�i��d��b)�*/��\���H�\ӓm.O"��Y��l�4F�7�u ,�����x��OJV���k�/�Ay��#�tV�u~�z�100�wv���3^�f���eJ 