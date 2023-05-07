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
]   �������� �BF=�j�g�z���a�HO?Hz�_��*���@�X�נ�����Y;�耻mJ��Hp�H,*�W�pt|b��,��+�d�����C�k��p������nh(�0@T� �&VM�c[XDR�y峬�+:cw�*��o��2��x	RB:Ny�*<���ٯ�X�W����)�Q1߫��h�v#����Vn�\�p'HA��yhq�@����_2��<{a�����{ϔ�:����T�����O��eΏE�!`kt7t��<�	=Z�!��(ԪW\VDn�����C��;XK��ݠ;9��5o��"R}?e&HK�严�"ۍ����c����!x;֡���25��\+���\&}��L*č��.�	���Z��O�@@��S^�*tJ��
�߾`5�5M�k�}%)m-�I���P͟q�㭤C�b���e�?8N��Q���>�P?2���$ �=��Y0ܞG#��C�Ͻ�b�+j�P��:j`l�߯Qmt'��e;(�Z����5.��w�2עL�c���g��6)��w�ʻ�M9�eOT�����&b��Km��KD"��=�a���}՜�i���F����
�s܅���S�?�?��M�_|ܙb���7�N앍9߰��a,啱�p�=;�^ddl�
j|G�p�Ǡ#*�Ƭ¼͙���Aζ�YV�� ���BM�0�_*�Ȁ�Sm ��3���tڈ�]f[
�p���\m��.�c8 ��H`']��s�1��wI����̇�+�\L�_z���`��?������Sb��c�/hZ=�n���+hcI�f�8�]����q�*!;z(0J�S����-��^���1�����0-%~�7�]��UI�t= S�J1��/��¨�~���A�ƃ�B ��HpF���u�P���^��
��T������k\R7��̊ ��'
�.>m�g�*]�b6�e��i�='��N�F��s��v� �Aފ$�>g���Μt�a��ְ�ԝrc���Ukv��.p�B�՟�Ps�~�{���j�o����s��M�k!S��>�N���aza���i!5���&���!W۲��qI$_�is���(�-�B�\Ъ�b��T�\�§���!{�j�Z�h���C�����ǚ;'�ڪ���n�3rf2�wjп*KjB�;���S3�XI�\����G���fe�1=՗����QhEn��F�ͩi��ӟ8^��u�����:��cD��}$d���ߣ�T��Jd��F�?]�㒟��^�r8�:R��˶���Қm����ޯ�`��������|M�����.�[��8�l�7�Z����B�A8=L:����AwOӻ����%�˸��af�M���MA=�� �M2��:˙��*�,PLH:�	 �m��YY������`{������֚�v����b0�r��i)�ԅf�\NSICEܠu�:H���S8my2L�o�g`+�?��b�cyt�^��~W��4矃���<�@�T8"xt�~�G12�6wÏ$��KZC`~\<�\�Y�͟�B��Ȍ�z�5��"F�Q@�SӢI����ؘE�լ� 9�����E��CT ���E���f��O�-?��)b�������(��M��2����@�
/�i���{���e�m�l3���]Q.�t#��uq Gd���I�Gj��u�m|}U���l���iq7��`< u���>���vۗ�!�u`�_�R3�W�L��,��W����K������E/Ǐ);��������^�D�(k�\�0$��iV<kj2�˚�jЍeQYѠ|d^~�������e���	��@*������}�V��Tr����1��/-��u��,���-�"ԍ�M�سe.�����D8�,XQP�\��D�?\��ns�I5^�l��Kh�g�`D���'pBF&�^"K�<O��M#��Z�0g�f����=��`]w=��U�X%�k�n�����:�۽#��Z��y���T���F��5`���":�G��K(��.�;h(���"�-b��T��rՁ�W�Q+Z���)�@��ƭۗwLe�����:�����!��!<fHñ �$��� ��Y�>��o��T�2c�ſ�"��`��;f���/��7� +�`,���=O[�Ǡh�Z�	���`��f=�1�9�F.(�r��<C�$���u�#��x6�;2�tK'�,�����7�����c���S2��`e܍��2�z=B��H1][Q�t��f�j΀H��.sP�d��� ؠ�J?"c�.����'�0څG)�w�˅�5�1���`���>�mr�r���7��5�]�Dї�_�3��E<�R�T�W!�����Rk8ǝ�� ���U�d��v�G%cg%����Siѽ�f/Z��w�����5C
OJ�R��Бˏ �d���-�;I$�&��B�l�QX���."e}�JN?�G���ؐ$�a��F.A]���~���9O�N�����_e9S�'hl�f��}\�0�Pqmž���C�����\���t_:h�Q) 1q0YX�;E�xS[B����T�<5,>�f�-�����E�}���A�*F	�
�����!O�r�;@�#P��)����U���Ջ3
{R{b)��� wњ�i��:IAЬ(��`�'���F������sC�k�Y��S�����F�����Fw�2���q���ܲv�s'w�jH.�{�!�%^�#uu�aq,� �� �m��L�'�G�-��f锽����dT"5��^j�LBl�h��L�M�fa~�d	֖��M4�V�b~@DSN��6J[�㼖�4��Ɔ�+9Lw�|�o��,N{A��O,P֒�r��ɝ���~ۭ�����]�[<���U+�49�g` +9Wz�5�;�<��X��~�ӢϙhCQ�J�rQ�i�]�^y��F�����{�`�`ߐ��S*\Y��U�6���*��W[�Uf�?W(�<��ܗ�����U�+ix�k�$������=�~�����{;.��B�S�����o�MHO��?[��+͒(��M��Jg�7��>L�Xvɂ��'.��^J����9-4F��/��U���D��B�*���ZH]�U��E�����ϔST�j��$G����N��>G�q��)�JF��+��O��"?��X5ۄ�:U`��<�P_�y��N/����:d��.b� �>������A�x���PE`�S��YҨ�@�Y��]�c���t<>[�h�7k����xf}ּanJ����\	�E'8��2��,H��AN����=��2�6*u�@�/W�4o�Rw/�>s�]�G��J���uՇp���X"���ze��Z4�rL1g�ePں���$ �XPN��� B>��T/'"�.���<�U��7�o���,��&�^~QW��Lc�/zgѣ���)����r!m�D��8�SnU��M���&��F�SRے�NKd<�l9���7tq��T8�q�b��೬/J�j�ў��Ƣ �G����J�mE���_��~<��@��:�GEf]�@uw�@�bNsJ�U������9��O��[I^�"�r�x������E��$c�S9������O�=��%R1��J�v�5 ݈1��K�k�����~�������5��~C��r
�
�f�Kr�@��>|i벡�o��Ԉ�S��`q$a>[��͞h�`�;l�C����YY������8�2�8ZlO��r�쌵�ˬ��M�����]��#��Qi��M�|��nl���;و����y^6[��lt<X	6�Z� �x[^�a33��34����L�Y
��a �o$*��E��*ΰ���֬Lh��N����v=�p�no��qtEL1g�R�G�sM(��2/����S�ҪE����"@��X�C��R����Y�O�>N=�E����4S�k��\2�Ϩ�}�)���FQ�΀�&Z����`&&��]@�(�aYk�KU�\N�/����ȩ3ʋ�q3�I�X�*� ��I{(��;�M|wt�z'ϙj� TB%Gb��Q�	7�s�#s��,-,�f�d6;��c�B+>V��N��˝���g��q�2�v�8_l���B��U��U準����07��e"%a<��d`���3�ad'"��|���S�E��i�p~|���6; �@Wd�
�2q{�g��ɋ��m��=hĺ\*�ܺ8�o~�a;AF���8�`A��@��)�P۹�`F%泖� ���o���Z5��qc#1�w� Hc��%���5D��V�u��isR�	z8w^EzO䝇���8��Je��q�̴��՘��B���F�"*l:�����S����pш��`�a͐e��b�[@�W�m�(H'�LOK$z"ޱ~�Fc��z�R�1@o����hj�dH.�5�$3P޿���e|�>��Ă�Jl��-�#���}*@��N"}���ǔƝ�DN�Z*�3)A�ZO�(� @�.�j����G�����eW݌ ח��:�Bw���eUU�q��(U(襴F2�B�s2�N�L?�:@���>2���WY1��|��1����֙x�ѿ��j���u��MM�D�
ۍa5�;��&�����B���Y���#��^->�m���vY�=jQc��C��e����2:�w�g��竔m#�p�����h��FG5� ���{��y!�H�AxL��?�Ɲ�x8S�r��������E��[p��m|����@M��xF�MV�1��o0�[�� v�����aCyj<�A	�5Ø�T����q�2ɷp�����i��
p���^XBmR�R��e��P	r�}o͜Y�Ų^������:�� V��s}Pثq�h꿦��� ������%�'nA�H���`GD�����[h��95�^�8��:�f��@M�x
�HHH!�|5_���(���C;���u�͓���
��^/�Ћ��7%� ���'1#���w���>���QH�iK���>�q��ȁy�O�����u��W��<���O\�Ҟ:�$�J� ��l�!�/���fׅյ�: ��TA* 2[���L���zw8�D�y��J�:�Ps�/5T�,���p;������7P��r��Mu ��Ϙ�,|S,�B�'��bѠ.��v���/Ĥ�8���ze��UWa�ιڀҕߡ[��l&�~Ҍ$В��|O��`�3��Q:����U�8�B���v�ƈ��s���xa�G����Hb'�.`ۛd��ǖ}���y���I��*9�{�ξkУ�gipr��L�*[f��2���g���G�j�폋JZ�9G��u�ުVÍV���6��� `���NumOE�4����οmYT�����d7�@I�$kR���q���c�'� �m�U���*s�m´�p��n����-͗խ�Dܴ,㼪���h��gԿ���Z}2⼐�	{͞ `��Ҽ{�w�^�F�wX�}2`��Z�̆� ��A�T���N�L��mV��^e9��7�I��@g`{~J!��QB;�hK?,$<G��3n҅�9:���"^yg��%,���Cy�4C+����j�L�fDμ��YR��q��� �?[D����άp�c#�O����3+e�����&(��m)����U�˷�`��i�i��x��_�_�:Z-@���0���-0��~�ti���>�po)�eǢ��󪑥	-������̓��Q�,2�K��X��O��H�k�z�'���<�����O�f8Dk5ĥ�ȡ��^����(s���Kj�-������o�jq�t�uGZ�u�!�J��!a���B�ɝY��y?7�.R3�lK&F����5_��y,����B�6T�򅣶k�"t-<���ΡM?Þ`�6��=��;�5��/Vz����g�D�C�Z�Ì��𡛃�q��tRΡ3=FKK�]�X�|?U*
� ��|>��&���p{b7��������5r�ܜ�r��i�~*Q�2��T6_�Ӷ��6 K�_�U�� �k��t�ɘN;
��Ei9F����1J�9�*�Jɲ$5^��J�WڈF��(&�n��'����lF���SI�|�X�2\O��(��u���ŋ�b�Xl ��P��ќ�����a��O�<��%�}���MO"ͧ�J%8<~�xd�4x�Y*1�Lݤ�l��� ���0��J��v�Єh�A��c&*��$ﻕ�R 5+P[N6��K��Ǵ������|��T �(@�>뇘���H�H�JzZ$'JГ�x��1jꦼ�����V`���q��m���"���_Z'� I�+��"����Xy�	����1c�� �/"
���	���7�(�/���-���ѭ���s�jnu�0�Bz���^_v��`������nLi�}&���Z�i�g��9�5��a\��ޛ�|�"��'og�L�����L)���S��n��i�q���9}��i��-)�C��G�":띦v�GO2�w&ַؾjo{��Y��f�GT'8@ͤ��hE�Q��x:f,�����ի[B������ZW.$d�ӽ�ƾ�y�1W�A�9�ì��;��z�@oȈ��H�>۝�DW�!�,���Y�/���΀�#s��6��RC���Ы�;��Y	��Z;���\�*��"'��q:���S�WiC�O��m8��z��٬��L��ƿK�4Ef�$���I�C�ՊI�Y�>S����l�� ��ɻ��Զ�� ����}�	z�Փ��)��3�0n �b6b�¼�ؕ�Z�J�n����Yr:y\e\2���2,���o*�b�=N�E&4KҖ�������,�������)�:�("&��r�A������D<���@W�k�E��rZ�#���/7JPz�n��V��\��[���O�wd�g�pf�0Z� Y�c�&j�}��|�D��|����)n�N[F�N��AV9����D�m
�2_��R��F`_�/�ټl��"�;	�m_ߑ.A�V���ԫ�!�-�_��3 =���=H�ɶu��{�?

��Dt������hj���i�lLT �ρ��n7�-E����ڝ��P���:��9�(� �Iq��$�]�f�p�Q�u�<Vcg�N]I�`��)��O�����blS?�������.ON5�b~h�(�Q�&����xoL#^{��<.�׹��W��x�UO[���K-�