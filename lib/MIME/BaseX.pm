package MIME::BaseX;

use strict;
use warnings;
use XSLoader;
use MIME::Base64 qw/encode_base64 decode_base64 encode_base64url decode_base64url/;
use Exporter 5.57 'import';

our $VERSION = '0.02';
our @EXPORT  = qw/
    base16_encode
    base16_decode
    base32_encode
    base32_decode
    base64_encode
    base64_decode
    base64url_encode
    base64url_decode    
/;
XSLoader::load('MIME::BaseX', $VERSION);

sub base64_encode {
    return encode_base64(shift, shift);
}

sub base64_decode {    
    return decode_base64(shift);
}

sub base64url_encode {    
    return encode_base64url(shift);
}

sub base64url_decode {    
    return decode_base64url(shift);
}

1;
