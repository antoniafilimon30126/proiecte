function u_prim = spab(N, m_min, a, b)
    A = zeros(1, m_min);

    if m_min == 3 
        A(1,:) = [1 0 1]; 
    elseif m_min == 4 
        A(1,:) = [1 0 0 1 ]; 
    elseif m_min == 5
        A(1,:) = [0 1 0 0 1]; 
    elseif m_min == 6
        A(1,:) = [1 0 0 0 0 1 ]; 
    elseif m_min == 7
        A(1,:) = [1 0 0 0 0 0 1]; 
    elseif m_min == 8
        A(1,:) = [1 1 0 0 0 0 1 1]; 
    elseif m_min == 9
        A(1,:) = [0 0 0 1 0 0 0 0 1]; 
    elseif m_min == 10
        A(1,:) = [0 0 1 0 0 0 0 0 0 1]; 
    end

    x = ones(1, m_min); 
    u = zeros(1, N);

    for k = 1:N
        x_next(1) = mod(sum(A.*x), 2);
        x_next(2:end) = x(1:end-1);
        u(k) = x_next(1);
        x = x_next;
    end 

    u_prim = a + (b - a) * u;
end

m_min = 10;
N = 200;
m_max = 3;
a = -0.7;
b = 0.7;
u = [zeros(1,10), spab(N, m_min, a, b), zeros(1,10), spab(N, m_max, a, b), zeros(1,10), 0.4*ones(1,70)];
plot(u)
