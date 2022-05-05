function [I,k] = adapt_trapz(f,a,b,maxlevel,tol)
    % Funkce realizuje adaptivní lichoběžníkovou kvadraturu
    % f - aproximovaná funkce (function handle @)
    % a - Spodní hranice intervalu
    % b - Horní hranice intervalu
    % maxlevel - Maximální počet úrovní zjemnění
    % tol - Požadovaná přesnost
    % I - aproximovaná hodnota integrálu
    % k - počet potřebných úrovní zjemnění
    
    LastApprox = 0;

    for k = 0:maxlevel
        dx = (b - a) / 2^k;

        v = a:dx:b;
        v = arrayfun(@(x) f(x), v);
        v(2:end - 1) = v(2:end-1) .* 2;
    
        I = sum(v) * (dx/2);
        if (abs(I - LastApprox) < tol)
            break;
        end
        LastApprox = I;
    end
end