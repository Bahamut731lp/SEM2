function [bd] = backward_difference(a, b)
    %Funkce realizuje dopřednou diferenci
    %a - první bod ve tvaru [x, y]
    %b - druhý bod ve tvaru [x, y], který je "nalevo" od bodu a

    bd = (a(2) - b(2)) / abs(b(1) - a(1));
end