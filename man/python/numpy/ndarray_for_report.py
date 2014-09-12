# import numpy module
import numpy

# create a ndarray from list : numpy.array(list)
a = numpy.array([0, 1, 2])
##
a
##
type(a)


## create a ndarray with arange : numpy.arange(start, end, step)
numpy.arange(0, 3, 1)

## create a ndarray with linspace : numpy.linspace(start, end, num_points)
numpy.linspace(0, 1, 3)

# use reshape() to create a n-dimensionale ndarray
a = numpy.arange(6).reshape(2, 3)
##
a

## type a:
type(a)
## rank of ndarray
a.ndim
## dimension of ndarray
a.shape
## elements of ndarray
a.size
## type of ndarray elements
a.dtype
## size in bytes of ndarray elements
a.itemsize


# example:
x = numpy.linspace(0, numpy.pi, 10)
s = numpy.sin(x)
##
"sin(x) = ", s


# numpy skip central part of ndarray when printing long ndarray
a = numpy.arange(10000)
print a
# to disable : numpy.set_printoptions(threshold='nan')'
numpy.set_printoptions(threshold='nan')
#print a # uncomment this line for verbose output

