addpath ('Funciones y objetos')
%--------------------Estabilidad Puntos de Lagrange-----------------------%
%Elección de tiempo y punto de Lagrange a estudiar

prompt = {'Elija tiempo (medido en periodos lunares)'...
    ,'Elija Punto de Lagrange (1-5)'};  
dlg_title = 'Puntos Langrange';
num_lines = 1;
defaultans = {'10','4'};   
datos = inputdlg(prompt,dlg_title,num_lines,defaultans);
datos = str2double(datos);
p = datos(1);
n = datos(2);

clearvars -except p n

%Variables adimensionales del problema

G = 1;
M_T = 81;
M_L = 1;
r_l = 1;

% Condiciones iniciales satelite

[xs, vxs, ys, vys] = punto_lagrange(n,G,M_T,M_L,r_l);
Y_0 = [0 -sqrt(G*M_T/r_l)/M_T*M_L,0 0,1 0 ,0 sqrt(G*M_T/r_l),xs vxs,ys vys];% Vector de condiciones iniciales
     %yt vyt,xt vxt,xl vxl,yl vyl,xs vxs,ys vys

tspan = [0, 2*pi*sqrt(r_l^3/G/M_T)*p];

% Integracion temporal

options = odeset('RelTol',2.22045e-6,'AbsTol',1e-8);
[T, Y] = ode45(@(t,Y)tierra_luna_sat(t,Y),tspan,Y_0,options);

dt = tspan(2)/length(Y);

%Representacion grafica

figure
plot(Y(:,5),Y(:,7))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')

hold on
plot(Y(:,3),Y(:,1))

hold on
comet(Y(:,9),Y(:,11))

legend('$Luna$','$Tierra$','$Satelite$')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');

