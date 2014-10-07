from scipy.special.orthogonal import eval_legendre

import matplotlib.pyplot as plt
import numpy as np

psi = lambda n,x: eval_legendre(n, x)

x = np.linspace(-5, 5, 500)

for n in xrange(6):
   plt.plot(x, psi(n,x), label=r"$P_"+str(n)+r"(x)$") 

plt.grid(True)
plt.xlim(-1,1)
plt.ylim(-1.5,1.5)
plt.xlabel(r"$x$")
plt.ylabel(r"$P_n(x)$")
plt.legend(loc="lower center", ncol=6, prop={'size': 10})
plt.title(r"Legendre polynomials $P_n$")

#plt.show()

plt.savefig('legendre.pdf')
