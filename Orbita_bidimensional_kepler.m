%% Orbita kepler

options = odeset('RelTol',2.22045e-14,'AbsTol',1e-10);
[T, Y] = ode45(@(t,Y)[Y(2);-1.0./(Y(1).^2+Y(3).^2).^(3.0./2.0).*Y(1);Y(4);-1.0./(Y(1).^2+Y(3).^2).^(3.0./2.0).*Y(3)],[0, 2*pi*10*365],[1, 0, 0, 1],options);

figure
plot(Y(:,1),Y(:,3))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')
