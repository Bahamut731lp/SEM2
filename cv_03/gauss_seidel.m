function [x,flag,rr,it,rv] = gauss_seidel(A,b,tol,maxit)
    x = b;
    
    rv = zeros(maxit, 1);
    rv(1) = norm(b - A*x);

    for it = 1:(maxit - 1)
        convergence = true;
        
        for radek = 1:length(b)
            sum = 0;
            
            for prvek = 1:length(b)
                if radek ~= prvek
                    sum = sum + A(radek, prvek) * x(prvek);
                end
            end

            x(radek) = -1 / A(radek,radek) * (sum - b(radek));
            rr = norm(b - A * x) / norm(b);
    
            if rr > tol
                convergence = false;
            end
        end

        rv(it + 1) = norm(b - A * x);
    
        if isnan(rr) || isinf(rr)
            convergence = false;
            flag = 4;
            break;
        end

        if convergence
            flag = 0;
            break;
        end
    end

    if it == maxit-1 && ~convergence
        flag = 1;
    end
    
    rv = rv(1:it+1,:);
end