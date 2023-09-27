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

����� ���EQ��q�K%��5;��<;Q��d����ކ��x/}:_�vQ�S�D�<�}Ҹ��r��}ĚL,M;��|�F];��>�#d\WEA���z��p�/w!c(=\_�)R?���\����}@)��f�}j�n�L~�ΎO�9�"�o�$9���+v�g�E���ʿl#����c�e�	��z�(���XөŎQ�#��q`P��(�������-K��AH�_~� T��\�(�5���s'����U��IvN�}$^�qr��TA,��i��͓��~�+����;i�������|� �p4�<���,I�`�6&�[}�����|�s�>_M���"��LbΡ5;�n=���,/Ik
Å��o�煊D�18�3�mb�jT�0��fL�vȕ��������σv�_Y��tth�`���O>��Ά|��	b+�s����,�5��S������
�p׮���v���$Հ�t �rx,���ؚX�q���"2N���k�r�?����g̚4�cq,��Xe<�Fv�*�$�ʞX�n��6�,�ȚՊ�F�?M9Z�bl"Q�g��H�y���(C���"GF�	�r7C��nj_�O���%��˩����v���8V|/[ə��9G'�{ŁP"�Ó䵫#��3B:W�f�&ؑ2If��O�w	 g�9��0x����y���Y�d�Λ��AS�	���E�˒ߌ֫�tchO�^3��j�縁��^i��s���Ka��2+��FXn����fɾ^H�e:nX]��E�*��J������bjM6߂�Lj��=��0�s	�Y&�Ѳ��~�,�.T3�xW�{r�I#��t���5�(7���4�AH�Yx��܋3�|����zӧ)�<��x!�KYٿ�����Lܖ�:���
�o݋�0<�Vs	q4?�r^T'��C���l�Y������Y����88���>TI��E��tF����H0�����7��L�Y�I��mR��e���ػ���.�a���z����͘+~���Ѐ�5���.>��Y������І?�惜�!��Ʌ��[��g������+u����RA�bh�i���Ne�x^k*�W1�x%�$��˓����v
^�s��j��' �B��ʪ�^d&Lb���@]��)<��f�w4���e=𔿐re��&d���?\��$s��_���p�%��D:�g����)p?n��	��_F�#-�PY�,���Ԥ���[�8�-~Ӹ���;����@�?�N���& �D�Z��� �?��hG%;Y���kZQ�ꨇ�ɋh��ΛRh�<��R��Gl��ݴ�ҩ�H]�dY�Dr�Z]�'}X���O�,���V���^�#���d�4c�H�A�.6�$N����jNS�&D��S���󾠋�`l�v�����~0���/_�@��K��+�Z))�G e�xŔ�7��U����O�u}����$]�q���Fy��Gm�h��@n�d��f#c��Z�u��JG�[�4�O�Lp`�c�L'A�_2l'l���.e3��x"��M7�v	�c��Q�����DL�t��/!D�A'+����[A�B=�<��H�!�B�y�*(o_���8)F���fʘ3����B�F4QG�R�se�H�rA�R�bǌu��#xu��s���yi�T�	z5($y����oG�3�9��� J�����"����6!j����UaS�:4��C�p k��Bk�+^�E������0ڂ��xU��:h�R#�2���0_���Iyu�����e����k}���+�K��O�(V��\�C�;���ܬz���&iڸ�1���#eY5���1�H�y�5r��Y��91DiYF�W��c6��\9z [i���M}ٜ�p��|��J�!S@�F%�'��Q�z���$!����_�Fd���-?k�"iH����I����j���Z����J�c�2�t�O��-�vo̘������6H�� bQ��f�P�N:�Q�G8~���;��u��e��("j�1���dsQ�k�ׅ��=�"Md�� 7Q���-Gq�K/:wD"��d�EA�N<�ə�MvJ���B_�G.�l�0m��C����N���7+����q��<�#HZ��a3ɇ ��_�����{�A�;�މ���=��#��)Ҍ�;^
'�,9�,3�LB.R�&?*�T䒢��%þ=�7&��cN���~�����ںCL<_�D2�R�cSaJ���[��Ӟ��k��qI�+?��R����??����$��F��/��J�4��� ���P�1�illw���᳁W	�A�2^;���fx��m �<�zr+Ѧ�4G����(e��A�s�D�%��9��oe����<T1�I����z^E>��+$�ae��"B�N�x���CT#�3�A`�lyg�vߨ�sڠ[��nǼ�0��J�2?mɛ��o!������ձWI� ����+K)�8��Vz{[�Y鏩�'@D��?����;�������z��:�,w�N�8մ"��i~�7��`4%K��N�v���rq���}5��&�&[5}Ez�l�^��ƺϣ���7� 6�:�@A����Ȅo�\s�4��ޑ���+|���kK>��4�D���yl���_���������V��#��u��}8Ӱ�6����y��HG�7S��ɘ_®e���ݑ�zIJO���|@���	n�|&�.Tk1=���?֍�^��X�y"}z�za�< �xe���r<7��s�W,`����ٗYc�Z����^Y��5(��l�~�[j��鉛����B�|`��㧴���i�� 0�|_=>�e$�bx�	���FM%����;T�W,��[�2��� ��#U�Z�o��]`�+]��!�|�rT�;�}�~�L��;���+�^pbċ9��".y��	b�׼SD���p]�5��bN&�7���L�7U�jDr��H��7�ۊTY7�A2�_��~N��xꤗu
op�#n��hߵ��`Ӓ�39��ښ��[����P��T�B8�����d� �TN>�빈���>����FH��Xf
OA��$SP
iB<8��ֳ���8��Bn|�Q�,���Lu�m��x�$��eG��0mz��EZ*���XH�X/�`]tn�h�h�L�vA���7K�O���HduLQ�X���"l?[���(	�