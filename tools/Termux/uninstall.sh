#!/data/data/com.termux/files/usr/bin/bash
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
LZIP �BF`�*�+��)��l
�!=�N�T/ԡ�Zi��n�@��Ҳ�6�+e��x�Ȁ�h�h邢f����ϩa]9@n���ˬ�.G|�p�2�kf��Ɲ�}�=kĠ�?�`���Ye~����q^�ݸ���(���@�_��x��k��R�쨣YP��_Fbњ�;b*;c�Ad*B�|��/��K��B���"��@(�6SS�}������T�b�������g5|�f6�*��D�!��p����/��y�6Oi_~2 n��ä���rC��hU�oן,�SЃRURzm�͟�a�B	{�r��Oz�K�/W �����6:3w���?�ys�ߟ5��a��A��	fŃ�j����1A���ID����a��3��"�^D2~c~�}@@�l�PҖ��N������ib�'y��BS��3N4�o�������?���,��W�+yh��T66F3��Y��(=��X�o2���.to/0p�E���>�c�\����'*�RG��*׉�s�2v"@�~^pc��P���xO���lQ���]�E.%�o�7���±�S�r�*86�T��1�}\��V�T�wfKY�`+6��K^�f��VJ�Vj�d�����#�	��.�5�K/5(,�wl������6�5�yi�CJ_[��@�b�7}��F	������fIoc�_��B�%�����BxG��������h��m=�����E��k�Z�.z�����s�F�� |Ҍ���[��vl���$���X��nR�&>��]9?gvn��?lA{��V@�\l셊u�%���s��o�T�U/+��c>��C"cb+��s���,��o�ˆRđ8x��6��.@���M��� @�հ|hC�Y�2�!�V��	~r��AEEz.�ᐨ��Dt��mټy�b�u���V�
�%5� w�����K�D.��O�� �#��JJ�`��^��۸F M;�BM�����92�=�/CH���2z?@�!���=�<&�������U�bю��ׇ/n�T��*��#��.~M�����<\�MS� |�!�2�
}!y��[Y`vN*8�6��K�)��#=��������?T���4t��ޤ#�~aL���Pj�O0���Z��b]�H<�ڀ�m*��&�u�+�2?������R[�9@V��<+�<!�p:+��e�aھ�X�0s�G����t* ��T'O�Wz���wx둁uC�V��X4�x&�k�X�q.�Cq��[�x���.�KO�����7�;��_<�n�Aq��eD�p�Uz>��Ko���SL�Y+ �N�f�8x$�0��$��MBi���/�c2��S�����R�35��-�tg��ω�b�4��
�gRx��m��F�v1�� ��<��Σ��[�x/��k����UB��(O��V���1�Mz�3[�\�-�K�^���i1�'�\<|�g���E�E�����A�%�/dDN��gQFn @�8����i����ۇ�nB��W��Z�'9%Uj#i�x,��|��eUu(���e�#�9ܟ�	      J      