# import numpy module
import numpy

a = numpy.arange(0, 9, 1).reshape(3,3)
##
a
#
b = numpy.arange(0, 18, 2).reshape(3,3)
##
b


##
a - b
##
a * b
##
numpy.dot(a, b)
##
numpy.exp(a)
##
numpy.sqrt(a)

##
a

## sum of a
a.sum()
## max of a
a.max()
## min of a
a.min()
## sum of each column
a.sum(axis=0)
## sum of each row
a.sum(axis=1)
## min along each row
a.min(axis=1)
## cumulative sum along each row
a.cumsum(axis=1)
