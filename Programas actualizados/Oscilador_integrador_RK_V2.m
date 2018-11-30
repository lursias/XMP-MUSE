addpath ('Funciones y objetos')
%---------------------Oscilador armonico utilizando RK45------------------%
tspan = [0, 20*pi];
Y_0 = [1, 0];

options = odeset('RelTol',2.22045e-14,'AbsTol',1e-20,'OutputFcn',@odeplot);
[T, Y] = ode45(@(t,y)Oscillator(y), tspan, Y_0, options);

grid on
xlabel('$t$', 'FontSize',14,'Interpreter','latex')
ylabel('$x$', 'FontSize',14,'Interpreter','latex')

figure
plot(Y(:,1),Y(:,2))
grid on
axis('equal');
title('Oscilador armonico RK','Interpreter','latex',...
      'FontSize',12)
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')

hold on

plot(Y(length(T),1),Y(length(T),2),'or')
legend('Orbita','Posicion final(para ver error de fase)')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');

