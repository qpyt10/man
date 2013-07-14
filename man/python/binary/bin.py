#!/usr/bin/python

import numpy

array = numpy.random.uniform(0, 1, size=(3,4))

print array

file_dat = "file_raw"

array.tofile(file_dat)

read = numpy.fromfile(file=file_dat, dtype=numpy.float)
print read
