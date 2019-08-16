use strict;
use warnings;
use Test::More tests => 12;

BEGIN { use_ok('MIME::BaseX') };

can_ok('MIME::BaseX', 'base32_encode', 'base32_decode');

is(base32_encode('Домашний каталог'), '2CKNBPWQXTILBUMI2C65BOGQXEQNBOWQWDIYFUFQ2C55BPWQWM======', 'Base32 Encode RU');
is(base32_decode('2CKNBPWQXTILBUMI2C65BOGQXEQNBOWQWDIYFUFQ2C55BPWQWM======'), 'Домашний каталог', 'Base32 Decode RU');
is(base32_encode('ホームフォルダ'), '4OBZXY4DXTRYHIHDQOK6HAVJ4OB2XY4DQA======', 'Base32 Encode JP');
is(base32_decode('4OBZXY4DXTRYHIHDQOK6HAVJ4OB2XY4DQA======'), 'ホームフォルダ', 'Base32 Decode JP');
is(base32_encode('打开个人文件夹'), '42EZHZN4QDSLRKXEXK5ONFUH4S53NZNEXE======', 'Base32 Encode zh_CN');
is(base32_decode('42EZHZN4QDSLRKXEXK5ONFUH4S53NZNEXE======'), '打开个人文件夹', 'Base32 Decode zh_CN');
is(base32_encode('개인 폴더를 엽니다'), '5KYJZ3E5XAQO3D5U5OGZJ25FXQQOZF555OFYR24LUQ======', 'Base32 Encode KO');
is(base32_decode('5KYJZ3E5XAQO3D5U5OGZJ25FXQQOZF555OFYR24LUQ======'), '개인 폴더를 엽니다', 'Base32 Decode KO');
is(base32_encode('તમારું વ્યક્તિગત ફોલ્ડર ખોલો'), '4CVKJYFKV3QKVPXAVKYOBK4B4CVIEIHAVK26BK4N4CVK7YFKSXQKXDPAVKSOBKV74CVJPYFKUQQOBKVL4CVYXYFKWLQKXDPAVKQ6BKVQEDQKVFXAVOF6BKVS4CVYW===', 'Base32 Encode GU');
is(base32_decode('4CVKJYFKV3QKVPXAVKYOBK4B4CVIEIHAVK26BK4N4CVK7YFKSXQKXDPAVKSOBKV74CVJPYFKUQQOBKVL4CVYXYFKWLQKXDPAVKQ6BKVQEDQKVFXAVOF6BKVS4CVYW==='), 'તમારું વ્યક્તિગત ફોલ્ડર ખોલો', 'Base32 Decode GU');

done_testing();
