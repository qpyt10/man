#include <iostream>
using namespace std;

struct struct_t {
   string name;
   float  val1;
   float  val2;
};

void print_stuct (struct_t a) {
   cout << "name  = " << a.name << endl;
   cout << "val1  = " << a.val1 << endl;
   cout << "val2  = " << a.val2 << endl;

}

void init_struct (struct_t *a) {
   a->name = "THE NAME";
   a->val1 = 1.01;
   a->val2 = 2.01;
}

void init_struct2 (struct_t &a) {
   a.name = "THE NAME2";
   a.val1 = 1.01;
   a.val2 = 2.01;
}

int main () {
   struct_t names;
   struct_t *pnames;

   //init_struct (&names);
   init_struct2 (names);

   print_stuct (names);

   pnames = &names;
   cout << "pnames  " << pnames << endl;
   cout << "&pnames " << &pnames << endl;
   cout << "(*pnames).name " << (*pnames).name << endl;
   cout << "pnames->name   " << pnames->name << endl;
   //cout << "*pnames " << *pnames << endl;

}

