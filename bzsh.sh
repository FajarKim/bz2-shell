#!/bin/bash
# bzsh: compressor for Unix executables.
# Use this only for binaries that you do not use frequently.
#
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
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
skip=87
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
]   �������� �BF=�j�g�z���a�HO?Hz�_��*���@�X�נ�����Y;�耻mJ��Hp�H,*�W�pt|b��,��+�d�����C�k��p������nh(�0@T� �&VM�c[XDR�y峬�+:cw�*��o��2��x	RB:Ny�*<���ٯ�X�W����)�Q1߫��h�v#����Vn�\�p'HA��yhq�@����_2��<{a�����{ϔ�:����T�����O��eΏE�!`kt7t��<�	=Z�!��(ԪW\VDn�����C��;XK��ݠ;9��5o��"R}?e&HK�严�"ۍ����c����!x;֡���25��\+���\&}��L*č��.�	���Z��O�@@��S^�6pFyw԰�9�f�M��sYy8,K��z�g�*�&�l�;=O���Y=��O����-H��*��2 �7�O`�><DJi�)@\dX���|#��w�Չ���A����"��,�����iX,�$H،�QXT����nw`�8�2iw�>�FBʜ!wGB�ZJ�g���T���1�Q��)��0 ϼ�5;�ts�����K��3ҝ ���߳���۽�NF���`�O-���eh&U��x�B93[q:���Y�w�4��6>����ױ_Mo�/�z�0��� 21��d֊�Mƫ��kp�]�t�.�בPD�k��"�?��X�<�	�<-i,vҳ�Ć��"�[*�5�I����6��T6`�(��.�D� v�@��ܮ��?�I7�p�3촍�~��㣵xr�\�Z�Y�����qp%z�Q�$k��1�y��q�Ĺu�l�.���ǆ,������m��qL������e�e�H6�E��~A���V�j�=6�d1���,�z�+>)�J�c(����R[&Gf����(	R��t.{G�G[N�.k-�a���v@�6�<���.�o���ϗ	�%�H��J�/�;�3a��+O=G�}���Zw���`lHMT����6�830 �T�&���mb�h:�USf�t���q���I���-�I��Ⱥ�p@�5n�'�R8��2�h�2V�
# Q)jX����Pb�D2s��/�Js�K����y4�>�I�1���̋��,��@����E����7�Ch�{�-��V�����W��M".����-��X�9RvY9���VV>$�e8�IҾHH��H���,�~ek88��-a��ҜD7n`��k� 4b`��qX�
[&f��꽤y�.���N�>h��/%��=E�r	��~��\�� ��WH)�Ϻ�ľ;U��6!L��η����֢�N���2�|�u�<�L�&��ؽ�f����<�>�k�K�q隌p	U/��{ �.l�8?����l�l|c*���'��T�{�QJ�Ty
��Qr~dδ����kH��|���-�;�4ݯU׈�]$#ڞq�"�g�a��r�s45#��uiZJ!pٻF�PQ#����e<K_V5���J����0��YhnB�# a�C�d�P�!yE���R��14�y�L��x Z����-ɢ�AX�+���y@m1/W:/똾,/��H�R����=�i�E��G��r"�D�����99���E[zN�Dm��|�eI�4p���bLA�?cD��vI��F_�>{τ&���w��3�ʍ̰��p~� ���?0�_5�[�zsܑ�qԟO��E�w	^���
���pdܚ�T��N�C�j�c���!nS]����	�b�
�?�D��!�?���3�kx�������>���"�
���Z�E��//1𵅋~	�Ms�w�b%�Fȕ��L��l����&<��_��tH��C��E(A;"��8-�O?��0`��6a��
ĕ����H�2���T"=3p�WϬ6l�ޘށ�W(��g���W�)�Nb��_c�VN�{������;�vx�0�,Z��,��JL��b�h�`SI���щgx5�0��A'F���}�ǼF��$�9���6�wn�����u��TYN�m&���{�y�_.�o�G�6g�����x�`;m�54;�c0>IczgJ����^"�m7�w�O�"A��-��iىW����+�ң�ǒ1a�$�[G����ϲ�����Y��6���8�:�Hf$����ˠk���b��ڒ6C��������o��54��������%���?OR!e=V����HU�ѻ����F��E7�_J�7P�?�Q�L������/���Z�p���yd.�K�)Sqo1�sM0�ʙ��������X���>1���wt���0y��Kn|uჼN�G<~Pd&�ͅ������pR��3j��5�K�d��f(��� ��/_�x�gčYku$�� ����p���H\*���F��M��f*q�Qgh�`'����P&�0�{؀��>{7��P���k;��~�ô�暋����l�Zlu.~oqW����ηS!��jkRi|f�o�K��V���%%�kO{P���`�������J@_%i`KJ���5�����q�2�׼�(�_|3������uL���	�a*8uC?���%J�9��-@��T�h�}E��SW�Eu��~D�Kl��ς�k�.�CtRc�L�5�$0ǘLO�M�p�у�f�m�:!���eB�Nô��e5��w۸q���f���Y�٦#�F`_�]b�ا��k�s\F��3/�,@�NGK�i&�-�T�vH}�D_��eJn/��e�<7R�ȴ_����y�)���F��_3�J3 Ԕ���N�μ��a(F���{���R�it�ɺ�N*�C�c��K������AX\rB��Y����.�'Gfj۵=�=��U�0�eu�N �P��Tdd ��y�=�;O\�������ڟ����Y�"7w�+4Ӆ����{�#��MF���L~��Rv�ӑE�S����x	��r|(v��ٍH^)2�]���*,�fp��x�[j�+��àhz,���3B^F��o��{��b�`�ljA9����8@�>b�`+���V�`�<�mO�\��QV�%�w�[˯}�Dq����6��<��?ۘ!�P�vL��SA�Ul�Uo��^t�'ټ���
����R[�9���A�o�r��b�/`2�x���"�O��zm�O��3n]|r�`8t~zn�Xzw��*2��N�w�\�Mh�lU� �~�2W��,	)�ͱ�x��9���7Æ�4s.�,]<�[�3Ӄ�C�ױ:s�i��D7~�̦�&�Bhv�a��^p@����ҹ]��j~۸�����I��ɭh�r|� 7�_Va��Y���Y�ф�m���،]�(�	Ý츲���Kͻv3�e���_�qK�k8L����3	�z�NF�;*f������+p+0F�2^,��S@ˣ�X%�\[N����l�
���B/��q�������_�	�9�ƿ+��'0��ǚ����&�P�õ�h��l��#�Mo�>��ￋ	&`V�:�Q�ZS��YW)յm}$��~{,n�{U�Zqz�q��{�ӓ��q�<�|dގ��M�N��S�%�tj��io����[yݢ{..�e���t��sj������1�yчg�
c�u��Mf��}��� ���H��/�'L������~�����'�lv���I�􎯦u?7-���IC���M��-t���J��?�i��k��b���H��Jn(���)�"oH�)(���Emи�9��+�5b&H4�ka��f��F��1#���U=��4x�O��Y�G�1؊����W�d��U�����;� ��O�C�8x��F�5h�^�b��N��;��׶X���`s⅛�z ��q�څ�# �;��R2��1=8�$$E�oGL��V�����C_���;���w�?h� �����&EG��j�y:t�P��|X������ � �;i]^�%J�K3�d���5��e��� H��N+L?$l�a�'�'0��Kcze����m�H����c_r����Peo�W�E2Y�H��,v2t�M]���P$lP��)�n��gA���˨\�+�񇣘�]FG?B_uMI�4޿��g"ǰ�!j!%!�l{�RA��c �@|F��)k�aQ�O݂��ĺMI��u���Ԇ�W@�M��$������\���r�#�g�f@��^ol�s�OV'T�:��)����ǌ*{��sֻ�` PM���L�6AD��m�V��b�|�r�Z`c4YC�5id`�c́��<�Zs^�j���*�ܳ�W��]�_�1�m:��]�N����U̕�Tq���ᕗL��V��|�Me�����2U�v�҄�\�k�ɢ��oo�\�kF��hJ�Q�Yz��� ��D5�g�6�]�ʹ� 46��LG���2�� �>4xh��VGD����oa����gZ<������e�q#c�K�b�?O�y����t ���P;�v�a�wݎ� L�k��}���=�03y`Ol�Y�}������q�-}�k��X�r�3�t� ����.J����q�'e�r�}����!��!Kq ��E�O��A�w�խ��Ai;�e��zT�?���;#-s=��fn�9*D�#8 ݺ���r�6?=��-�������I�I;�g�A�#V�ޗ�@0D$=��Gm����š�bv��w��T�{N���}���7	��<�ӣ��#or�*��W6���Eqf}�InI�*^��LF5رj5�����$�|�!�贘rZ�b��.̤���3�z�cT��X�t5�?�!N`��Auc0� ��muN��AH�RyCƮ��4>�C�5|�,0A���n���%Ou3�����7���9���@����|�L�S�pb5V�8+E���>�j��&�%)����KU���d�|���a�Cɓ�j�+���_s$�3���;- �����S�Ja�i*�(6��t�>�Z��tNH��[]�1 {�o��2 �t�6����v�������p8*Wv���V$���>� ��9_9	���L*J��4���RD;8��W�k��Ϫ� �΄U5h�;2��b���
���4+D�Gv�%��ay,J:��1��X�+��ލ�[��w�i��c����nb2@��3�s�7��4F7T"b#ε��H�?f��
R�K ��^�'Ae)R��[l���
�?��x����_U�r���ݸo��l�\T��+��k����3�;���n������ͻR%C���E�b#19D��oܓ�������\�YUm�(�-%�R����FQ#�]T�pl� f�Y%w�^���u�	g��"����x�4�ЪT�����nQ2��G"1�:���_�L^����T��<��sp����4C �)8V/U�)��5��HQ�2����3M��M����-���ƨ��2�\���I4r� ���{�=����Z"8�k�qb��A�b��b���U���#�4m/�Ck�Ԟ�v��1�z"c�4Yu�r��x�5�{�HH�#����O�ֈ0ȗZp�(s�:�z��=��r�'q�`�g87�?�RNeyI�`��:��~�։��#D���.!|�j��|�5��eQ�\�G�Ќ���@J��w��O���2�X�O)S*e����� ���>p��rRc������\���pa��=䋇�H��VDw�$�� :���g��K����
�|�|��PxH�!i@��kM���L)��YL�Θ���ӫ�A�)���9��YE-�������]Sɣ�$Ź����В�x�hZq�1\���-l:W�dϑ�]}����v��8�� ì�.���.�8*��ȑ�Rٛ;� ��EΌ(ȶ̬�`.[b�I3K Ыf�x��M�W��Mo��`W:��J���2�d�Փ�Ǿ�����Og���N7��6��r�OxTPOd��<7ڙ���Iq����EN�v#�V]H��q��g�Y���˖s_
�4�
~a��B�pPc�}7wĀ�A?sWJJOl����
����`���d~gdA�P������:AF`;�٭,��[��+�a��|pE-�H)�I�t���%��R��!<>1���i�)�����U)F<�����'S��³c�@i	r�̀/�8�a�,�*�{O�t�J�3F��^����<歩��BW-8"N�|N� �k��+hH���H�G����"˫���ɦ��"��s��[T�D.�(.����]�{ 7y='\�vp½���g@�M�����P�2 �-��RZ�����4�:z�@��O�d�W5.�S/َ���av��F^�X׼����~r�K�E�"9+�?��\ì"��M�1�N��oB8���|3\�!���ky j��:s���+�J��}�b��h����ը��"Y��Ƀ�U�,}r�@ ��+|j���]"�qv��$)n�L�{�ϱ���<~ƾۯCE��DT�]�B����%��]� k����0�sv�Ѯ�"A�ڣ)Ӯ_���qT�H�ph}N��Wg�������v�x�iЊ쩋p�������qN�����~��,س�N ���3�"��M�0�\ߦ�nQ���,E��~���Guo{��b����-|X��"�L��diN@F[���[����E��ph���%�V�jL� ��"b�������ƓSV4Y�y�j-A��[���
f�Q:��3��ۇ$��iw��~�*����(a?�P��X4{�����,����!/�ŀ����!�U_��@��a��� b���CK�Mx���b�sB���_��,Pg�	������/K����{����f���~ܡ�3���56�"����2 y$xd�΋[<ωc�P��)����l�**�l~�P��/{�x���G�d�N�erj��L��hAe���ۅ��L9Z�<j�?�y�|���O�`��9��i(#��{]�~?�[��uXJk�DyB|���ĦB)�����4vo4��LB�v�����C����u�o��|��)���M:Qt1��7�%��uF�o�K���t�}��Ԕ��Dw�JIV�͞�;��@=̨C��s��'KJ����<�[��`Ǎ�ނ6!�ь���
9i5��6���b�,
��e�3X��^���G���8TC�7}=ɺ�P'g�yY���ț�Ѣ�D[�U�4�o���,}$z7�@g��
;�4+�^v}fr=��p��IѲj�߭��X��[�o�&;[��L��Kng��wN�$�lY�V
v��n�V�5j&��*�Jf���x�"�#B�|c�L;�w�0ਵFoR��#�p�Z�Ωm�ԔF�)�:�V=OV��Űt����)���i{������4��nb$���0\�q%ւSA�E ��m���⃋���`B���{�.��)�X���f��f��dy���Z�W�	vΓ&�:�ZB��7���� $c58��+��I��"<<� 
#�ew�,�=�iZ!�H������4	�=����vd���8�����ܶ�"���3)f��׆:��5���:����
�
��t�f�n�")4��h�B>���)�? M/zIy������8@�_����CU������tj�fG͉ӈ��Z�kp����L�rGt%��9 � MpE�%L�i��H�/�ɥ�ڢ��u�(���L9�G��b��טн�!�Ԯ��T2�MW^(~�\j#���}���b�R�S�Ӯ^n*��)���:y�s`P������e���*:v"��@k�0�o�+h�]��=��	����H�m�Js�6~���'�Ѣ6�ӽ��٧\lR��p�K���� ���K��xg	�L��9Fpc�H�a��W�S���i+��qW	X$�D�O��J���?����;��j�G��������Å�+)���͠�J�ә[�7�gĸZN��>~�,�c���"����l�0P�E�����h���I:�!
����<�ȡ���S���ق���2ҁ��}����)�RKC����x3ċi��/J�[�)��[ꇻ�g#ބѱC�HzAg�:B��l�Ioe��jx���%ތ���t�pgG��h��I��ѝ㖤�HB	���2�34��_At������+�Q�!e��oE�Lq_'slq���Xv��Wr�;����[g����x�>�t���?��(�X��O���d�m.�.�v���Z��1W��1��~X"^��HzI�1E�us;��^:]��b��AU�4��;��$=ȫy��q�������_˸C�	���NA�ɓe�i��B���y\��D�E���vEV�#[e����Gy��O�d��vX�-��� a�����mʵ���+4�\1e����8@$����eF���c�T��Dc����D��9���t�}��;�'��r-��W��
"�%^�@�>��t;�8�2Mb�x��m4n&�X�6X�.�)�m���j�l��LB�����l����{_dn5ٗ�����I��
Ѫ�k�,l-
��<�~�"������ivݳc[K[�u��)}ê��w{��g���׋�����ɬ �]�8ԝ����+�xaU��A	x�w��M�e�Xi���x
���
�"?�"�@�y�t�l�jD�����\��7f���	:W�団k�v��24ݙ����ܶ�6XY�*�#�GI~�ۜ^
�R?������M=}���[t!���|��=�R]����Q$+����4���X��&�C� ��`�������'����k���r� b�"H�CE�S?�O�����