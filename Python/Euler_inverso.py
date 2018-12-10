import math
from XMP_MUSE import euler_implicito
import numpy as np
import matplotlib.pyplot as plt


n = int(1e6)
t = 2*math.pi*365*10
dt = t/n
A = np.array([[0, 1], [-1, 0]])
U = np.empty((2,n+1))
U [:,0] = [1,0]
U = euler_implicito(U,dt,n,A)

plt.figure(figsize = (8,8))
plt.plot(U[0,:], U[1,:])
plt.xlabel(r"$x\ (m)$", fontsize = 14, color = 'black')
plt.ylabel(r"$dx/dt\ (m/s)$", fontsize = 14, color = 'black')
plt.grid(True)
plt.grid(color = '0.5', linestyle = '--', linewidth = '1')
plt.axis('tight')
plt.show()

radio = math.sqrt(U[0,n]**2+U[1,n]**2)
print('Radio de la órbita =', radio, 'm')