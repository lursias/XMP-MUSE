import numpy as np
from XMP_MUSE import kepler_2D
import math
from scipy.integrate import odeint
import matplotlib.pyplot as plt


tspan = np.linspace(0, 2*math.pi*10*365)
Y_0 = np.array([1, 0, 0, 1])
Y = odeint(kepler_2D, Y_0, tspan, rtol = 2.22045e-14, atol = 1e-10)

plt.figure(figsize = (8,8))
plt.plot(Y[:,0], Y[:,1])
plt.xlabel(r"$x\ (m)$", fontsize = 14, color = 'black')
plt.ylabel(r"$dx/dt\ (m)$", fontsize = 14, color = 'black')
plt.grid(True)
plt.grid(color = '0.5', linestyle = '--', linewidth = '1')
plt.axis('tight')
plt.show()
