addpath ('Funciones y objetos')
%----------Calculo Oscilador Armonico con euler inverso-------------------%
n = 1e6;
t = 2*pi*365*10; 
dt = t/n; 
A = [0 1;-1 0];
U(:,1) = [1 0]';
U = euler_implicito(U,dt,n,A);

plot(U(1,:),U(2,:))
grid on
axis('equal');
title('Oscilador armonico con Euler inverso','Interpreter','latex',...
      'FontSize',12)
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')
legend('Orbita')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');

radio = sqrt(U(1,n+1)^2+U(2,n+1)^2);


