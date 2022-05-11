function [x,res,k] = newton(f,fp,x0,tol,maxit)
    k = 0;
    res = 0;
    lastX = x0;
    
    while k < maxit
        x = lastX - (f(lastX) / fp(lastX));
        res = abs(lastX - x);

        if res < tol
            break;
        end

        lastX = x;
        k = k + 1;
    end
end

