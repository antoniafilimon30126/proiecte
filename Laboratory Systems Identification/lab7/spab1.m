N = 30;
m_min = 3;
m = 10;
a = -0.7;
b = 0.7;

u = [zeros(1, 10), spab(m_min, N, a, b), zeros(1, 10), spab(m, N, a, b), zeros(1, 10)];

function u_prim = spab(m, N, a, b)
    A = zeros(m, N);

    if m == 3 
        A(1,:) = [1 0 1]; 
    elseif m == 4 
        A(1,:) = [1 0 0 1]; 
    elseif m == 5
        A(1,:) = [0 1 0 0 1]; 
    elseif m == 6
        A(1,:) = [1 0 0 0 0 1]; 
    elseif m == 7
        A(1,:) = [1 0 0 0 0 0 1]; 
    elseif m == 8
        A(1,:) = [1 1 0 0 0 0 1 1]; 
    elseif m == 9
        A(1,:) = [0 0 0 1 0 0 0 0 1]; 
    elseif m == 10
        A(1,:) = [0 0 1 0 0 0 0 0 0 1]; 
    end 

    for i = 2:N
        A(i, i - 1) = 1;
    end

    x = ones(1, m); 
    u_prim = zeros(1, N);

    for k = 1:N
        x_next = zeros(1, m);
        x_next(2:end) = x(1:end-1);
        u_prim(k) = mod(sum(A(k, :) .* x), 2);
        x = x_next;
    end 

    u_prim = a + (b - a) * u_prim;
end

% Exemplu de utilizare:

