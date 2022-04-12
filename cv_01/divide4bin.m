function [v] = divide4bin(number)
    num = number;
    v = [];

    if (number == 0)
        v = 0
    end

    while num > 0
        remainder = rem(num, 2);
        num = (num - remainder) / 2;
        v(end + 1) = remainder;
    end
    
    %Po celočíselném dělení se zbytky čtou odzadu
    v = flip(v);
end
