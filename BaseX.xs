#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "baseX.h"

MODULE = MIME::BaseX     PACKAGE = MIME::BaseX     PREFIX = x_

char *
x_base16_encode(unsigned char *input)    
    PREINIT:
        unsigned char * output;
        unsigned int len;
    CODE:
        len = strlen(input);
        output = malloc(sizeof(output) * (len * 2 + 1));
        if (output != NULL)
            base16_encode(input, output, len);
            
        RETVAL = output;
        
    OUTPUT:
        RETVAL
    
    CLEANUP:
        free(RETVAL);      
        
char *
x_base16_decode(unsigned char *input)
    PREINIT:
        unsigned char * output;
        unsigned int len;
        
    CODE:
        len = strlen(input);
        output = malloc(sizeof(output) * (len / 2 - 1));
        if (output != NULL)
            base16_decode(input, output, len);
            
        RETVAL = output;
        
    OUTPUT:
        RETVAL
    
    CLEANUP:
        free(RETVAL);  

char *
x_base32_encode(unsigned char *input)
    PREINIT:
        unsigned char *output;
        unsigned int len;
    CODE:
        len = strlen(input);
        output = malloc(sizeof(output) * (len * 2 + 1));
        if (output != NULL)
            base32_encode(input, output, len);
            
        RETVAL = output;
        
    OUTPUT:
        RETVAL
        
    CLEANUP:
        free(RETVAL);         
        
char *
x_base32_decode(unsigned char *input)    
    PREINIT:
        unsigned char *output;
        unsigned int len;
        
    CODE:
        len = strlen(input);
        output = malloc(sizeof(output) * (len / 2 + 1));
        if (output != NULL)
            base32_decode(input, output, len);
            
        RETVAL = output;
        
    OUTPUT:
        RETVAL
        
    CLEANUP:
        free(RETVAL);  