#!/usr/bin/python

import numpy

a = numpy.arange(0, 12, 1).reshape(3,4)

print "a =" 
print a
print

print "a[1,2] =", a[1,2]
print "a[:,1] =", a[:,1]
print "a[1,1:3] =", a[1,1:3]

print

print "print 2nd row :"
print "a[1,:]   =", a[1,:]
print "a[1,...] =", a[1,...]
print "a[1]     =", a[1]

print

print "iterator :"

print "for row in a"
for row in a:
   print "   ", row

print "for element in a.flat"
print "   ",
for element in a.flat:
   print element,
