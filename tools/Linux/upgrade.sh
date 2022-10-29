#!/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

lziptmpdir=
trap 'res=$?
  test -n "$lziptmpdir" && rm -fr "$lziptmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  lziptmpdir=`mktemp -d "${TMPDIR}lziptmpXXXXXXXXX"`
else
  lziptmpdir=${TMPDIR}lziptmp$$; mkdir $lziptmpdir
fi || { (exit 127); exit 127; }

lziptmp=$lziptmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$lziptmp" && rm -r "$lziptmp";;
*/*) lziptmp=$lziptmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | lzip -cd > "$lziptmp"; then
  umask $umask
  chmod 700 "$lziptmp"
  (sleep 5; rm -fr "$lziptmpdir") 2>/dev/null &
  "$lziptmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs <fajarrkim@gmail.com>"
  (exit 127); res=127
fi; exit $res
LZIP� �BF=�j�g�z�I���,;eb����YqC�gtJ��8�<d�����Gq���	c9ΦB�4z�ߵ��[�T9N`�xf��G��;[�T�@�d6�>Ec^gs���� ��*��Ή>�J��h��	�6��'e�8����;��&��l�#3R�x��<�^�>S9�":dQ_ɝud�:WeC�ذVt���GF����x�B�uX~f]����s.=P���m��T�GƗ:5'q�[۴AZe�#����w��@>;���p@$���J��Σ��=���&�Z�Z�w���oR�'��6�0?$�`��B3f�'}�]��^7|E�HUu?��;�/i��y�|s&dD��2^��?=,%�'#(��x�4�v?E�� .�so�e��&v�*��=|���b6��%��u�mZ�����G��R(E��
/Eh�,8e�ɧ�}��e>�F�A�&b
���4o���D�L�WC�\��`-�;�B��_;!1QV��=��W$�dX�,]��g��2]}�V��e�G=C���Lb�iB";�L(|E��)Sy�ش����G�-$��0���Ř'�2�]ͭ�os��D�鷫�F�"��y8���F��g�Ot,,z��W�~�0�5*����JW\/�M�[�t-�n��n�^z}N��A�qF�Lb5Dpu�~��Yӱ�窢�g�.���B�œ��Ð��L8�?�R}0.�D�D�*��ˏ��G�#�"CU7y�_Y}��m�����w�4OZ��DhX/	���z>�	1�ҙB���12k�tv��IYlrA�c���<�yBj�<k`2.��^�h�����@��&nosI�qy���3�d�070з��p�o�HZt�
���Z���	���he�T!�G���_�l�O:$l���*l>��֦��ޯ�H�ڋ�1{�/2������Uy���V�� ��?��EۚP�Sg[D��(�D��ϾR�9p�	u1���ݎ]�a�}�I߅-|a��	�3�ݮHG��^������Im�4���5�&�n���6*�b3U�&��AJn_Ӊ����3��[��3̦�|���!OpmvM���� ���0�Ϡ�>>�Γ-E���(O]z!�*�W��Bȭ�����\<����SZ�/!�ӂ���4D*�-7+��e�i~>�? � ��l�s��cY4�Y��Ƭ�Z��gf.�B]J�|h�t2�6�MȹGm�����V��+�GTc0����-x�K-�%=���e��g�3z����Y�u��˞2T�S�f�Zu����i��_�� I$�o�Ѩ=.j	��k��r��Ĝ��b�H�o�������)� ���l錫l%보�NA�"˲U�G۠���e��Â%�;}���~���a��9���`Q���K�qN��_�=�||z��� "��� 2�#�����N�j/o/���p/�*������+ij.�����Rpt�'��i����A.��Tq���B���%����4�7��V�y}T����SY������
B���Ց�ޙ�BG����]���?ˁ�Vţ����b����Z�U~��2^$O��C�^)KN���q}'VVw��m�}>�nz߂y�V��`A�r�A{&���E���S�,���V8���.�����RP+��5���^=�;�Dh�\��7��˼��d�V�EOs�}-
1=f6��ٵ� �8��7��)qjA��^�C�|ņ�#�'��G�8?�����0K�R���o/e��b�D�E�P�����l�C%�����Q�����"��|�TJ����0�"���֜H�љf�����am���O�݃ݣ���J�l.���U���}��UÊ!0�=˅8�Bd�N���3&u��B|�6
�8��=�Yڂ�,�a5g��݉�f��&6�u��B�m�nPă�R\���ĆA�ǿcw��4u<��E<Ք6����LS�D���\�j�0T����"?'��G��G�b����R%d���%�J-�$vc-e0o(ɸ_H�D4tUFAL�j�3}8��	O��]��[/�Č�2���l�o���#�sо�8F������9۝�q�SN���|�4ᕄir�s���	��F����Svq�#V���$���3I�%U~>�`�ā���L�as���#���U��3�}˅z��]�,̮!�f�X���:�X38{"	=���"��T`���&s��p<�҈`���W9�Z&7��ލ���OR�E<z�*b���u���S�Iu�;;���Sv_Λ��i��)O��K�Lu�n/I_�����k�6�a���
�h���^��Ԛ�.������[�]�O�4v:<*�W�&��R���+��m|�l�L�TlyԠ�f �rfm#,�1Òm&ϾO˲1c�̜�����~K�&��_��q���G���E�RH䉇*؜ׅF��� jH�F\q�d��1?Ѩ������3!���Z.�	�-(�>	�G�4�N4���^'�/q��4&��I�w�C�T��x�]DZC��I���+Q����N����H'ؕn%sf����;��.ز�
��Z�x}p8߀�c��3���mՊ�D#�x�;E�(�= ��Xu]�h���n#��\a���+J}�Z��<l�qP��Fۇ)|� w��/�*h��J>C����Dd7<��A�/Z�S���vN���VAJ�"7���.k�t�t�EE��K*{`���_���l�J��������6#q����V&2�U�n��Fu$X���>��Ʊ�b1A(o��Q[)wށ���3��ܩ[��/�H2���ӏ��-��ȱ�Cr|�{aR������*
4`�5�].|활�O6����Ӱ������*a��aʔ���BŤ�בXOX|ĭ��x�=�3�9�BT����z��><�;����m�ye:�0��b	�wr�xF2�O�7���[�:;����O� ?kʆf�܎$D�5l#��5�h4�8���WQ�m \�ŉ���Z��2��Y	DOXSA	97��7L!0��8!gJTDo�Y2��&g���D��0<��Yyˆ���E���#y̭D[�,�3���w@��]�pK4R� �a�����9�B�h ��&�a�$W��BJ���^��p��m�4�gq�^!�R˾����FʲT�I�vB�ƟvC����y��_�y��Y#�ġyf�sdW�N��OtG=Զ� ���]���G�_���pZ��=�q�5�>S�l�p�����û�tdQ�FA��������\��ZIu@�<vL�����Y����T���?
z�0>��?6`���l��Ʀ��X��`K�����?��;@���d-Q��{�P�')a��+>��H�I�ʁ�n[�Ҋ��,�D��,i��pƹ���z�G�z���HÍ��������p/[1
3X �ٿ��4Ժ;���q�+�|�r;�t�������9����'�|�J�ǻ.�wx��kM9z�M���ॡ���wR�V�~?���ow<'ÙW;��}�5*16k���*	7�\            