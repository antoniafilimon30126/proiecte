k = 5; % Setează valoarea dorită pentru 'k'

% Cell array pentru a stoca matricele cu valori binare și vectorul cu elementele x_1(k), x_2(k), ... , x_k(k)
x = cell(k+1, 1);

% Matrice 3x3 cu valori binare (exemplu)
matrice_binara = [1 0 1; 0 1 0; 1 0 1];

% Adaugă matricea binară pe fiecare poziție a cell array-ului
for i = 1:(k+1)
    x{i} = matrice_binara; % Adaugă matricea binară în cell array
end

% Afișează conținutul cell array-ului x
for i = 1:(k+1)
    disp(['Matricea ', num2str(i), ':']);
    disp(x{i});
end
