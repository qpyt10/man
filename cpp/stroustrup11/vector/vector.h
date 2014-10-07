#ifndef VECTOR_H
#define VECTOR_H

namespace vector {

class Vector {
public:
   Vector (int s);               // constructor
   double& operator[] (int i);   // access element 
   int size();
private:
   int sz;       // number of elements
   double *elem; // pointer to the elements
};

}

#endif
