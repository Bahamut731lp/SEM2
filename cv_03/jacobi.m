function [x,flag,rr,it,rv] = jacobi(A,b,tol,maxiter)
    x = b;
    rv = zeros(maxiter,1);
    rv(1) =  norm(b - A * x);
    
    for it = 1:maxiter-1
        konverguje = true;
        dalsiX = x;
        
        for i = 1:length(b)
            sum = 0;
            for j = 1:length(b)
                if i ~= j
                    sum = sum + A(i,j)*x(j);
                end
            end
            dalsiX(i) = -1 / A(i,i) * (sum - b(i));
            
            %Relativní residuum
            rr = norm(b - A * dalsiX)/norm(b);
    
            if rr > tol
                konverguje = false;
            end
        end

        x = dalsiX;
        rv(it+1) = norm(b-A*x);
        
        %Kontrola, jestli to náhodou nediverguje
        if isnan(rr) || isinf(rr)
            konverguje = false;
            flag = 4;
            break;
        end
        
        %Konverguje
        if konverguje
            flag = 0;
            break;
        end
    end
    
    if it == maxiter-1 && ~konverguje
        flag = 1;
    end
    
    rv = rv(1:it+1,:);
end