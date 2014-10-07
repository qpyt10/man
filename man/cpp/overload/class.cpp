#include <iostream>
using namespace std;

class struct_t {
   public:
   string name;
   float val1;
   float val2;
   void print_stuct (struct_t );
   void print();
   struct_t();
   ~struct_t();
};

struct_t::struct_t () {
   cout << "constructor struct_t::struct_t" << endl;
   name = "";
   val1 = 99;
   val2 = 99;
}

struct_t::~struct_t () {
   cout << "destructor struct_t::~struct_t" << endl;
}

void struct_t::print() {
   cout << "name  = " << this->name << endl;
   cout << "val1  = " << this->val1 << endl;
   cout << "val2  = " << this->val2 << endl;
}

int main () {
   struct_t names;

   names.print();

   struct_t *pnames;
   pnames = &names;
   cout << "pnames  " << pnames << endl;
   cout << "&pnames " << &pnames << endl;
   cout << "(*pnames).name " << (*pnames).name << endl;
   cout << "pnames->name   " << pnames->name << endl;
   //cout << "*pnames " << *pnames << endl;

}

