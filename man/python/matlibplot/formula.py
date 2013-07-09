#!/usr/bin/python
from pylab import *

axis([0, 10, 0, 10])


# insert equation
text(2, 5, 'insert equation: $E=mc^2$', fontsize=20, color='red')


savefig('fig.pdf')
