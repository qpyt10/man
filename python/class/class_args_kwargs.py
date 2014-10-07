#!/usr/bin/python

class C:

   def __init__ (self, one = -1, two = -2, three = -3, *args, **kwargs):

      print "    @__init__", args, kwargs

      self.one   = one
      self.two   = two
      self.three = three

      #for key in kwargs:
      #   setattr(self, key, kwargs[key])

      print "    init as = ", self.one, self.two, self.three



print "-> (one = 1, two = 2, three = 3)"
C (one = 1, two = 2, three = 3)

print "-> (1, two = 2, three = 3)"
C (1, two = 2, three = 3)

print "-> (two = 2, three = 3)"
C (two = 2, three = 3)

print "-> (100, 200, 300)"
C (100, 200, 300)

print "-> ()"
C ()

d = {'one' : 101, 'two' : 102, 'three' : 103}
print "->", d
C (**d)

e = {'four' : 4, 'five' : 5, 'two' : 222}
C (**e)
