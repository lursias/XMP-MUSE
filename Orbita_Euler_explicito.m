mu_T = 398600;
n = 1e+6;
r_0 = [42e+3 0 0];
v_0 = [0 sqrt(mu_T/r_0(1)) 0];

U = orbita_circular(r_0,v_0,mu_T,n);


function U = orbita_circular(r_0,v_0,mu_T,n)
r = zeros(3,n);
v = zeros(3,n);
r(:,1) = r_0;
v(:,1) = v_0;
a = zeros(3,n);
a(:,1) = -mu_T/(sqrt(r(1,1)^2+r(2,1)^2+r(3,1)^2))^3*r(:,1);

dt = 0.9;
U = [r; v];
F = [v; a];

for i = 1:n-1
    U(:,i+1) = U(:,i)+dt*F(:,i);
    r(:,i+1) = U(1:3,i+1);
    m = sqrt(r(1,i+1)^2+r(2,i+1)^2+r(3,i+1)^2);
    v(:,i+1) = U(4:6,i+1);
    a(:,i+1) = -mu_T/m^3*r(:,i+1);
    F(:,i+1) = [v(:,i+1); a(:,i+1)];
end
plot(r(1,:),r(2,:))
grid on 
axis('equal');
title('$Euler explicito$', 'FontSize',14,'Interpreter','latex')
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')
end