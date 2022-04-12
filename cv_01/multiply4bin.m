function [v] = multiply4bin(number, length) 
    num = number;
    precision = 1;
    v = [];
    
    while (num > 0 && precision <= length)
        decimal = fix(num * 2);
        num = num * 2 - decimal
        v(end + 1) = decimal
        precision = precision + 1;
    end
end