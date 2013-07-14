#!/usr/bin/python

import numpy

a = numpy.arange(0, 9, 1).reshape(3,3)
b = numpy.arange(0, 18, 2).reshape(3,3)

print "a ="
print a
print "b ="
print b

print "a-b ="
print a-b

print "a*b ="
print a*b

print "dot(a, b) ="
print numpy.dot(a, b)

print "exp(a) ="
print numpy.exp(a)

print "sqrt(a) ="
print numpy.sqrt(a)
print 

print "a ="
print a
print "a.sum() = ", a.sum()
print "a.max() = ", a.max()
print "a.min() = ", a.min()
print "a.sum(axis=0) : sum of each column  ", a.sum(axis=0)
print "a.sum(axis=1) : sum of each row     ", a.sum(axis=1)
print "a.min(axis=1) : min along each row  ", a.min(axis=1)
print "a.cumsum(axis=1) : cumulative sum along each row "
print a.cumsum(axis=1)
