from scipy.special import gamma, gammasgn

import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(-5, 5, 50000)

plt.plot(x, gamma(x), label=r"$\gamma(x)$") 

#plt.plot(x, gammasgn(x)*50, label=r"$sign(\gamma(x))$") 

plt.grid(True)
plt.xlim(-5, 5)
plt.ylim(-100, 100)
plt.xlabel(r"$x$")
plt.ylabel(r"$\gamma(x)$")
plt.legend(loc="lower right")
plt.title(r"Gamma functions $\gamma$ : $\gamma_{(n+1)} = n!$")

#plt.show()

plt.savefig('gamma.pdf')
