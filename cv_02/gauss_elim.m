function [x, U] = gauss_elim(A, b)
    containsB = false;
    if (size(A, 1) == size(b, 1))
        A = [A b];
        containsB = true;
    end

    rows = size(A, 1);
    U = [];
    x = [];
    
    %Smyčka pro přední eliminaci
    for i=1:rows
        A(i:end, :) = sortrows(A(i:end, :), i, "descend")
        A(i,i)
        
        if (abs(A(i, i)) <= 1e-15); error("singular"); end

        %Přičítání vhodných násobků řádku do nižších řádků tak, aby se
        %prvky pod vodícím prvek vynulovali
        for j=(i+1):rows
            A(j, :) = row2row(A(i, :), A(j, i) / A(i, i), A(j, :));
            
            %Kdyby tam náhodou vyšel kompletně nulový řádek, tak
            
        end
    end

    %Přiřazení matice v horním stupňovitém tvaru do výstupní proměnné

    if containsB
        U = A(:, 1:end - 1);
    else
        U = A;
    end

    %Smyčka pro zpětnou eliminaci
    for i=rows:-1:1
        for j=i:-1:1
            if (i == j); continue; end
            A(j, :) = row2row(A(i, :), A(j, i) / A(i, i), A(j, :));
        end

        A(i, :) = normalize(A(i, :), i);
    end

    %Řešení soustavy rovnic
    if (containsB)
        x = A(:, end);
    end
end