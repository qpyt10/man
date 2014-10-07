#!/usr/bin/python

import matplotlib.pyplot as plt

plt.axis([0, 10, 0, 10])

# insert equation
plt.text(2, 5, 'insert equation: $E=mc^2$', fontsize=20, color='red')

plt.savefig('fig.pdf')
