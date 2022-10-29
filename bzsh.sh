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
LZIPm �BF=�j�g�z�I���,;eb����YqC�gtJ��8�<d�����Gq���	c9ΦB�4z�ߵ��[�T9N`�xf��G��;[�T�@�d6�>Ec^gs���� ��*��Ή>�J��h��	�6��'e�8����;��&��l�#3R�x��<�^�>S9�":dQ_ɝud�:WeC�ذVt���GF����x�B�uX~f]����s.=P���m��T�GƗ:5'q�[۴AZe�#����w��@>;���p@$���J��Σ��=���&�Z�Z�w���oR�'��6�0?$�`��B3f�'}�]��^7|E�HUu?��;�/i��y�|s&dD��2^��?=,%�'#(��x�4�v?E�� .�so�e��&v�*��=|���b6��%��u�mZ�����G��R(E��
/Eh�,8e�ɧ�}��e>�F�A�&b
���4o���D�L�WC�\��`-�;�B��_;!1QV��=��W$�dX�,]��g��2]}�V��e�G=C���Lb�iB";�L(|E��)Sy�ش����G�-$��0���Ř'�2�]ͭ�os��D�鷫�F�"��y8���F��VZ������\��~B,�N�{ۧ��⏇࣯��Geg/s��j݅
Ȗ���0�1}�:�)�x�C��Mr`�f+p��H�_�=q�5�ߑ�$F��ܧ���3]�����(V���O��	O�?�����d]�AU[D^I�ØM}�/�l&���P{�~��w~l�4��~��`D^�rL�k���%R���M��-Re��|��1��m�{6���{l�����E[h`��U����N�h�E^I�bÂ�u�v��,�����o��TJݺ�n�j��ņ��ģ�0-~J�Zϵ������W*I��~�v����P�ph~����ӯ��s��X�Vy�<�ǐS6�b��cM>�i����¤�v�syw#:ς7�:5o~�R�×����YpN�N�h�?��柧e=)��H%��!���0�Ƈ4�+������D�3,;���S�$6��m8������<��aT�4������ �x�[��z�/Q� �I%��)��њ��&�ѩ"	�{֚���CZ3n6�-������l�=��e�ԲMH��C�nΒ���ذ�l�-Rr�#w7�Q���ۅ���j�Y�������ʧ���2˪������uV��z)槣n�t�puԽݰ����ѯB��
��r����b� .o �Ēk��.�.�g��������L1��U���5C�.��i�`a%�v#�g��)^AqHiM���2�k%&PU[<�c�<τC��A ѐǗ��ܰ��SB��~�ޔD-�N 1�Be� "K���9��x�Z�	槍�0�����؁��Nҩ�G�9�;X�6�9`�T��fgC�x�.qgb�^D%�#熍0�Z�0�	^ �5o��n �KL^���Az��ca]x1�w�U��*D�0�0U��;�G�=��,����n������nT�YaۜF�/}`��7qE�����-GC��*U坟�D��˺�&�Ww�/�����Y�&I ��-�f<9F�k�W>�j��Y��b�;�6���F�d�5�Z?w�D���߾�୅����w/�+^4�\�Ƭ��ZEf?�?��Ǌ aZ7����,a�G��� �k���1Ÿ�{�c�yy�B��a�d]�σ����h�Y j��[(?&q��o2K��R��U�D�p�e>�g���\!CM��P����\�m�J��=���@�B�q�1$~��C$g~p"��6u0���^D&�1���H��w�s�Y���˽�2�~:TQ?8h~���5N��;`k�T��iƢ�0�%.��8���cɂ8�#lW�ޤ<�|��r��{Y���H� Fڌ���L��l�/ՂF ����p{�Z��f�1�Q�q��3;v?��j=^|�uV�U�Zl<_aNpR�Y'2�]�)�� c�x�Y�X�� ]�r���9?\����C����AU�i�	K!I�T�k��C�}2;��Ѽ�/�� �1��O�ڜ���)=�i!׏b�d�q7Ɔ�½�-J��q�鬤!��v���ax��4=w7��a�JCC��}޹�ƚ"¾�s��@ �H��m�u?%��T��
�(5"U�؊Y>��ZZ 4>E�.��|=.s9�V���˵��؍����&�n��ꖿl����\	Lj{�S鐷�&j�!�'����M���7�s]�� -%��vN���#Ԓr�f�騟�\�e�dc�ZJ���]P	�iM�3��2HQ�rAnU{e�	d!zΤ�ߎ;=���F'��l�EKI��f�H{.�
o�+C���C�>����f�O<p�Fj���y�B�m��*r�Nl�P�_V��&d�z����Y~z����"C��rQKM�e�p��Jt��ž�^Ѝ���B侔��� �4j�Y�w�0��^�|�������z��L^�T�*b0cPn�.���e��Eշ��q}�lT0g�\�2K�?� ���{5Zm@W�%�W�C3�Y��_���$�s��*r�����*��H2��P@����=�bڧ��#�և� h
s�6���Ȧ�1h�GmF�K!�ٚ%���o�w��}>~�톈�?x��T�"0˫b��?η�*;˅��d�����@	��?�V�{p��`W.��k=Zs!h�u�0�
���IH�$��P�)�{F�-@#{��>\.�-X_�Ia�2?X�z	�Ϳ�����@��(t�h;Q���0�\!%g^�}ni����3aC��>"'�|�:I�P�gJ�|�K"��%]�DK���r��c�l$�_�������¨���rc7�#jZV�o��1��Q���G���� =�=<�)"�EY_���R3���o��*��U[$�����o�!�G5��� ��!�ƷL|u8m�Sƍ�͈��)��G�"h�98cN,���v�&��8��.�����܀U��_��f���J��;��k�KpMAuߥ}�[c�,�{���pCQ�Muۼ-RE	mV��d��y|ݛKT��{�U^��(KJ��9>��j�?�d��V!���"@���ˎ	m�-[�/�[՛�4��M<VO]��c�z}�����ֆ%�������9/�>JH�mAǦ;K�֨�!�����Pr�]ބI:��>��L�ӍQ��$��<f��)`�����b8��c���㡣�K�Gɻw
:T�DJtE���TqHTA�Eb.O��,Z[����3���I9�p&!�1��wK+a�t��� �XN��ܕ;ȶ"et�[��v'ˢ��4���P�lD�ђkm&��=�s�� (;J}��d�:q�8Yw�)�>�V��S ��M�+�vX�o�;�}~��:��2v��v\�y�n�x ��x)Iĕ�K�%P-4��Nv���¸"�Xd���� C��Ε����té�lٹ�y�k����_��(��5L��Q�E� b`���ӵ��oӑ��76��X����Yu�q(G->Ɍ��9y}�A���Wo��Gj!��~2�����Y�&A��������4� 6��&�I�l �n�T��*9��|2�'���ɡH������9��3�#��%őH)�1�Y���A�ѠF쾉F�|E��R�uCw�RʛW�����U,�X�ش���|�*���d ����
!�����[�i9��Yft���^��h0��#c�h1���A��%��c���а1�W_�y��!z��JEj���� �"�&�:Lml��w��jK�e&����A�Jﶉ�� �\����A��ģɭٗb	_,�Ҳ��߸�!^Cc�*�v憈�I`TcI�"3�Y����Y�GJ&��"a#g���R$��kD��D��h���Yi�������a���
0z��s(N�oT ���vv]v��/��7�,�+�qb'57JM�)K����i�9M?)X��[7|�5Z/��TR��	���uY�����J�M}�W�C"fL;&�U��]��(�_�o<����`������R��8�KGJ'�L�qGm3\ُw�Rv4�멬0�#�mu�;�@2�3�>,�.�6D��Y-���0��}�����!���]��8�VJ��Ut�Z9��5�^�.wfHL�%x��#r�K_Gs1��?ߐ=^b�����6#�L ��#?��6���p�Ė+Fa�Cۀ<�g�B�dL���茛Ԕ>�u��h��S����m����`�2,߫xe��Ԓx�g�H���fIh4��3N:�C_����e�T�ŽHg���(���J_Z�1^`��������0eң駗5-�(Nb����WP�~qH[����|r�rU�ʑ:�u}-[��Z�I���70մ}�Düd��|�R�]&I�ۚ�� �.�R�$x�R	�F ���>�Ϝ+0����<@��m��:�fX��,aNf2Mu����\1����벸>�M�8�)����5o�J��ޭ�ͷP)�c�L�Y��&{b�0َYן9�M%�\���OXu�z� @���3Jx��N�R�&��eT��;c�,{�sr��O�A�Q�J�,B��Tm� Ωy�q9F��Q�Rg�@\Ŝ���O /�A�*k2k�3Ab��X�̱�LX�U+܋��P��i,�"�i�Ų�Gz6EG?��i���d�1��� �t� ������̿ҷ�_�L���í�K"2��*�c�ЋD���A|�h��+�����)�&s7(wj�y<�2V��RC6;�3iC��v�V6��� us�J�UK���_	���MM�B��S2M��%�0�X�����P'�m������*I���vF�L˪64
���#�A>&��!\eC�����W?�׿�\��C�DȰ҉�'�����hwK�]�]H��
��e�1?Ăh��]M%�m�ړ*����/��=�9���d+>��<xn��-X���:�~��|� ����F�#}ѩ��c��aG � �/p}B�0���K���2��V"�1_��>�L�����d��cg�>�c�����RLc��Fl!�O�B�Y&�qEz������R�Ƣ�}�����lw��S���"�T�e�z��g�T\��Xw�9i�$v�C�K��x�;6P�ɩyk�6!���=S�5�����c�:�y�+��#�`���饅>X��!������f�,�dTb?�Q��-x�)�Jg��/��σdztƔ�E���������\Ia�=�0c�L*~
������~��h��:
)~]��b�X�2U�a���~��Ĉc�Xf!��C<�f��:��P{�Ǡ�.E�ߦ	C���}n��J ������?#�@
#�����3�/S���pؤG-�1i�d�� �ۊ	mk���AϽ������+��Cptn[�t����"��u�ʝ�H�I��ˤ׆QN娛g���:^a@�=�s��$/o�+?�;W�8�3�j��B��7��̕�� ��`ᆢ��}!�����f�xm/�       �      