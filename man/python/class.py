#!/usr/bin/python

class prova:
   def __init__ (self, x):
      self.a = x
   def p(self):
      return self.a

x = prova(1)
print x.a, x.p()

