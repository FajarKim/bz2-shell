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
LZIP� �BF`�*�+��)��l
�!=�N�T/ԡ�Zi��n�@��Ҳ�6�+e��x�Ȁ�h�h邢f����ϩa]9@n���ˬ�.G|�p�2�kf��Ɲ�}�=kĠ�?�`���Ye~����q^�ݸ���(���@�_��x��k��R�쨣YP��_Fbњ�;b*;c�Ad*B�|��/��K��B���"��@(�6SS�}������T�b�������g5|�f6�*��D�!��p����/��y�6Oi_~2 n��ä���rC��hU�oן,�SЃRURzm�͟�a�B	{�r��Oz�K�/W �����6:3w���?�ys�ߟ5��a��A��	fŃ�j����1A���ID����a��3��"�^D2~c~�}@@�l�PҖ��N������ib�'y��BS��3N4�o�������?���,��W�+yh��T66F3��Y��(=��X�o2���.to/0p�E���>�c�\����'*�RG��*׉�s�2v"@�~^pc��P���xO���lQ���]�E.%�o�7���±�S�r�*86�T��1�}\��V�T�wfKY�`+6��K^�f��VJ�Vj�d����L��	��.�5�K/5(,�wl������6�5�yi�CJ_[��@�b�7}��F	������fIoc�_��B�%�����BxG��������h��m=�����E��k�Z�.z�����s�F�� |Ҍ���[��vl���$���X��nR�&>��]9?gvn��?lA{��V@�\l셊u�%���s��o�T�U/+��c>��C"cb+��s���,��o�ˆRđ8x��6��.@���M��� @�հ|hC�Y�2�!�V��	~r��AEEz.�ᐨ��Dt��mټy�b�u���V�
�%5� w�����K�D.��O�� �#��JJ�`��^��۸F M;�BM�����92�=�/CH���2z?@�!���=�<&�������U�bю��ׇ/n�T��*��#��.~M�����<\�MS� |�!�2�
}!y��[Y`vN*8�6��K�)��#=��������?T���4t��ޤ#�~aL���Pj�O0���Z��b]�H<�ڀ�m*��&�u�+�2?������R[�9@V��<+�<!�p:+��l�~�]�т�+��9��	��\�<_�ڹA	g�.�`�>,Թ��E�h��H��%�~�j)!��(t�
�-Zw��L�Gs�:������'��� ���Q�׃�AD�II@�<i���J�$ ���L�Wòc[#~>�e*K��`�VOI�8%���g��ٺ��_H�a�%���HyX�@�G�i��䒧� e]���U.ْL1��F�m^gz!�j�d(1���a�x�4�*q])�f����Ƞ�mG8�����k�,�q� �vB	E���s+��IXH]����$���.j�����!|��,iY3���IX���%���~/iV=�. �;)Cqt�[�ɗ(L$�z���*�O2|�Y�5���^�������l%��b�@<�m�#G���D)/s���T�s�|t(�f�0@��:݅b+p�8vL��_r��y�.晎��X�(o-�t���Y�/o�Vn�~Y!X#���n���E�K��s�v�6tm��%��AӃ�H<_���-������%�����-�(��?3�e�Bz����m�C9��%�`��V���`yɀ�����1�7�05�D+ث.�.
�&��D��4�↼4m�v�<��x+w�֡��ulw�`�O5
oRh���T/��=9�Ѕ�k�������az� a�_	�O��/)1�s؄����6Hn|c13��jGj��@	�}u������
K�et�5�\��^�e2����ť���;N �d�d��<�:��C��D܁�+��ԼOfMj�4���{��i��ѿ��x�m�'%���	�݅���N}��p�9��!����@a+Q����:��sYJ>Z3��?3��eD��y�O{��	�<�P?dM#�)�m����m�C"��aa퓰�=�%(l�+5���si?T�i�4F�D8�~6X�\)����f*��[�GL\ךB�;�{%q�o��3�-����欆��hpK�[欉s剨�|�Yjs�����N�g��Z�Q�O�m�+����.C9��ﴠ�ws�g���]VI��J�L5��?���J��0U�g5^���z�h!o�����2;�W͑*��h9>�	��%R☜6�d������d�v7I橞���7����#5���)���L�w]Q���=���o�b�sJQI]u�Q@���j�u~\��xiV��i���UJ|g��K���0@`�k��,g`��k�v-�:A��g9k��^�
hã�z�;�+�}�������vf�vj��Y+�+ڼT~M�ꉲ�D�O�;��sT�"	o���e�X�*�1	�1u����dp2^�/$<{��w����D����Z�������:"�l��N'�8�ڌ����Z8��*߈ ��h!�@��f^���<�D(�v�E�f��o���x�����e��}+w�����h�O]+�A��1�*{'�iLs��'���Эc8F�0k����V0#%��
��x;q_�kcP�U���?Ja�^��7Ğ$ee_b����e@ၟ\��@��(z�Կ͸�����#����LL�P[P��Ҿ+'ޒ�r��RZ�� �]��Oi���Rqt����rٝ�8Te�;�����O�?2H$`�F�6�Od-�ى.�1�҆�B;N^w��S�w�2.W�q��8M�T�ɺXl�iѕ�@���t��b���]}��<	*�`3�Gm#bL�9[�f,��+\/�^��T�m�\X���M��t����]�CU78#S�sn�O��k��w�R�] <Ý����B��d3���qy���0��ӗ4<8֊z�\��� ��҇SA�%�d@��_�N����}�˔ ��s
w��}����-Ni\�;��tE��+|�ک�F�r} �u3�X�7���ID�2#|�w=-�x.�7
&��SI�S?#����,��N���>?�����WO�Ń���C��e��
�ƿ�_�L�o��~��h�y����nq�,��F�g)/(ˮhͦ��$D:;�Qn|�Ƒɛ#������zF�.k�˕A�������ŋ4�AW�0�G'ֳ��ҥO���g�2���v qH�
u��2�f��X����.�����x� f�yt�㽵�5<�t��mYCľJ0=��r��M�$Ц��ۥQ*�;�~fQ��H��ʉ.��7���G���б�b̂�L����Y<�$��څ�XQ�7ACI��?�!������u�>��/qo�#�՞5���Y
x���?�&tG0SsM+�����0PK^Z��t��b��'���\:x��r��H[`uv#R�.zI&dN����<yEYZ3|=�w���}��4���1c�F�=��j�Φ�V=nI�?:-�ˣ�U>1/��9
�E��Gp$9��ʣ�t��qU�E���0�]��Q�:�b��qE��v��Lt!�!�?�=G��X�-�,��      �      