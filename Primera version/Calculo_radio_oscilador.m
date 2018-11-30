U = [1 0]';
n = 20000;
dt = 10/n;
for i = 1:n-1
    F = [U(2) -U(1)]';
    U = U + dt*F;
end
resultado = U(2)^2 + U(1)^2;
