import numpy as np
import math
def Oscillator (U):
    F = Oscillator
    F = [U[1], -U[0]]
    return np.array(F)

def euler_explicito(U, dt, n):
    for i in range(n):
        U = U + dt*Oscillator(U)
    return U

def Oscillator_simplified(dt,A):
    phi = Oscillator_simplified
    phi = np.identity(2) - dt*A
    return phi

def euler_implicito(U,dt,n,A):
    for i in range(n):
        U[:,i+1] = np.linalg.solve(Oscillator_simplified(dt,A),U[:,i])
    return U

def kepler_2D(Y,t):
    yp = [Y[1],-Y[0]/(Y[0]**2+Y[1]**2)**(3/2),Y[3], -Y[2]/(Y[0]**2+Y[1]**2)**(3/2)]
    return np.array(yp)