addpath ('Funciones y objetos')
%--------------------Orbita kepler bidimensional--------------------------%

tspan = [0, 2*pi*10*365];
Y_0 = [1, 0, 0, 1];

options = odeset('RelTol',2.22045e-10,'AbsTol',1e-10);
[T, Y] = ode45(@(t,Y)kepler_2D(t,Y),tspan,Y_0,options);

figure
plot(Y(:,1),Y(:,3))
grid on
axis('equal');
title('Orbita Kepler bidimensional','Interpreter','latex',...
      'FontSize',12)
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')

hold on
plot(Y(length(T),1),Y(length(T),3),'or')
legend('Orbita','Posicion final(para ver error de fase)')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');
