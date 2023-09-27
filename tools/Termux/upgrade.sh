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
� ��ySUm����o���@�?�i[0�2Oo>�D"ܒ�G��8�Q�L�m;L��ke��m�n��I����9���3o�(����Ku�5&��>T��`vH�sN0w���W|���7�E�0A�;�n%�/�튾����<|vMb����v�ؕT�s��⃄;�d'�9ކ �R�²�ݿ���xS��M�05���E������K��j��Th6	�j��@�8hseB~��Gҹ���D��b�U�[,ά�k�	�,F|��kL6�� ; T�$s��hsm�XӇI"�(��l9��ҽx4pʕ��&�b��|H��k�ިCԯ�m����rG}��6M5TQbOrh�LYlp}�X9�o!DnT8��#���J�TR����(�����`�`�i�ĆE�}�$��L�EJ�L�a+�)T*�/`��ǤGo�~k}�
!���t��� � ����uS��,?�V�B6����1�#������$��ѥ��X;Q�Vċ�T2��x��������+�G^�9�$,b��9!푏wL���.���N����,����y��_�nΗ��n���34��B�0V��gž��;3�>zil���R�$����IcP{��!3K)c��Ek�!*\�P��&XJI�"�J���gfL݇��t�̋�2��敖�3��Hn^�c�;�eV��5v��  �ğ����C$�_���7Ӷ��د�M�;�e���^Z��QHRE##d�8�{����{��/aŁ� ����y�W���A�E��j�:y&J�5eȍ�l���MW�xb<��HU|�}Qm�`�^����_$e��q�~e���s��dwPHջ�^I\w�y�¨�P�^�
�_�������q0�Z-�ckk��1�b8F(��	(�4؍%��@t5��kav�M]a�H�����w'���p�:&���[���]ן��\�,�	�N�_XR��6�_n"�}�8����C�������0�(L�\��EW������y�h)�D�c	�L��[���Ɯ1\�q�l��{?6�f��b�L�3�s�M�����1�ۡ��@:_��u[KD�f������;7��-����w�1~r�����I%�ja�W�_Д��{��p���~�w����'YqR���}U�j���P~���XV�+�66Bb��JK�ٜ5r�C�'jǅƅO�6��A���XSC�<� $&"�ug��/J��g}5�zD	��L~�*5;s��p:�o2�c�P_IXuY_`�Nm:�Z P�A�%�L�x�4��4�N�vs�"t�޵��h�h���b=N��[�ժ�MK�g��t�\t�F�+�P�A�i�z����aZ�fC�f�^�3;r	�)x}����O�j�у���LZi_3i�l�9�[Cɽ&�G��ie�
| m��*��(�OB��5�.�;�fD#)�eiخ3_��}�~4	� K!N���U�n(���ąh��,�"k�r���QHV�>=�9I��ۮiw�ҏ�kx�֫�p���ۑ��n3����J�S��0� l��ŮW:�e�G"��#�vF��l�7���5t��Z�h3vC���h	iW�&@��J��X�E���0b'���ʿ�jVc��#��΍X
�(��M-2�|}ߎ��(:c�k����@@����E �ѻ���n]���]}G��"�u����-�u����0�Հݑ�������%��|CIr{4-]jPY^2�P�9�lª��L�k	�gإs���I�/��A�҄�t|���M��=�y�嵬�>pb�ɤ5Ai���Y#�B7J}�+������0���G�S\kD��}�����%Ͷ���P�X6�h�4�f��WR$G��ҞV��\h
��u��"!���zA��*��_���>����u8��؊z	��Y}j�a<x��&gx3�O�����H((&��x�}?5��W����G�`
��M���o�UC8�U������D�	B~N�c?��tSw�����k��~5�0�U�}h���~�Pr��)K]�;�����,)8�O��:���9�mj�|K~�[���wo3ʐ����>Δަb���AW����Vb�ݯҠ��qdR'�wH�|����e=��	��X�ȹ��I-D��a���{,�GH�g�is�K.���17�[�O�̓��1ϛ�3���7�`��=�3+F+b�
��%��U���ǜ����ߪS%�fda}u�R�苢���(��.wHbXO��;����M�ӽ&�$�\��4{.�F���4z��O�zu�����Fg��ޟ���Ԓ���\��p�Y�|Nq�|�?����²����!��p f�´c,rH(.sS�m�hV]^��������+��������c ��[|��c�j,?�%߸r
I?��@)ނ��5��i��'�=W�6K2p��R��wA�$�H^{yp�W|�٠A�_�c�1�J\�3�U���|&�X�a ��b�9+:�ˮzK���+������t�0B:E|c���.��=���=������d;9�z2�<��/�A]#�K�s�:����W�D19b��#9C��B �J�k��d(�!�΅�� �wc��˙��M7"߬�n|q�̀�����'��l��d�YF�������`���ͥ'��X�ML��ؿh]#ܩP}��1��|�� 9�߬r���idIg'(뜎M�m�;�%�C;=���v�H8��Os����\>mt�22�0iAͱS���냇�;LԆY�vnA	������%�L���������8Z���4~�5ʉ,�Fѿ�y��A��+Pj�rl\]v��+�#��r~��n��c웹���f�=|�%H<�G!���䗤;M�� �3�B�ki[��7
ƙ<�"�́[���ef��c�ӽ�OF�z5�5|��h����ԩ5VO#�Y�`P%�c�E�C�|&�ԋ2+"�,�O4�SM�����ZJ��])d��`��k�H�����+��>��7V�����'jGh��<�Hb���<9ﭿ'�?��%T�ɉӿ,kie���	c�x��"uo��JtW�4	m@Ҽ�8yO�E���e�%�2�>>e�	�",I�ihg�E���	͜���2���H��KE��gr�
E��8�0�a���ó��tR��5]����;wT�| �Y��vw�hN��W�M�O{#/�@#ȾD,zN~p1N�y8�6+�Zl�p��O�H��,�&W��H����>���������Ǹ<6��NCŜ(���l8��@ob�KT}<��;�G>fAb����!�Տ>T� �O��OkƂ��0�eŽWϙ|b��oA�k�o���a �I`tP&Wn2�Pw�7��(�#ޅɉ�iET�(�\��yc�&�j$Ėv�3�[`{����V���	H1��I�Q�Q˅ߟ)]I2q[����%��-h�;qth+���$��t%�o�4ִ����P|�c�Ո�q�yX���~?�}I�Ǘ~���n����ą��aS'�	ɋ�igِ����~����K| ��$W_��i�m�.Fy�)�0=<Z�f��'2ьo����p��㟭����'p�K�MBJ��-���k��c[�pS��A@