%% Problema Tierra Luna sin simbolico 


%options = odeset('RelTol',2.22045e-14,'AbsTol',1e-20,'OutputFcn',@odeplot);
options = odeset('RelTol',2.22045e-14,'AbsTol',1e-20);
tspan = [0, 2*pi*2];
Y0 = [0 1/9,0 0,1 0 ,0 -9,0.8 0,0 3]; % Vector de condiciones iniciales
     %yt vyt,xt vxt,xl vxl,yl vyl,xs vxs,ys vys

[T, Y] = ode45(@(t,Y)odefun(t,Y),tspan,Y0,options);
dt = tspan(2)/length(Y);

figure
plot(Y(:,5),Y(:,7))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$y$', 'FontSize',14,'Interpreter','latex')

hold on
plot(Y(:,3),Y(:,1))

hold on 
plot(Y(:,9),Y(:,11))

legend('$Luna$','$Tierra$','$Satelite$')
set(legend,...
    'Position',[0.630 0.785 0.204 0.081],...
    'Interpreter','latex');

function yp = odefun(t,Y)
    yp = [Y(2);-(Y(1)-Y(7)).*1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0);Y(4);-(Y(3)-Y(5)).*1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0);Y(6);1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0).*(Y(3).*8.1e1-Y(5).*8.1e1);Y(8);1.0./((Y(1)-Y(7)).^2+(Y(3)-Y(5)).^2).^(3.0./2.0).*(Y(1).*8.1e1-Y(7).*8.1e1);Y(10);(Y(5)-Y(9)).*1.0./((Y(5)-Y(9)).^2+(Y(7)-Y(11)).^2).^(3.0./2.0)+1.0./((Y(1)-Y(11)).^2+(Y(3)-Y(9)).^2).^(3.0./2.0).*(Y(3).*8.1e1-Y(9).*8.1e1);Y(12);(Y(7)-Y(11)).*1.0./((Y(5)-Y(9)).^2+(Y(7)-Y(11)).^2).^(3.0./2.0)+1.0./((Y(1)-Y(11)).^2+(Y(3)-Y(9)).^2).^(3.0./2.0).*(Y(1).*8.1e1-Y(11).*8.1e1)];
end