%% 10 años de vueltas
n = 1000000;
t = 2*pi*365*10; 
dt = t/n; 
B = eye(2)-dt*[0 1;-1 0]; 
U = zeros(2,n+1);
U(:,1) = [1 0]';
for i = 1:n
    U(:,i+1) = B\U(:,i);
end
plot(U(1,:),U(2,:))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')
radio = sqrt(U(1,n+1)^2+U(2,n+1)^2);


%% F en funcion
n = 1000000;
t = 2*pi*365*10; 
dt = t/n; 
U = zeros(2,n+1);
U(:,1) = [1 0]';
for i = 1:n
    U(:,i+1) = U(:,i)+dt*Oscillator(U(:,i));
end

plot(U(1,:),U(2,:))
grid on
axis('equal');
xlabel('$x$', 'FontSize',14,'Interpreter','latex')
ylabel('$dx/dt$', 'FontSize',14,'Interpreter','latex')

function F = Oscillator(U)
F = [U(2); -U(1)];
end 




