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
ѣ�s��5���!�9�ラ��-� ��I�e�ᥱ|t^��N�?��m�?Z�O���pk��m����#潻(Q���p5�4�E�M�F%:u4�T���2K���D�(&<��jg8�$V)SZ�c�ae��zS��k��)��{	< ���i�K]��º蜔�/hr]Y)�0�<�)S<XF9F�$n�b<���ύ�o���i�K�u0��~ې%?��y���h �)̬Q3[I9�/��L���/��+��$a�5�������j=�Ad��uK��j� �g��k6��ٲ��Y���5@���7���~��q2 ��M�֫��$���$_���ٞ��]���oS ���B��ݩ�;Z��̯�����R����&���C�g�g��O�.}�z�󦮎��֛��)�5M x�A�u�Uԇ����d/2z\��[W��h�.��s�#[�n�Z��9D��]�z��R��%����^'�#Y���u�Թ0�ꣴHXYvBЅ͇��u���J�0�xs>�wCU��^��D>�%/g��u��)ȯ̽�{���_��Dd�h����l:�G�<0��!�7C�t�l{����u�!�؟��С0��Uu �T`v��_!�M�M��<�ΏB���aroܼ��/���b圬�Y7��"լc�.�le�}u���j�^9�u�&�X�۬���`,n�Q���ܐ?�YV��B�k`��M���3բ��ւ�w�����)7�)XN��&~P%�0�2W��&����bh���=H%�WP�Y7Y]D!�Q7�ԩFe�H��ju�uH��x����_Z�԰�_��71���H�ta�ӊw͐���0K	͟�z�U��R'V�徺��a�v�K�A�e󫼷I�Ս�bF�����K5�M��n^�if8M�'����P�ëH~���m���lL�g?<7 P)6V���at,ais�V���S�ď�<���k8
���ɏ�F�b$�BL����-+���A��<�wK�^!͟�s~s�2+�x}�����Nn���`)<L�D+*(@P����u�_�5(ZN�3�X���'A���\�xy�Rmߦ�yW���1��̑Y2�Q�J�L71��	���j��ܒ �t�ŋ`a���B����rIp�rC	kn���?��7�B��eR����3��n֘�z���oX�F�&5E/�E��:��,�����ׂ�D�=�ʥLL�����
WZX�fS���d`�#N��;#��^Sk�#|�f�YײN_%!!��V��j�$�D,։N�@�.6Z����PN�o�j�Y@ǣ#%'N�C"mjPg�}id�Vb��ۺ$�y[�%��;�	3B��&Y{!��1Ǚ��}Ao��Y@�����+�O,��E�	��٘�
h-�9>��g��k<�Fk�.��dsfHA�]��& � r��^��8��O{�gvyd��?�P���1� �!<tpI�ߓ!~�Do�Z(�#f�t�$�T�G��0t���x��ATBn\l�ٴ��r���NF��?�N�8�J��Iv�к�� ��OP'�%����8<]r����Е%�X�w'�����~�&�ɏ�����`>�Ь�d�Ҵ�����ag��1�����=��%ʣ��S<z^��hm�g�R��1PQw�������Eq1���ްf=��i�MkUz��qJ8��9L�$��M9Tc� �m�m����%30q!fK��+���EU�z��Ro���~U��<6U��f�lI��^���n҈�̸��]���#hF,�u�s�v�y|Kz��S���a�����}3x�~�䟘sR�p�n��q]��#O���^hb����}Y�f��ST�@���ȕ�s�#�˥l�EM�q�Vb�>��, �_')���>�Ƈ���0���yƔzp��2�����<V��>���Z�|��C,[��nU��!���X���q�9� ftcg�{;t�&���idYwf��b�zy4�C&d�g��î����i���$�[s�ߺ����IrDa;Axu8p��9R4���7��σ���3�� T�]2�	ʸ5��6���~�e74��f�L��$<0.r��g�����s˦��韊�s�I��Lp&-��it�q��f�,�9���aw�?�Z�'w�Rk�M�f�P��|�"P�ͥC�����\m�T��N�;�Zʁ�7A��MF�N�sxr���&�(X�S�X�Y�<4�}�	,�$#Q�noI�x>o�Տ�x�{�	�I�l��iֵG'�I�)��AA����`mݟZ�:�&���1�}�ĎQ1+%w�[\P���$����z�5z�L�ݿ��:�!��ѭ���u��ڟ/�~�Zl��4�$�6�P��N��Gq�+q��P£sMr{� @����	�V��l	{��u����׾���N,M�w�X�}<+�Kѿ짾�����L���/�e��Kܛ̖�r��t��zV;��n"&+��=� i�ZZ܄	S��D?������B�_��L�K��朗���b�zv3P�و̝�4n��_v�._�Z�H�˱K��]�{�1b~�~R������M�Աh� �K��⮏fVֳ�r�C��RӠ��� <���Y^�:�ob6K=
.~q���:*ظ/M��I��*7�@�OF��G(�����:����$5�m;��5v�g�-��]�җ�>^�]�^���&�������l�*��K��Ȫ}$?�|��z�Ɓ��9uш���g~��o�+�9�>Uф-�(�ʊ*;��M듳D̡�ֵ��m��ߑ�"��ǅ`
C��#�ı�&�"������M���6� 24���s� ��Y��2;�*Mp6�u��&�j!��aǤi�����!�EY�^{ӽ�`�����2��Rܓ�I�|$��-ʗ�h�U[�н\ l	=��4�mZ $Ї��,�`��*�[Z����K�HG��E�d�ߏ�(��@?c S�(��?L4��qn_��$pܧ<O�a-[����B�4pV��R��n�X���+���,H���˸SǪ--A�����&*Gh1}�&Uo���/��$=)��v����I�����/�d��m�T}헜���,o�p|	�ZjJz"�kS/��q�P��j)��
��/�d�
��c�m�QZ!Ŗ6N�2����6�p�]C}Ȁ����>��x�q��6��OP��[m!�jހC�@gb���8/���DwKH,���q���������d�=�V�,W,]N��=T��G3@8�-�^k�W1�$�������5q5U�"���|��{C/�VO� ]S��lX���ѽ��������=0fMA/2�b�Qx����;0�������0[�N���,���Q�N%kYF���$z�7���&h���*�h\�B^�_�{'<�^ݎoz���w��9�S�
���}�� ���߻I-�7�e5���� �t��i�B%c]��&�4!��`��"�QS_�����D,z�d��Ȃa���ؽ�
���B�83;�����v��cpA^-�#��&�4�;f��U�Q߿=牲mA��3WU�t8�	��n-�<��.ؿP.{[&�&�|˵�f~S��%��