#include <iostream>
using namespace std;

int main () {

   int v[] = {0, 1, 2, 3, 4, 5};

   for (auto i : v)
      cout<< i << endl;
   cout<< "end of loop" << endl;

   for (auto &i : v) {
      ++i;
      cout<< i << endl;
   }
   cout<< "end of loop" << endl;

}
