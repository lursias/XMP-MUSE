
function U = euler_implicito(U,dt,n,A)
for i = 1:n
    U(:,i+1) = Oscillator_simplified(dt,A)\U(:,i);
end
end