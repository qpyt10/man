#include <iostream>
using namespace std;

class Vector {
public:
   Vector (int s) : elem{new double[s]}, sz{s} {} // constructor
   double& operator[] (int i) {return elem[i];}   // access element 
   int size() {return sz;}
private:
   int sz;       // number of elements
   double *elem; // pointer to the elements
};

int main (int argc, char **argv) {

   Vector v(6);

   for (int i = 0; i < v.size(); ++i) {
      cout<< v[i] << endl;
   }

}

