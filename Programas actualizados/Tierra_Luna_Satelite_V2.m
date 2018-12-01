addpath ('Funciones y objetos')
%--------------------Problema Tierra-Luna-Satelite------------------------%

p = 10; %Periodos de integracion (p = periodo Luna alrededor Tierra)

%Variables adimensionales del problema

G = 1;
M_T = 81;
M_L = 1;
r_l = 1;

% Condiciones iniciales satelite

prompt = {'Elija orbita del satelite (1 = caotica, 2 = circular)'};  
title = 'Selección de órbita';
num_lines = 1;
default = {'1'};   
Init_orb = inputdlg(prompt,title,num_lines,default);
Init_orb = char(Init_orb);
Init_orb = str2double(Init_orb);

clearvars default  prompt title num_lines

[xs, vxs, ys, vys]  = condicion_init(Init_orb,M_T);

tspan = [0, 2*pi/9*p];
Y_0 = [0 -sqrt(G*M_T/r_l)/M_T*M_L,0 0,1 0 ,0 sqrt(G*M_T/r_l),xs vxs,ys vys]; % Vector de condiciones iniciales
     %yt vyt,xt vxt,xl vxl,yl vyl,xs vxs,ys vys
     
options = odeset('RelTol',2.22045e-6,'AbsTol',1e-8);
[~, Y] = ode45(@(t,Y)tierra_luna_sat(t,Y),tspan,Y_0,options);

dt = tspan(2)/length(Y);

figure
plot(Y(:,5),Y(:,7))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')
title('Problema Tierra-Luna-Satelite','Interpreter','latex',...
      'FontSize',12)  
hold on
plot(Y(:,3),Y(:,1))

hold on 
comet(Y(:,9),Y(:,11))

legend('$Luna$','$Tierra$','$Satelite$')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');



