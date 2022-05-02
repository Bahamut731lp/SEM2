function [cd] = central_difference(a, b, c)
    %Funkce realizuje zpětnou diferenci
    %a  - Levý bod
    %b  - Střed
    %c  - Pravý bod

    cd = (c(2) - a(2)) / (abs((b(1) - a(1)) + (c(1) - b(1))));
end