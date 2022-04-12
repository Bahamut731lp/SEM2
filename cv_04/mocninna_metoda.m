%%
%   KREJSKA, Martin. Přednáška z předmětu: Speciální numerické metody. 
%   Téma č.4: Vlastní čísla a vlastní vektory. [online]. [cit. 28.3.2022]
%   Dostupné na http://fast10.vsb.cz/krejsa/studium/spec_num_04.pdf, strana 10
%
%   Kód je sice augmentován, aby vyhovoval potřebám zadání, ovšem značně se
%   opírá o základ poskytnutý z výše uvedeného zdroje.
%%

function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    x = y0;
    if (isrow(x))
        x = x';
    end

    lastLambda = NaN;

    for j=1:maxit
        u = x / norm(x);
        x = A * u;
        lambda = u' * x;
        vec = u;

        if (isnan(lastLambda))
            lastLambda = lambda;
            continue;
        elseif (abs(lambda - lastLambda) < tol)
            break;
        end
    end

    vec, lambda
    disp("Plati rovnost");
    abs(A * vec - lambda * vec) < tol 

    disp("Eig test");
    [V, D] = eig(A);
    abs(A*V - V*D) < tol


end