function [x,flag,rr,it,rv] = jacobi(A,b,tol,maxiter)
    %% Realizace jacobiho iterační metody pro řešení soustav rovnic
    %% Vstupy
    % A - Matice levé strany
    % b - Vektor pravé strany
    % tol - Tolerance pro ukončovací kritériumm
    % maxiter - Maximální počet iterací
    
    %% Výstupy
    % x - Vektor výsledků
    % flag - Příznak informující o způsobu ukončení
    % rr - Relativní reziduum (poslední)
    % it - Počet iterací
    % rv - Vektor relativních reziduí (pro každou iteraci)

    %% Program:

    % Přepoklad, že řešení je stejné jako vektor pravé strany
    x = b;
    % Vytvoření vektoru reziduí a počátečního rezidua
    rv = zeros(maxiter,1);
    rv(1) =  norm(b - A * x);
   
    % Samotný výpočet
    for it = 1:maxiter-1
        konverguje = true;
        dalsiX = x;
        
        % Výpočet sumy prvků na řádcích
        for i = 1:length(b)
            sum = 0;
            % Pro každý prvek na řádku
            for j = 1:length(b)
                % Pokud není diagonální
                if i ~= j
                    % K součtu se přičte
                    sum = sum + A(i,j)*x(j);
                end
            end

            dalsiX(i) = -1 / A(i,i) * (sum - b(i));
            
            %Relativní residuum
            rr = norm(b - A * dalsiX)/norm(b);
            
            % Pokud je relataivní reziduum větší než tolerance, tak metoda
            % nekonverguje
            if rr > tol
                konverguje = false;
            end
        end

        x = dalsiX;
        rv(it+1) = norm(b-A*x);
        
        %Kontrola, jestli to náhodou nediverguje
        if isnan(rr) || isinf(rr)
            konverguje = false;
            flag = 4;
            break;
        end
        
        %Konverguje
        if konverguje
            flag = 0;
            break;
        end
    end
    
    if it == maxiter-1 && ~konverguje
        flag = 1;
    end
    
    rv = rv(1:it+1,:);
end