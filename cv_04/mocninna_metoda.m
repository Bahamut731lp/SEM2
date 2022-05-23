%%
%   KREJSKA, Martin. Přednáška z předmětu: Speciální numerické metody. 
%   Téma č.4: Vlastní čísla a vlastní vektory. [online]. [cit. 28.3.2022]
%   Dostupné na http://fast10.vsb.cz/krejsa/studium/spec_num_04.pdf, strana 10
%
%   Kód je sice augmentován, aby vyhovoval potřebám zadání, ovšem značně se
%   opírá o základ poskytnutý z výše uvedeného zdroje.
%%

function [vec, lambda] = mocninna_metoda(A, y0, tol, maxit)
    %% Funkce realizující mocninnou metodu pro hledání vlastních čísel a vlastních vektorů
    %% Vstupy
    % A - Vstupní matice, jejíž vlastní čísla/vektory hledáme
    % y0 - Počáteční odhad
    % tol - Tolerance
    % maxit - Maximální počet iterací
    %% Výstupy:
    % vec - Vlastní vektor
    % lambda - Vlastní číslo
    %% Program:
    
    x = y0;
    
    if (isrow(x))
        x = x';
    end

    lastLambda = NaN;

    for j=1:maxit
        % Normalizovaní vektoru x
        u = x / norm(x);
        % Maticové násobení matice A a normalizovaného vektoru u
        x = A * u;
        % Násobení transponovaného normalizovaného vektoru u a (vektoru) aproximace x
        lambda = u' * x;
        % Samotný normalizovaný vektor je vlastním vektorem matice
        vec = u;

        if (isnan(lastLambda))
            lastLambda = lambda;
            continue;
        elseif (abs(lambda - lastLambda) < tol)
            break;
        end
    end
end