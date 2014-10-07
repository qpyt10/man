class Vector {
   public:
      Vector(int s) : elem{new double[s]}, sz{s} { } // construct of Vector
      double& operator[] (int i) {return elem[i]; }
      int size() {return sz;}
   private:
      int     sz; // number of elements
      double* elem; // pointer to the elements
};

#include <iostream>
using namespace std;

int main () {

   Vector v(3);

   // read elements
   for (int i = 0; i < v.size(); ++i) {
      cin>> v[i];
   }
   cout<< "size of v = " << v.size() << "\n";
   for (int i = 0; i < v.size(); ++i) {
      cout << "v[" << i << "] = " << v[i] << "\n";
   }

}
