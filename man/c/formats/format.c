//
//
// 12/12/12
//
//
#include <stdio.h>

int main () {

   int value = -73;

   printf ("\nvalue is @[0x%08x]\n", &value);

   printf (" Dec. (%%08d): %08d, \t (%%d): %d\n", value, value);
   printf (" Hex. (%%08x): %08x, \t (%%x): %x\n", value, value);
   printf (" Uns. (%%08u): %08u, \t (%%u): %u\n", value, value);
   printf (" Hex2 (%%08p): %08p, \t (%%p): %p\n", value, value);

   printf ("\n");
   return 0;
}
