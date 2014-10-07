#include "vector.h"
#include <stdexcept>      // std::out_of_range

using namespace std;
using namespace vector;

Vector::Vector (int s)
   //: elem{new double[s]}, sz{s} { }
   {
      if (s < 0)
	 throw length_error {};
      elem = new double[s];
      sz = s;
   }

double& Vector::operator[] (int i) {
   if ( i < 0 || i >= size() )
      throw out_of_range{"Vector::operator[]"};

   return elem[i];
}

int Vector::size() {
   return sz;
}

