clear;

% Sousednost = [
%     0 1 1 1 0;
%     1 0 1 0 0;
%     1 1 0 1 1;
%     1 0 0 0 0;
%     1 0 0 1 1;
% ];

%Matice sousednosti - A B C D E
%Jednička je odkaz z další stránky
%První řádek je pro stránku A, druhý pro stránku B, ...
Sousednost = [0 1 1 1 1; 1 0 1 0 0; 1 1 0 0 1; 1 0 1 0 1; 0 0 1 0 0];
M = zeros(5);

for i=1:numel(M)
    
    row = ceil((i - 1e-15) / size(M, 1));
    col = mod(i, 5) + 1;
   
    M(row, col) = Sousednost(row, col) / sum(Sousednost(:, col));
end

y0 = ones(1, size(M, 1));

[vec, lambda] = mocninna_metoda(M, y0, 1e-08, 1000);

stranky = ['A','B','C','D','E'];
[~, indexy] = sort(vec);
webs = stranky(indexy);