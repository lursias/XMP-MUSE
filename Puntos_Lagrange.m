%% Estudio estabilidad puntos de Lagrange

n = input('Elija el punto de Lagrange en el que desea colocar el S/C ');
p = input('Elija el numero de vueltas que quiere integrar');

options = odeset('RelTol',2.22045e-6,'AbsTol',1e-8);
G = 1;
M_T = 81;
M_L = 1;
r_l = 1;
tspan = [0, 2*pi*sqrt(r_l^3/G/M_T)*p];


if n == 1

        
        syms x
        eqn = G*M_L/(r_l-x)^2 + (G*M_T/r_l^3)*x - G*M_T/x^2 == 0;
        r = solve(eqn,x);
        sol = double(subs(r));
        sol = sol(1);
        
        
        xs = sol;
        vxs = 0;
        ys = 0;
        vys = sqrt(M_T)*xs;
        Y0 = [0 -sqrt(G*M_T/r_l)/M_T*M_L,0 0,1 0 ,0 sqrt(G*M_T/r_l),xs vxs,ys vys]; % Vector de condiciones iniciales
        %yt vyt,xt vxt,xl vxl,yl vyl,xs vxs,ys vys
        
        
        [T, Y] = ode45(@(t,Y)odefun(t,Y),tspan,Y0,options);
        dt = tspan(2)/length(Y);
        


elseif n == 2
        
        
        syms x
        eqn = G*M_L/(x-r_l)^2 + G*M_T/x^2 - (G*M_T/r_l^3)*x == 0;
        r = solve(eqn,x);
        sol = double(subs(r));
        sol = sol(5);
        
        
        xs = sol;
        vxs = 0;
        ys = 0;
        vys = sqrt(M_T)*xs;
        Y0 = [0 -sqrt(G*M_T/r_l)/M_T*M_L,0 0,1 0 ,0 sqrt(G*M_T/r_l),xs vxs,ys vys]; % Vector de condiciones iniciales
        %yt vyt,xt vxt,xl vxl,yl vyl,xs vxs,ys vys
        
        
        [T, Y] = ode45(@(t,Y)odefun(t,Y),tspan,Y0,options);
        dt = tspan(2)/length(Y);
        

        
    elseif n == 3
        

        syms x
        eqn = G*M_L/(r_l+x)^2 + G*M_T/x^2 - (G*M_T/r_l^3)*x == 0;
        r = solve(eqn,x);
        sol = double(subs(r));
        sol = sol(3);
        
        
        xs = -sol;
        vxs = 0;
        ys = 0;
        vys = sqrt(M_T)*xs;
        Y0 = [0 -sqrt(G*M_T/r_l)/M_T*M_L,0 0,1 0 ,0 sqrt(G*M_T/r_l),xs vxs,ys vys]; % Vector de condiciones iniciales
        %yt vyt,xt vxt,xl vxl,yl vyl,xs vxs,ys vys
        
        
        [T, Y] = ode45(@(t,Y)odefun(t,Y),tspan,Y0,options);
        dt = tspan(2)/length(Y);
        

        
    elseif n == 4
        

        v = sqrt(G*(M_T + M_L)/(sqrt((r_l*sqrt(3)/2)^2+(r_l/2-M_L*r_l/(M_T + M_L))^2)));
        alfa = atan((r_l*sqrt(3)/2)/(r_l/2-M_L*r_l/(M_T + M_L)));
        alfa = pi/2-alfa;
        xs = r_l/2;
        vxs = -v*cos(alfa);
        ys = sqrt(3)*r_l/2;
        vys = v*sin(alfa);
        Y0 = [0 -sqrt(G*M_T/r_l)/M_T*M_L,0 0,1 0 ,0 sqrt(G*M_T/r_l),xs vxs,ys vys]; % Vector de condiciones iniciales
        %yt vyt,xt vxt,xl vxl,yl vyl,xs vxs,ys vys
        
        
        [T, Y] = ode45(@(t,Y)odefun(t,Y),tspan,Y0,options);
        dt = tspan(2)/length(Y);

        
    elseif n == 5
        
        
        v = sqrt(G*(M_T + M_L)/(sqrt((r_l*sqrt(3)/2)^2+(r_l/2-M_L*r_l/(M_T + M_L))^2)));
        alfa = atan((r_l*sqrt(3)/2)/(r_l/2-M_L*r_l/(M_T + M_L)));
        alfa = pi/2-alfa;
        xs = r_l/2;
        vxs = v*cos(alfa);
        ys = -sqrt(3)*r_l/2;
        vys = v*sin(alfa);
        Y0 = [0 -sqrt(G*M_T/r_l)/M_T*M_L,0 0,1 0 ,0 sqrt(G*M_T/r_l),xs vxs,ys vys]; % Vector de condiciones iniciales
        %yt vyt,xt vxt,xl vxl,yl vyl,xs vxs,ys vys
        
        
        [T, Y] = ode45(@(t,Y)odefun(t,Y),tspan,Y0,options);
        dt = tspan(2)/length(Y);

end

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
        
        
function yp = odefun(~,Y)
yp = [Y(2);-(Y(1)-Y(7)).*1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0);Y(4);-(Y(3)-Y(5)).*1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0);Y(6);1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0).*(Y(3).*8.1e1-Y(5).*8.1e1);Y(8);1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0).*(Y(1).*8.1e1-Y(7).*8.1e1);Y(10);(Y(5)-Y(9)).*1.0./((Y(5)-Y(9)).^2+(Y(7)-Y(11)).^2).^(3.0./2.0)+1.0./((Y(1)-Y(11)).^2+(Y(3)-Y(9)).^2).^(3.0./2.0).*(Y(3).*8.1e1-Y(9).*8.1e1);Y(12);(Y(7)-Y(11)).*1.0./((Y(5)-Y(9)).^2+(Y(7)-Y(11)).^2).^(3.0./2.0)+1.0./((Y(1)-Y(11)).^2+(Y(3)-Y(9)).^2).^(3.0./2.0).*(Y(1).*8.1e1-Y(11).*8.1e1)];
end
