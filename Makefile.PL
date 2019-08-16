use 5.008005;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'MIME::BaseX',
    ABSTRACT         => 'MIME::BaseX - Encoding and decoding of base16, base32, base64 and base64url',
    VERSION_FROM     => 'lib/MIME/BaseX.pm',
    AUTHOR           => 'Lucas Tiago de Moraes',
    LICENSE          => 'perl_5',
    MIN_PERL_VERSION => '5.008005',
    INC              => '-I.',
    OBJECT           => '$(O_FILES)',
    
    META_MERGE => {
        'meta-spec' => {
          version => 2,
        },
     
        resources => {
            homepage => 'https://github.com/lucas1/MIME-BaseX',
       
            bugtracker => {
                web => 'https://github.com/lucas1/MIME-BaseX/issues'
            },
       
            repository => {
                type => 'git',
                url  => 'git@github.com:lucas1/MIME-BaseX.git',
                web  => 'https://github.com/lucas1/MIME-BaseX'
            }
        }        
    },
    
    PREREQ_PM => {
        'XSLoader' => 0,
        'Exporter' => '5.57',
        'MIME::Base64' => '3.11'
    },
    
    test => {
        TESTS => 't/*.t'
    }     
);