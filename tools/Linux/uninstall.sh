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
LZIP �BF=�j�g�z�I���,;eb����YqC�gtJ��8�<d�����Gq���	c9ΦB�4z�ߵ��[�T9N`�xf��G��;[�T�@�d6�>Ec^gs���� ��*��Ή>�J��h��	�6��'e�8����;��&��l�#3R�x��<�^�>S9�":dQ_ɝud�:WeC�ذVt���GF����x�B�uX~f]����s.=P���m��T�GƗ:5'q�[۴AZe�#����w��@>;���p@$���J��Σ��=���&�Z�Z�w���oR�'��6�0?$�`��B3f�'}�]��^7|E�HUu?��;�/i��y�|s&dD��2^��?=,%�'#(��x�4�v?E�� .�so�e��&v�*��=|���b6��%��u�mZ�����G��R(E��
/Eh�,8e�ɧ�}��e>�F�A�&b
���4o���D�L�WC�\��`-�;�B��_;!1QV��=��W$�dX�,]��g��2]}�V��e�G=C���Lb�iB";�L(|E��)Sy�ش����G�-$��0���Ř'�2�]ͭ�os��D�鷫�F�"��y8���F�r-.�!r����-��"�(����W\�a2��(q���Z�y�T���\��1���@��N�r�~���c�T��́\q�M�KCI�/�JႨ.F޽�����INm���,^@��
�h������*�Ig�}� zY����6��W�S�=��}��Bq�a
-�u:#B<q�7[^�j��Ih��1�;q'�0�x�;A=׏X/��fkT�92�
c��+oR���c�G�"�	����;Ђ��İ��r
�32KQ��z���6]lOT$��q�z-%z��7 ��QЎr�sZfL�����{0�n��yO�:i�c�=Y_1����~�}�t7��=\������>�e|g)HS�7�[D��1P~F%���Vm_�xq.�A�ȋ�������3)f��!��m9���G��[�6 ��3��ͪZrW��}��L��7��k��b�yE��d���tcoF�I�}��0�(�[Q*j�f^����E�s��+�)�9f�Y&�	BA�����w;T�`A�Zۈ=��f[��<W{��E���I��h.HS���w�ў+o.
�C^�/����+F�����3O��*9�Z�n��\���
(��2��	��IIF���rH�Q?,��6��I^�	y��}�?�-�2�?K�A���J=�>j���ѿ
Ɓ��:�}t鸇�`��I[٣�:���?�%h䭫��i�*R���B]Ѹ�.�'퉁��#ֿ8c�|�M�G�)7�r���/�%��g>k�lt�s ��7�-Y��u$cu�y�7V��	�(�l��j1�n��t�j?�4O<��:s�=���;�P�G/��PP�+D���Z,�|�����T0��T	      �      