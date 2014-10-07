//
//
// 12/12/12
//
//
#include <stdio.h>

int func_one () {
   printf(" This is function one\n");
   return 1;
}

int func_two () {
   printf(" This is function two\n");
   return 2;
}

int main () {

   int value;

   int (*function_ptr) ();


   // function_ptr points to func_one
 
   function_ptr = func_one;

   printf ("\nfunction_ptr @[0x%08x] is 0x%08x\n", &function_ptr, function_ptr);
   value = function_ptr();
   printf ("value returned was %d\n", value);

   // function_ptr points to func_two

   function_ptr = func_two;

   printf ("\nfunction_ptr @[0x%08x] is 0x%08x\n", &function_ptr, function_ptr);
   value = function_ptr();
   printf ("value returned was %d\n", value);

   printf ("\n");
   return 0;
}
