#!/data/data/com.termux/files/usr/bin/bash
skip=50
set -e

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/data/data/com.termux/files/usr/tmp/;;
esac
if command -v mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�H�dhanykernel.sh �T]O�V���xH�iIH��u(�
$�)�A !����>�V�}����m��DU!��ЫiU�u��M�&�bm��?CBv����e	Et�u$��y���>���4ܰ�[ص1)��4��a�jPU]���@�5�L��4��p�`��0g/��?�������+���E�=��>:�
"�!�31��������#�<״�R̯�@�o��k�x.���قF3<SŪ��vi>ܰ���b���7[%پSʍ�F
u��!�����s�q+?a&��	K,	�wk��Ѥ6�s��$,�M��u'��"�4p`�k�k��C��R(���� �D
/[P�	!�d-F�׊�-!ߣ����R�qy�x�1e��(�Pk� =޶i�BzĈ:�2�QJXV�.�0CH��Jj/�̪ȃ,�@�&{pP��
��)H�u��=���d�U8H�	*bf&������}0m�F�,y��aq1�ċW�o�{�����o��L�ff�?H!%6PE�_^�bYT�bQ^��6W�?�Ee�3�[*�e*�������K�T�@�jL.��P��n���msi�+,C)�WD�KB�1��	�(?��5�"6�ŵ�x�Z�.qm]���\��(�7Vntח���{�^%����]���;��|��ʶ&�E"~3X2kSW�5���
_H�ћ�G�t]�7tM2�|S�J�Gd�i(u����{֜ڑz���A��A�}�P��Q���ZO.k�R�u�]XM��f]�y}S�\T��ٻ�[0�F�z4���;��������ޜ�?|����O�z~�����G�ӟƝ�d��Q|�Ց+�]�P�.���J���Z4y,!����1�S���0i�=~CaL��NK�d�������`��|�0v���4>�+ѧ��������Cz��<\6�l����J��4kڦ�
�[h
��-�en_,�g�X�C�i��Wg���|6��FH$ο9��������%���亍#��[ο�x���ux�`���|?�u]���c�\ �NB�9����翟=��Q��  