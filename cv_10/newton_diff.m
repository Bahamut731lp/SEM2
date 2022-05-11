function [x, res, k] = newton_diff(f,x0,x1,tol,maxit)
    v = zeros(1, maxit);
    v(1)=x0;
    v(2)=x1;
 
    k=0;
    
    for i=3:maxit
        % Vypočteme další prvek
        v(i) = v(i-1) - (f(v(i-1))) * ( (v(i-1) - v(i-2)) / (f(v(i-1)) - f(v(i-2))) );
        
        % Vypočteme relativní reziduum.
        % Protože to jsou problémy typu f(x) = 0, můžeme se akorát
        % kouknout, jestli je funkční hodnota dostatečně blízko nule.
        res = abs(f(v(i)));
        
        % Pokud je dostatečně blízko nule, tak hledání ukončíme
        if res < tol
            x = v(i);
            break;
        end
        
        % Zvedneem počet iterací
        k = k + 1;
    end

end

