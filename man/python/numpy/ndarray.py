#!/usr/bin/python

import numpy

print "create a ndarray from list : numpy.array([list])"
print "numpy.array([0, 1, 2])"
print numpy.array([0, 1, 2])
print 

print "create a ndarray with arange : numpy.arange(start, end, step)"
print "numpy.arange(0, 3, 1)"
print numpy.arange(0, 3, 1)
print

print "creat a ndarray with linspace : numpy.linspace(start, end, num_points)"
print "numpy.linspace(0, 1, 3)"
print numpy.linspace(0, 1, 3)
print

print "use reshape() to create a n-dimensionale ndarray"
a = numpy.arange(6).reshape(2, 3)
print "a = numpy.arange(6).reshape(2, 3)"
print a
print

print "type a :", type(a)
print "rank of ndarray"
print "  a.ndim =", a.ndim
print "dimension of ndarray"
print "  a.shape =", a.shape
print "elements of ndarray"
print "  a.size =", a.size
print "type of ndarray elements"
print "  a.dtype =", a.dtype
print "size in bytes of ndarray elements"
print "  a.itemsize =", a.itemsize

print "example:"
x = numpy.linspace(0, numpy.pi, 10)
s = numpy.sin(x)
print "x = numpy.linspace(0, numpy.pi, 10)"
print "sin(x) = " , s
print

print "numpy skip central part of ndarray when printing long ndarray"
print "arange(10000) =", numpy.arange(10000)
print "to disable : numpy.set_printoptions(threshold='nan')"
numpy.set_printoptions(threshold='nan')
#print numpy.arange(10000)
