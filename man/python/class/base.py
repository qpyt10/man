#!/usr/bin/python

class c:
  a = 42
  __p = 43
  def method(self):
     print "Hello from class", c.__name__

print "Class name :", c.__name__
print "type of c :", type(c)
print "dict of c :", c.__dict__
print "bases of c :", c.__bases__


print 

i = c()

print "i is an instance of c"
print "class of i :", i.__class__
print "type of i :", type(i)
print "i is an instance of c :", isinstance(i, c)

print "i.a =", i.a
print "i.method() =",
i.method()

print 

class d(c):
   def dmethod(self):
      print "Hello from class", d.__name__

print "Class name :", d.__name__
print "dict of d :", d.__dict__
print "bases of d :", d.__bases__

print

j = d()

print "j is an instance of d"
print "class of j :", j.__class__
print "type of j :", type(j)
print "j is an instance of d :", isinstance(j, d)
print "j is an instance of c :", isinstance(j, c)

print "j.dmethod() =",
j.dmethod()
print "j.method() =",
j.method()

print "c.method :", c.method
print "i.method :", i.method

