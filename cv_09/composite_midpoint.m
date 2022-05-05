function I = composite_midpoint(f,a,b,n)
    % Funkce realizuje složené obdélníkové pravidlo
    % f - Integrovaná funkce (konkrétně její handle (@))
    % a - Spodní hranice intervalu
    % b - Horní hranice intervalu
    % n - Jemnost dělení

    % Krok pro interval
    dx = (b - a) / n;
    % Vytvoření intervalů
    oblast = a:dx:b;
    % Je potřeba odstranit poslední hodnotu, protože matlab intervaly jsou
    % inkluzivní.
    % Navíc ke každému bodu přičteme jednu polovinu šířky intervalu, tím
    % dostaneme hodnoty ve středu intervalu
    oblast = oblast(1: end - 1) + (dx/2);
    % Na každý střed pošlu funkci, kterou má aproximovat, tím dostaneme
    % funkční hodnotu ve středu
    oblast = arrayfun(@(x) f(x), oblast);
    
    % Pak už zbývá akorát vytvořit obdélníky, kde výška je funkční hodnota
    % z pole oblast, a šířka je krok dx.
    % Díky distributivním zákonům to necháme vynásobit až po sečtění.
    I = sum(oblast) * dx;
end