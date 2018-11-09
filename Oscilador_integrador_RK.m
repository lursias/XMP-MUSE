options = odeset('RelTol',2.22045e-14,'AbsTol',1e-20,'OutputFcn',@odeplot);
%options = odeset('RelTol',2.22045e-14,'AbsTol',1e-20);
[T, X] = ode45(@(t,x)[x(2);-x(1)],[0, 20*pi],[1, 0],options);
grid on
xlabel('$t$', 'FontSize',14,'Interpreter','latex')
ylabel('$x$', 'FontSize',14,'Interpreter','latex')

figure
plot(X(:,1),X(:,2))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')

