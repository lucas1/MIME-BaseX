#include <stdio.h>
#include <stdlib.h>
#include "baseX.h"

const char base16_alphabet[16] = "0123456789ABCDEF";
const char base32_alphabet[32] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567";

/* general purpose base16 encoder */
void base16_encode(unsigned char * input, unsigned char * output, unsigned int len)
{
	while (len--) {
		*output++ = base16_alphabet[*input >> 4];
		*output++ = base16_alphabet[*input++ & 0x0F];
	}
	
	*output = '\0';
	
	return;
}

/* general purpose base16 decoder */
void base16_decode(unsigned char * input, unsigned char * output, unsigned int len)
{
	char t[2];
	unsigned char d = 0;
	unsigned int i;

	for (i = 0; i < len; i+=2) {
   		for (d = 0; d < 2; d++) {
			if ((input[i+d] >= '0' && input[i+d] <= '9') || 
				(input[i+d] >= 'A' && input[i+d] <= 'F')) {
				for (t[d] = 0; input[i+d] != base16_alphabet[t[d]]; ++t[d]); 
			} else {
				exit(EXIT_FAILURE);
			}
		}
		t[0] <<= 4;
		t[0] |= t[1];
		*output++ = t[0];
	}
	
	*output = '\0';
	
	return;
}

/* general purpose base32 encoding */ 
void base32_encode(unsigned char * input, unsigned char * output, unsigned int len)
{
	unsigned long int x = 0;
	unsigned int i, z;
	unsigned char ap[5] = {0, 6, 4, 3, 1};
	
	for (i = 0; i < len; i++) {
		for (z = 0; z < 5 && i < len; z++, i++) {
			x |= input[i];
			x <<= 8;
		}
		
		x <<= (7 - z) << 3;

		*output++ = base32_alphabet[x >> 59];
		*output++ = base32_alphabet[(x << 5) >> 59];
		*output++ = base32_alphabet[(x << 10) >> 59];
		*output++ = base32_alphabet[(x << 15) >> 59];
		*output++ = base32_alphabet[(x << 20) >> 59];
		*output++ = base32_alphabet[(x << 25) >> 59];
		*output++ = base32_alphabet[(x << 30) >> 59];
		*output++ = base32_alphabet[(x << 35) >> 59];
		--i;
	}
	
	*output = '\0';
	
	for (i = ap[len % 5]; i; i--) {
		*--output = '='; 
	}
}

/* general purpose base32 decoding */
void base32_decode(unsigned char * input, unsigned char * output, unsigned int len)
{
	unsigned long int x;
	unsigned int i, z, rtsize;
	unsigned char pad;
	unsigned char t;
	char lkpad[7] = {0, 4, 0, 3, 2, 0, 1};

	for (pad = 0,i = len-1; input[i] == '='; i--) {
		++pad;
		--len;
	}

	for (i = 0; i < len; i++) {
		for (x = 0, z = 0; z < 8 && i < len; z++, i++) {
			if ((input[i] >= 'A' && input[i] <= 'Z') ||  
				(input[i] >= '2' && input[i] <= '7')) {	 
				for (t = 0; input[i] != base32_alphabet[t]; t++);
				x |= t;
				x <<= 5;
			} else {
				exit(EXIT_FAILURE);
			}
		}
		
		x <<= (19 + ((8-z)*5)); 
		*output++ = x >> 56; 
		*output++ = (x << 8) >> 56;
		*output++ = (x << 16) >> 56;
		*output++ = (x << 24) >> 56;
		*output++ = (x << 32) >> 56;
		--i;
	}

	output[(len >> 3) * 5 + lkpad[pad]] = '\0';
	
	return;
}