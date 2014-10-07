#include <iostream>
#include "vector.h"
#include <stdexcept>      // std::out_of_range

using namespace std;
using namespace vector;

int main () {

   Vector v(3);
   cout<< "size = " << v.size() << endl;

   cout<< v[0] << endl;
   try {
      cout<< v[1000] << endl;
   }
   catch (out_of_range) {
      cout<< "out of range !!" << endl;
   }
   //v[1000] = 0;

}

