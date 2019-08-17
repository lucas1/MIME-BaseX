# NAME

MIME::BaseX - Encoding and decoding of base16, base32, base64 and base64url

# SYNOPSIS

    #!/usr/bin/perl
    
    use strict;
    use warnings;
    use MIME::BaseX;
    
    # Base 16
    my $encoded_base16 = base16_encode('Baz');
    my $decoded_base16 = base16_decode($encoded_base16);     
    
    # Base 32
    my $encoded_base32 = base32_encode('Foo');
    my $decoded_base32 = base32_decode($encoded_base32);
    
    # Base 64
    my $encoded_base64 = base64_encode('Bar');
    my $decoded_base64 = base64_decode($encoded_base64);
    
    # Base 64 URL
    my $encoded_base64url = base64url_encode('Qux');
    my $decoded_base64url = base64url_encode($encoded_base64url);
