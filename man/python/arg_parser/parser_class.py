#!/usr/bin/python

import argparse

class C:

   default = {'foo' : 11, 
              'bar' : 21}

   def __init__ (self, **kwargs):

      # set default keys
      for key in C.default:
         setattr(self, key, C.default[key])

      # set keys from arguments
      for key in kwargs:
         if (kwargs[key]):
            setattr(self, key, kwargs[key])

   def __str__ (self):
      s = ""
      s += "foo = " + str(self.foo) + "\n" 
      s += "bar = " + str(self.bar)
      return s
parser = argparse.ArgumentParser(prog='myprogram')


parser.add_argument('-f', '--foo', help='foo help', type = int)
parser.add_argument('-b', '--bar', help='bar help', type = int)

args = parser.parse_args()

print args

c = C(**vars(args))

print c

class D:

   def __init__ (self, *args, **kwargs):

      print args
      print kwargs

      for key, value in kwargs.items():
         if (not value):
            del kwargs[key]

      self.foo = kwargs.get('foo', 42)
      self.bar = kwargs.get('bar', 43)

   def __str__ (self):
      s = ""
      s += "foo = " + str(self.foo) + "\n" 
      s += "bar = " + str(self.bar)
      return s


class E:
   def __init__(self, foo = -1, bar = -1, **kwargs ):
      print "E ", kwargs
      #self.__dict__.update(kwargs)
      #print self.__dict__
      #print self.bar

print args

d = D(*vars(args), **vars(args))

#print d


#E (**vars(args))

E('1', '2', '3')


