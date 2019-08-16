use strict;
use warnings;
use Test::More tests => 12;

BEGIN { use_ok('MIME::BaseX') };

can_ok('MIME::BaseX', 'base64_encode', 'base64_decode');

is(base64_encode('Dobrir vòstre dorsièr personal', ''), 'RG9icmlyIHbDsnN0cmUgZG9yc2nDqHIgcGVyc29uYWw=', 'Base64 Encode OC');
is(base64_decode('RG9icmlyIHbDsnN0cmUgZG9yc2nDqHIgcGVyc29uYWw='), 'Dobrir vòstre dorsièr personal', 'Base64 Decode OC');
is(base64_encode('Peldanka şexsî veke', ''), 'UGVsZGFua2EgxZ9leHPDriB2ZWtl', 'Base64 Encode KU');
is(base64_decode('UGVsZGFua2EgxZ9leHPDriB2ZWtl'), 'Peldanka şexsî veke', 'Base64 Decode KU');
is(base64_encode('เปิดโฟลเดอร์ส่วนตัวของคุณ', ''), '4LmA4Lib4Li04LiU4LmC4Lif4Lil4LmA4LiU4Lit4Lij4LmM4Liq4LmI4Lin4LiZ4LiV4Lix4Lin4LiC4Lit4LiH4LiE4Li44LiT', 'Base64 Encode TH');
is(base64_decode('4LmA4Lib4Li04LiU4LmC4Lif4Lil4LmA4LiU4Lit4Lij4LmM4Liq4LmI4Lin4LiZ4LiV4Lix4Lin4LiC4Lit4LiH4LiE4Li44LiT'), 'เปิดโฟลเดอร์ส่วนตัวของคุณ', 'Base64 Decode TH');
is(base64_encode('Otwórz katalog prywatny użytkownika', ''), 'T3R3w7NyeiBrYXRhbG9nIHByeXdhdG55IHXFvHl0a293bmlrYQ==', 'Base64 Encode PL');
is(base64_decode('T3R3w7NyeiBrYXRhbG9nIHByeXdhdG55IHXFvHl0a293bmlrYQ=='), 'Otwórz katalog prywatny użytkownika', 'Base64 Decode PL');
is(base64_encode('Abrir a sua pasta pessoal', ''), 'QWJyaXIgYSBzdWEgcGFzdGEgcGVzc29hbA==', 'Base64 Encode PT');
is(base64_decode('QWJyaXIgYSBzdWEgcGFzdGEgcGVzc29hbA=='), 'Abrir a sua pasta pessoal', 'Base64 Decode PT');

done_testing();
