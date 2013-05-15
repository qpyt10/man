from pylab import *

x = np.linspace(-np.pi, np.pi, 12,endpoint=True)
c,s = np.cos(x), np.sin(x)


# set figure size and resolution
figure(figsize=(4,3), dpi=80)

plot(x, c, label="cosine")

# set legend
legend(loc='upper left')

# set axis limit
xlim(-4, 4)
ylim(-1.5, 1.5)

bar(x, c, width=0.2, align="center")

savefig('fig.png')


