#ifndef A_H
#define A_H

#include <iostream>

class a {

   private :
      int _member;
   public :
      int  member;

      a (int pub, int pri) :
          member(pub),
         _member(pri)
      {
      }

      int get_() { return _member; }
      int get () { return  member; }

      void print () {

         std::cout << member << ", " << _member << std::endl;
      }
};

#endif
