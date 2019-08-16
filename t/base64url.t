use strict;
use warnings;
use Test::More tests => 4;

BEGIN { use_ok('MIME::BaseX') };

can_ok('MIME::BaseX', 'base64url_encode', 'base64url_decode');

is(base64url_encode('<html><head></head><body></body></html>'), 'PGh0bWw-PGhlYWQ-PC9oZWFkPjxib2R5PjwvYm9keT48L2h0bWw-', 'Base64 URL Encode');
is(base64url_decode('PGh0bWw-PGhlYWQ-PC9oZWFkPjxib2R5PjwvYm9keT48L2h0bWw-'), '<html><head></head><body></body></html>', 'Base64 URL Decode');

done_testing();
