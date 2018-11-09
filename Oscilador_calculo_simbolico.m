syms x(t) Y t
eqn = diff(x,2) + x == 0;
V = odeToVectorField(eqn);
M = matlabFunction(V, 'Vars',[t Y]);
tspan = [0, 20*pi];
x_0 = [1, 0];
options = odeset('RelTol',2.22045e-14,'AbsTol',1e-18);
[T, Y] = ode45(M,tspan,x_0,options);
plot(Y(:,1),Y(:,2))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')

%% Orbita Kepler

syms x(t) y(t) Y 

D2y = diff(y,t,2);
D2x = diff(x,t,2);

eqns=[D2x == -x/(x^2+y^2)^(3/2), D2y == -y/(x^2+y^2)^(3/2)];

[yode,Sbs] = odeToVectorField(eqns);
Yodefcn = matlabFunction(yode, 'Vars',[t Y]);
tspan = [0, 2*pi*365*10];
Y0 = [1 0,0 1];
options = odeset('RelTol',2.22045e-10,'AbsTol',1e-10);
[T,Y] = ode45(Yodefcn, tspan, Y0,options);
dt = tspan(2)/length(Y);
figure
plot(Y(:,1),Y(:,3))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')


