from scipy.special import gamma
from scipy.special.orthogonal import eval_hermite, eval_hermitenorm

import matplotlib.pyplot as plt
import numpy as np

#psi = lambda n,x: 1.0/np.sqrt((2**n*gamma(n+1)*np.sqrt(np.pi))) * np.exp(-x**2/2.0) * eval_hermitenorm(n, x)
psi = lambda n,x: 1.0/np.sqrt((2**n*gamma(n+1)*np.sqrt(np.pi))) * np.exp(-x**2/2.0) * eval_hermite(n, x)

x = np.linspace(-5, 5, 500)

for n in xrange(6):
   plt.plot(x, psi(n,x), label=r"$\psi_"+str(n)+r"(x)$") 

plt.grid(True)
plt.xlim(-5,5)
#plt.ylim(-5,5)
plt.xlabel(r"$x$")
plt.ylabel(r"$\psi_n(x)$")
plt.legend(loc="lower right")
plt.title(r"Hermite functions $\psi_n$")

#plt.show()

plt.savefig('hermite.pdf')
