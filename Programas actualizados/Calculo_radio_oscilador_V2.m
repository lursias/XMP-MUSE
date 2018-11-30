addpath ('Funciones y objetos')
%------------------Programa calculo radio oscilador armonico--------------%
U_0 = [1; 0];
n = 200000;
t = 10;
dt = t/n;

U = euler_explicito(U_0,dt,n);

resultado = U(2)^2 + U(1)^2;



