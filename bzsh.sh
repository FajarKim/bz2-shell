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
# Copyright (C) 2022 Fajar Kim
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
# along with this program. If not write to the Fajar Kim, see <https://www.gnu.org/licenses/>.
skip=77
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

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
]   �������� �BF=�j�g�z���a�HO?Hz�_��*���@�X�נ�����Y;�耻mJ��Hp�H,*�W�pt|b��,��+�d�����C�k��p������nh(�0@T� �&VM�c[XDR�y峬�+:cw�*��o��2��x	RB:Ny�*<���ٯ�X�W����)�Q1߫��h�v#����Vn�\�p'HA��yhq�@����_2��<{a�����{ϔ�:����T�����O��eΏE�!`kt7t��<�	=Z�!��(ԪW\VDn�����C��;XK��ݠ;9��5o��"R}?e&HK�严�"ۍ����c����!x;֡���25��\+���\&}��L*č��.�	���Z��O�@@��S^�6pFyw԰�9�f�M��sYy8,K��z�g�*�&�l�;=O���Y=��O����-H��*��2 �7�O`�><DJi�)@\dX���|#��w�Չ���A����"��,�����iX,�$H،�QXT����nw`�8�2iw�>�FBʜ!wGB�ZJ�g���T���1�Q��)��0 ϼ�5;�ts�����K��3ҝ ���߳���۽�NF���`�O-���eh&U��x�B93[q:���Y�w�4��6>����ױ_Mo�/�z�0��� 21��d֊�Mƫ��kp�]�t�.�בPD�k��"�?��X�<�	�<-i,vҳ�Ć��"�[*�5�I�����/^�O�ٳ�n� 2�OE�U{�}��`	_z~W�+���T0��c����o@�vTCv�r�)�l+�H����G����q�s#Rz�Ѯ���g��7d�xˋ�]@�>�в{c��!G]�K�hw9d�g���r�Xv��3Z�04k �4��A>2(z�\��d�gh��L�yY#�.Y��G_�tD(VQ��ɺLW9���qL0�A�cU�F����R�������61�*3ih��C�x�g��P�x$���־	=�de��է�3ꯡ�26����)_��\�Q�$Sdb7-uH��1hGz���� l:���Z�8Z�.������E:������J��������w�P�؀;A2@܉r�"�����f��^3
o�4�8�O�sz�aA�=�vT'�z�P�th%��q����ޛ�/]Q-mAv&���&���T��R9`���lV2l�K6�Л����-<�@�����Ƈo�#�?��s��99"3�x'J��v�=�
S�Ly��O��%���
!!<u�i�.*�D"Βq�,I�������ĺd�m�^����=�`�\�ww;)���y��|^h1�
�,N2�rD�3��'֯0F����}SȁC�
l3�c�VgSb7����;��3d�^�*o*
�-	֊��X+QG�:$]�pQ"��oa9�Ű7��B`S]�.{q�fb���JlZ��^�Np~�x	}��g�c���u�	z�3Td>�����~	��`R�1��6�a�ф�۲�O~�1�i���� ����K+�)/~�u��O�9 ط=gsGZg��qI[^'2�;�&�ʉ��t��kے
��r�wS車�ܗ�.�TW�V�t[�9 i����5�^dӞ.��16Zx��?�{�"��߭-&����[㾽H�k�=ٳ�?7�.�?qJ%�f6.%�J�GR�	P�w��4<~�w�s�G���$�����&��_l� ;�<�F�����:�ΕS1 6 }�����D y���J��F���\^��/i�f���|ݓ�,/bN�R�'������Zm�L�.�T�,�:����p��>Z��V�5�P*VB�
�EU$^�8=>Cz�'�٦Ի��y�چ�>�	�q�CC�|6O�D��������w1��zn��ܮ7L�@d�=�H#}X�!;�ӳz�zt��ֈ�<0�̗��$9�4��:bz������B�W���̐�T��Z�g�G�|An�[��i����*OSy`pz��9��0��k����M!�A0�+p�{��]�k��.$�m�o�;����1]l�,p'7�W�<*��џjΠ�z��&3�U�t=�O�Ajd�Ef`#+��n2��<���T7��fN;o�cG�R�{�T�੮����(s�SR#�F\�*].�p/�mI `�������H���q�w.I�^���pO�6){7x�z��́�0�J��~5�,`_���)�p)�g�h�X����99�(������ND8�������Q5������pGg���=қ:߱�;������"��	���䍼�������
���s�^�\7wX�&�b4�y7%��&A�5� �Z ZCm�n�~��`���@ �,){�4�}l�-��[B��D�#W���7E�I]^�4�}"�*ʸ�(��譼'm(A��������!K�ɯ�lf���W�R��-�c��� `��BG�ُ���M!7��4�&<JGR�pI��;[�D�9�B��a�I�gg�]>������y��Dfn.?�TvJ��vR�G�۴ Of��K��iN� ����_-ccT�6�V���(�e7�N�^+JF��:�?3�˹P������@�H��؇��j�����r��'��r�rq	���˾e���m���L/H���f'Q)y��=a�Jx��e���\���\ �
7�7d%a��#��V�;'J�ε�
���8���5�C�-���`�L�1�A�ӣ��xl ����7'0i2@u�:*�8l�)�y��d��<U�_�_R�E1.f��
1��C軈��(<�
�)��bğ6i�s�����`��o���DGx�F�Y�V-E-�����L��RM2⸠	:��RwĹֵD��:�P��-2�D�X����['��i�l�(^yŷ��C!?<'I�8�'�������a�ͤ�ԃ�S^$��#��YX�����Ѓ�RL�]k%�T3z�iS��J�]F�*�%Y2�ׯ9c�����X~$��1ثX[[q&Gwnf�5�{��x���J��UF+�Ѧ �B:�kݩ;ĭ��J�!ȔEB=��u����L��H]�Kx���g-�[2�Э���	�r��B�Z=�Ήe��R[�����`�z�*P�r��'�7б�\0'd&O\c3���k��~]�?��6�1�-A�p�i�f���Sܟd ���K�Ƙ����>Q�pS3�S>�o�Dj��v�Ѱ�T���)��i� ܘ����[n�� a��(��	pûzۮb
v��͛�B�̑�CO��C��:1�v�`}d����s2]w���/��u�m�_���P��DgZ=H��~�%֔�s���{��2��<؎���:���n���\'�U֬��*�>~��L�;�zHh,�}��h����烙��]�;�����[���R�!
��yc/�tp�q�۹�=g��Y�I�DN���Ot!U7���j�8�I�;�|�\	J���;ovsN���W�'%b��_�7�H9��EpG)�G�xXj��V�r@}�.��N�OU��,L�ԋ,�@P��3en.�e�	FC|n�{ɰԸ�� �����6�[�䚇=�;n}�B�\�pe$���m�~�C�7���G<Fi(�`c͈֭Ҡ��F��&"Ɣ��u[^�ɗ���Ƃ�W�u��6���V�8�R���Ѥ�ү�7 P��9FoM��_$�]���Ւ�"Y�;�8;n��>�<~���ȧ0��AU�P��|�`}!y���
()��0�*��r�3�]��g��F�<���r��r���/��0�����������=a\��?��&T��Z��
&.�C�&�j����8k@MK�	F/�}9��7MBVa[�9��<
�`c�2���>�}�;K��JSl�5]���~.]�[;ow�ɹ�2�2Y���q3]�8�X�	_�Iv��5 ��Kǂ�O�����J[����C6���1��Q���k��>�#�KJǅ@&aRm32��U��~��w�	�t�����
�SS^���������'�n�F�����c�ɧ_53b����✣HD�f��U��ɢ�6�*!�v��s������t�*�vNG(q������?T�N�7ر�:bG=s�ߖ��Ѯ�ARmO8��ϫ�ZcM��>n"���y(����HF�"X�	]lJ�  ���y����3s6}�]��4쭡C���ٜ([��&'��b'ۖ4�&��+��3kv#|F�~#�9+e�fr�Q�j�=�S�	&>�*qI.�say�{#�g��@�V;�)+ H����B���� OȀ8��&Fs76�)2�&#�Y������s [�Feʥ��
��` �)l�r?eJ]�C'=��C2݀�ol�#X8>0�����,��Q�����}k��}8
Bbhg���b���FM�-���1c�ژ�n�����1M�%�c|�~8A�QH�F�/�5�9��� G�OC6��L�:�mo�y�T��^�=>d�*$;�"�}?^������|)�׏���`M5�>��ۣMhb­V�u��c}{�[�yd��^��a��[�bL`�.��V�c$������6�{9�FvZ�,p�j�H�"����l������[&���"�,���)2=��m�o��	� �o��V'�
��17]��ɺZ����y�iK�fІd�3\��ݝGU|�"��o~w7�M�&\�#��Cp�V��w8�6��_x�i�� p�4
����6G	�kE�p��E徃ê&FŏsQz��/g�'R�%���3
���[s T�oM�{ǔp�$6x6�lp�_s��`��<�z�K�����ϙ�� ԰oꀭ�B2D����l��b3`Y�����S�䄛��\ʘU$�vâ0����pЅ��@:f����4D������m$M�{;ɑ�>�����z���V���ˣZ���2{�G�f��5�OJ�zo��*vWq���sU�Y�X�l�x#f_�ܓ�����"��'�'@#Hh�����44@"���Md�<Ѧs	�Ɋ�Dȵ䬞p?����T��p�]Oq|�@gpI���ދ���Qu�ధy0�z�2#.H����%I�F^�$��f�}6`�Kj�'R=?ٔ|���9��]��e�S���Uԓ�����
����M/�g9�>����T�p�q��}B�-i�<�X�M6�@@�G\����Y���z�y��I�`r׍=ŧۅ	/�g�[�>�9��v/J;�ӯ�5�eQ6(�WS�Ö��ɶ���'ZEh89�o�O���ޛ52}��`��Ɇ� ~U��o����m�����6pC��S2&�uGA�k삌�@ ��>���-Dp��
{�0��.�h��"��w����s愊�[U�L��"��-a�\S���MgZ� �N��ϳ��>EZ��zf������`0q;�kM�b�"\�I��˱(��3Z�#�`"w2=}=k�8Ǜ�
�ب�¬�(-l�b�Pk;_��t0��Y���jI�Ap�h�oo�����>(�cCvT���5%\�ߺG&���0�92��|�0m^���c�)JH~�4����}!
��;���-%O<�`�oS*�/���T���a���S��E%c�ߺG�u�( �o�w��j޷�E�A��u�ȃ�%���s�%<˔;<_������T�&.Y��3��)*�a�&�v�m���zՀeo�ֆ%�=Du:T@�~�����ƙ�m���>�X��SP�Ƕ8yIX%��1�<�cŦ2�� K�B6�3�9�m� �Lj&�ϣh�tH]/�ϝf��8�w�����>�x&�p��r��}5�HQ:�H_��򠨚�D����(��G�v�zn�,޺�o����Ѻ���;=W��g 7����	�kEn)����sBi�_�߄aH��w�I���kH�������6Rn>V#�p��&~��0	A-e�}��,u�TÞ�\��@��H���j�O0��̲G����*�󉳊E_���������� ��������������!��	3bCF�
�b�6�B��Ns��"r��Y���&���W�X�Y�o+��Ӽ]�q�s�?�uX��զvLZDp�.r��ի
�Ns�GT��x�e�>2�X	�Ԥl��;�,����89��υo�C-
��.UE��3����"��Q�-��ס��0ŗQ���� ��ăQ`���h� /$��~
b@遪��p�os3��˃W�$��;����kH-s��A�`�H�铵�w�ҥ�0�)�4�HҊ�#yg����u���!N�5
���j~�����{GJ�����Yy��>�VNF�@��'Ī	�$Q3�%��6H��EY�[*'�	T�+��h�_��!��ň�5���a�5]<Ɇ!�b��tI6�+ǿc�A�PE���m�s������u��^��G�['�������g���m��
��!��v�ٛ��+�s���)���b/L���T�xj&$��,����y���B�/&,�xtf�[s-�2�5������ z�����t����a&1�KXt�}.�~�Zi�j��\�?ؖ�T�I��~~q�W���ʡ��5e�6G�\*��}�?���Bs̞yJ<ྣp�=�-�8���e��CL�S�gu�C��� q��H��" V?�&�	�Q��"�I�����qyu��jUZm�U��E�ƊW<N٢�8���xZ�N&@eJu�U[��w�;#���s4ɬz�=�qMR�:XJ�di��'�1�t�eA��?�Թ�N{���'{�<@15p�������$���ǆ��D���*�'��{\C
�E�"u 8z��rCPZ}D7�������tn��ĄZy��@p�(�eI���)Nb����#���2L�5
��6Rd��H*�Y1cu��j�w�0�M�ӥ�~5-EYNtu@�������)�7� �\�H��
��a2�ixj����8=�私��+<D�5d'y��r�6j����P(@?�Ui��դ��Au�������l�8$�tރ~P�O--��X\2��¶��Cވ""@@	i�엎�j������Lڂ#?.*��Q�E���5���/9zb�t�=6�r|�n�h�Ə�0�Y���~:@��m�suAR��S��1������Z;v\�mJ�5u�!٤DQ��M��G՚S�Oo����=m
s\����f�tw f�Sh�Ȼ��v^-�ڋ������D��3����P0�l���)\�qm��p������������i�� a9@E��Ç�o���a�e��bv��[ �	6����%8%�q�~���&�\���J�� ������u�$c��^�op'Z�&�g��X�=����e%/�x&c5G(T��Al&0�b�y
4��q�����wD|��[ �Yʍ~s�����E���&}�n[VžA�=N�[A�pXz���KK��׏5;ga�J=�bOp�$7a0�9�8�Q�h]�;�bb}�����xCD>�~D�ʣn�F`����v�&�5���yآ�=.�N�:�Y�v�eV�_�+2�*3O���:��}I��� 0��x�+�f?5xj,ỻ!�@Ų.��Yj������6z8�Ȍ e��I�K�z N�Թ��uc�������Lz^t�$>��-�����0��QlA
D�L��(��.�(C*h˄�TM�n�d�k���HՃaˉ{�����P������՜E���'����7��ʲ!�e#Ֆ!x�xx��ge"o����P6|7�9��)���9�}ԫ�T��{�c�w���^ݸlD�-�������e