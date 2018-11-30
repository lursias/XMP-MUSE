addpath ('Funciones y objetos')
%------------------------Problema Tierra-Luna------------------------------%

tspan = [0, 2*pi*2];
Y_0 = [0 -1/9,0 0,1 0 ,0 9]; % yt, vyt, xt, vxt,xl, vxl, yl, vyl, xs,vxs,ys,vys

options = odeset('RelTol',2.22045e-6,'AbsTol',1e-8); 
[T, Y] = ode45(@(t,Y)tierra_luna(t,Y),tspan,Y_0 ,options);

dt = tspan(2)/length(Y);

figure
plot(Y(:,5),Y(:,7))
grid on
axis('equal');
title('Problema dos cuerpos Tierra-Luna','Interpreter','latex',...
      'FontSize',12)
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')

hold on
plot(Y(:,3),Y(:,1))
legend('$Luna$','$Tierra$')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');



