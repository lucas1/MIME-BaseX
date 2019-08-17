# NAME

MIME::BaseX - Encoding and decoding of base16, base32, base64 and base64url

# SYNOPSIS

    #!/usr/bin/perl
    
    use strict;
    use warnings;
    use MIME::BaseX;
    
    # Base16
    my $encoded_base16 = base16_encode('Baz');
    my $decoded_base16 = base16_decode($encoded_base16);     
    
    # Base32
    my $encoded_base32 = base32_encode('Foo');
    my $decoded_base32 = base32_decode($encoded_base32);
    
    # Base64
    my $encoded_base64 = base64_encode('Bar');
    my $decoded_base64 = base64_decode($encoded_base64);
