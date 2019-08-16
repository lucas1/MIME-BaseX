use strict;
use warnings;
use Test::More tests => 12;

BEGIN { use_ok('MIME::BaseX') };

can_ok('MIME::BaseX', 'base16_encode', 'base16_decode');

is(base16_encode('Tuisgids'), '5475697367696473', 'Base16 Encode AF');
is(base16_decode('5475697367696473'), 'Tuisgids', 'Base16 Decode AF');
is(base16_encode('የ ቤት ፎልደር'), 'E18BA820E189A4E189B520E18D8EE1888DE18BB0E188AD', 'Base16 Encode AM');
is(base16_decode('E18BA820E189A4E189B520E18D8EE1888DE18BB0E188AD'), 'የ ቤት ፎልደር', 'Base16 Decode AM');
is(base16_encode('Домашна папка'), 'D094D0BED0BCD0B0D188D0BDD0B020D0BFD0B0D0BFD0BAD0B0', 'Base16 Encode BG');
is(base16_decode('D094D0BED0BCD0B0D188D0BDD0B020D0BFD0B0D0BFD0BAD0B0'), 'Домашна папка', 'Base16 Decode BG');
is(base16_encode('Domovská složka'), '446F6D6F76736BC3A120736C6FC5BE6B61', 'Base16 Encode CS');
is(base16_decode('446F6D6F76736BC3A120736C6FC5BE6B61'), 'Domovská složka', 'Base16 Decode CS');
is(base16_encode('Saját mappa'), '53616AC3A174206D61707061', 'Base16 Encode HU');
is(base16_decode('53616AC3A174206D61707061'), 'Saját mappa', 'Base16 Decode HU');

done_testing();
