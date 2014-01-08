#!/usr/bin/python

class c:
   def __init__ (self, p):
      self.__p = p
   def get_p (self):
      return self.__p
   def set_p (self, p):
      self.__p = p


a = c(42)

print a.get_p()
a.set_p(43)
print a.get_p()
print hasattr(a, '_c__p')
#print a.__p
