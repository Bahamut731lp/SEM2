function [fd] = forward_difference(a, b)
    %Funkce realizuje dopřednou diferenci
    %a - první bod ve tvaru [x, y]
    %b - druhý bod ve tvaru [x, y], který je "napravo" od bodu a

    fd = (b(2) - a(2)) / abs(b(1) - a(1));
end