//
//
// 12/12/12
//
//
#include <stdio.h>

int main () {

   int  a = 42;
   int *a_ptr;

   printf ("\n");

   printf ("The variable @[0x%08x] is %d\n", &a, a);

   // a_ptr points to a
   a_ptr = a;

   printf ("\n...... pointer = variable; ......\n");

   printf ("\nThe pointer  @[0x%08x] is %d\n\n", &a_ptr, a_ptr);

   printf (" pointer = 0x%08x %d\n",  a_ptr,  a_ptr);
   printf ("&pointer = 0x%08x %d\n", &a_ptr, &a_ptr);


   // copy the address of a in a_ptr
   a_ptr = &a;

   printf ("\n...... pointer = &variable; .....\n");

   printf ("\nThe pointer  @[0x%08x] is %d\n\n", &a_ptr, a_ptr);

   printf (" pointer = 0x%08x %d\n",  a_ptr,  a_ptr);
   printf ("&pointer = 0x%08x %d\n", &a_ptr, &a_ptr);
   printf ("*pointer = 0x%08x %d\n", *a_ptr, *a_ptr);

   printf ("\n++(*pointer) = %d\n", ++(*a_ptr));

   printf ("\n");
   return 0;
}
