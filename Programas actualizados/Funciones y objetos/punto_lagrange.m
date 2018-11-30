function [xs, vxs, ys, vys] = punto_lagrange(n,G,M_T,M_L,r_l)

    switch n

        case 1
            
            syms x
            eqn = G*M_L/(r_l-x)^2 + (G*M_T/r_l^3)*x - G*M_T/x^2 == 0;
            r = solve(eqn,x);
            sol = double(subs(r));
            sol = sol(imag(sol)==0);
            
            xs = sol;
            vxs = 0;
            ys = 0;
            vys = sqrt(M_T*G/r_l^3)*xs;

        case 2
            
            syms x
            eqn = G*M_L/(x-r_l)^2 + G*M_T/x^2 - (G*M_T/r_l^3)*x == 0;
            r = solve(eqn,x);
            sol = double(subs(r));
            sol = sol(imag(sol)==0);
            
            
            xs = sol;
            vxs = 0;
            ys = 0;
            vys = sqrt(M_T*G/r_l^3)*xs;
            
        case 3
            
            syms x
            eqn = G*M_L/(r_l+x)^2 + G*M_T/x^2 - (G*M_T/r_l^3)*x == 0;
            r = solve(eqn,x);
            sol = double(subs(r));
            sol = sol(imag(sol)==0);
            
            
            xs = -sol;
            vxs = 0;
            ys = 0;
            vys = sqrt(M_T*G/r_l^3)*xs;
            
        case 4
            
            v = sqrt(G*(M_T + M_L)/(sqrt((r_l*sqrt(3)/2)^2+(r_l/2-M_L*r_l/(M_T + M_L))^2)));
            alfa = atan((r_l*sqrt(3)/2)/(r_l/2-M_L*r_l/(M_T + M_L)));
            alfa = pi/2-alfa;
            xs = r_l/2;
            vxs = -v*cos(alfa);
            ys = sqrt(3)*r_l/2;
            vys = v*sin(alfa);
            
        case 5
            
            v = sqrt(G*(M_T + M_L)/(sqrt((r_l*sqrt(3)/2)^2+(r_l/2-M_L*r_l/(M_T + M_L))^2)));
            alfa = atan((r_l*sqrt(3)/2)/(r_l/2-M_L*r_l/(M_T + M_L)));
            alfa = pi/2-alfa;
            xs = r_l/2;
            vxs = v*cos(alfa);
            ys = -sqrt(3)*r_l/2;
            vys = v*sin(alfa);
    end
    
end