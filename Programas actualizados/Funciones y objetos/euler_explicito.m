
function U = euler_explicito(U,dt,n)
for i = 1:n-1  
    U = U + dt*Oscillator(U); 
end
end