function [x, M] = find_int_roots(p)
    % Funkce najde celočíselné kořeny polynomu za pomocí Hornerova schématu

    % Tím, že to jsou jenom kandidáti, tak budeme ve schématu zkoušet jak
    % číslo s + tak s -, je tedy jedno, pokud tady ztratíme informaci o
    % znamínku. Při nejhorším ji lze znovu dohledat
    konst = abs(p(find(p,1,'last')));
    
    % Vytvoříme vektor čísel od jedničky až po konstantní člen
    % Pak každé číslo vydělíme konstantou - pokud je zbytek po dělení 0, je
    % číslo dělitelem konstantního členu.
    delitele = 1:konst;
    delitele = delitele(rem(konst,delitele)==0);
    
    % Vyfiltrování dělitelů tak, aby splňovali větu o omezenosti kořenů
    if (length(p) > 1)
        A = max(abs(p(2:end)));
        an = p(1);
        potencialniKoreny = delitele(abs(delitele) < 1 + A./abs(an));
    else
        potencialniKoreny = delitele;
    end
    
    potencialniKoreny = [potencialniKoreny -1 * potencialniKoreny];
    potencialniKoreny(end + 1) = 0;

    % Inicializace Hornerova schématu
    M = p;
    x = [];
    posledniPolynom = p;
    
    %Když to je jenom konstanta, tak nemá smysl tady dělat fuckin schéma
    if (length(p) == 1)
         x = p(1);
         return;
    end
    
    % Dokud máme polynomy na dělení, budeme hledat kořeny
    while ~isempty(posledniPolynom)
        % Interní proměnná
        % Matlab je totiž tak retardovanej, že nemá labely pro smyčky
        % Takže musím jak neandrtálec smyčky ovládat skrz proměnné
        flag = 0;

        for i=1:numel(potencialniKoreny)
            % Dělení polynomů
            [q, r] = deconv(posledniPolynom, [1 potencialniKoreny(i)]);
            
            % Pokud je nějaký zbytek po dělení, tak číslo není kořenem
            if (any(r ~= 0))
                continue
            end
            
            % Pokud ale zbytek není, našli jsme kořen
            % Výsledný polynom použijeme pro výpočet dalšího polynomu
            % Je to v podstatě fancy vytknutí
            posledniPolynom = q;
            x(end + 1) = potencialniKoreny(i);
            M(end + 1, 1:length(q)) = q;

            if (abs(q - 0) < 1e-15) break; end

            % Ovládání vnější smyčky
            flag = 1;
            break;
        end
        
        if (flag == 1) continue
        else break; end
    end
    
    % Čísla tam mám poukládaná s opačnýma znamínkama
    x = -1 * x;
    
    if (isrow(x))
        x = x';
    end
end