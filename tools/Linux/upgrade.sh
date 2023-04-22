#!/bin/bash
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
]   �������� �BF=�j�g�z�ᑃ�s(��Z����9un�T	S�29�M~1����v�Dd�+����j�X�H"Yu
��!5���D�rɝ^��<ի�G
�c&j���p;�><8ݶc�qԊՐinc�eQ�7 �/�-]��J�pTz0�S�?���>bKYc��I�'u��y��\�!1���ٝ@��-ĥ����L����OR��G�D�-I��D��:1�������9BU=/�C�0ͭ/��vA����D��2�W�b� 	���~S?���*NpDz���d�t<q'�],��z"�~�z�g�����<*��y[�k�B�,�d���V��[�?��P�	~3��,8�������xJ�
��P3�b2l�ٚ�_+�Y�>�$I�=hc��7	�lm�9%EA+�nKDDY��퇒x Es�B�W����U��P��~��y��_8�X��p �}	��2%�V%�2-I�������;�wJb̹�"~����XFT��T�]5z���5���������IM9	Eh��r���םw;2@����MW���V�_���RV�X2U���.��Wm5��͠]N���U(����w���(b��ܥ)�RJ�1j"|}�g3���G�r�d�Vñ0Ng<c����a7��T/�˵����_8b�H���Cb���4��~�z�PJ\+�U;�ϝ�������Ć�/�]�+�(�"�ixNK۞��?O8k���Q/�Y�!��SP�Z$��5����&�l��_�����giI(��M�K��n��C�X==�`(k
�.��{�}���p�����է��r���E&���=5N��{�XT��[��g�G��G1��ܧӮX/�f
�
�!����v1cD,�5W��J�n��{F.w� �PM��ң�W3DaUXg�T��TrEE�Qé�L4j!�Q���s]нe��f[�E�[�R<Gć�NE�,��sR!�����p|V�;�ñ�M�ۛz�µCoRv�z�$5t�fQw N2V���c����cY���)Ԗ**�5 �a\���N3s���Yᘴ��p���K���]2 ђ�\������rz6|N'�89ށB&x�����Rl���e�%$���1P��q�H$6$ѵWgd�f���yÛeM�NO���5���U�E{b���� Ao�Ây����@�[F*=��uc�΄�-T���	 ��R��PZfi��C��y�δ�*Za"+�Fg�LP�ڠ�زe��{T� �f���CcW��<e��� a�}�aX(37��ޅ��e�K�z@���2��.Z��if�)��zR^@��6���K;���6�X����Z��ѕj��C:t'��d�ys�mT$�G?�*L���G(1!�pZìeޑgX���Nx��n�6���jC��d���W�w�Ag,���mL��-'c&��?�|�h��ߗ�Χ|_�o���&�CG����4���o?�m2��&:��:y���&�������~t�H����a�[pb'9*��t �ꐞw�Y�Ѻ����X�	���w>H��M͜	��M-��D�N�d5
��i��X[M)�^��ـ*��9ˬo�7�u(��5�Or
=�s<��Att%sZ{L�*:���:a��bM�?� �-�=�,$:�_f��s�uB�N�3�h9���k&8�f�ۛ$�*20� d�P���p]��:9�(� ��@9��ܺ�������aп<Rδ]0�Ԑ+�����@,��J�;i�,	,�Ǵ*ׅ,�f*�{��(w4��:E��0����*�(�j�mTw��)h�Y��6���X׫���p��e,P0�\�Z���L�U�Y�rռ����������4��!)�6����iQ~̏� d���J�����X�4�������^$p�}/�����v������j{Y��z&��H�H
��%N�﷋d4������V�IfXt��RV�C=��W�^1Rx���T\ȹ�lq����Τ�A���� n�uC�Njxv^��w��F�=���e2�՛�#Ή��Q��y���M?�V��A}��1=5VD�'���PlUm�wZ@+��	$�����HSa%/�@�
yZ#f����|���ߪ9��!՚�y�o��"������^�+�[p����^�ȉ|�� a-^s�"5�50%�"��hȁU�+]���փ-y��$Bv!�ڳ[�O�@������5����ϱ/���oC���z$�TNf��P��'M���xW�_T�����{�<��u��l�3򋧄�qj�\���!�.��Q(*�u���Q`Π}��W�Z:�T���$��:������c�ήC�J��c��sK3�P�s�5W�eO�����M�%՘�}�M1���FW�nڟ$F_��+�����
(�B1F�pv�	�U{@?�{��|�P�����0j��S/_ME�֭ư�����U� �^s&yW��/RRE�����\���_L9���/T��-EW��C�D�>3
?�W����xqL��IO���h!�Q!�b�t�q���a�%NO�2��\a�h����~ec��|��LL���8�_�{ �G�����㫺�K��E 
z����2�cz�[}���9�10�Y�Sac� ��Ո��Y[?�M��'dQ�8��tu���LR�����7�mҙ>���?uG�E���x���((�L��U`f��r-w���K�F�H����F�$_����aU�0�id�ܩ4#:
�Al���m�C�c�ޘV����X��Z
AgoN���j���4Ӥ����O�?K���JՕc+���$�s˽<���+�5@�o`��32���/rT9��b?i�{8Or��~��l��'~aµ��f���"C�ҩ�Pn_�N�/��W=�S�ct����L[1G�<�'mU$߁��OmP� 4��h�1���ฌ�S�ѱ/�G{���7�	�e
���y��2���D�Z��7��-e���p.����%���0��釩�0.�e��M9�
���Qx���o�CB�����Z7)��un�H'�tG��P�	���s�(�e���p�L|�T�]��~�@�?�?7\ ۪��ۧ-��>XY6s�S������D���ʽᐊ��c��/��U�|�Q�ҫ��<��bCu*fLC�v�����(]z�t\=������fw���)�`�9Kc7B;z��-r����IKp3�;}�N^�EH~�U1��J[h�3É�H���Z�a'E�h�D�����)�p��W^'�\@'��L���z�r1�aZ�2Xq,�t	k�T��4̝|�.P��gv�eAt9z��N�xC�+`�h��8	�A��(�U�濑�- K�ί�cD1~�A��)�;�w�.�`������k'2
�x	�@͞����Ĝ���.Lfj������i���:@����$���� ���T�!�j�O�����NZ�l�O�D���{Ք����0�����?�H�i�͇Mn���n�pՎED,nD"C�(i^����y�u�6@�iP���P�}�Sф\�|�nmֵ���[朒t��,c�/�X-d�����u����t'�.hI\Ú�v~���21��DL3|�=wc-[�LmoT�L] V������I���A�l�p/�;8m����'Μ���ܢ�
���a��E�����O������� �T�:���ؒD���s4蕓w:}Rh�9z�ߴ�?���)dv����~<� ?VL�ĉn��ŬY`�Laַ�C� ��#�����TԈw���<Ba�SNO+,g�9��/�}N�����4,��cd���7C���frLAi�1��SP���-�8*M�ѫ�:4&��͜r�y�:�+��(�B��߇3���4�m�Ӷ�[��.;U����oc�X�cB?z�ۜrj�1zE�8J*B*Q�g� z�ƺ!Z>d����|�R�9�^�̀��L�oM{l)Z�����?D�� ��M�HR��ɕ��{��5��Nݲ�}r��TB��E�9A�X�K죚�R�';2�0�z���tO�.;�N.���h�f�J���	wWH��L�2�g�B��M8�.���^�CI?T���cL��X�/`%��\��!�H�,'Fcu� �P�cD�pj%��Mw�__,M� �߃�f����phU���)}70L�B�_b�SG���T�c��6E���4� ���T��i=�^z�}1����