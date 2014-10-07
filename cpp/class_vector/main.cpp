#include <iostream>
#include <string>
#include <vector>

using namespace std;

class class_t {
   public:
      string s;
      int i;

      class_t (int j = 0, string a = "default") { s = a; i = j;};
      ~class_t() {};
};

int main (){
   class_t a;

   vector<int> v;

   vector<class_t> vc(2);

   cout << a.s << endl;

   string stmp;
   stmp = "new";
   class_t tmp(1, "");

   //vc.resize(2);
   vc.push_back(tmp);
   for (int i = 0; i < vc.size(); i++) {
      cout << " i = " << i << endl;
      cout << "class_t = " << vc[i].s << endl;
   }

   return 0;
}

