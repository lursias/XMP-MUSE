## Import needed modules
from pylab import *
from scipy.integrate import odeint
G = 4*pi**2 # define G for convenience.

## Set initial position and speed of satellite.
# Compute and display some values for a circular orbit to help decide 
# on initial conditions.
Ro = 1.0    # Radius of the orbit 
M  = 1.0    # mass of the central mass

v =sqrt(G*M/Ro) # v assuming circular orbit

# Get initial position and speed.
print("For circular orbit of r = %g, and v = %g." % (Ro,v))
x0 = input('Initial radius: ')
vy0 = input('Initial tangential velocity: ')

## Set initial conditions and define needed array.
X0 = [ x0, 0, 0, vy0]       # set initial state of the system
t0 = 0
tf = 23000
tau = 1
t = arange(t0,tf,tau)   # create time array starting at t0, 
                        # ending at tf with a spacing tau

## Define function to return f(X,t)
def f_func(state,time):
    f=zeros(4)
    f[0] = state[2]
    f[1] = state[3]
    r = sqrt(state[0]**2 + state[1]**2)
    f[2] = -(G*M*state[0])/r**3
    f[3] = -(G*M*state[1])/r**3
    return f

## Solve the ODE with odeint
X = odeint(f_func,X0,t) # returns an 2-dimensional array with 
                        # the first index specifying the time
                        # and the second index specifying the 
                        # component of the state vector

x = X[:,0]  # Giving a ':' as the index specifies all of the 
            # elements for that index so
y = X[:,1]  # x, y, vx, and vy are arrays that specify their 
vx = X[:,2] # values at any given time index
vy = X[:,3]

## Plot the results
figure(1)
clf()

# Plot the orbit

#title(r'Using odeint with $x$ = %g, $v_y$ = %g, and $\tau$ = %g' \
      #% (x0,vy0,tau))
plot(x,y)
plt.show()