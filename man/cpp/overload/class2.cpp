#include <iostream>
using namespace std;

class struct_t {
   string name;
   float val1;
   float val2;
   public:
   void print();
   // constructor
   struct_t(string, float, float);
   // destructor
   ~struct_t();
   // OVERLOADING
   struct_t operator + (struct_t);
};

struct_t::struct_t (string a="default", float b=9, float c=9) {
   //cout << "constructor struct_t::struct_t" << endl;
   name = a;
   val1 = b;
   val2 = c;
   //print();
}

struct_t::~struct_t () {
   //print();
   //cout << "destructor struct_t::~struct_t" << endl;
}

void struct_t::print() {
   cout << "name  = " << this->name << endl;
   cout << "val1  = " << this->val1 << endl;
   cout << "val2  = " << this->val2 << endl;
}

struct_t struct_t::operator+ (struct_t b) {
   //cout << "start: struct_t::operator+" << endl;
   struct_t c;
   c.name = name + b.name + " ";
   c.val1 = val1 + b.val1;
   c.val2 = val2 + b.val2;
   //cout << "end: struct_t::operator+" << endl;
   return c;
}

int main () {

   //struct_t names;
   //struct_t names2("AAA");
   //struct_t names3("BBB", 1.0);
   //struct_t names4("CCC", 1.0, 1.0);

   //names.print();
   //names2.print();
   //names3.print();
   //names4.print();

   cout << "ADDITION" << endl;
   struct_t a("a", 1.0, 2.0);
   struct_t b("b", 3.0, 4.0);
   struct_t c;

   a.print();
   b.print();
   c = a+b;
   c.print();

   cout << endl;

   c.print();
   a.print();
   b = c+a;
   b.print();

   cout << endl;

   b.print();
   b.print();
   c = b + b;

   c.print();

}

