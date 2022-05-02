function [z] = sus_points(v)
    % Funkce najde podezřelé body ve vektoru
    % v - vektor prvků
    % Vrací indexy podezřelých bodů
    
    z = find(sign(v(1:end-1)) ~= sign(v(2:end)));
end