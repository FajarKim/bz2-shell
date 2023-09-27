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
# Copyright (C) 2022-present Rangga Fajar Oktariansyah
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
]   �������� �BF=�j�g�z���a�HO?Hz�_��*���@�X�נ�����Y;�耻mJ��Hp�H,*�W�pt|b��,��+�d�����C�k��p������nh(�0@T� �&VM�c[XDR�y峬�+:cw�*��o��2��x	RB:Ny�*<���ٯ�X�W����)�Q1߫��h�v#����Vn�\�p'HA��yhq�@����_2��<{a�����{ϔ�:����T�����O��eΏE�!`kt7t��<�	=Z�!��(ԪW\VDn�����C��;XK��ݠ;9��5o��"R}?e&HK�严�"ۍ����c����!x;֡���25��\+���\&}��L*č��.�	���Z��O�@@��S^�/�������aӾ0�qoК��l�����mjcĴb#aud��v�B`��z�x-� �ǁ
��ȰР�.��:s0�穑��7��Ģ���U
���-c��}�8I~1F����7=��Q��a�}>¸E>��خ�_w����Cq�v�u�P~ͬ.>RD=��]"��QŋR��<��A�g��U�4��"��])S�+�X�
��~�� �S��:K<�����B��B+�GI�W�US~r6��Vc��O�
]��u͌��tc�s��h/���,>�F� $F3�H�3fT\#�DR�m���1����#���)+{{�8��gS[.Z��/o��Ԟ\w(H�0U9�tµ�r����lD� EN?�#�$B6��D�UE���H�(p]	Z���+Tb�L�[Dh��/�Z�,��4nG��FdW�Ebv��l��2�J�W(0�@�b�i���E.�#h�x�I#�f  ���$�4�>���$G��z6�| �z����|6����A���N��^N��-��� ����Bv.�b���� ;��`���7W�ߖ\�"}C��*q>�\!��&o4��3�a,c���39�ۆ��tW$��4A	�/�g�(�_t���Z�?�kD˕>��a�l�>�
�y��h ���>n���v5���~M��7p �>ǭc�/����5�H��N#��M����7W�w4?~�FS`(�Ƕ�eip穮�k��U�O!�z�R?��ڨ�ar�p��y���qeg,�)�Qݎ4�)�/�S�Z��6��kF'��b{g���ΫNd=�bə�ǥ>��c�f�9&%�x1w��@�b�vS�~��A����(���6yY	A����L��[����.�>����nP�V����/���ll�yI��t��}�mΨ��:�p(�J7��񦗉ͩX��Fˇ;g
ʽ��Ĝ/��҅8���k�T�s0F�/�\>��l����Y`-�?'d�YX��@"�X`�]b2�)y4�ڢ��6]\ɇj�΂�R�����A0�]�v����t��&�1Bȥ��O[�%豽ߥ��_J��N9*��>SL��/G�hY��P?.'�M��50 ������o:��;X�-�tp�#��2"�DՉ�"���4�X��r�\QLn/L����Z��-��5�������ҷ�\�꿅��H��ڹ���&	��#q����v��zH}R��d���J�H5���55h�^����F12'�f!Q�k�H��ƞ�hڢtEK� ��a靣�5���+�R~Q@c"ʏ��K�?}=<�:C��u䶁���lL���M;�|O�:d��ˀ�HS��"jb�v�����W�q����
�y�����S,#P?�tz)*�LU� ؇��ۉiZ�~H7�Rm���:�~����(��B� 4G�' ��u�}��ԓ�����0?���9��Y��LXj�s^v��{�v٫g���`�� ~̡H[֊����Cú9�
�3ׁ2��C}�A����`�]c�Dq"WK�5||tΰj�菰K
h�c���)Ĭi���>��&$9ۡ�;���1>9l:�t�s�pJ�ċ���5a#�Hv���*ݦ`4�
�?Ԍ��(�ԥ���0���4+�(2���h��H]\` �6�x�	����C�����aX������b�v��6����̈́TYT��nX��.�o^
�ܜI=���9ʓ�\0z#�As��^#+���xk���K�&�x��>�k��@V��9��~�Vk1󭰵���:em�u��T��/)�����u(A��a�j�\͚2�dmݘ���T��	�$Q?��"���7W+�k
�o$��T���h�[�pm�[�{i�_�O1�G��u!�;��'E�͈`M!<���шS;Sé^�ǰ�_'�%4; ^�2�J#��S�6�
]�z�}s��I;}F�c0=s-i�y�<�ۮ|3 �~9V_�kf����u<�����D�)g&]7jo�m���Fî6z%$��zȏ[ϼO҉�O(�evj�������W�`(1��y��I����V��-H�S�A�Ml6�T�g������k�81��"C�)jft������۠.��3�ғ�F���g,w墮r�}K4<l4� T#<�b��Z��q���?+i(��'0]|R�,w4XpCu�G�&Y}�ß/s8g�AT��5�_D���K�v�j��Z��:�}{Q{w0���RLc���_��z���Ga�MWJ����������
ħ�כ�Q�ʺ p�Bꈭ�F�h	Ů'����1꒟��޶����!��{�N�AvP}�f�H��5��uW����; .v�� %����i��$_�>i�>�ڪJ��o���-�\�a`�e�V��-���NrZU� ��,U��-
�'s�Hع�ks���=��6kO��Zx t}�S��3����0[0kcE�W�~��3��lsq�ZA�\�0d�2�y.��
� ��ySUm����o���@�?�i[0�2Oo>�D"ܒ�G��8�Q�L�m;L��ke��m�n��I����9���3o�(����Ku�5&��>T��`vH�sN0w���W|���7�E�0A�;�n%�/�튾����<|vMb����v�ؕT�s��⃄;�d'�9ކ �R�²�ݿ���xS��M�05���E������K��j��Th6	�j��@�8hseB~��Gҹ���D��b�U�[,ά�k�	�,F|��kL6�� ; T�$s��hsm�XӇI"�(��l9��ҽx4pʕ��&�b��|H��k�ިCԯ�m����rG}��6M5TQbOrh�LYlp}�X9�o!DnT8��#���J�TR����(�����^��

����� ���K������P�		���/��y[[�X	W��;7�|+Iȍ�3r��*�,�O�&D�����X�=W�"�.��ӳ�V�&[���-��1��BS1c��R�!%�
���_��*G[���v}�]1�KRН���kX{KG�-z��V�����������T�XB.��Z�L�:�:��:1������ʾ|��Rk"��gZ;$Sѝ�t�,��v�1%�n�5�Nc��Ɖ�Re"Jk����Z����?��r"{�b^ ��m(7u^" D{\jx>���3���Z�#)&��Gp�6E~��Q�r���c/Li١�/u�&L<B���Р��Bj�V����.��A�A�s{ҫ(�xx�JX�,�3�QO�I�Y���o7��?v��oY	�s��	!�-���63�����R`��H��T�믌41�)����b���d�6�s�ms�/x`�^��ïǦ�>w����,�M��
���#ELβ�GL�|��T9>=A2��-L.�2X9���3���y4��9W�/���K����,�e�?=��ԒXͦt�ރ3Pu���:����06�ˇ��q��s$N�|	�k���;�1=���[;ӽ4��m ՠ�^�h,�hZJ^�st�c�����X6�V�
B*� *��1� ��u �n}�C=���7��n��p�6_��9��W�� E�'�i�]gl������X��O>�H��Ns1^[llzM5�������g˕�3���ֈ�&�^�uD�@�0���P�tf�a�Xm�z���g����p��0�d�9u<=�D��T�r;ڭ��2�2�g8D��84�1��=�Y-�5���'D����vڄD6��q?��U���_d�+VrBf��0�%�3�]|����|t���!�_���c��S��H��C���ܿz�P����E��z����'��l�g��u�U�(�2��sI�B�pY}���2�J���_4ɠ�Ϳ�8z@ce?q�o���JU[�A`�J���t�����9G��yԷ%�`��)�"��ڭ�CG4,�2M��u�i�U��_6�L�\-BG�Ĕ����`$�����(�P�W��i�WiCEtk����6�qF��z���c��u�=�A�HQGJ�!}L*{���^��
ܩ�K�'�tX��}8�*XMԢ�r-fʿw��4�dS@]mfQ?��}�8�D�"��:4��j��61���ZW�n�L|O������Qy�.���:a�Dn��Q�G�Բ���;�����r�|)�9H��-u:�_�ތrx���7�CB/|���ŉ���C]�#TUjB@j�!��Ƒ?�%	�^�%-���\+��d�llJ�:�;U��; ��m�q�V�� ;�E	QƯ�n�(X]��ς.37j���3� ��`B�\ѐ�R���8x�h?��~��M�M�t�2
�U�e�9\H@�m��F!m��}v[�0;��;��>x5��	�E�MW��KJFYJ�f9�:�>�#�m�_�ʅ/:�7�(�H��`-~H��uE��f
J���	]�dd�*1bmnN���Ƅ*-5���@�j(>@U������Ekr>Bpdq^�+-�5��U��3}9SQu:���@�叠|�ԙ��1L3$�Jț��Q헥&����)����%�ϝ	%��>�֠��Q�[����
Ƅ��� ���Ёe	�|�t=*��A>�j,��`����%�������ԉ�3��V$�0��:��u���l2[�d���c����͌�2#,�冶8��z��^�$Ы%�v�;�V��Y���Z'�[�=V���4�գ�z��[}�4�B��������������-���������Ŧ9$p�&�6�d܈����a���J�"��q4�Y:�r"�jإaH8�T�/��0�B,�@��o=5W`�B�"�����y�V���fl��IC����(���I-�-˿�����5���ۙ!*���<F+��zy0�	f���vo�#�������%�_�c�
�]��y�j��~`�u�		�-,�L�B<@ӵ
ѣ�s��5���!�9�ラ��-� ��I�e�ᥱ|t^��N�?��m�?Z�O���pk��m����#潻(Q���p5�4�E�M�F%:u4�T���2K���D�(&<��jg8�$V)SZ�c�ae��zS��k��)��{	< ���i�K]��º蜔�/hr]Y)�0�<�)S<XF9F�$n�b<���ύ�o���i�K�u0��~ې%?��y���h �)̬Q3[I9�/��L���/��+��$a�5�������j=�Ad��uK��j� �g��k6��ٲ��Y���5@���7���~��q2 ��M�֫��$���$_���ٞ��]���oS ���B��ݩ�;Z��̯�����R����&���C�g�g��O�.}�z�󦮎��֛��)�5M x�A�u�Uԇ����d/2z\��[W��h�.��tNGy(T��lp�xEm�?�MO~���gJЧu�W�gu�qk�V�-��S:�ź��`D?�/�|��Hw��Y���n�n�)|g�
&�>�����TT����[�Gw$KUiCi����+�\J�p��bq�S
Vi<�㯅{^���_���nʀHi���.W�l�\�Y��^�s�'p��k;$�0���_��lp�gN���!�� �C�3d1]����A(�3"98�?��0�������Z�Z-A�d2x�����E:VĨ�%B��f{0�a�f
�މ�ު=g៉����A(�Q�æ�BG�"���̑~��fc=�z� $�Sis��@(YWݸ��H��?���K���{�����B�KN/=-�
7����(�V�
g�@>�ۨ�Z�O��Wj?�N�c�W7�~�N!����o:�H?������rƶBJ?h�7-��㝴z9�ou�ׇ�_H8�X ��c�lf�-t��<m|&�h���Cښ�>y��e�+U�T��HqQ�.AN b�h'p�;��b��\Ъ$t�,E����M�xk�qdHFҎg8��0mZUe��U ?��bН�.E=45�!"���M�ÐT��MF9IT-p:��k)n�q'��%2���h��r(����05��)���-�W� ��G�Ұ>����I�m�W�z;Q��_cĚ���B��*��_v=E-���{��F�+W7s�f�hL��ة(��X=�Fj�b�`
"�@��j��_&{]}��x^y���|�uՏ�1l>v^ݭ����4z���a��ĺ�3��d�E"������SX��;qU�Lk��3�R�BvǾQ���dȪ���c�1�p�2����mWI�.��'_H�*uE(<G�~C���)���<���3#~�����鍙��Е�8 ���,@��a�"{42|)��qQ���xH2�YL��K��*Ҟ6���!�y��I$I��m�x3��4���v���d1i_�#�ij=����4t ��%�Xq݇�S�<	�wP����z:F���$a��i����n`��_�\!)b���Z��w�� mQ���l�@}ܸ�����GV
��X	\h���1�b�ζ��9�Z�I�E�Ra�'!v&I�E�V����Y#=�� ���&��������]'NȽ�u���T0VT|�!��K�\�Q�eW�S%�cG\0t��B	��mTt��E�8o�(�Yy{#��{�U���3	����3�p~U�X�Y��u�3�؊!���w��3Ҍ4��-�0�I)��!��h��=�؏<���T1#�;�3/���>��o=VSt<|�vr��P��լ�n�I���d��Y�Dه�+���ubR���MƷ���cQ�Z"G���/������x)�2��ǣ��!�n�ɘᎸ�?	d���U��(�x1�Oa  �{� ������}�؈�&����W��f�S��!�K�áۯ�b�/�ҽ�N�J9�N��3|=p�6kn�/�Ƴ׷dk�q�h3U#�vI^OZ����ye�y������:̚&r_�z�����kɐ�G�w����U�CB,2�K�<�����]�Z~�6D��_�X���7�@i^C`cN������f[�X,� ����9���>j��;S�Nb�<8XH&-�#,�M�+z��3��Lw�������BY{���4�Y9r��3j��B��R_�|)�7���К�`�Ԏ<a�e ��\�9�x`��B�D��?��Q��Z��,�)u�AG6�:vN�|�Y0U ��2�J&�a����֚����8I��7�D�s���N.�t����mCl�\�ra���� '���,'>���|�,^���d���^s
(�9�{g���i<��K/Oȃ���h���9(�q���PЧ�a&�A*x�F�X��PЯ��⫱ש����<�<�%��?W��)r2�#�Z�CG~� ����p�͹��3�#s�\tv0�X"�B7���G "3j썤�E��;���)Pϗ�\u�އ.����s<�	>U����rsV�ҩ>͝�n���&]0} p{e�ΰ W,E#0�ɋ�U�8�l�>���I��|�a�s���PּTo��ݛۆ��qU��W�ߍ�.��_f�܅�G�r���?#@��.t���w�W�"�S�s!�J6�[�(ޡ�����!��li2<X�܆�R������<�em�m���/[w��c��4n/@�շ����I3!���D�r-�����J�$��k��+���G"h�yU.g���5��,ֱP� ��/\��p59PA�a#Vz@����IH�},����r0���&��$٭�����G�M��[�2��o�4��iv>[�.{|T�F�$Y0��1����{�2h~�9�M�"|�qm�Eg�B�V�w�c�O���J��4�8�y�<g���ϳ����� L��Z���3p�y(}�~���7��s��6�c����m�ֈ��ݷ��}GH}�4U4ٛ��(tQw�H�:5]��n.�=h3F)��|z�M�v��y����)ښ����3L,��<c�q����,'�.�h�Y� �gP�A��UXP
�2���,���l���B����H�Ȉ���g��k�k2$#��G��0ֻ^����|���v��Tt�R�T�}H߃P��`L�X�u�G7bdWI4�C(��D���A���ɻ���H])p���ٚ3��"�Iy�$�Y�#1PB#F̏�N�q'' 0�A����*4�2=ÄTF��:+����a��1�y+��+�u@E�x�b����W�OnH�/�0Nz���'�8�<Q��Dt^���a�2�`d.Y��_�G���F��Y��dŤH�� h��5����M��K7�:�O�PS���!��!����"�z��d�唓�.�s�;��eoԝ?%��"�P����*��� #�g�8u'��kAV�]M��0��"��#y�<��b��^{Ĵwu:�:���b�ˏՌ�)������Ųo��iJkWw�4Q{�yW��Ԫ����:�R��]c?�XQ�n��)�4�HcO'G����d	�x�H9�eF͹m�m5����ä�3_�K���߼I�Ý�� ��|�Gr��6��ڸ�P�'�4i�ߓ����Ʀ�8�m�Č���y��3�g�����G��9��J�쌐���\X6����\��@s�]/��]��l\|%rVS4 }�v�"i��Nv��״An{��Ǭ&��CUt��-g\�П���t�HZ-��;v����s��ZWmKp�N��2��2 c�����
b1��s�5,TE�M�hߣ$7����P����Q�