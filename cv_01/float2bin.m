function b = float2bin(number,dec_length)
    decimal = fix(number)
    fraction = number - decimal
    
    decimalInBin = join(string(divide4bin(decimal)), "")
    fractionInBin = multiply4bin(fraction, dec_length)

    %Ošetření, že číslo nemá desetinnou část
    if (numel(fractionInBin) == 0)
        fractionInBin = "";
    else
        fractionInBin = append(".", join(string(fractionInBin), ""))
    end
    
    %Ošetření, že číslo bude menší než jeden celek
    if (numel(decimal) == 0)
        decimalInBin = "0";
    end
    
    %Výstup
    b = char(append(decimalInBin, fractionInBin))
end