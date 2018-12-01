function [xs, vxs, ys, vys]  = condicion_init(n,M_T)

    switch n

        case 1
            xs = 0.8;
            vxs = 0.5;
            ys = 0.5;
            vys = -4;

        case 2

            xs = 0.2;
            vxs = 0;
            ys = 0;
            vys = sqrt(M_T/xs);
    end
end