function [x,res,k] = bisection(f,a,b,tol,maxit)
    x = b;
    k = 0;
    res = 0;
    lowerBound = a;
    upperBound = b;
    
    while (abs(f(x)) > tol) && (k < maxit)
        x = 0.5 * (lowerBound + upperBound);   
    
        if (f(x) * f(b) < 0)
            lowerBound = x;
        else
            upperBound = x;
        end

        k = k + 1;
        res = abs(f(x));
    end
end