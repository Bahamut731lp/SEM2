function yq = lagrange(x,y,xq)
    pocetX = numel(x);
    yq = zeros(numel(xq), 1);
    
    for p=1:numel(xq)
        
        num = xq(p);

        for i=1:pocetX
            term = 1;
            
            for j=1:pocetX
                if i ~= j
                    term = term * (num - x(j)) / (x(i) - x(j));
                end
            end
            
            % Součet jednotlivejch interpolačních polynomů,
            % resp. jejich vyčíslených hodnot
            yq(p) = yq(p) + (y(i) * term);
        end

    end

    if (iscolumn(yq))
        yq = yq';
    end
end