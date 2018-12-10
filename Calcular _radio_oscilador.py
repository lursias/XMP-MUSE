import numpy as np
from XMP_MUSE import euler_explicito

U_0 = [1,0]
n = 200000
t = 10
dt = t/n

U = euler_explicito(U_0,dt,n)

resultado = U[1]**2 + U[0]**2

print(resultado)